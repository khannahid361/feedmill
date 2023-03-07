
<div class="col-md-12 py-5 table-responsive">
    <div class="col-md-12 text-center">
        <h5 class="bg-warning text-white p-3" style="width:250px;margin: 20px auto 10px auto;">Materials</h5>
    </div>
    <table class="table table-bordered pb-5" id="material_table_<?php echo e($tab); ?>">
        <thead class="bg-primary">
            <th width="30%">Material</th>
            <th width="5%" class="text-center">Type</th>
            <th width="10%" class="text-center">Unit Name</th>
            <th width="10%" class="text-right">Rate</th>
            <th width="15%" class="text-center">Stk. Avl. Qty</th>
            <th width="13%" class="text-center">Required Qty</th>
            <th width="17%" class="text-right">Total</th>
        </thead>
        <tbody>
            <?php if(!$materials->isEmpty()): ?>
                <?php $__currentLoopData = $materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                    <td>
                        <?php echo e($item->material_name .' ('.$item->material_code.')'); ?>

                        <input type="hidden" class="form-control text-center" value="<?php echo e($item->material_id); ?>" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][material_id]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_material_id" data-id="<?php echo e($key+1); ?>" readonly>
                    </td>
                    <td class="text-center">
                        <?php echo e(MATERIAL_TYPE[$item->type]); ?>

                    </td>
                    <td class="text-center">
                        <?php echo e($item->unit_name.' ('.$item->unit_code.')'); ?>

                        <input type="hidden" class="form-control" value="<?php echo e($item->unit_id); ?>" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][unit_id]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_unit_id" data-id="<?php echo e($key+1); ?>">
                        
                    </td>
                    <td class="text-right">
                        <?php echo e(number_format($item->cost,2,'.','')); ?>

                        <input type="hidden" class="form-control text-right" value="<?php echo e($item->cost); ?>" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][cost]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_cost" data-id="<?php echo e($key+1); ?>" readonly>
                    </td>
                    <td class="text-center">
                        <?php echo e($item->qty); ?>

                        <input type="hidden" class="form-control text-right stock_qty" value="<?php echo e($item->qty); ?>" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][stock_qty]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_stock_qty" data-id="<?php echo e($key+1); ?>">
                    </td>
                    <td>
                        <input type="text" class="form-control text-center qty" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][qty]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_qty"  onkeyup="calculateRowTotal('<?php echo e($tab); ?>','<?php echo e($key+1); ?>')" data-id="<?php echo e($key+1); ?>">
                    </td>
                    <td>
                        <input type="text" class="form-control text-right total" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][total]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_total" data-id="<?php echo e($key+1); ?>" readonly>
                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php endif; ?>
        </tbody>
    </table>
</div> <?php /**PATH C:\laragon\www\insaf\Modules/Production\Resources/views/production/materials.blade.php ENDPATH**/ ?>