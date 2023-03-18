<?php if($below_qty > 0): ?> <h6 class="text-danger font-weight-bolder text-center w-100">Red Marked Materials Stock Quantity is Less Than Required Quantity</h6> <?php endif; ?>
<table class="table table-bordered pb-5" id="material_table">
    <thead class="bg-primary">
        <th>Material</th>
        <th class="text-center">Type</th>
        <th class="text-center">Unit Name</th>
        <th class="text-center">Current Stock Qty</th>
        <th class="text-center">Total Required Qty</th>
    </thead>
    <tbody>
        <?php if(!empty($materials) && count($materials) > 0): ?>
            <?php $__currentLoopData = $materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr class="<?php echo e($item['background'] ? $item['background'].' text-white' : ''); ?>">
                    <td><?php echo e($item['material_name']); ?></td>
                    <td class="text-center"><?php echo e($item['type']); ?></td>
                    <td class="text-center"><?php echo e($item['unit_name']); ?></td>
                    <td class="text-center"><?php echo e($item['stock_qty']); ?></td>
                    <td class="text-center"><?php echo e($item['qty']); ?></td>
                </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php endif; ?>
    </tbody>
</table>

<div class="col-md-12">
    <button type="button" class="btn btn-danger btn-sm float-right" data-dismiss="modal">Close</button>
</div><?php /**PATH F:\laragon\www\insaf_erp_b2gsoft\Modules/Production\Resources/views/production/view-data.blade.php ENDPATH**/ ?>