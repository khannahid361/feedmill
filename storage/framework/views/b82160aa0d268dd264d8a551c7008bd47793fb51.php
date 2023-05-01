<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title">
                    <h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3>
                </div>
                <div class="card-toolbar">
                    <a href="<?php echo e(route('sale.return')); ?>" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a>
                </div>
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-body">
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <form id="sale_update_form" method="post" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <div class="row">
                            <input type="hidden" name="customer_id" value="<?php echo e($sale->customer_id); ?>">
                            <div class="form-group col-md-4">
                                <label for="warehouse_id"> Warehouse </label>
                                <select class="form-control selectpicker" id = "warehouse_id" name = "warehouse_id" data-live-search = "true">
                                    <option value="">Please Select Warehouse</option>
                                    <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($warehouse->id); ?>"> <?php echo e($warehouse->name); ?> </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="form-group col-md-4 required">
                                <label for="memo_no">Memo No.</label>
                                <input type="text" class="form-control" name="memo_no" id="memo_no" value="<?php echo e($sale->memo_no); ?>"  readonly />
                            </div>
                            <div class="form-group col-md-4 required">
                                <label for="sale_date">Sold Date</label>
                                <input type="text" class="form-control" name="sale_date" id="sale_date" value="<?php echo e($sale->sale_date); ?>" readonly />
                            </div>
                            <div class="form-group col-md-4 required">
                                <label for="return_date">Return Date</label>
                                <input type="text" class="form-control date" name="return_date" id="return_date" value="<?php echo e(date('Y-m-d')); ?>" readonly />
                            </div>
                            
                            <div class="form-group col-md-4 required">
                                <label for="customer_name">Customer Name</label>
                                <input type="text" class="form-control" name="customer_name" id="customer_name" value="<?php echo e($sale->customer->shop_name.' - '.$sale->customer->name); ?>" readonly />
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered" id="product_table">
                                    <thead class="bg-primary">
                                        <th>Name</th>
                                        <th class="text-center">Code</th>
                                        <th class="text-center">Unit</th>
                                        <th class="text-center">Sold Qty</th>
                                        <th class="text-center">Return Qty</th>
                                        <th class="text-right">Net Unit Price</th>
                                        <th class="text-right">Deduction (%)</th>
                                        <th class="text-right">Subtotal</th>
                                        <th>Check Return</th>
                                    </thead>
                                    <tbody>
                                        <?php if(!$sale->sale_products->isEmpty()): ?>
                                            <?php $__currentLoopData = $sale->sale_products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $sale_product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <?php
                                                        $tax = DB::table('taxes')->where('rate',$sale_product->pivot->tax_rate)->first();
                                                        $unit_name = DB::table('units')->where('id',$sale_product->pivot->sale_unit_id)->value('unit_name');
                                                        $total_return_qty = \DB::table('sale_return_products')->where([['memo_no',$sale->memo_no],['product_id',$sale_product->pivot->product_id],['batch_no', $sale_product->pivot->batch_no]])->sum('return_qty');
                                                        $sold_qty = $sale_product->pivot->qty - $total_return_qty;
                                                    ?>
                                                    <td><?php echo e($sale_product->name); ?></td>
                                                    <td class="text-center"><?php echo e($sale_product->code); ?></td>
                                                    <td class="unit-name text-center"><?php echo e($unit_name); ?></td>
                                                    <td><input type="text" class="sold_qty_<?php echo e($key+1); ?> form-control text-center" name="products[<?php echo e($key+1); ?>][sold_qty]"  value="<?php echo e($sold_qty); ?>" readonly></td>
                                                    <td><input type="text" class="form-control return_qty_<?php echo e($key+1); ?> text-center" onkeyup="quantity_calculate('<?php echo e($key+1); ?>')" onchange="quantity_calculate('<?php echo e($key+1); ?>')" name="products[<?php echo e($key+1); ?>][return_qty]" id="products_<?php echo e($key+1); ?>_return_qty" placeholder="0"></td>
                                                    <td><input type="text" class="net_unit_price_<?php echo e($key+1); ?> form-control text-right" name="products[<?php echo e($key+1); ?>][net_unit_price]" value="<?php echo e($sale_product->pivot->net_unit_price); ?>"></td>
                                                    <td><input type="text" class="deduction_rate_<?php echo e($key+1); ?> form-control text-right" onkeyup="quantity_calculate('<?php echo e($key+1); ?>')" onchange="quantity_calculate('<?php echo e($key+1); ?>')" name="products[<?php echo e($key+1); ?>][deduction_rate]" placeholder="0.00"></td>
                                                    <td class="sub-total sub-total-<?php echo e($key+1); ?> text-right"></td>
                                                    <td class="text-center">
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="hidden" id="return_<?php echo e($key+1); ?>"  name="products[<?php echo e($key+1); ?>][return]" value="2">
                                                            <input type="checkbox" class="custom-control-input chk" onchange="setReturnValue('<?php echo e($key+1); ?>')"  id="products_<?php echo e($key+1); ?>_return_checkbox">
                                                            <label class="custom-control-label" for="products_<?php echo e($key+1); ?>_return_checkbox"></label>
                                                        </div>
                                                    </td>
                                                    <input type="hidden" class="product-id" name="products[<?php echo e($key+1); ?>][id]"  value="<?php echo e($sale_product->pivot->product_id); ?>">
                                                    <input type="hidden" class="product-code" name="products[<?php echo e($key+1); ?>][code]" value="<?php echo e($sale_product->code); ?>">
                                                    <input type="hidden" class="product-batch" name="products[<?php echo e($key+1); ?>][batch_no]" value="<?php echo e($sale_product->pivot->batch_no); ?>">
                                                    <input type="hidden" class="sale-unit" name="products[<?php echo e($key+1); ?>][unit]" value="<?php echo e($unit_name); ?>">
                                                    <input type="hidden" class="deduction_amount deduction_amount_<?php echo e($key+1); ?>" name="products[<?php echo e($key+1); ?>][deduction_amount]" >
                                                    <input type="hidden" class="subtotal subtotal_<?php echo e($key+1); ?>" name="products[<?php echo e($key+1); ?>][total]" >
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="5" rowspan="3">
                                                <label  for="reason">Reason</label>
                                                <textarea class="form-control" name="reason" id="reason"></textarea><br>
                                            </td>
                                            <td class="text-right" colspan="1"><b>Total Deduction</b></td>
                                            <td class="text-right">
                                                <input type="text" id="total_deduction_ammount" class="form-control text-right" placeholder="0.00" name="total_deduction" readonly="readonly" />
                                            </td>
                                        </tr>
                                        <tr class="d-none">
                                            <td class="text-right" colspan="1" ><b>Total Tax</b></td>
                                            <td class="text-right">
                                                <input type="hidden" name="total_price" id="total_price">
                                                <input type="hidden" name="tax_rate" id="tax_rate" value="<?php echo e($sale->order_tax_rate ? $sale->order_tax_rate : 0); ?>">
                                                <input id="total_tax_ammount" tabindex="-1" class="form-control text-right valid" name="total_tax" placeholder="0.00" readonly="readonly" aria-invalid="false" type="text">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="1"  class="text-right"><b>Net Return</b></td>
                                            <td class="text-right">
                                                <input type="text" id="grandTotal" class="form-control text-right" name="grand_total_price" placeholder="0.00" readonly="readonly" />
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="form-grou col-md-12 text-right pt-5">
                                <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="save_data()">Return</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
<script src="<?php echo e(asset('js/moment.js')); ?>"></script>
<script src="<?php echo e(asset('js/bootstrap-datetimepicker.min.js')); ?>"></script>
<script>
$(document).ready(function () {
    $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
    $('#save-btn').prop("disabled", true);
    $('input:checkbox').click(function () {
        if ($(this).is(':checked')) {
            $('#save-btn').prop("disabled", false);
        } else {
            if ($('.chk').filter(':checked').length < 1) {
                $('#save-btn').attr('disabled', true);
            }
        }
    });
});
function setReturnValue(row) {
    $('#products_'+row+'_return_checkbox').is(':checked') ? $('#return_'+row).val(1) : $('#return_'+row).val(2);
}
function quantity_calculate(row) {
    var a = 0,o = 0,d = 0,p = 0;
    var sold_qty = $(".sold_qty_" + row).val();
    var return_qty = $(".return_qty_" + row).val();
    var price_item = $(".net_unit_price_" + row).val();
    var deduction_rate = $(".deduction_rate_" + row).val();
    if(parseFloat(sold_qty) < parseFloat(return_qty)){
        alert("Sold quantity less than quantity!");
        $("#return_qty_"+row).val("");
    }
    if (parseFloat(return_qty) > 0) {
        var price = (return_qty * price_item);
        var deduction = price * (deduction_rate / 100);
        $(".deduction_amount_" + row).val(deduction);
        var deduction_amount = $(".deduction_amount_" + row).val();
        //Total price calculate per product
        var temp = price - deduction_amount;
        $(".subtotal_" + row).val(temp);
        $(".sub-total-" + row).text(parseFloat(temp).toFixed(2));
        $(".subtotal").each(function () {
            isNaN(this.value) || o == this.value.length || (a += parseFloat(this.value));
        });
        var tax_rate = parseFloat($('#tax_rate').val());
        var total_tax_ammount = a * (tax_rate/100);
        var grand_total = a + total_tax_ammount;
        $("#total_price").val(a.toFixed(2, 2));
        $("#total_tax_ammount").val(total_tax_ammount.toFixed(2, 2));
        $("#grandTotal").val(grand_total.toFixed(2, 2));
        $(".deduction_amount").each(function () {
            isNaN(this.value) || p == this.value.length || (d += parseFloat(this.value));
        });
        $("#total_deduction_ammount").val(d.toFixed(2, 2));
    }
}
function save_data(){
    var rownumber = $('table#product_table tbody tr:last').index();
    if (rownumber < 0) {
        notification("error","Please insert product to return table!")
    }else{
        let form = document.getElementById('sale_update_form');
        let formData = new FormData(form);
        let url = "<?php echo e(route('sale.return.store')); ?>";
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
                $('#sale_update_form').find('.is-invalid').removeClass('is-invalid');
                $('#sale_update_form').find('.error').remove();
                if (data.status == false) {
                    $.each(data.errors, function (key, value) {
                        var key = key.split('.').join('_');
                        $('#sale_update_form input#' + key).addClass('is-invalid');
                        $('#sale_update_form textarea#' + key).addClass('is-invalid');
                        $('#sale_update_form select#' + key).parent().addClass('is-invalid');
                        $('#sale_update_form #' + key).parent().append('<small class="error text-danger">' + value + '</small>');
                    });
                } else {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        window.location.replace("<?php echo e(route('sale.return')); ?>");
                    }
                }
            },
            error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
        });
    }
}
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/StockReturn\Resources/views/sale/edit.blade.php ENDPATH**/ ?>