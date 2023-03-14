
<div class="col-md-12 py-5 table-responsive">
    <div class="col-md-12 text-center">
        <h5 class="bg-warning text-white p-3" style="width:250px;margin: 20px auto 10px auto;">Materials</h5>
    </div>

    <table class="table table-bordered pb-5 material_table" id="material_table_<?php echo e($tab); ?>">
        <div class="col-md-12 text-center">
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-2">
                    <label style="padding-top: 10px;">Total Finished Quantity</label>
                </div>
                <div class="col-md-4 mb-4">
                    <input type="text" class="form-control text-center finishedQty" value="" name="finished_qty" id="finished_qty" >
                </div>

            </div>
        </div>

        <thead class="bg-primary">
            <th width="30%">Material</th>
            <th width="5%" class="text-center">QTY</th>
            <th width="10%" class="text-right">Rate</th>
            <th width="15%" class="text-center">Stk. Avl. Qty</th>
            <th width="17%" class="text-right">Total</th>
        </thead>
        <tbody>
            <?php if(!$materials->isEmpty()): ?>
                <?php $__currentLoopData = $materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                <tr>
                    <td class="active-bg">
                        <?php echo e($item->material_name .' ('.$item->material_code.')'); ?>

                        <input type="hidden" class="form-control text-center" value="<?php echo e($item->material_id); ?>" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][material_id]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_material_id" data-id="<?php echo e($key+1); ?>" readonly>
                        <input type="hidden" class="track" data-qty="<?php echo e($item->q_ty); ?>" data-cost="<?php echo e($item->cost); ?>" data-stock_qty="<?php echo e($item->qty); ?>" data-total="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_total" data-tab="<?php echo e($tab); ?>"/>
                    </td>
                    <td class="text-center ">
                        <?php echo e($item->q_ty); ?> <?php echo e($item->unit_name); ?>

                        <input type="hidden" class="form-control text-right" value="<?php echo e($item->q_ty); ?>" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][q_ty]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_q_ty" data-id="<?php echo e($key+1); ?>" readonly>
                    </td>
                    <td class="text-right ">
                        <?php echo e(number_format($item->cost,2,'.','')); ?>

                        <input type="hidden" class="form-control text-right" value="<?php echo e($item->cost); ?>" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][cost]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_cost" data-id="<?php echo e($key+1); ?>" readonly>

                    </td>
                    <td class="text-center ">
                        <?php echo e($item->qty ? $item->qty : 0); ?> <?php echo e($item->unit_name); ?>

                        <input type="hidden" class="form-control text-right stock_qty" value="<?php echo e($item->qty); ?>" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][stock_qty]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_stock_qty" data-id="<?php echo e($key+1); ?>">
                    </td>
                        <input type="hidden" class="form-control" value="<?php echo e($item->unit_id); ?>" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][unit_id]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_unit_id" data-id="<?php echo e($key+1); ?>">
                    <td class="">
                        <input type="text" class="form-control text-right total" name="production[<?php echo e($tab); ?>][materials][<?php echo e($key+1); ?>][total]" id="production_<?php echo e($tab); ?>_materials_<?php echo e($key+1); ?>_total" data-id="<?php echo e($key+1); ?>" readonly>
                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php endif; ?>
        </tbody>

    </table>
</div>
<div class="col-md-8"></div>
<div class="col-md-4">
    <table class="table">
        <tr>
            <td><button type="button" class="btn btn-primary btn-block"><?php echo e(__('Other Cost')); ?></button></td>
            <td><input type="text" class="form-control bg-primary text-white text-center other_cost" id="other_cost" name="other_cost" /></td>
        </tr>
        <tr>
            <td><button type="button" class="btn btn-primary btn-block"><?php echo e(__('Grand Total')); ?></button></td>
            <td><input type="text" class="form-control bg-primary text-white text-center grand_total" id="grand_total" name="grand_total" readonly/></td>
            <td><input type="hidden" class="form-control bg-primary text-white text-center g_tl" id="g_tl" name="g_tl" readonly/></td>
        </tr>
        <tr>
            <td><button type="button" class="btn btn-primary btn-block"><?php echo e(__('Cost Per Unit')); ?></button></td>
            <td><input type="text" class="form-control bg-primary text-white text-center cost_per_unit" id="cost_per_unit" name="cost_per_unit" readonly/></td>
        </tr>
    </table>
</div>
<?php /**PATH F:\laragon\www\insaf_erp_b2gsoft\Modules/Production\Resources/views/production/materials.blade.php ENDPATH**/ ?>