<div class="col-md-12">
    <form id="receive_form" method="post">
        <?php echo csrf_field(); ?>
        <table class="table table-borderless">
            <tbody>
                <tr>
                    <td><b>Challan No.</b></td><td><b>: <?php echo e($transfer->challan_no); ?></b></td>
                    <td><b>Date</b></td><td><b>: <?php echo e(date('d-M-Y',strtotime($transfer->transfer_date))); ?></b></td>
                    <td><label for="received_cost">Received Cost</label><input type="number" class="form-control" id="received_cost" name="received_cost"/> </td>
                </tr>
            </tbody>
        </table>
        <table class="table table-bordered">
            <thead class="bg-primary">
                <th class="text-center">SL.</th>
                <th>Product</th>
                <th class="text-center">Unit</th>
                <th class="text-center">Transferred Qty</th>
                <th class="text-center">Receive Qty</th>
                <th class="text-center">Damage Qty</th>
            </thead>
            <tbody>
                <?php
                    $total_damage_cost = 0;
                ?>
                <?php if(!$transfer->hasManyProducts->isEmpty()): ?>
                    <?php $__currentLoopData = $transfer->hasManyProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php
                        $total_damage_cost += $item->net_unit_cost * $item->damage_qty;
                    ?>
                        <tr>
                            <td class="text-center"><?php echo e($key+1); ?></td>
                            <td><?php echo e($item->product->name); ?></td>
                            <td class="text-center"><?php echo e($item->unit->unit_name); ?></td>
                            <td class="text-center">
                                <?php echo e($item->transfer_qty); ?>

                                <input type="hidden"  name="products[<?php echo e($key+1); ?>][id]" id="products_<?php echo e($key+1); ?>_id" value="<?php echo e($item->product_id); ?>" />
                                <input type="hidden" class="transfer_qty" name="products[<?php echo e($key+1); ?>][transfer_qty]" id="products_<?php echo e($key+1); ?>_transfer_qty" value="<?php echo e($item->transfer_qty); ?>" />
                                <input type="hidden" name="products[<?php echo e($key+1); ?>][net_unit_cost]" id="products_<?php echo e($key+1); ?>_net_unit_cost" value="<?php echo e($item->net_unit_cost); ?>" />
                                <input type="hidden" class="damage_cost" name="products[<?php echo e($key+1); ?>][damage_cost]" id="products_<?php echo e($key+1); ?>_damage_cost" value="<?php echo e($item->net_unit_cost * $item->damage_qty); ?>" />
                            </td>
                            <td class="text-center">
                                <input type="text" class="form-control text-center receive_qty" name="products[<?php echo e($key+1); ?>][receive_qty]" id="products_<?php echo e($key+1); ?>_receive_qty" value="<?php echo e($item->receive_qty ? $item->receive_qty : ''); ?>" onkeyup="calculateQty(<?php echo e($key+1); ?>)" />
                            </td>
                            <td class="text-center">
                                <input type="text" class="form-control text-center damage_qty" name="products[<?php echo e($key+1); ?>][damage_qty]" id="products_<?php echo e($key+1); ?>_damage_qty" value="<?php echo e($item->damage_qty ? $item->damage_qty : ''); ?>" readonly />
                            </td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
            </tbody>
            <tfoot>
                <thead  class="bg-primary">
                    <th colspan="3">Total</th>
                    <th id="total-qty" class="text-center"><?php echo e($transfer->total_qty); ?></th>
                    <th id="receive-qty" class="text-center"><?php echo e($transfer->receive_qty); ?></th>
                    <th id="damage-qty" class="text-center"><?php echo e($transfer->damage_qty); ?></th>
                </thead>
            </tfoot>
        </table>
        <input type="hidden" name="transfer_id" id="transfer_id" value="<?php echo e($transfer->id); ?>" />
        <input type="hidden" name="challan_no" id="challan_no" value="<?php echo e($transfer->challan_no); ?>" />
        <input type="hidden" name="transfer_date" id="transfer_date" value="<?php echo e($transfer->transfer_date); ?>" />
        <input type="hidden" name="to_warehouse_id" id="to_warehouse_id" value="<?php echo e($transfer->to_warehouse_id); ?>" />
        <input type="hidden" name="receive_qty" id="receive_qty" />
        <input type="hidden" name="damage_qty" id="damage_qty" />
        <input type="hidden" name="total_damage_cost" id="total_damage_cost" value="<?php echo e($total_damage_cost); ?>" />
    </form>
</div>
<?php /**PATH D:\laragon\www\insaf\Modules/Transfer\Resources/views/transfer-data.blade.php ENDPATH**/ ?>