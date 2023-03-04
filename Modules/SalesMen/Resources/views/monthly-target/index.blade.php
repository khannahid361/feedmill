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
                    @if (permission('sr-monthly-target-add'))
                    <a href="{{ url('sr-monthly-target/add') }}" class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a>
                    @endif
                </div>
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="name">Choose Your Date</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed" value="{{  date('Y-m-01').' to '.date('Y-m-t') }}">
                                <input type="hidden" id="start_date" name="start_date" value="{{ date('Y-m-01') }}">
                                <input type="hidden" id="end_date" name="end_date" value="{{ date('Y-m-t') }}">
                            </div>
                        </div>
                        @if(Auth::user()->warehouse_id)
                        <input type="hidden" name="warehouse_id" id="warehouse_id" value="{{ Auth::user()->warehouse_id }}">
                        @else
                        <x-form.selectbox labelName="Warehouse" name="warehouse_id" required="required" col="col-md-3" class="warehouse">
                            @if (!$warehouses->isEmpty())
                                @foreach ($warehouses as $warehouse)
                                    <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                                @endforeach
                                @endif
                        </x-form.selectbox>
                        @endif
                        <x-form.selectbox labelName="SR" name="salesmen_id" required="required" col="col-md-3" class="selectpicker" />
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
                                        <th>Sl</th>
                                        <th>Month</th>
                                        <th>Salesman</th>
                                        <th>Warehouse</th>
                                        <th>Target Amount</th>
                                        <th>Commission</th>
                                        <th>Commission Rate</th>
                                        <th>Achieved Amount</th>
                                        <th>Closing Date</th>
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
@include('salesmen::monthly-target.modal')
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
        $('input[name="start_date"]').val(start_date);
        $('input[name="end_date"]').val(end_date);
    }
});
var table;
$(document).ready(function(){
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
            "url": "{{route('sr.monthly.target.datatable.data')}}",
            "type": "POST",
            "data": function (data) {
                data.warehouse_id    = $("#form-filter #warehouse_id").val();
                data.salesmen_id    = $("#form-filter #salesmen_id").val();
                data.start_date    = $("#form-filter #start_date").val();
                data.end_date    = $("#form-filter #end_date").val();
                data._token   = _token;
            }
        },
        "columnDefs": [{
                "targets": [0,1,2,3,4,5,6,7,8,9,10],
                "orderable": false,
                "className": "text-center"
            }
        ],
    });

    $('#btn-filter').click(function () {
        table.ajax.reload();
    });

    $('#btn-reset').click(function () {
        $('#start_date').val("{{ date('Y-m-01') }}");
        $('#end_date').val("{{ date('Y-m-t') }}");
        $('.daterangepicker-filed').val("{{ date('Y-m-01').' to '.date('Y-m-t') }}");
        $('#form-filter #warehouse_id.selectpicker').val('');
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
                url: "{{route('sr.monthly.target.edit')}}",
                type: "POST",
                data: { id: id,_token: _token},
                dataType: "JSON",
                success: function (data) {
                    if(data.status == 'error'){
                        notification(data.status,data.message)
                    }else{
                        $('#store_or_update_form #update_id').val(data.id);
                        $('#store_or_update_form #month').val(data.month);
                        $('#store_or_update_form #warehouse').val(data.warehouse_name);
                        $('#store_or_update_form #sr').val(data.salesman_name);
                        $('#store_or_update_form #target_value').val(data.target_value);
                        $('#store_or_update_form #commission_rate').val(data.commission_rate);

                        $('#store_or_update_form #type.selectpicker').selectpicker('refresh');
                        $('#store_or_update_modal').modal({
                            keyboard: false,
                            backdrop: 'static',
                        });
                        $('#store_or_update_modal .modal-title').html(
                            '<i class="fas fa-edit text-white"></i> <span>Edit ' + data.salesman_name + '</span>');
                        $('#store_or_update_modal #save-btn').text('Update');
                    }

                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
    });

    $(document).on('click', '#save-btn', function () {
        let form = document.getElementById('store_or_update_form');
        let formData = new FormData(form);
        let url = "{{route('sr.monthly.target.update')}}";
        let id = $('#update_id').val();
        let method;
        if (id) {
            method = 'update';
        } else {
            method = 'add';
        }
        store_or_update_data(table, method, url, formData);
    });

    $(document).on('click', '.delete_data', function () {
        let id    = $(this).data('id');
        let name  = $(this).data('name');
        let row   = table.row($(this).parent('tr'));
        let url   = "{{ route('sr.monthly.target.delete') }}";
        delete_data(id, url, table, row, name);
    });
});
$(document).on('change','.warehouse',function(){
    let html;
    let warehouseId = $(this).find('option:selected').val();
    $('#salesmen_id').empty();
    $.ajax({
        url     :"{{ url('warehouse-wise-salesmen-list') }}/"+warehouseId,
        type    :"GET",
        dataType:"JSON",
        success :function(data){
            if(data != ''){
                html = `<option value="">Select Please</option>`;
                $.each(data, function(key, value) { html += '<option value="'+ key +'">'+ value +'</option>'; });
                $('#salesmen_id').append(html);
                $('.selectpicker').selectpicker('refresh');
            }
        },
    });
})
</script>
@endpush
