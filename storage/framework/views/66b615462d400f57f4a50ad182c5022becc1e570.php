
<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                <div class="card-toolbar"><a href="<?php echo e(route('transfer.inventory')); ?>" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a></div>
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-body">
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <form action="" id="store_update_form" method="post" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <input type="hidden" name="transfer_id" value="<?php echo e(isset($transfer) ? $transfer->id : ''); ?>">
                        <div class="row">
                            <div class="form-group col-md-3 required">
                                <label for="challan_no">Challan No.</label>
                                <input type="text" class="form-control" name="challan_no" id="challan_no" value="<?php echo e(isset($transfer) ? $transfer->challan_no :  $challan_no); ?>" readonly />
                            </div>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Transfer Date','name' => 'transfer_date','value' => ''.e(isset($transfer) ? $transfer->transfer_date : date('Y-m-d')).'','required' => 'required','class' => 'date','col' => 'col-md-3']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Transfer Date','name' => 'transfer_date','value' => ''.e(isset($transfer) ? $transfer->transfer_date : date('Y-m-d')).'','required' => 'required','class' => 'date','col' => 'col-md-3']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <?php if(Auth::user()->warehouse_id): ?>
                            <input type="hidden" name="from_warehouse_id" id="from_warehouse_id" value="<?php echo e(Auth::user()->warehouse_id); ?>">
                            <?php else: ?>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'From Warehouse','name' => 'from_warehouse_id','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'From Warehouse','name' => 'from_warehouse_id','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']); ?>
                              <?php if(!$warehouses->isEmpty()): ?>
                                  <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                  <option value="<?php echo e($value->id); ?>" <?php echo e(isset($transfer) ? ($transfer->from_warehouse_id == $value->id ? 'selected' : 'disabled') : ''); ?>><?php echo e($value->name); ?></option>
                                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                              <?php endif; ?>
                             <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <?php endif; ?>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'To Warehouse','name' => 'to_warehouse_id','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'To Warehouse','name' => 'to_warehouse_id','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <?php if(!$warehouses->isEmpty()): ?>
                                <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($value->id); ?>" <?php echo e(isset($transfer) ? ($transfer->to_warehouse_id == $value->id ? 'selected' : '') : ''); ?>><?php echo e($value->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                             <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <div class="form-group col-md-4">
                                <label for="driver_name">Driver Name</label>
                                <input type="text" class="form-control" name="driver_name" id="driver_name" value="<?php echo e(isset($transfer) ? $transfer->driver_name :  ''); ?>"  />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="dmobile_no">Driver Mobile No.</label>
                                <input type="text" class="form-control" name="dmobile_no" id="dmobile_no" value="<?php echo e(isset($transfer) ? $transfer->dmobile_no :  ''); ?>"  />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="shipping_cost">Shipping Cost</label>
                                <input type="text" class="form-control" name="shipping_cost" id="shipping_cost" value="<?php echo e(isset($transfer) ? $transfer->shipping_cost :  ''); ?>"  />
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered" id="product_table">
                                    <thead class="bg-primary">
                                        <th>Product</th>
                                        <th class="text-center">Unit</th>
                                        <th class="text-center">Available Qty</th>
                                        <th class="text-center">Transfer Qty</th>
                                        <th class="text-center">Cost</th>
                                        <th class="text-center">Subtotal</th>
                                        <th>Action</th>
                                    </thead>
                                    <tbody>
                                        <?php if(isset($transfer)): ?>
                                            <?php if(!$transfer->hasManyProducts->isEmpty()): ?>
                                                <?php $__currentLoopData = $transfer->hasManyProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php
                                                        $stock_qty = 0;
                                                        $warehouse_stock = DB::table('warehouse_product')->where([
                                                            'warehouse_id'=>$transfer->from_warehouse_id,'product_id'=>$item->product_id])->value('qty');

                                                        if($transfer->transfer_status == 1)
                                                        {
                                                            $stock_qty = ($warehouse_stock ?? 0) + $item->transfer_qty;
                                                        }else{
                                                            $stock_qty = ($warehouse_stock ?? 0);
                                                        }
                                                    ?>
                                                    <tr>
                                                        <td>
                                                            <select name="products[<?php echo e($key+1); ?>][id]" id="products_<?php echo e($key+1); ?>_id" class="form-control product_id selectpicker" onchange="setProductDetails(<?php echo e($key+1); ?>)"  data-live-search="true" data-row="1">
                                                                <?php if(!$products->isEmpty()): ?>
                                                                <option value="">Please Select</option>
                                                                <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <option value="<?php echo e($product->id); ?>" <?php echo e($item->product_id == $product->id ? 'selected' : 'disabled'); ?>

                                                                        data-cost="<?php echo e($product->cost); ?>" data-unitname="<?php echo e($product->unit->unit_name); ?>" data-unitid="<?php echo e($product->unit->id); ?>">
                                                                        <?php echo e($product->code.' - '.$product->name); ?>

                                                                    </option>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                <?php endif; ?>
                                                            </select>
                                                        </td>
                                                        <td class="unit-name-<?php echo e($key+1); ?> text-center"><?php echo e($item->unit->unit_name); ?></td>
                                                        <td class="stock-qty-<?php echo e($key+1); ?> text-center"><?php echo e($stock_qty); ?></td>
                                                        <td>
                                                            <input type="text" class="form-control transfer_qty text-center"
                                                            value="<?php echo e($item->transfer_qty); ?>" name="products[<?php echo e($key+1); ?>][transfer_qty]"
                                                            id="products_<?php echo e($key+1); ?>_transfer_qty">
                                                        </td>
                                                        <td class="net-unit-cost-<?php echo e($key+1); ?> text-center"><?php echo e(number_format($item->net_unit_cost,2,'.','')); ?></td>
                                                        <td class="sub-total-<?php echo e($key+1); ?> subtotal text-center"><?php echo e(number_format($item->total,2,'.','')); ?></td>
                                                        <td class="text-center">
                                                            <?php if($key != 0 ): ?>
                                                            <button type="button" class="btn btn-danger btn-sm remove-product small-btn"><i class="fas fa-trash"></i></button>
                                                            <?php endif; ?>
                                                        </td>

                                                        <input type="hidden" name="products[<?php echo e($key+1); ?>][unit_id]" value="<?php echo e($item->unit_id); ?>" id="products_<?php echo e($key+1); ?>_unit_id">
                                                        <input type="hidden" class="stock_qty" name="products[<?php echo e($key+1); ?>][stock_qty]"
                                                        id="products_<?php echo e($key+1); ?>_stock_qty" value="<?php echo e($stock_qty); ?>">
                                                        <input type="hidden" class="net_unit_cost" name="products[<?php echo e($key+1); ?>][net_unit_cost]"
                                                        id="products_<?php echo e($key+1); ?>_net_unit_cost" value="<?php echo e($item->net_unit_cost); ?>">
                                                        <input type="hidden" class="sub_total"  name="products[<?php echo e($key+1); ?>][subtotal]"
                                                        id="products_<?php echo e($key+1); ?>_subtotal" value="<?php echo e($item->total); ?>">
                                                    </tr>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php endif; ?>
                                        <?php else: ?>
                                        <tr>
                                            <td>
                                                <select name="products[1][id]" id="products_1_id" class="form-control product_id selectpicker" onchange="setProductDetails(1);getProductStockQty(this.value,1);"  data-live-search="true" data-row="1">
                                                    <?php if(!$products->isEmpty()): ?>
                                                    <option value="">Please Select</option>
                                                    <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($product->id); ?>"
                                                            data-cost="<?php echo e($product->cost); ?>" data-unitname="<?php echo e($product->unit->unit_name); ?>" data-unitid="<?php echo e($product->unit->id); ?>">
                                                            <?php echo e($product->code.' - '.$product->name); ?>

                                                        </option>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <?php endif; ?>
                                                </select>
                                            </td>
                                            <td class="unit-name-1 text-center"></td>
                                            <td class="stock-qty-1 text-center"></td>
                                            <td><input type="text" class="form-control transfer_qty text-center" name="products[1][transfer_qty]" id="products_1_transfer_qty"></td>
                                            <td class="net-unit-cost-1 text-center"></td>
                                            <td class="sub-total-1 subtotal text-center"></td>
                                            <td class="text-center"></td>
                                            <input type="hidden" name="products[1][unit_id]" id="products_1_unit_id">
                                            <input type="hidden" class="stock_qty" name="products[1][stock_qty]" id="products_1_stock_qty">
                                            <input type="hidden" class="net_unit_cost" name="products[1][net_unit_cost]" id="products_1_net_unit_cost">
                                            <input type="hidden" class="sub_total"  name="products[1][subtotal]" id="products_1_subtotal">
                                        </tr>
                                        <?php endif; ?>
                                    </tbody>
                                    <tfoot class="bg-primary">
                                        <th colspan="3" class="font-weight-bolder">Total</th>
                                        <th id="total-qty" class="text-center font-weight-bolder"><?php echo e(isset($transfer) ? $transfer->total_qty : '0'); ?></th>
                                        <th></th>
                                        <th id="total" class="text-center font-weight-bolder"><?php echo e(isset($transfer) ? number_format($transfer->grand_total,2,'.','') : '0.00'); ?></th>
                                        <th class="text-center"><button type="button" class="btn btn-success btn-sm add-product small-btn"><i class="fas fa-plus-square"></i></button></th>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="shipping_cost">Note</label>
                                <textarea  class="form-control" name="note" id="note" cols="30" rows="3"><?php echo e(isset($transfer) ? $transfer->note : ''); ?></textarea>
                            </div>
                            <div class="col-md-12">
                                <input type="hidden" name="total_qty" value="<?php echo e(isset($transfer) ? $transfer->total_qty : '0'); ?>">
                                <input type="hidden" name="item" value="<?php echo e(isset($transfer) ? $transfer->item : '0'); ?>">
                                <input type="hidden" name="grand_total" value="<?php echo e(isset($transfer) ? $transfer->grand_total : '0'); ?>">
                            </div>
                            <div class="form-grou col-md-12 text-center pt-5">
                                <a href="<?php echo e(isset($transfer) ? url('transfer-inventory') : url('transfer-inventory/create')); ?>" type="button" class="btn btn-danger btn-sm mr-3"><i class="<?php echo e(isset($transfer) ? 'fas fa-window-close' : 'fas fa-sync-alt'); ?>"></i> <?php echo e(isset($transfer) ? 'Cancel' : 'Reset'); ?></a>
                                <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i> <?php echo e(isset($transfer) ? 'Update' : 'Save'); ?></button>
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
    $('.date').datetimepicker({format: 'YYYY-MM-DD'});
    var rowindex;
    $('.product_id').on('change', function() {
        var warehouse_id = document.getElementById('from_warehouse_id').value;
        if (!warehouse_id) {
            $(this).val('');
            $(this).selectpicker('refresh');
            notification('error', 'Please select from inventory first!');
        }
    });
    $('#product_table').on('keyup','.transfer_qty',function(){
        rowindex = $(this).closest('tr').index();
        let qty =  parseFloat($(this).val());
        let cost = parseFloat($('#product_table tbody tr:nth-child('+(rowindex + 1)+') .net_unit_cost').val());
        let stock_qty = $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .stock_qty').val() ? parseFloat($('#product_table tbody tr:nth-child('+(rowindex + 1)+') .stock_qty').val()) : 0;
        if($(this).val() <= 0 && $(this).val() != ''){
            qty = 1;
            $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .transfer_qty').val(1);
            notification('error','Qunatity can\'t be less than 1');
        }
        if(qty > stock_qty) {
            qty = stock_qty;
            $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .transfer_qty').val(stock_qty);
            notification('error','Qunatity can\'t be greater than stock available qty');
        }
        let subtotal = (qty ? qty : 0) * cost;
        console.log(subtotal);
        $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .subtotal').text(parseFloat(subtotal).toFixed(2));
        $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .sub_total').val(parseFloat(subtotal));
        calculateTotal();
    });
    var count = 1;
    <?php if(isset($transfer)): ?>
        <?php if(!$transfer->hasManyProducts->isEmpty()): ?>
        count = "<?php echo e(count($transfer->products)); ?>";
        <?php endif; ?>
    <?php endif; ?>
    function addProductField(count) {
        var newRow = $('<tr>');
        var cols = `<td>
                        <select name="products[${count}][id]" id="products_${count}_id" class="form-control product_id selectpicker" onchange="setProductDetails(${count});getProductStockQty(this.value,${count});"  data-live-search="true" data-row="1">
                            <?php if(!$products->isEmpty()): ?>
                            <option value="">Please Select</option>
                            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($product->id); ?>"
                                    data-cost="<?php echo e($product->cost); ?>" data-unitname="<?php echo e($product->unit->unit_name); ?>" data-unitid="<?php echo e($product->unit->id); ?>">
                                    <?php echo e($product->code.' - '.$product->name); ?>

                                </option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                        </select>
                    </td>
                    <td class="unit-name-${count} text-center"></td>
                    <td class="stock-qty-${count} text-center"></td>
                    <td><input type="text" class="form-control transfer_qty text-center" name="products[${count}][transfer_qty]" id="products_${count}_transfer_qty"></td>
                    <td class="net-unit-cost-${count} text-center"></td>
                    <td class="sub-total-${count} subtotal text-center"></td>
                    <td class="text-center"><button type="button" class="btn btn-danger btn-sm remove-product small-btn"><i class="fas fa-trash"></i></button></td>
                    <input type="hidden" name="products[${count}][unit_id]" id="products_${count}_unit_id">
                    <input type="hidden" class="stock_qty" name="products[${count}][stock_qty]"
                    id="products_${count}_stock_qty">
                    <input type="hidden" class="net_unit_cost" name="products[${count}][net_unit_cost]"
                    id="products_${count}_net_unit_cost">
                    <input type="hidden" class="sub_total"  name="products[${count}][subtotal]"
                    id="products_${count}_subtotal">`;
        newRow.append(cols);
        $('#product_table tbody').append(newRow);
        $('#product_table tbody .selectpicker').selectpicker();
    }

    $('#product_table').on('click','.remove-product',function(){
        $(this).closest('tr').remove();
        calculateTotal();
    });
    $('#product_table').on('click','.add-product',function(){
        count++;
        addProductField(count);
    });
    function calculateTotal(){
        let total_qty = 0;
        let total = 0;
        $('.transfer_qty').each(function() {
            if($(this).val() == ''){
                total_qty += 0;
            }else{
                total_qty += parseFloat($(this).val());
            }
        });
        $('.sub_total').each(function() {
            if($(this).val() == ''){
                total += 0;
            }else{
                total += parseFloat($(this).val());
            }
        });
        $('#total-qty').text(total_qty);
        $('#total').text(total.toFixed(2));
        $('input[name="total_qty"]').val(total_qty);
        $('input[name="grand_total"]').val(total);
        $('input[name="item"]').val($('#product_table tbody tr:last').index() + 1);
    }
});
    function setProductDetails(row) {
        var warehouse_id = document.getElementById('from_warehouse_id').value;
        if(warehouse_id) {
            const cost     = $(`#products_${row}_id option:selected`).data('cost');
            const unitname = $(`#products_${row}_id option:selected`).data('unitname');
            const unitid   = $(`#products_${row}_id option:selected`).data('unitid');
            $(`.net-unit-cost-${row}`).text(parseFloat(cost ? cost : 0));
            $(`#products_${row}_net_unit_cost`).val(parseFloat(cost ? cost : 0));
            $(`.unit-name-${row}`).text(unitname ? unitname : '');
            $(`#products_${row}_unit_id`).val(unitid ? unitid : '');
        }
    }
    function getProductStockQty(product_id,row) {
        var warehouse_id = document.getElementById('from_warehouse_id').value;
        if (warehouse_id) {
            $.ajax({
                url: '<?php echo e(url("warehouse-wise-product-qty-for-transfer")); ?>',
                type: 'POST',
                data: {
                    product_id: product_id,_token:_token,warehouse_id:warehouse_id
                },
                success: function(data) {
                    console.log(data);
                    $(`.stock-qty-${row}`).text(data.qty);
                    $(`#products_${row}_stock_qty`).val(data.qty);
                }
            });
        }
    }
    function store_data(){
        var rownumber = $('table#product_table tbody tr:last').index();
        if (rownumber < 0) {
            notification("error","Please insert product to order table!")
        }else{
            let form = document.getElementById('store_update_form');
            let formData = new FormData(form);
            let url = "<?php echo e(route('transfer.inventory.store.update')); ?>";
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
                    $('#store_update_form').find('.is-invalid').removeClass('is-invalid');
                    $('#store_update_form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function (key, value) {
                            var key = key.split('.').join('_');
                            $('#store_update_form input#' + key).addClass('is-invalid');
                            $('#store_update_form textarea#' + key).addClass('is-invalid');
                            $('#store_update_form select#' + key).parent().addClass('is-invalid');
                            $('#store_update_form #' + key).parent().append(
                                '<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        notification(data.status, data.message);
                        if (data.status == 'success') {
                            window.location.replace("<?php echo e(route('transfer.inventory')); ?>");
                        }
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
            });
        }
    }
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Transfer\Resources/views/form.blade.php ENDPATH**/ ?>