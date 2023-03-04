@extends('layouts.app')
@section('title', $page_title)
@push('styles')
<link href="{{asset('plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('css/daterangepicker.min.css')}}" rel="stylesheet" type="text/css" />
<link href="{{asset('css/bootstrap-datetimepicker.min.css')}}" rel="stylesheet" type="text/css" />
@endpush
@section('content')
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title"><h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3></div>
                <div class="card-toolbar">
                    <a href="{{ route('sale.add') }}"  class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a>
                </div>
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <x-form.textbox labelName="Memo No." name="memo_no" col="col-md-4" />
                        <div class="form-group col-md-3">
                            <label for="name">Choose Your Date</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed">
                                <input type="hidden" id="start_date" name="start_date">
                                <input type="hidden" id="end_date" name="end_date">
                            </div>
                        </div>
{{--                        <x-form.selectbox labelName="Order Received By" name="salesmen_id" col="col-md-4" class="selectpicker">--}}
{{--                            @if (!$salesmen->isEmpty())--}}
{{--                                @foreach ($salesmen as $value)--}}
{{--                                    <option value="{{ $value->id }}">{{ $value->name.' - '.$value->phone }}</option>--}}
{{--                                @endforeach--}}
{{--                            @endif--}}
{{--                        </x-form.selectbox>--}}
                        <x-form.selectbox labelName="Customer" name="customer_id" col="col-md-4" class="selectpicker">
                            @if (!$customer->isEmpty())
                                @foreach ($customer as $value)
                                    <option value="{{ $value->id }}">{{ $value->name }}</option>
                                @endforeach
                            @endif
                        </x-form.selectbox>
                        <x-form.selectbox labelName="Payment Status" name="payment_status" col="col-md-4" class="selectpicker">
                            @foreach (PAYMENT_STATUS as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </x-form.selectbox>
                        <div class="col-md-2">
                            <div class="text-left" style="margin-top:28px;">
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
                        <div class="col-sm-12 table-responsive">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>Memo No.</th>
                                        <th>Customer Name</th>
                                        <th>Total Item</th>
                                        <th>Product List</th>
                                        <th>Total Delivery</th>
                                        <th>Total</th>
                                        <th>Grand Total</th>
                                        <th>Paid Amount</th>
                                        <th>Sale Date</th>
                                        <th>Payment Status</th>
                                        <th>Payment Method</th>
                                        <th>Delivery Status</th>
                                        <th>Status</th>
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
@include('sale::modal')
@endsection
@push('scripts')
<script src="{{asset('plugins/custom/datatables/datatables.bundle.js')}}" type="text/javascript"></script>
<script src="{{asset('js/moment.js')}}"></script>
<script src="{{asset('js/knockout-3.4.2.js')}}"></script>
<script src="{{asset('js/daterangepicker.min.js')}}"></script>
<script src="{{asset('js/bootstrap-datetimepicker.min.js')}}"></script>
<script>
    function _(x){
        return document.getElementById(x);
    }
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
    $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
    table = $('#dataTable').DataTable({
        "processing"    : true,
        "serverSide"    : true,
        "order"         : [],
        "responsive"    : false,
        "bInfo"         : true,
        "bFilter"       : false,
        "lengthMenu"    : [
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
            "url": "{{route('sale.datatable.data')}}",
            "type": "POST",
            "data": function (data) {
                data.memo_no        = $("#form-filter #memo_no").val();
                data.start_date     = $("#form-filter #start_date").val();
                data.end_date       = $("#form-filter #end_date").val();
                data.customer_id    = $("#form-filter #customer_id").val();
                data.payment_status = $("#form-filter #payment_status").val();
                data._token         = _token;
            }
        },
        "columnDefs": [{
                "targets": [0,1,2,3,4,5,6,7,8,9,10,11,12,13],
                "orderable": false,
                "className": "text-center"
            }
        ],
    });
    $('#btn-filter').click(function () {table.ajax.reload();});
    $('#btn-reset').click(function () {
        $('#form-filter')[0].reset();
        $('#form-filter .selectpicker').selectpicker('refresh');
        $('#form-filter #start_date').val('');
        $('#form-filter #end_date').val('');
        table.ajax.reload();
    });
    $(document).on('click', '.delete_data', function () {
        let id    = $(this).data('id');
        let name  = $(this).data('name');
        let row   = table.row($(this).parent('tr'));
        let url   = "{{ route('sale.delete') }}";
        delete_data(id, url, table, row, name);
    });
    $(document).on('click','.change_status',function(){
        _('sale_id').value = $(this).data('id');
        $('#approve_status_modal').modal({
            keyboard: false,
            backdrop: 'static',
        });
        $('#approve_status_modal .modal-title').html('<span>{{'Change Status'}}</span>');
        $('#approve_status_modal #status-btn').text('{{'Change'}}');
    });
});
$(document).on('click','#status-btn',function(){
    let saleId          = _('sale_id').value;
    let saleStatus      = _('sale_status').value;
    if(saleId && saleStatus){
        $.ajax({
            url         : "{{route('sale.status.change')}}",
            type        : "POST",
            data        : {id:saleId,sale_status:saleStatus,_token:_token},
            dataType    : "JSON",
            beforeSend  : function(){
                $('#status-btn').addClass('kt-spinner kt-spinner--md kt-spinner--light');
            },
            complete    : function(){
                $('#status-btn').removeClass('kt-spinner kt-spinner--md kt-spinner--light');
            },
            success     : function(data){
                notification(data.status, data.message);
                if(data.status == 'success'){
                    $('#approve_status_modal').modal('hide');
                    window.location.replace("{{ route('sale') }}");
                }
            },
            error       : function (xhr, ajaxOption, thrownError){
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    }
});
</script>
@endpush
