@extends('layouts.app')
@section('title', $page_title)
@push('styles')
    <link href="{{ asset('plugins/custom/datatables/datatables.bundle.css') }}" rel="stylesheet" type="text/css" />
@endpush
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title">
                        <h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3>
                    </div>
                    <div class="card-toolbar">
                        @if (permission('dealer-add'))
                            <a href="{{ route('dealer.monthly.commission.create') }}"
                                class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add
                                New</a>
                        @endif
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <x-form.selectbox labelName="Month" name="month" required="required" col="col-md-3"
                                class="selectpicker">
                                <option value="1">January</option>
                                <option value="2">February</option>
                                <option value="3">March</option>
                                <option value="4">April</option>
                                <option value="5">May</option>
                                <option value="6">June</option>
                                <option value="7">July</option>
                                <option value="8">August</option>
                                <option value="9">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </x-form.selectbox>
                            @php
                                $currentYear = date('Y');
                                $nextYear = $currentYear + 1;
                            @endphp
                            <x-form.selectbox labelName="Year" name="year" required="required" col="col-md-3"
                                class="selectpicker">
                                <option value="{{ $currentYear }}">{{ $currentYear }}</option>
                                <option value="{{ $nextYear }}">{{ $nextYear }}</option>
                            </x-form.selectbox>
                            <x-form.selectbox labelName="Dealer" name="dealer_id" required="required" col="col-md-3"
                                class="selectpicker">
                                @if (!$dealers->isEmpty())
                                    @foreach ($dealers as $value)
                                        <option value="{{ $value->id }}">{{ $value->name }}
                                        </option>
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
                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead class="bg-primary">
                                        <tr>
                                            <th>Sl</th>
                                            <th>Dealer Name</th>
                                            <th>Year</th>
                                            <th>Month</th>
                                            <th>Target Quantity</th>
                                            <th>Acheived Quantity</th>
                                            <th>Commission Amount</th>
                                            {{-- <th>Paid Amount</th>
                                            <th>Due Amount</th> --}}
                                            <th>Created By</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include('dealer::monthly_target.view')
    @push('scripts')
        <script>
            $(document).ready(function() {
                table = $('#dataTable').DataTable({
                    "processing": true,
                    "serverSide": true,
                    "order": [],
                    "responsive": true,
                    "bInfo": true,
                    "bFilter": false,
                    "ordering": false,
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
                        "url": "{{ route('dealer.monthly.commission.datatableData') }}",
                        "type": "POST",
                        "data": function(data) {
                            data.year = $('#year').val();
                            data.month = $('#month').val();
                            data.dealer_id = $('#dealer_id').val();
                            data._token = _token;
                        }
                    },
                    "columnDefs": [{
                        "targets": [8],
                        "orderable": false,
                        "className": "text-center"
                    }, ],
                    "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
                        "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",

                    "buttons": [{
                            'extend': 'colvis',
                            'className': 'btn btn-secondary btn-sm text-white',
                            'text': 'Column',
                            'columns': ':gt(0)'
                        },
                        {
                            "extend": 'print',
                            'text': 'Print',
                            'className': 'btn btn-secondary btn-sm text-white',
                            "title": "{{ $page_title }} List",
                            "orientation": "landscape", //portrait
                            "pageSize": "A4", //A3,A5,A6,legal,letter
                            "exportOptions": {
                                columns: ':visible:not(:eq(0),:eq(10))'
                            },
                            customize: function(win) {
                                $(win.document.body).addClass('bg-white');
                                $(win.document.body).find('table thead').css({
                                    'background': '#034d97'
                                });
                                $(win.document.body).find('table tfoot tr').css({
                                    'background-color': '#034d97'
                                });
                                $(win.document.body).find('h1').css('text-align', 'center');
                                $(win.document.body).find('h1').css('font-size', '15px');
                                $(win.document.body).find('table').css('font-size', 'inherit');
                            },
                        },
                        {
                            "extend": 'csv',
                            'text': 'CSV',
                            'className': 'btn btn-secondary btn-sm text-white',
                            "title": "{{ $page_title }} List",
                            "filename": "{{ strtolower(str_replace(' ', '-', $page_title)) }}-list",
                            "exportOptions": {
                                columns: ':visible:not(:eq(0),:eq(10))'
                            }
                        },
                        {
                            "extend": 'excel',
                            'text': 'Excel',
                            'className': 'btn btn-secondary btn-sm text-white',
                            "title": "{{ $page_title }} List",
                            "filename": "{{ strtolower(str_replace(' ', '-', $page_title)) }}-list",
                            "exportOptions": {
                                columns: ':visible:not(:eq(0),:eq(10))'
                            }
                        },
                        {
                            "extend": 'pdf',
                            'text': 'PDF',
                            'className': 'btn btn-secondary btn-sm text-white',
                            "title": "{{ $page_title }} List",
                            "filename": "{{ strtolower(str_replace(' ', '-', $page_title)) }}-list",
                            "orientation": "landscape", //portrait
                            "pageSize": "A4", //A3,A5,A6,legal,letter
                            "exportOptions": {
                                columns: ':visible:not(:eq(0),:eq(11))'

                            },
                            customize: function(doc) {
                                doc.defaultStyle.fontSize = 7; //<-- set fontsize to 16 instead of 10
                                doc.styles.tableHeader.fontSize = 7;
                                doc.pageMargins = [5, 5, 5, 5];
                            }
                        },
                    ],
                });
                $('#btn-filter').click(function() {
                    table.ajax.reload();
                });
                $('#btn-reset').click(function() {
                    $('#form-filter')[0].reset();
                    $('#form-filter .selectpicker').selectpicker('refresh');
                    table.ajax.reload();
                });
                $(document).on('click', '.view_data', function() {
                    let id = $(this).data('id');
                    if (id) {
                        $.ajax({
                            url: "{{ route('dealer.monthly.commission.show') }}",
                            type: "POST",
                            data: {
                                id: id,
                                _token: _token
                            },
                            success: function(data) {
                                $('#view_modal #view-data').html('');
                                $('#view_modal #view-data').html(data);
                                $('#view_modal').modal({
                                    keyboard: false,
                                    backdrop: 'static',
                                });
                            },
                            error: function(xhr, ajaxOption, thrownError) {
                                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr
                                    .responseText);
                            }
                        });
                    }
                });

                $(document).on('click', '.generate-data', function() {
                    //stopping double click
                    $(this).prop('disabled', true);

                    let id = $(this).data('dealerid');
                    let targetId = $(this).data('id');
                    if (id) {
                        $.ajax({
                            url: "{{ route('dealer.monthly.commission.generate') }}",
                            type: "POST",
                            data: {
                                id: id,
                                targetId: targetId,
                                _token: _token
                            },
                            beforeSend: function() {
                                $('#status-btn').addClass(
                                    'kt-spinner kt-spinner--md kt-spinner--light');
                            },
                            complete: function() {
                                // Re-enable the button after the AJAX request is completed
                                $('.generate-data').prop('disabled', false);

                                $('#status-btn').removeClass(
                                    'kt-spinner kt-spinner--md kt-spinner--light');
                            },
                            success: function(data) {
                                notification(data.status, data.message);
                            },
                            error: function(xhr, ajaxOption, thrownError) {
                                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr
                                    .responseText);
                            }
                        });
                    }
                });
            });
        </script>
    @endpush
@endsection
