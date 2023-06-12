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
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <x-form.textbox labelName="Shop Name" name="shop_name" col="col-md-3" />
                            <x-form.textbox labelName="Customer Name" name="name" col="col-md-3" />
                            <x-form.textbox labelName="Mobile" name="mobile" col="col-md-3" />
                            <x-form.selectbox labelName="Customer Group" name="customer_group_id" col="col-md-3"
                                class="selectpicker">
                                @if (!$customer_groups->isEmpty())
                                    @foreach ($customer_groups as $value)
                                        <option value="{{ $value->id }}">{{ $value->group_name }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            @if (Auth::user()->warehouse_id)
                                <input type="hidden" name="warehouse_id" id="warehouse_id"
                                    value="{{ Auth::user()->warehouse_id }}">
                            @else
                                <x-form.selectbox labelName="Depo" name="warehouse_id" col="col-md-3"
                                    class="selectpicker">
                                    @if (!$warehouses->isEmpty())
                                        @foreach ($warehouses as $id => $name)
                                            <option value="{{ $id }}">{{ $name }}</option>
                                        @endforeach
                                    @endif
                                </x-form.selectbox>
                            @endif
                            <x-form.selectbox labelName="District" name="district_id" col="col-md-3" class="selectpicker"
                                onchange="getUpazilaList(this.value,1)">
                                @if (!$locations->isEmpty())
                                    @foreach ($locations as $location)
                                        @if ($location->type == 1 && $location->parent_id == null)
                                            <option value="{{ $location->id }}">{{ $location->name }}</option>
                                        @endif
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <x-form.selectbox labelName="Upazila" name="upazila_id" col="col-md-3" class="selectpicker"
                                onchange="getAreaList(this.value,1)">
                                @if (!$locations->isEmpty())
                                    @foreach ($locations as $location)
                                        @if ($location->type == 2 && $location->parent_id == auth()->user()->district_id)
                                            <option value="{{ $location->id }}">{{ $location->name }}</option>
                                        @endif
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <x-form.selectbox labelName="Area" name="area_id" col="col-md-3" class="selectpicker">
                                @if (!$locations->isEmpty())
                                    @foreach ($locations as $location)
                                        @if ($location->type == 4 && $location->grand_parent_id == auth()->user()->district_id)
                                            <option value="{{ $location->id }}">{{ $location->name }}</option>
                                        @endif
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <x-form.selectbox labelName="Status" name="status" col="col-md-3" class="selectpicker">
                                @foreach (STATUS as $key => $value)
                                    <option value="{{ $key }}">{{ $value }}</option>
                                @endforeach
                            </x-form.selectbox>
                            <div class="{{ Auth::user()->warehouse_id ? 'col-md-12' : 'col-md-9' }}"
                                style="padding-top: 28px;">
                                <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right"
                                    type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i
                                        class="fas fa-undo-alt"></i></button>
                                <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right"
                                    type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i
                                        class="fas fa-search"></i></button>
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
                                            <th>Customer</th>
                                            <th>Group Name</th>
                                            <th>Depo</th>
                                            <th>District</th>
                                            <th>Upazila</th>
                                            <th>Balance</th>
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
@endsection
@push('scripts')
    <script src="{{ asset('plugins/custom/datatables/datatables.bundle.js') }}" type="text/javascript"></script>
    <script src="{{ asset('js/spartan-multi-image-picker.min.js') }}"></script>
    <script>
        var table;
        $(document).ready(function() {
            table = $('#dataTable').DataTable({
                "processing": true, //Feature control the processing indicator
                "serverSide": true, //Feature control DataTable server side processing mode
                "order": [], //Initial no order
                "responsive": true, //Make table responsive in mobile device
                "bInfo": true, //TO show the total number of data
                "bFilter": false, //For datatable default search box show/hide
                "lengthMenu": [
                    [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
                    [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
                ],
                "pageLength": 25, //number of data show per page
                "language": {
                    processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable: '<strong class="text-danger">No Data Found</strong>',
                    infoEmpty: '',
                    zeroRecords: '<strong class="text-danger">No Data Found</strong>'
                },
                "ajax": {
                    "url": "{{ route('customer.due.report.datatable.data') }}",
                    "type": "POST",
                    "data": function(data) {
                        data.name = $("#form-filter #name").val();
                        data.shop_name = $("#form-filter #shop_name").val();
                        data.mobile = $("#form-filter #mobile").val();
                        data.customer_group_id = $("#form-filter #customer_group_id").val();
                        data.warehouse_id = $("#form-filter #warehouse_id").val();
                        data.district_id = $("#form-filter #district_id").val();
                        data.upazila_id = $("#form-filter #upazila_id").val();
                        data.area_id = $("#form-filter #area_id").val();
                        data.status = $("#form-filter #status").val();
                        data._token = _token;
                    }
                },
                "columnDefs": [{
                        "targets": [6],
                        "orderable": false,
                        "className": "text-center"
                    },
                    {
                        "targets": [0, 1, 3, 4],
                        "className": "text-center"
                    },
                    {
                        "targets": [5],
                        "className": "text-right"
                    },
                ],
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
                            columns: ':visible:not(:eq(9))'
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
                            columns: ':visible:not(:eq(9))'
                        }
                    },
                    {
                        "extend": 'excel',
                        'text': 'Excel',
                        'className': 'btn btn-secondary btn-sm text-white',
                        "title": "{{ $page_title }} List",
                        "filename": "{{ strtolower(str_replace(' ', '-', $page_title)) }}-list",
                        "exportOptions": {
                            columns: ':visible:not(:eq(9))'
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
                            columns: ':visible:not(:eq(9))'
                        },
                        customize: function(doc) {
                            doc.defaultStyle.fontSize = 7; //<-- set fontsize to 16 instead of 10
                            doc.styles.tableHeader.fontSize = 7;
                            doc.pageMargins = [5, 5, 5, 5];
                        }
                    },
                ],
            });
        });
    </script>
@endpush
