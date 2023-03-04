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
                        @if (permission('sr-product-target-add'))<a href="{{ route('sr.product.target.add') }}" class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a>@endif
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <x-form.selectbox labelName="Sales Men" class="selectpicker" col="col-md-5" name="salesmen_id">
                                @if (!$salesmen->isEmpty())
                                    @foreach ($salesmen as $sr)
                                        <option value="{{ $sr->id }}">{{ $sr->name }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <div class="col-md-2 text-left">
                                <br/>
                                <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>
                                <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>
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
                                        <th>Sales Men</th>
                                        <th>Commission Name</th>
                                        <th>Achieved Value</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
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
    @include('salesmen::product-target.modal')
@endsection
@push('scripts')
    <script src="{{asset('plugins/custom/datatables/datatables.bundle.js')}}" type="text/javascript"></script>
    <script src="{{asset('js/knockout-3.4.2.js')}}"></script>
    <script>
        let table;
        $(document).ready(function(){
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
                "pageLength": 25,
                "language"  : {
                    processing  : `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable  : '<strong class="text-danger">No Data Found</strong>',
                    infoEmpty   : '',
                    zeroRecords : '<strong class="text-danger">No Data Found</strong>'
                },
                "ajax"      : {
                    "url"   : "{{route('sr.product.target.datatable.data')}}",
                    "type"  : "POST",
                    "data"  : function (data) {
                        data.name           = $("#form-filter #name").val();
                        data.product_id     = $("#form-filter #product_id").val();
                        data._token         = _token;
                    }
                },
                "columnDefs"    : [{
                    "targets"   : [0,1,2,3,4,5,6,7],
                    "orderable" : false,
                    "className" : "text-center"
                }],
            });
            $('#btn-filter').click(function () {table.ajax.reload();});
            $('#btn-reset').click(function () {
                $('#form-filter')[0].reset();
                $('#form-filter .selectpicker').selectpicker('refresh');
                table.ajax.reload();
            });
            $(document).on('click', '.edit_data', function () {
                let id = $(this).data('id');
                $('#store_or_update_form')[0].reset();
                $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                $('#store_or_update_form').find('.error').remove();
                if (id) {
                    $.ajax({
                        url         : "{{route('sr.product.target.edit')}}",
                        type        : "POST",
                        data        : { id: id,_token: _token},
                        dataType    : "JSON",
                        success     : function (data) {
                            if(data.status == 'error'){
                                notification(data.status,data.message)
                            }else{
                                $('#store_or_update_form #update_id').val(data.id);
                                $('#store_or_update_form #salesmen_id').val(data.salesmen_id);
                                $('#store_or_update_form #product_commission_id').val(data.product_commission_id);
                                $('#store_or_update_form #start_date').val(data.start_date);
                                $('#store_or_update_form #end_date').val(data.end_date);
                                $('#store_or_update_form #salesmen_id.selectpicker').selectpicker('refresh');
                                $('#store_or_update_form #product_commission_id.selectpicker').selectpicker('refresh');
                                $('#store_or_update_modal').modal({
                                    keyboard: false,
                                    backdrop: 'static',
                                });
                                $('#store_or_update_modal .modal-title').html('<i class="fas fa-edit text-white"></i> <span>Edit ' + data.start_date + '</span>');
                                $('#store_or_update_modal #save-btn').text('Update');
                            }
                        },
                        error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
                    });
                }
            });
            $(document).on('click', '#save-btn', function () {
                let form        = document.getElementById('store_or_update_form');
                let formData    = new FormData(form);
                let url         = "{{route('sr.product.target.update')}}";
                let method      = 'update';
                store_or_update_data(table, method, url, formData);
            });
            $(document).on('click', '.delete_data', function () {
                let id    = $(this).data('id');
                let name  = $(this).data('name');
                let row   = table.row($(this).parent('tr'));
                let url   = "{{ route('sr.product.target.delete') }}";
                delete_data(id, url, table, row, name);
            });
        });
    </script>
@endpush
