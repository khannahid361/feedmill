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
                    @if (permission('asm-add'))
                    <a href="{{ url('asm/add') }}" class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a>
                    @endif
                </div>
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <x-form.textbox labelName="Name" name="name" col="col-md-4" placeholder="Enter name" />
                        <x-form.textbox labelName="Phone No." name="phone" col="col-md-4" placeholder="Enter phone number" />
                        <x-form.textbox labelName="Email" name="email" col="col-md-4" placeholder="Enter email" />
                        <x-form.selectbox labelName="Warehouse" name="warehouse_id" required="required" col="col-md-3" class="selectpicker" onchange="getUpazilaList(1)">
                            @if (!$warehouses->isEmpty())
                                @foreach ($warehouses as $warehouse)
                                    <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                                @endforeach
                                @endif
                        </x-form.selectbox>
                        <x-form.selectbox labelName="District" name="district_id" col="col-md-3" class="selectpicker" onchange="getUpazilaList(1)">
                            @if (!$locations->isEmpty())
                                @foreach ($locations as $district)
                                    @if ($district->type == 1)
                                    <option value="{{ $district->id }}">{{ $district->name }}</option>
                                    @endif
                                @endforeach
                            @endif
                        </x-form.selectbox>
                        <x-form.selectbox labelName="Upazila" name="upazila_id" col="col-md-4" class="selectpicker">
                            @if (!$locations->isEmpty())
                                @foreach ($locations as $upazila)
                                    @if ($upazila->type == 2)
                                    <option value="{{ $upazila->id }}">{{ $upazila->name }}</option>
                                    @endif
                                @endforeach
                            @endif
                        </x-form.selectbox>
                        <div class="col-md-2 text-left">
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
                                        <th>Sl</th>
                                        <th>Avatar</th>
                                        <th>Name</th>
                                        <th>Username</th>
                                        <th>Warehouse</th>
                                        <th>District</th>
                                        <th>Upazila</th>
                                        <th>Status</th>
                                        <th>salary</th>
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
@include('asm::view')
@endsection
@push('scripts')
<script src="{{asset('plugins/custom/datatables/datatables.bundle.js')}}" type="text/javascript"></script>
<script>
let table;
$(document).ready(function(){
    table = $('#dataTable').DataTable({
        "processing": true,
        "serverSide": true,
        "order": [],
        "responsive": true,
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
            "url" : "{{route('asm.datatable.data')}}",
            "type": "POST",
            "data": function (data) {
                data.name               = $("#form-filter #name").val();
                data.phone              = $("#form-filter #phone").val();
                data.warehouse_id       = $("#form-filter #warehouse_id").val();
                data.district_id        = $("#form-filter #district_id").val();
                data.upazila_id         = $("#form-filter #upazila_id").val();
                data._token             = _token;
            }
        },
        "columnDefs": [{
                "targets"  : [0,1,2,3,4,5,6,7,8,9],
                "orderable": false,
                "className": "text-center"
            }
        ],
    });
    $('#btn-filter').click(function () {table.ajax.reload();});
    $('#btn-reset').click(function () {
        $('#form-filter')[0].reset();
        $('#form-filter .selectpicker').selectpicker('refresh');
        table.ajax.reload();
    });
    $(document).on('click', '.view_data', function () {
        let id = $(this).data('id');
        if (id) {
            $.ajax({
                url: "{{route('asm.view')}}",
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
                error: function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
            });
        }
    });
    $(document).on('click', '.delete_data', function () {
        let id    = $(this).data('id');
        let name  = $(this).data('name');
        let row   = table.row($(this).parent('tr'));
        let url   = "{{ route('asm.delete') }}";
        delete_data(id, url, table, row, name);
    });
});
</script>
@endpush
