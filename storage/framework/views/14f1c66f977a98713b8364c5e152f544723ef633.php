
<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?> <link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" /> <?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                    <div class="card-toolbar"><a href="<?php echo e(route('dealer.sale')); ?>" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i><?php echo e('Back'); ?></a></div>
                </div>
            </div>
            <div class="card card-custom" style="padding-bottom: 100px !important;">
                <div class="card-body">
                    <form id="store_form" method="post" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <input type="hidden" id="sale_id" name="dealer_sale_id" value="<?php echo e($details->id); ?>"/>
                        <div class="row">
                            <div class="form-group col-md-4 required">
                                <label for="customer"><?php echo e('Dealer'); ?></label>
                                <input type="text" class="form-control" value="<?php echo e($details->dealer->name); ?>"/>
                                <input type="hidden" id="dealer_id" name="dealer_id" value="<?php echo e($details->dealer_id); ?>"/>
                            </div>
                            <div class="form-group col-md-4 required">
                                <label for="tenant_id"><?php echo e('Warehouse'); ?></label>
                                <select class="form-control selectpicker" id="warehouse_id" name="warehouse_id" data-live-search="true">
                                    <option value=""><?php echo e('Select Please'); ?></option>
                                    <?php if(!$warehouses->isEmpty()): ?>
                                        <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($warehouse->id); ?>"><?php echo e($warehouse->name); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php endif; ?>
                                </select>
                            </div>
                            <div class="form-group col-md-4 required">
                                <label for="delivery_date"><?php echo e('Delivery Date'); ?></label>
                                <input type="date" class="form-control date" name="delivery_date" id="delivery_date" value="<?php echo e(date('Y-m-d')); ?>"/>
                            </div>
                            <div class="col-md-12 pb-5">
                                <table class="table table-bordered" id="product-delivery-table">
                                    <thead class="bg-primary">
                                    <tr class="text-center">
                                        <th width="20%"><?php echo e('Product Name'); ?></th>
                                        <th width="20%"><?php echo e('Stock Qty'); ?></th>
                                        <th width="20%"><?php echo e('Order Qty'); ?></th>
                                        <th width="20%"><?php echo e('Delivered Qty'); ?></th>
                                        <th width="20%"><?php echo e('Delivery Qty'); ?></th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="3"></td>
                                        <td><button type="button" class="text-right btn btn-primary btn-block"><b><?php echo e('Total Delivery Quantity'); ?></b></button></td>
                                        <td><button type="button" class="text-left btn btn-primary btn-block"><input type="hidden" id="total-delivery-quantity" name="total_delivery_quantity"/> <b><span id="total-delivery-quantity-show">0</span></b></button></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="note"><?php echo e('Note'); ?></label>
                                <textarea  class="form-control" name="note" id="note" cols="30" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="row pt-5">
                            <div class="form-group col-md-12 text-center px-0">
                                <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="storeData()"><i class="fas fa-save"></i><?php echo e('Submit'); ?></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script src="<?php echo e(asset('js/bootstrap-datetimepicker.min.js')); ?>"></script>
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
                console.log('there is something');
                $.ajax({
                    url     : "<?php echo e(route('dealer.sale.product.delivery.available.list')); ?>",
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
            let url      = "<?php echo e(route('dealer.sale.product.delivery.store')); ?>";
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
                        if (data.status == 'success') { window.location.replace("<?php echo e(route('dealer.sale')); ?>"); }
                    },
                    error       : function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
                });
            }else{
                notification('error','<?php echo e(__('file.Please checked at least one row of table!')); ?>')
            }
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH H:\laragon\www\insaf\Modules/DealerSale\Resources/views/delivery.blade.php ENDPATH**/ ?>