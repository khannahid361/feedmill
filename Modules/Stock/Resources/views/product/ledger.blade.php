@extends('layouts.app')
@section('title', $page_title)
@push('styles')
    <link href="{{asset('plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
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
                        <a href="{{ route('convert.product.bag') }}"  class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add Product Bag</a>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <x-form.textbox labelName="Product Name" name="name" col="col-md-3" />
                            <x-form.selectbox labelName="Category" name="category" col="col-md-3" class="selectpicker">
                                <option value="0" selected>All Category</option>
                                @if (!$categories->isEmpty())
                                    @foreach ($categories as $item)
                                        <option value="{{ $item->id }}">{{ $item->name }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <x-form.selectbox labelName="Depo" name="warehouse" col="col-md-3" required="required" class="selectpicker">
                                @if (!$warehouses->isEmpty())
                                    @foreach ($warehouses as $id => $name)
                                        <option value="{{ $id }}">{{ $name }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <div class="col-md-3">
                                <div style="margin-top:28px;">
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-left mr-2" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>
                                    <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon float-left" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>
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
                                        <th>Warehouse Name</th>
                                        <th>Product Name</th>
                                        <th>Product Code</th>
                                        <th>Category</th>
                                        <th>Per Unit Cost</th>
                                        <th>Bag</th>
                                        <th>Bag Cost</th>
                                        <th>Unbagged Quantity</th>
                                        <th>Unbagged Cost</th>
                                        <th>Balance</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                    <tfoot>
                                    <tr class="bg-primary">
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th style="text-align: right !important;font-weight:bold;color:white;">Total</th>
                                        <th style="text-align: right !important;font-weight:bold;color:white;"></th>
                                        <th style="text-align: right !important;font-weight:bold;color:white;"></th>
                                        <th style="text-align: right !important;font-weight:bold;color:white;"></th>
                                        <th></th>
                                        <th></th>
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
    <script src="{{asset('js/spartan-multi-image-picker.min.js')}}"></script>
    <script>
        let table;
        $(document).ready(function() {
            table = $('#dataTable').DataTable({
                "processing": true,
                "serverSide": true,
                "order"     : [],
                "responsive": true,
                "bInfo"     : true,
                "bFilter"   : false,
                "lengthMenu": [
                    [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
                    [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
                ],
                "pageLength": -1,
                "language"  : {
                    processing : `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable : '<strong class="text-danger">No Data Found</strong>',
                    infoEmpty  : '',
                    zeroRecords: '<strong class="text-danger">No Data Found</strong>'
                },
                "ajax": {
                    "url" : "{{route('warehouse.product.ledger.datatable.data')}}",
                    "type": "POST",
                    "data": function (data) {
                        data.name = $("#form-filter #name").val();
                        data.category = $("#form-filter #category").val();
                        data.warehouse = $("#form-filter #warehouse").val();
                        data._token = _token;
                    }
                },
                "columnDefs"   : [{
                    "targets"  : [0,1,2,3,4,5,6,7,8,9,10],
                    "orderable": false,
                    "className": "text-center"
                },],
                "dom"    : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" + "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",
                "buttons": [
                        @if (permission('product-stock-report-access')){
                        'extend'   : 'colvis',
                        'className': 'btn btn-secondary btn-sm text-white',
                        'text'     : 'Column',
                        'columns'  : ':gt(0)'
                    }, {
                        "extend"     : 'print',
                        'text'       : 'Print',
                        'className'  : 'btn btn-secondary btn-sm text-white',
                        "title"      : "{{ $page_title }} List",
                        "orientation": "landscape",
                        "pageSize"   : "A4",
                        customize: function (win) {
                            $(win.document.body).addClass('bg-white');
                            $(win.document.body).find('table thead').css({'background': '#034d97'});
                            $(win.document.body).find('table tfoot tr').css({'background-color': '#034d97'});
                            $(win.document.body).find('h1').css('text-align', 'center');
                            $(win.document.body).find('h1').css('font-size', '15px');
                            $(win.document.body).find('table').css('font-size', 'inherit');
                        },
                    }, {
                        "extend"   : 'csv',
                        'text'     : 'CSV',
                        'className': 'btn btn-secondary btn-sm text-white',
                        "title"    : "{{ $page_title }} List",
                        "filename" : "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                    }, {
                        "extend"   : 'excel',
                        'text'     : 'Excel',
                        'className': 'btn btn-secondary btn-sm text-white',
                        "title"    : "{{ $page_title }} List",
                        "filename" : "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                    }, {
                        "extend"     : 'pdf',
                        'text'       : 'PDF',
                        'className'  : 'btn btn-secondary btn-sm text-white',
                        "title"      : "{{ $page_title }} List",
                        "filename"   : "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                        "orientation": "landscape",
                        "pageSize"   : "A4",
                        customize    : function (doc) {
                            doc.defaultStyle.fontSize = 7;
                            doc.styles.tableHeader.fontSize = 7;
                            doc.pageMargins = [5, 5, 5, 5];
                        }
                    },
                    @endif
                ],
                "footerCallback": function ( row, data, start, end, display ) {
                    var api = this.api(), data;
                    var intVal = function ( i ) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '')*1 :
                            typeof i === 'number' ?
                                i : 0;
                    };
                    for (let index = 6; index <7; index++) {
                        total = api
                            .column( index )
                            .data()
                            .reduce( function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0 );
                        pageTotal = api
                            .column(index, { page: 'current'} )
                            .data()
                            .reduce( function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0 );
                        if(index == 8) {
                            $( api.column( index ).footer() ).html('= '+number_format(pageTotal));
                        }else{
                            $( api.column( index ).footer() ).html('= '+number_format(pageTotal));
                        }

                    }
                    for (let index = 7; index <=8; index++) {
                        total = api
                            .column( index )
                            .data()
                            .reduce( function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0 );
                        pageTotal = api
                            .column(index, { page: 'current'} )
                            .data()
                            .reduce( function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0 );
                        if(index == 8) {
                            $( api.column( index ).footer() ).html('= '+number_format(pageTotal)+'Tk');
                        }else{
                            $( api.column( index ).footer() ).html('= '+number_format(pageTotal));
                        }

                    }

                    for (let index = 9; index <=10; index++) {
                        total = api
                            .column( index )
                            .data()
                            .reduce( function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0 );
                        pageTotal = api
                            .column(index, { page: 'current'} )
                            .data()
                            .reduce( function (a, b) {
                                return intVal(a) + intVal(b);
                            }, 0 );
                        if(index == 9) {
                            $( api.column( index ).footer() ).html('= '+number_format(pageTotal));
                        }else{
                            $( api.column( index ).footer() ).html('= '+number_format(pageTotal));
                        }

                    }
                }
            });
            $('#btn-filter').click(function () { table.ajax.reload(); });
            $('#btn-reset').click(function () {
                $('#form-filter')[0].reset();
                $('#form-filter .selectpicker').selectpicker('refresh');
                table.ajax.reload();
            });
        })
    </script>
@endpush
