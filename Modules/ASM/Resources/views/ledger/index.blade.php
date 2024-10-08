@extends('layouts.app')
@section('title', $page_title)
@push('styles')
    <link href="{{asset('plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('css/daterangepicker.min.css')}}" rel="stylesheet" type="text/css" />
@endpush
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3></div>
                    <div class="card-toolbar">
                        @if (permission('salesmen-access'))<a href="{{ route('sales.representative') }}" class="btn btn-primary btn-sm font-weight-bolder mr-3"><i class="fas fa-user-tie"></i> Manage Salesmen</a>@endif
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row justify-content-center">
                            <x-form.selectbox labelName="Salesmen" name="salesmen_id" col="col-md-3" class="selectpicker">
                                @if (!$asms->isEmpty())
                                    @foreach ($asms as $asm)
                                        <option value="{{ $asm->id }}" @if($asm->coa != null) data-coaid="{{ $asm->coa->id }}" @endif data-name="{{ $asm->name }}">{{ $asm->name.' - '.$asm->phone }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <div class="form-group col-md-3">
                                <label for="name">Choose Your Date</label>
                                <div class="input-group">
                                    <input type="text" class="form-control daterangepicker-filed">
                                    <input type="hidden" id="from_date" name="from_date" >
                                    <input type="hidden" id="to_date" name="to_date" >
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div style="margin-top:28px;">
                                    <div style="margin-top:28px;">
                                        <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>
                                        <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>
                                    </div>
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
                                        <th>Date</th>
                                        <th>Narration</th>
                                        <th>Voucher No</th>
                                        <th>Debit</th>
                                        <th>Credit</th>
                                        <th>Balance</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                    <tfoot>
                                    <tr class="bg-primary">
                                        <th></th>
                                        <th></th>
                                        <th style="text-align: right !important;font-weight:bold;">Total</th>
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
@endsection
@push('scripts')
    <script src="{{asset('plugins/custom/datatables/datatables.bundle.js')}}" type="text/javascript"></script>
    <script src="{{asset('js/moment.js')}}"></script>
    <script src="{{asset('js/knockout-3.4.2.js')}}"></script>
    <script src="{{asset('js/daterangepicker.min.js')}}"></script>
    <script>
        $('.daterangepicker-filed').daterangepicker({
            callback: function(startDate, endDate, period){
                var start_date = startDate.format('YYYY-MM-DD');
                var end_date   = endDate.format('YYYY-MM-DD');
                var title = start_date + ' To ' + end_date;
                $(this).val(title);
                $('input[name="from_date"]').val(start_date);
                $('input[name="to_date"]').val(end_date);
            }
        });
        var table;
        $(document).ready(function(){
            table = $('#dataTable').DataTable({
                "processing"  : true,
                "serverSide"  : true,
                "order"       : [],
                "responsive"  : true,
                "bInfo"       : true,
                "bFilter"     : false,
                "lengthMenu"  : [
                    [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
                    [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
                ],
                "pageLength"      : 25,
                "language"        : {
                    processing    : `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable    : '<strong class="text-danger">No Data Found</strong>',
                    infoEmpty     : '',
                    zeroRecords   : '<strong class="text-danger">No Data Found</strong>'
                },
                "ajax": {
                    "url" : "{{route('sales.representative.ledger.datatable.data')}}",
                    "type": "POST",
                    "data": function (data) {
                        data.salesmen_id = $("#form-filter #salesmen_id option:selected").val();
                        data.from_date   = $("#form-filter #from_date").val();
                        data.to_date     = $("#form-filter #to_date").val();
                        data._token      = _token;
                    }
                },
                "columnDefs": [
                    {
                        "targets": [0,2],
                        "className": "text-center"
                    },
                    {
                        "targets": [3,4,5],
                        "className": "text-right"
                    },
                ],
                "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",

                "buttons": [
                    {
                        'extend':'colvis','className':'btn btn-secondary btn-sm text-white','text':'Column','columns': ':gt(0)'
                    },
                    {
                        "extend": 'print',
                        'text':'Print',
                        'className':'btn btn-secondary btn-sm text-white',
                        "title": "{{ $page_title }} List",
                        "orientation": "landscape", //portrait
                        "pageSize": "A4", //A3,A5,A6,legal,letter
                        "exportOptions": {
                            columns: function (index, data, node) {
                                return table.column(index).visible();
                            }
                        },
                        customize: function (win) {
                            $(win.document.body).addClass('bg-white');
                            $(win.document.body).find('table thead').css({'background':'#034d97'});
                            $(win.document.body).find('table tfoot tr').css({'background-color':'#034d97'});
                            $(win.document.body).find('h1').css('text-align', 'center');
                            $(win.document.body).find('h1').css('font-size', '15px');
                            $(win.document.body).find('table').css( 'font-size', 'inherit' );
                        },
                        footer:true
                    },
                    {
                        "extend": 'csv',
                        'text':'CSV',
                        'className':'btn btn-secondary btn-sm text-white',
                        "title": "{{ $page_title }} List",
                        "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                        "exportOptions": {
                            columns: function (index, data, node) {
                                return table.column(index).visible();
                            }
                        },
                        footer:true
                    },
                    {
                        "extend": 'excel',
                        'text':'Excel',
                        'className':'btn btn-secondary btn-sm text-white',
                        "title": "{{ $page_title }} List",
                        "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                        "exportOptions": {
                            columns: function (index, data, node) {
                                return table.column(index).visible();
                            }
                        },
                        footer:true
                    },
                    {
                        "extend": 'pdf',
                        'text':'PDF',
                        'className':'btn btn-secondary btn-sm text-white',
                        "title": "{{ $page_title }} List",
                        "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                        "orientation": "landscape", //portrait
                        "pageSize": "A4", //A3,A5,A6,legal,letter
                        "exportOptions": {
                            columns: function (index, data, node) {
                                return table.column(index).visible();
                            }
                        },
                        footer:true,
                        customize: function(doc) {
                            doc.defaultStyle.fontSize = 7;
                            doc.styles.tableHeader.fontSize = 7;
                            doc.styles.tableFooter.fontSize = 7;
                            doc.pageMargins = [5,5,5,5];
                        }
                    },
                ],
                "footerCallback": function ( row, data, start, end, display ) {
                    var api = this.api(), data;
                    var intVal = function ( i ) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '')*1 :
                            typeof i === 'number' ?
                                i : 0;
                    };
                    var debit=0;
                    var credit=0;
                    var balance = 0;
                    var currency_symbol = "{{ config('settings.currency_symbol') }}";
                    var currency_position = "{{ config('settings.currency_position') }}";
                    for (let index = 3; index <= 4; index++) {
                        pageTotal = api
                            .column( index, { page: 'current'} )
                            .data()
                            .reduce( function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0 );
                        if(index == 3){
                            debit = pageTotal;
                        }else{
                            credit = pageTotal;
                        }
                        var total = (currency_position == 1) ? currency_symbol+' '+number_format(pageTotal) : number_format(pageTotal)+' '+currency_symbol;
                        $(api.column( index ).footer()).html(total);
                    }
                    balance = (currency_position == 1) ? currency_symbol+' '+number_format((debit - credit)) : number_format((debit - credit))+' '+currency_symbol;
                    $(api.column(5).footer()).html(balance);
                }
            });
            $('#btn-filter').click(function () {table.ajax.reload();});
            $('#btn-reset').click(function () {
                $('#form-filter')[0].reset();
                $('#form-filter #from_date').val("");
                $('#form-filter #to_date').val("");
                $('#form-filter .selectpicker').selectpicker('refresh');
                table.ajax.reload();
            });
        });
    </script>
@endpush
