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
                        @if (permission('asm-salary-add'))
                            <a class="btn btn-primary btn-sm font-weight-bolder" href="{{route('asm.salary.add')}}"><i class="fas fa-plus-circle"></i> Add New</a>
                        @endif
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <x-form.selectbox labelName="ASM" name="salarytable_id" required="required"  col="col-md-3" class="selectpicker">
                                @if (!$asms->isEmpty())
                                    @foreach ($asms as $value)
                                        <option value = "{{ $value->id }}">{{ $value->username }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <div class="col-md-3">
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
                                        <th>UserName</th>
                                        <th>Depo</th>
                                        <th>Month</th>
                                        <th>Date</th>
                                        <th>Salary</th>
                                        <th>Monthly Achieve</th>
                                        <th>TA/TD</th>
                                        <th>Deduction</th>
                                        <th>claim</th>
                                        <th>Status</th>
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
    <script src="{{asset('plugins/custom/datatables/datatables.bundle.js')}}" type="text/javascript"></script>
    <script>
        let table;
        $(document).ready(function(){
            table = $('#dataTable').DataTable({
                "processing": true, //Feature control the processing indicator
                "serverSide": true, //Feature control DataTable server side processing mode
                "order"     : [], //Initial no order
                "responsive": true, //Make table responsive in mobile device
                "bInfo"     : true, //TO show the total number of data
                "bFilter"   : false, //For datatable default search box show/hide
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
                    "url" : "{{route('asm.salary.datatable.data')}}",
                    "type": "POST",
                    "data": function (data) {
                        data.bank_name      = $("#form-filter #bank_name").val();
                        data.account_name   = $("#form-filter #account_name").val();
                        data.account_number = $("#form-filter #account_number").val();
                        data.warehouse_id   = $("#form-filter #warehouse_id").val();
                        data._token         = _token;
                    }
                },
                "columnDefs": [{
                        "targets"  : [0,1,2,3,4,5,6,7,8,9,10],
                        "orderable": false,
                        "className": "text-center"
                    },],
                "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" + "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",
            });
            $('#btn-filter').click(function () { table.ajax.reload(); });
            $('#btn-reset').click(function () { $('#form-filter')[0].reset(); table.ajax.reload(); });
            {{--$(document).on('click', '#save-btn', function () {--}}
            {{--    let form = document.getElementById('store_or_update_form');--}}
            {{--    let formData = new FormData(form);--}}
            {{--    let url = "{{route('bank.store.or.update')}}";--}}
            {{--    let id = $('#update_id').val();--}}
            {{--    let method;--}}
            {{--    if (id) {--}}
            {{--        method = 'update';--}}
            {{--    } else {--}}
            {{--        method = 'add';--}}
            {{--    }--}}
            {{--    store_or_update_data(table, method, url, formData);--}}
            {{--});--}}

            {{--$(document).on('click', '.edit_data', function () {--}}
            {{--    let id = $(this).data('id');--}}
            {{--    $('#store_or_update_form')[0].reset();--}}
            {{--    $('#store_or_update_form .select').val('');--}}
            {{--    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');--}}
            {{--    $('#store_or_update_form').find('.error').remove();--}}
            {{--    if (id) {--}}
            {{--        $.ajax({--}}
            {{--            url: "{{route('bank.edit')}}",--}}
            {{--            type: "POST",--}}
            {{--            data: { id: id,_token: _token},--}}
            {{--            dataType: "JSON",--}}
            {{--            success: function (data) {--}}
            {{--                if(data.status == 'error'){--}}
            {{--                    notification(data.status,data.message)--}}
            {{--                }else{--}}
            {{--                    $('#store_or_update_form #update_id').val(data.id);--}}
            {{--                    $('#store_or_update_form #bank_old_name').val(data.bank_name);--}}
            {{--                    $('#store_or_update_form #bank_name').val(data.bank_name);--}}
            {{--                    $('#store_or_update_form #account_name').val(data.account_name);--}}
            {{--                    $('#store_or_update_form #account_number').val(data.account_number);--}}
            {{--                    $('#store_or_update_form #warehouse_id').val(data.warehouse_id);--}}
            {{--                    $('#store_or_update_form .selectpicker').selectpicker('refresh');--}}
            {{--                    $('#store_or_update_modal').modal({--}}
            {{--                        keyboard: false,--}}
            {{--                        backdrop: 'static',--}}
            {{--                    });--}}
            {{--                    $('#store_or_update_modal .modal-title').html(--}}
            {{--                        '<i class="fas fa-edit text-white"></i> <span>Edit ' + data.bank_name + '</span>');--}}
            {{--                    $('#store_or_update_modal #save-btn').text('Update');--}}
            {{--                }--}}

            {{--            },--}}
            {{--            error: function (xhr, ajaxOption, thrownError) {--}}
            {{--                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);--}}
            {{--            }--}}
            {{--        });--}}
            {{--    }--}}
            {{--});--}}

            {{--$(document).on('click', '.change_status', function () {--}}
            {{--    let id     = $(this).data('id');--}}
            {{--    let name   = $(this).data('name');--}}
            {{--    let status = $(this).data('status');--}}
            {{--    let row    = table.row($(this).parent('tr'));--}}
            {{--    let url    = "{{ route('bank.change.status') }}";--}}
            {{--    change_status(id, url, table, row, name, status);--}}
            {{--});--}}

            {{--$(document).on('click', '.delete_data', function () {--}}
            {{--    let id    = $(this).data('id');--}}
            {{--    let name  = $(this).data('name');--}}
            {{--    let row   = table.row($(this).parent('tr'));--}}
            {{--    let url   = "{{ route('bank.delete') }}";--}}
            {{--    delete_data(id, url, table, row, name);--}}
            {{--});--}}


        });
    </script>
@endpush
