@extends('layouts.app')
@section('title', $page_title)
@push('styles')
    <link href="{{ asset('plugins/custom/datatables/datatables.bundle.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('css/daterangepicker.min.css') }}" rel="stylesheet" type="text/css" />
@endpush
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title">
                        <h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row justify-content-center">
                            <div class="form-group col-md-3">
                                <label for="name">Choose Your Date</label>
                                <div class="input-group">
                                    <input type="text" class="form-control daterangepicker-filed" value="">
                                    <input type="hidden" id="start_date" name="start_date" value="">
                                    <input type="hidden" id="end_date" name="end_date" value="">
                                </div>
                            </div>
                            <x-form.selectbox labelName="Dealer" name="dealer_coa_id" col="col-md-3" class="selectpicker">
                                @if (!$dealers->isEmpty())
                                    @foreach ($dealers as $dealer)
                                        <option value="{{ $dealer->dealer_coa_id }}">{{ $dealer->name }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <div class="col-md-3">
                                <div style="margin-top:28px;">
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right"
                                        type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i
                                            class="fas fa-undo-alt"></i></button>
                                    <button id="btn-filter"
                                        class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button"
                                        data-toggle="tooltip" data-theme="dark" title="Search"><i
                                            class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="table-responsive">
                                    <table id="dataTable" class="table table-bordered table-hover">
                                        <thead class="bg-primary">
                                            <tr>
                                                <th>{{ 'SL' }}</th>
                                                <th>{{ 'Voucher Date' }}</th>
                                                <th>{{ 'Voucher No' }}</th>
                                                <th>{{ 'Dealer' }}</th>
                                                <th>{{ 'Account Head' }}</th>
                                                <th>{{ 'Description' }}</th>
                                                <th>{{ 'Debit' }}</th>
                                                <th>{{ 'Credit' }}</th>
                                                <th>{{ 'Balance' }}</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                        <tfoot>
                                            <tr class="bg-primary">
                                                <th style="text-align: right !important;font-weight:bold;" colspan="6">Total</th>
                                                <th style="text-align: right !important;font-weight:bold;"></th>
                                                <th style="text-align: right !important;font-weight:bold;"></th>
                                                <th style="text-align: right !important;font-weight:bold;"></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    <script src="{{ asset('plugins/custom/datatables/datatables.bundle.js') }}" type="text/javascript"></script>
    <script src="{{ asset('js/moment.js') }}"></script>
    <script src="{{ asset('js/knockout-3.4.2.js') }}"></script>
    <script src="{{ asset('js/daterangepicker.min.js') }}"></script>
    <script>
        let table;
        $(document).ready(function() {
            $('.daterangepicker-filed').daterangepicker({
                callback: function(startDate, endDate, period) {
                    var start_date = startDate.format('YYYY-MM-DD');
                    var end_date = endDate.format('YYYY-MM-DD');
                    var title = start_date + ' To ' + end_date;
                    $(this).val(title);
                    $('input[name="start_date"]').val(start_date);
                    $('input[name="end_date"]').val(end_date);
                }
            });
            table = $('#dataTable').DataTable({
                "processing": true,
                "serverSide": true,
                "order": [],
                "responsive": false,
                "bInfo": true,
                "bFilter": false,
                "lengthMenu": [
                    [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
                    [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
                ],
                "pageLength": 25,
                "language": {
                    processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable: '<strong class="text-danger">No Data Found</strong>',
                    infoEmpty: '',
                    zeroRecords: '<strong class="text-danger">No Data Found</strong>'
                },
                "ajax": {
                    "url": "{{ route('dealer.monthly.commission.ledger.datatable') }}",
                    "type": "POST",
                    "data": function(data) {
                        data.start_date = $("#form-filter #start_date").val();
                        data.end_date = $("#form-filter #end_date").val();
                        data.dealer_coa_id = $("#form-filter #dealer_coa_id").val();
                        data._token = _token;
                    }
                },
                "columnDefs": [{
                    "targets": [0, 1, 2, 3, 4, 5, 6, 7, 8],
                    "orderable": false,
                    "className": "text-center"
                }, ],

                "footerCallback": function(row, data, start, end, display) {
                    var api = this.api(),
                        data;

                    // Remove the formatting to get integer data for summation
                    var intVal = function(i) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                    };
                    var debit = 0;
                    var credit = 0;
                    var balance = 0;
                    var currency_symbol = "{{ config('settings.currency_symbol') }}";
                    var currency_position = "{{ config('settings.currency_position') }}";
                    // Total over all pages
                    for (let index = 6; index <= 7; index++) {
                        // Total over this page
                        pageTotal = api
                            .column(index, {
                                page: 'current'
                            })
                            .data()
                            .reduce(function(a, b) {
                                return intVal(a) + intVal(b);
                            }, 0);
                        if (index == 6) {
                            debit = pageTotal;
                        } else {
                            credit = pageTotal;
                        }



                        var total = (currency_position == 1) ? currency_symbol + ' ' + number_format(
                            pageTotal) : number_format(pageTotal) + ' ' + currency_symbol;
                        // Update footer
                        $(api.column(index).footer()).html('= ' + total );
                    }
                    balance = (currency_position == 1) ? currency_symbol + ' ' + number_format((debit -
                        credit)) : number_format((debit - credit)) + ' ' + currency_symbol;
                    $(api.column(8).footer()).html('= ' + balance );
                }
            });
            $('#btn-filter').click(function() {
                table.ajax.reload();
            });
            $('#btn-reset').click(function() {
                $('#form-filter')[0].reset();
                $('#form-filter #start_date').val("");
                $('#form-filter #end_date').val("");
                $('#form-filter .selectpicker').selectpicker('refresh');
                table.ajax.reload();
            });
        });
    </script>
@endpush
