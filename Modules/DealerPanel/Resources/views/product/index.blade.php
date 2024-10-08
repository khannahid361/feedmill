@extends('dealerpanel::layouts.master')
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
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
{{--                    <form method="POST" id="form-filter" class="col-md-12 px-0">--}}
{{--                        <div class="row">--}}
{{--                            <x-form.textbox labelName="Memo No." name="memo_no" col="col-md-4" />--}}
{{--                            <div class="form-group col-md-3">--}}
{{--                                <label for="name">Choose Your Date</label>--}}
{{--                                <div class="input-group">--}}
{{--                                    <input type="text" class="form-control daterangepicker-filed">--}}
{{--                                    <input type="hidden" id="start_date" name="start_date">--}}
{{--                                    <input type="hidden" id="end_date" name="end_date">--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <div class="col-md-2">--}}
{{--                                <div class="text-left" style="margin-top:28px;">--}}
{{--                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>--}}
{{--                                    <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                    </form>--}}
                </div>
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12 table-responsive">
                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead class="bg-primary">
                                    <tr>
                                        <th>Sl</th>
                                        <th>Transfer No.</th>
                                        <th>Transfer Date</th>
                                        <th>From Depo</th>
                                        <th>To Depo</th>
                                        <th>Total Qty</th>
                                        <th>Stock Value</th>
                                        <th> Status</th>
                                        <th>Receive Info.</th>
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
    @include('dealerpanel::product.receive-modal')
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
            console.log('hello')
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
                    "url": "{{route('dealer.panel.product.datatable.data')}}",
                    "type": "POST",
                    "data": function (data) {
                        data.memo_no        = $("#form-filter #memo_no").val();
                        data.start_date     = $("#form-filter #start_date").val();
                        data.end_date       = $("#form-filter #end_date").val();
                        data._token         = "{{ csrf_token() }}";
                    }
                },
                "columnDefs": [{
                    "targets": [0,1,2,3,4,5,6,7,8,9,10],
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

            $(document).on('click', '.receive_data', function () {
                let id = $(this).data('id');
                if (id) {
                    $.ajax({
                        url: "{{url('dealer-panel/data')}}/"+id,
                        type: "GET",
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

        });
        function calculateQty(row)
        {
            const transfer_qty = $(`#products_${row}_transfer_qty`).val() ? parseFloat($(`#products_${row}_transfer_qty`).val()) : 0;
            const receive_qty = parseFloat($(`#products_${row}_receive_qty`).val());
            const cost = $(`#products_${row}_net_unit_cost`).val() ? parseFloat($(`#products_${row}_net_unit_cost`).val()) : 0;
            const damage_qty  = transfer_qty - receive_qty;
            if(receive_qty < 0 && receive_qty != '')
            {
                $(`#products_${row}_receive_qty,#products_${row}_damage_qty`).val(0);
                notification('error','Receive quantity must be grater than or equal to 0!');
            }else{
                if(isNaN(receive_qty)){
                    $(`#products_${row}_receive_qty,#products_${row}_damage_qty`).val('');
                }else{
                    if (receive_qty > transfer_qty) {
                        $(`#products_${row}_receive_qty,#products_${row}_damage_qty`).val(0);
                        $(`#products_${row}_damage_cost`).val(0);
                        notification('error','Receive quantity must be leass than or equal to transfered quantity!');
                    }else{
                        $(`#products_${row}_damage_qty`).val(parseFloat(damage_qty));
                        $(`#products_${row}_damage_cost`).val(parseFloat(cost * damage_qty));
                    }
                    calculateTotal();
                }
                calculateTotal();
            }


        }
        function calculateTotal()
        {
            let receive_qty = 0;
            let damage_qty = 0;
            let damage_cost = 0;
            $('.receive_qty').each(function() {
                if($(this).val() == ''){
                    receive_qty += 0;
                }else{
                    receive_qty += parseFloat($(this).val());
                }
            });
            $('.damage_qty').each(function() {
                if($(this).val() == ''){
                    damage_qty += 0;
                }else{
                    damage_qty += parseFloat($(this).val());
                }
            });
            $('.damage_cost').each(function() {
                if($(this).val() == ''){
                    damage_cost += 0;
                }else{
                    damage_cost += parseFloat($(this).val());
                }
            });
            $('#receive-qty').text(receive_qty);
            $('#receive_qty').val(receive_qty);
            $('#damage-qty').text(damage_qty);
            $('#damage_qty').val(damage_qty);
            $('#total_damage_cost').val(damage_cost);
        }
        function store_data(){
            var receive_qty = $('#receive_form #receive_qty').val() ? parseFloat($('#receive_form #receive_qty').val()) : 0;
            if (receive_qty <= 0) {
                notification("error","Please insert product receive qty!")
            }else{
                let form = document.getElementById('receive_form');
                let formData = new FormData(form);
                let url = "{{route('dealer.panel.receive')}}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: formData,
                    dataType: "JSON",
                    contentType: false,
                    processData: false,
                    cache: false,
                    beforeSend: function(){
                        $('#save-btn').addClass('spinner spinner-white spinner-right');
                    },
                    complete: function(){
                        $('#save-btn').removeClass('spinner spinner-white spinner-right');
                    },
                    success: function (data) {
                        $('#receive_form').find('.is-invalid').removeClass('is-invalid');
                        $('#receive_form').find('.error').remove();
                        if (data.status == false) {
                            $.each(data.errors, function (key, value) {
                                var key = key.split('.').join('_');
                                $('#receive_form input#' + key).addClass('is-invalid');
                                $('#receive_form #' + key).parent().append(
                                    '<small class="error text-danger">' + value + '</small>');
                            });
                        } else {
                            notification(data.status, data.message);
                            if (data.status == 'success') {
                                $('#view_modal').modal('hide');
                                table.ajax.reload(null, false);
                            }
                        }

                    },
                    error: function (xhr, ajaxOption, thrownError) {
                        console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                    }
                });
            }

        }
    </script>
@endpush
