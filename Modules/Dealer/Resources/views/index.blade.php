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
                <div class="card-title"><h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3></div>
                <div class="card-toolbar">
                    @if (permission('dealer-add'))
                    <a href="{{ url('dealer/add') }}" class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a>
                    @endif
                </div>
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <x-form.textbox labelName="Shop Name" name="shop_name" col="col-md-3" />
                        <x-form.textbox labelName="Dealer Name" name="name" col="col-md-3" />
                        <x-form.textbox labelName="Mobile" name="mobile" col="col-md-3" />
                        @if(Auth::user()->warehouse_id)
                        <input type="hidden" name="warehouse_id" id="warehouse_id" value="{{ Auth::user()->warehouse_id }}">
                        @else
                        <x-form.selectbox labelName="Depo" name="warehouse_id" required="required" col="col-md-3" class="selectpicker">
                            @if (!$warehouses->isEmpty())
                                @foreach ($warehouses as $id => $name)
                                    <option value="{{ $id }}">{{ $name }}</option>
                                @endforeach
                            @endif
                        </x-form.selectbox>
                        @endif
                        <x-form.selectbox labelName="District" name="district_id" col="col-md-3" class="selectpicker" onchange="getUpazilaList(this.value)" >
                            @if (!$districts->isEmpty())
                                @foreach ($districts as $id => $name)
                                    <option value="{{ $id }}">{{ $name }}</option>
                                @endforeach
                            @endif
                        </x-form.selectbox>
                        <x-form.selectbox labelName="Upazila" name="upazila_id" col="col-md-3" class="selectpicker">
                            @if (!$upazilas->isEmpty())
                                @foreach ($upazilas as $id => $name)
                                    <option value="{{ $id }}">{{ $name }}</option>
                                @endforeach
                            @endif
                        </x-form.selectbox>
                        <x-form.selectbox labelName="Status" name="status" col="col-md-3" class="selectpicker">
                            @foreach (STATUS as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </x-form.selectbox>
                        <div class="{{ Auth::user()->warehouse_id ? 'col-md-6' : 'col-md-3' }}">
                            <div style="margin-top:28px;">
                            <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>
                            <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>
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
                                        @if (permission('dealer-bulk-delete'))
                                        <th>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="select_all" onchange="select_all()">
                                                <label class="custom-control-label" for="select_all"></label>
                                            </div>
                                        </th>
                                        @endif
                                        <th>Sl</th>
                                        <th>Image</th>
                                        <th>Dealer</th>
                                        <th>Shop Name</th>
                                        <th>Username</th>
                                        @if(empty(Auth::user()->warehouse_id))
                                        <th>Depo</th>
                                        @endif
                                        <th>District</th>
                                        <th>Upazila</th>
                                        <th>Status</th>
                                        <th>Balance</th>
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
@include('dealer::view')
@endsection
@push('scripts')
<script src="{{asset('plugins/custom/datatables/datatables.bundle.js')}}" type="text/javascript"></script>
<script src="{{asset('js/spartan-multi-image-picker.min.js')}}"></script>
<script>
var table;
$(document).ready(function(){
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
            "url": "{{route('dealer.datatable.data')}}",
            "type": "POST",
            "data": function (data) {
                data.name              = $("#form-filter #name").val();
                data.shop_name         = $("#form-filter #shop_name").val();
                data.mobile            = $("#form-filter #mobile").val();
                data.warehouse_id      = $("#form-filter #warehouse_id").val();
                data.district_id       = $("#form-filter #district_id").val();
                data.upazila_id        = $("#form-filter #upazila_id").val();
                data.status            = $("#form-filter #status").val();
                data._token            = _token;
            }
        },
        "columnDefs": [{
                @if (permission('dealer-bulk-delete'))
                    @if(empty(Auth::user()->warehouse_id))
                    "targets": [0,11],
                    @else
                    "targets": [0,10],
                    @endif
                @else
                    @if(empty(Auth::user()->warehouse_id))
                    "targets": [10],
                    @else
                    "targets": [9],
                    @endif
                @endif
                "orderable": false,
                "className": "text-center"
            },
            {
                @if (permission('dealer-bulk-delete'))
                    @if(empty(Auth::user()->warehouse_id))
                    "targets": [1,2,5,6,7,8,9],
                    @else
                    "targets": [1,2,5,6,7,8],
                    @endif
                @else
                    @if(empty(Auth::user()->warehouse_id))
                    "targets": [0,1,4,5,6,7,8],
                    @else
                    "targets": [0,1,4,5,6,7],
                    @endif
                @endif
                "className": "text-center"
            },
            {
                @if (permission('dealer-bulk-delete'))
                    @if(empty(Auth::user()->warehouse_id))
                    "targets": [10],
                    @else
                    "targets": [9],
                    @endif
                @else
                    @if(empty(Auth::user()->warehouse_id))
                    "targets": [9],
                    @else
                    "targets": [8],
                    @endif
                @endif
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
                    @if (permission('dealer-bulk-delete'))
                        @if(empty(Auth::user()->warehouse_id))
                        columns: ':visible:not(:eq(0),:eq(11))'
                        @else
                        columns: ':visible:not(:eq(0),:eq(10))'
                        @endif
                    @else
                        @if(empty(Auth::user()->warehouse_id))
                        columns: ':visible:not(:eq(10))'
                        @else
                        columns: ':visible:not(:eq(9))'
                        @endif
                    @endif

                },
                customize: function (win) {
                    $(win.document.body).addClass('bg-white');
                    $(win.document.body).find('table thead').css({'background':'#034d97'});
                    $(win.document.body).find('table tfoot tr').css({'background-color':'#034d97'});
                    $(win.document.body).find('h1').css('text-align', 'center');
                    $(win.document.body).find('h1').css('font-size', '15px');
                    $(win.document.body).find('table').css( 'font-size', 'inherit' );
                },
            },
            {
                "extend": 'csv',
                'text':'CSV',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "{{ $page_title }} List",
                "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                "exportOptions": {
                    @if (permission('dealer-bulk-delete'))
                        @if(empty(Auth::user()->warehouse_id))
                        columns: ':visible:not(:eq(0),:eq(11))'
                        @else
                        columns: ':visible:not(:eq(0),:eq(10))'
                        @endif
                    @else
                        @if(empty(Auth::user()->warehouse_id))
                        columns: ':visible:not(:eq(10))'
                        @else
                        columns: ':visible:not(:eq(9))'
                        @endif
                    @endif
                }
            },
            {
                "extend": 'excel',
                'text':'Excel',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "{{ $page_title }} List",
                "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                "exportOptions": {
                    @if (permission('dealer-bulk-delete'))
                        @if(empty(Auth::user()->warehouse_id))
                        columns: ':visible:not(:eq(0),:eq(11))'
                        @else
                        columns: ':visible:not(:eq(0),:eq(10))'
                        @endif
                    @else
                        @if(empty(Auth::user()->warehouse_id))
                        columns: ':visible:not(:eq(10))'
                        @else
                        columns: ':visible:not(:eq(9))'
                        @endif
                    @endif
                }
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
                    @if (permission('dealer-bulk-delete'))
                        @if(empty(Auth::user()->warehouse_id))
                        columns: ':visible:not(:eq(0),:eq(11))'
                        @else
                        columns: ':visible:not(:eq(0),:eq(10))'
                        @endif
                    @else
                        @if(empty(Auth::user()->warehouse_id))
                        columns: ':visible:not(:eq(10))'
                        @else
                        columns: ':visible:not(:eq(9))'
                        @endif
                    @endif
                },
                customize: function(doc) {
                    doc.defaultStyle.fontSize = 7; //<-- set fontsize to 16 instead of 10
                    doc.styles.tableHeader.fontSize = 7;
                    doc.pageMargins = [5,5,5,5];
                }
            },
            @if (permission('dealer-bulk-delete'))
            {
                'className':'btn btn-danger btn-sm delete_btn d-none text-white',
                'text':'Delete',
                action:function(e,dt,node,config){
                    multi_delete();
                }
            }
            @endif
        ],
    });
    $('#btn-filter').click(function () {
        table.ajax.reload();
    });
    $('#btn-reset').click(function () {
        $('#form-filter')[0].reset();
        $('#form-filter .selectpicker').selectpicker('refresh');
        table.ajax.reload();
    });
    $(document).on('click', '.view_data', function () {
        let id = $(this).data('id');
        if (id) {
            $.ajax({
                url: "{{route('dealer.view')}}",
                type: "POST",
                data: { id: id,_token: _token},
                success: function (data) {
                    $('#view_modal #view-data').html('');
                    $('#view_modal #view-data').html(data);
                    $('#view_modal').modal({
                        keyboard: false,
                        backdrop: 'static',
                    });
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
    });
    $(document).on('click', '.delete_data', function () {
        let id    = $(this).data('id');
        let name  = $(this).data('name');
        let row   = table.row($(this).parent('tr'));
        let url   = "{{ route('dealer.delete') }}";
        delete_data(id, url, table, row, name);
    });
    function multi_delete(){
        let ids = [];
        let rows;
        $('.select_data:checked').each(function(){
            ids.push($(this).val());
            rows = table.rows($('.select_data:checked').parents('tr'));
        });
        if(ids.length == 0){
            Swal.fire({
                type:'error',
                title:'Error',
                text:'Please checked at least one row of table!',
                icon: 'warning',
            });
        }else{
            let url = "{{route('dealer.bulk.delete')}}";
            bulk_delete(ids,url,table,rows);
        }
    }
    $(document).on('click', '.change_status', function () {
        let id     = $(this).data('id');
        let name   = $(this).data('name');
        let status = $(this).data('status');
        let row    = table.row($(this).parent('tr'));
        let url    = "{{ route('dealer.change.status') }}";
        change_status(id, url, table, row, name, status);
    });
});
function getUpazilaList(district_id){
    $.ajax({
        url:"{{ url('district-id-wise-upazila-list') }}/"+district_id,
        type:"GET",
        dataType:"JSON",
        success:function(data){
            html = `<option value="">Select Please</option>`;
            $.each(data, function(key, value) {
                html += '<option value="'+ key +'">'+ value +'</option>';
            });
            $('#form-filter #upazila_id').empty();
            $('#form-filter #upazila_id').append(html);
            $('.selectpicker').selectpicker('refresh');
        },
    });
}
</script>
@endpush
