@extends('layouts.app')
@section('title', $page_title)
@push('styles') <link href="{{asset('css/bootstrap-datetimepicker.min.css')}}" rel="stylesheet" type="text/css" /> @endpush
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3></div>
                    <div class="card-toolbar"><a href="{{ route('sale') }}" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i>{{'Back'}}</a></div>
                </div>
            </div>
            <div class="card card-custom" style="padding-bottom: 100px !important;">
                <div class="card-body">
                    <form id="store_form" method="post" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" id="sale_id" name="sale_id" value="{{$details->id}}"/>
                        <div class="row">
                            <div class="form-group col-md-6 required">
                                <label for="customer">{{'Customer'}}</label>
                                <input type="text" class="form-control" value="{{$details->customer->name}}"/>
                                <input type="hidden" id="customer_id" name="customer_id" value="{{$details->customer->id}}"/>
                            </div>
{{--                            <div class="form-group col-md-6 required">--}}
{{--                                <label for="customer">{{'Sale\'s Person'}}</label>--}}
{{--                                <input type="text" class="form-control" value="{{$details->salesmen->name}}"/>--}}
{{--                                <input type="hidden" id="salesmen_id" name="salesmen_id" value="{{$details->salesmen->id}}"/>--}}
{{--                            </div>--}}
                            <div class="form-group col-md-6 required">
                                <label for="tenant_id">{{'Warehouse'}}</label>
                                <select class="form-control selectpicker" id="warehouse_id" name="warehouse_id" data-live-search="true">
                                    <option value="">{{'Select Please'}}</option>
                                    @if (!$warehouses->isEmpty())
                                        @foreach ($warehouses as $warehouse)
                                            <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                                        @endforeach
                                    @endif
                                </select>
                            </div>
                            <div class="form-group col-md-6 required">
                                <label for="delivery_date">{{'Delivery Date'}}</label>
                                <input type="date" class="form-control date" name="delivery_date" id="delivery_date" value="{{ date('Y-m-d') }}"/>
                            </div>
                            <div class="col-md-12 pb-5">
                                <table class="table table-bordered" id="product-delivery-table">
                                    <thead class="bg-primary">
                                    <tr class="text-center">
                                        <th width="20%">{{'Product Name'}}</th>
                                        <th width="20%">{{'Stock Qty'}}</th>
                                        <th width="20%">{{'Order Qty'}}</th>
                                        <th width="20%">{{'Delivered Qty'}}</th>
                                        <th width="20%">{{'Delivery Qty'}}</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="3"></td>
                                        <td><button type="button" class="text-right btn btn-primary btn-block"><b>{{'Total Delivery Quantity'}}</b></button></td>
                                        <td><button type="button" class="text-left btn btn-primary btn-block"><input type="hidden" id="total-delivery-quantity" name="total_delivery_quantity"/> <b><span id="total-delivery-quantity-show">0</span></b></button></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="note">{{'Note'}}</label>
                                <textarea  class="form-control" name="note" id="note" cols="30" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="row pt-5">
                            <div class="form-group col-md-12 text-center px-0">
                                <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="storeData()"><i class="fas fa-save"></i>{{'Submit'}}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    <script src="{{asset('js/bootstrap-datetimepicker.min.js')}}"></script>
    <script type="text/javascript">
        let count = 1;
        function _(x){
            return document.getElementById(x);
        }
        $(document).on('change','#warehouse_id',function(){
            $('#product-delivery-table tbody').empty();
            let saleId      = _('sale_id').value;
            let warehouseId = _('warehouse_id').value;
            if(warehouseId != ''){
                $.ajax({
                    url     : "{{route('sale.product.delivery.available.list')}}",
                    data    : {sale_id : saleId,warehouse_id : warehouseId},
                    success : function(data){
                        $(data).each(function(index, item) {
                            html = `<tr class = "text-center">
                                        <td><input type = "text" class = "form-control bg-secondary" value = "`+ item.product_name +`" readonly/><input type = "hidden" id = "deliveries_`+ index +`_product_id" name="deliveries[`+ index +`][product_id]" value = "`+ item.product_id +`"/></td>
                                        <td><input type = "text" class = "form-control bg-secondary" id = "deliveries_`+ index +`_stock_qty" value = "`+ item.stock_qty +`" name="deliveries[`+ index +`][stock_qty]" readonly/></td>
                                        <td><input type = "text" class = "form-control bg-secondary" id = "deliveries_`+ index +`_order_qty" value = "`+ item.order_qty +`" name="deliveries[`+ index +`][order_qty]" readonly/></td>
                                        <td><input type = "text" class = "form-control bg-secondary" id = "deliveries_`+ index +`_delievered_qty" value = "`+ item.delivered_qty +`" name="deliveries[`+ index +`][delivered_qty]" readonly/></td>
                                        <td>
                                        <input type = "text" class = "form-control deliveryQty delivery" id = "deliveries_`+ index +`_delivery_qty" name="deliveries[`+ index +`][delivery_qty]" data-stock_qty = "`+ item.stock_qty +`" data-order_qty = "`+ item.order_qty +`" data-delivered_qty = "`+ item.delivered_qty +`"/>
                                        <input type = "hidden" name="deliveries[`+ index +`][price]" value = "`+ item.price +`"/>
                                        </td>
                                    </tr>`
                            $('#product-delivery-table tbody').append(html);
                        });
                    }
                })
            }
        });
        $(document).on('input','.deliveryQty',function(){
            let stockQty        = parseInt($(this).data('stock_qty'));
            let orderQty        = parseInt($(this).data('order_qty'));
            let deliveredQty    = parseInt($(this).data('delivered_qty'));
            let deliveryQty     = parseInt($(this).val());
            let totalDelivered  = + deliveredQty + + deliveryQty
            if($(this).val() != ''){
                if(orderQty + + 1 > totalDelivered){
                    if(stockQty + + 1 > deliveryQty){
                        calculation();
                    }else{
                        $(this).val('');
                        notification('error','Delivery Quantity Can\'t Be Greater Then Stock Quantity')
                    }
                }else{
                    $(this).val('');
                    notification('error','Delivery Quantity Can\'t Be Greater Then Order Quantity')
                }
            }
            calculation();
        });
        function calculation(){
            let delivery        = 0;
            $('.delivery').each(function() {
                if($(this).val() == ''){
                    delivery += + 0;
                }else{
                    delivery += + $(this).val();
                }
            });
            _('total-delivery-quantity').value = delivery;
            _('total-delivery-quantity-show').innerText = delivery;
        }
        function storeData(){
            let form     = _('store_form');
            let formData = new FormData(form);
            let url      = "{{route('sale.product.delivery.store')}}";
            let delivery = 0;
            $('.delivery').each(function() {
                if($(this).val() == ''){
                    delivery += + 0;
                }else{
                    delivery += + $(this).val();
                }
            });
            if(delivery > 0){
                $.ajax({
                    url         : url,
                    type        : "POST",
                    data        : formData,
                    dataType    : "JSON",
                    contentType : false,
                    processData : false,
                    cache       : false,
                    beforeSend  : function(){
                        $('#save-btn').addClass('spinner spinner-white spinner-right');
                    },
                    complete    : function(){
                        $('#save-btn').removeClass('spinner spinner-white spinner-right');
                    },
                    success     : function (data) {
                        notification(data.status, data.message);
                        if (data.status == 'success') { window.location.replace("{{ route('sale') }}"); }
                    },
                    error       : function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
                });
            }else{
                notification('error','{{__('file.Please checked at least one row of table!')}}')
            }
        }
    </script>
@endpush
