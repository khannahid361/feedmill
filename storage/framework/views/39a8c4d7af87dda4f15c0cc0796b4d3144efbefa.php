<?php if($ledger_data): ?>
    <?php $__currentLoopData = $ledger_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <tr>
            <td class="text-center"><?php echo e(date('d-M-y', strtotime($value['date']))); ?></td>
            <td><?php echo e($value['material_name']); ?></td>
            <td class="text-center"><?php echo e($value['unit_name']); ?></td>

            <td class="text-right font-weight-bolder" style="color:#002447 !important;"><?php echo e($value['previous_qty']); ?></td>
            <?php if(permission('material-stock-ledger-cost-view')): ?>
                <td class="text-right font-weight-bolder" style="color:#002447 !important;"><?php echo e($value['previous_cost']); ?>

                </td>
                <td class="text-right font-weight-bolder" style="color:#002447 !important;"><?php echo e($value['previous_value']); ?>

                </td>
            <?php endif; ?>
            <td class="text-center">
                <ul style="list-style:none;margin:0;padding:0;">
                    <?php if(!empty($value['purchase_numbers'])): ?>
                        <?php $__currentLoopData = $value['purchase_numbers']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li class="text-center px-2 font-weight-bolder"><?php echo e($item); ?></li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                </ul>
            </td>
            <td class="text-right font-weight-bolder" style="color:#1F9F04 !important;"><?php echo e($value['purchase_qty']); ?>

            </td>
            <?php if(permission('material-stock-ledger-cost-view')): ?>
                <td class="text-right font-weight-bolder" style="color:#1F9F04 !important;">
                    <?php echo e($value['purchase_cost']); ?></td>
                <td class="text-right font-weight-bolder" style="color:#1F9F04 !important;">
                    <?php echo e($value['purchase_value']); ?></td>
            <?php endif; ?>
            <td class="text-center">
                <ul style="list-style:none;margin:0;padding:0;">
                    <?php if(!empty($value['batch_numbers'])): ?>
                        <?php $__currentLoopData = $value['batch_numbers']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li class="text-center px-2 font-weight-bolder"><?php echo e($item); ?></li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                </ul>
            </td>
            <td class="text-center">
                <ul style="list-style:none;margin:0;padding:0;">
                    <?php if(!empty($value['return_numbers'])): ?>
                        <?php $__currentLoopData = $value['return_numbers']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li class="text-center px-2 font-weight-bolder"><?php echo e($item); ?></li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                </ul>
            </td>
            <td class="text-center">
                <ul style="list-style:none;margin:0;padding:0;">
                    <?php if(!empty($value['damage_numbers'])): ?>
                        <?php $__currentLoopData = $value['damage_numbers']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li class="text-center px-2 font-weight-bolder"><?php echo e($item); ?></li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                </ul>
            </td>
            <td class="text-right">
                <ul style="list-style:none;margin:0;padding:0;">
                    <li class="text-center px-2 font-weight-bolder" style="color: darkred;">
                        <?php echo e($value['production_qty']['production_material_qty']); ?></li>
                    <li class="text-center px-2 font-weight-bolder" style="color: darkred;">
                        <?php echo e($value['production_qty']['returned_material_qty']); ?></li>
                    <li class="text-center px-2 font-weight-bolder" style="color: darkred;">
                        <?php echo e($value['production_qty']['damage_material_qty']); ?></li>
                </ul>
            </td>
            <?php if(permission('material-stock-ledger-cost-view')): ?>
                <td class="text-right">
                    <ul style="list-style:none;margin:0;padding:0;">
                        <li class="text-right px-2 font-weight-bolder" style="color: darkred;">
                            <?php echo e($value['production_cost']['production_material_cost']); ?></li>
                        <li class="text-right px-2 font-weight-bolder" style="color: darkred;">
                            <?php echo e($value['production_cost']['returned_material_cost']); ?></li>
                        <li class="text-right px-2 font-weight-bolder" style="color: darkred;">
                            <?php echo e($value['production_cost']['damage_material_cost']); ?></li>
                    </ul>
                </td>
                <td class="text-right">
                    <ul style="list-style:none;margin:0;padding:0;">
                        <li class="text-right px-2 font-weight-bolder" style="color: darkred;">
                            <?php echo e($value['production_subtotal']['production_material_cost']); ?></li>
                        <li class="text-right px-2 font-weight-bolder" style="color: darkred;">
                            <?php echo e($value['production_subtotal']['returned_material_cost']); ?></li>
                        <li class="text-right px-2 font-weight-bolder" style="color: darkred;">
                            <?php echo e($value['production_subtotal']['damage_material_cost']); ?></li>
                    </ul>
                </td>

                <td class="text-right font-weight-bolder" style="color: darkred;"><?php echo e($value['production_value']); ?></td>
            <?php endif; ?>
            <td class="text-right font-weight-bolder"><?php echo e($value['current_qty']); ?></td>
            <?php if(permission('material-stock-ledger-cost-view')): ?>
                <td class="text-right font-weight-bolder"><?php echo e($value['current_cost']); ?></td>
                <td class="text-right font-weight-bolder"><?php echo e($value['current_value']); ?></td>
            <?php endif; ?>
        </tr>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    <tr class="bg-primary text-white">
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <?php if(permission('material-stock-ledger-cost-view')): ?>
            <td></td>
            <td></td>
        <?php endif; ?>
        <td class="text-right font-weight-bolder">Total</td>
        <td class="text-right font-weight-bolder"><?php echo e($total_purchase_qty); ?></td>
        <?php if(permission('material-stock-ledger-cost-view')): ?>
            <td></td>
            <td class="text-right font-weight-bolder"><?php echo e($total_purchase_value); ?></td>
        <?php endif; ?>
        <td></td>
        <td></td>
        <td></td>
        <td class="text-right font-weight-bolder"><?php echo e($total_production_qty); ?></td>
        <?php if(permission('material-stock-ledger-cost-view')): ?>
            <td></td>
            <td></td>
            <td class="text-right font-weight-bolder"><?php echo e($total_production_value); ?></td>
        <?php endif; ?>
        <td class="text-right font-weight-bolder"><?php echo e($total_current_qty); ?></td>
        <?php if(permission('material-stock-ledger-cost-view')): ?>
            <td></td>
            <td class="text-right font-weight-bolder"><?php echo e($total_current_value); ?></td>
        <?php endif; ?>
    </tr>
<?php else: ?>
    <tr>
        <td colspan="18" class="text-center text-danger font-weight-bolder">No Data Found</td>
    </tr>

<?php endif; ?>
<?php /**PATH D:\laragon\www\insaf\Modules/StockLedger\Resources/views/material-ledger/data.blade.php ENDPATH**/ ?>