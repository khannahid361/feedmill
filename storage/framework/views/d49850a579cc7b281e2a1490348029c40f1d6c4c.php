<div class="col-md-12 py-5 table-responsive">
    <div class="col-md-12 text-center">
        <h5 class="bg-warning text-white p-3" style="width:250px;margin: 20px auto 10px auto;">Materials</h5>
    </div>

    <table class="table table-bordered pb-5 material_table" id="material_table_<?php echo e($tab); ?>">
        <div class="col-md-12 text-center">
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-2 required">
                    <label style="padding-top: 10px;">Total Finished Quantity </label>
                </div>
                <div class="col-md-4 mb-4">
                    <input type="text" class="form-control text-center finishedQty finished-qty" value=""
                        name="production[<?php echo e($tab); ?>][expected_unit_qty]" id="finished_qty">
                </div>

            </div>
        </div>

        <thead class="bg-primary">
            <th width="30%">Material</th>
            <th width="5%" class="text-center">Material QTY</th>
            <th width="10%" class="text-right">Rate</th>
            <th width="15%" class="text-center">Stk. Avl. Qty</th>
            <th width="15%" class="text-center">Received Qty</th>
            
            <th width="17%" class="text-right">Total</th>
        </thead>
        <tbody>
            <?php if(!$materials->isEmpty()): ?>
                <?php $__currentLoopData = $materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                        <td class="active-bg">
                            <?php echo e($item->material_name . ' (' . $item->material_code . ')'); ?>

                            <input type="hidden" class="form-control text-center" value="<?php echo e($item->material_id); ?>"
                                name="production[<?php echo e($tab); ?>][materials][<?php echo e($key + 1); ?>][material_id]"
                                id="production_<?php echo e($tab); ?>_materials_<?php echo e($key + 1); ?>_material_id"
                                data-id="<?php echo e($key + 1); ?>" readonly>
                            <input type="hidden" class="form-control" value="<?php echo e($item->unit_id); ?>"
                                name="production[<?php echo e($tab); ?>][materials][<?php echo e($key + 1); ?>][unit_id]"
                                id="production_<?php echo e($tab); ?>_materials_<?php echo e($key + 1); ?>_unit_id"
                                data-id="<?php echo e($key + 1); ?>">
                            <input type="hidden" class="form-control text-right" value="<?php echo e(round($item->cost,2)); ?>"
                                name="production[<?php echo e($tab); ?>][materials][<?php echo e($key + 1); ?>][cost]"
                                id="production_<?php echo e($tab); ?>_materials_<?php echo e($key + 1); ?>_cost"
                                data-id="<?php echo e($key + 1); ?>" readonly>
                            <input type="hidden" class="form-control text-right stock_qty" value="<?php echo e($item->qty); ?>"
                                name="production[<?php echo e($tab); ?>][materials][<?php echo e($key + 1); ?>][stock_qty]"
                                id="production_<?php echo e($tab); ?>_materials_<?php echo e($key + 1); ?>_stock_qty"
                                data-id="<?php echo e($key + 1); ?>">
                            <input type="hidden" class="form-control text-right q_ty" value="<?php echo e($item->q_ty); ?>"
                                id="production_<?php echo e($tab); ?>_materials_<?php echo e($key + 1); ?>_q_ty"
                                data-id="<?php echo e($key + 1); ?>" readonly>
                            <input type="hidden" class="track" data-qtys="<?php echo e($item->q_ty); ?>"
                                data-cost="<?php echo e(round($item->cost,2)); ?>" data-stock_qty="<?php echo e($item->qty); ?>"
                                data-total="production_<?php echo e($tab); ?>_materials_<?php echo e($key + 1); ?>_total"
                                data-tab="<?php echo e($tab); ?>" />
                            <input type="hidden" class="track_qty" data-qtys="<?php echo e($item->q_ty); ?>"
                                data-cost="<?php echo e(round($item->cost,2)); ?>" data-stock_qty="<?php echo e($item->qty); ?>"
                                data-qty="production_<?php echo e($tab); ?>_materials_<?php echo e($key + 1); ?>_qty"
                                data-tab="<?php echo e($tab); ?>" />
                        </td>
                        <td class="text-center">
                            <?php echo e($item->q_ty); ?> <?php echo e($item->unit_code); ?>

                        </td>
                        <td class="text-right ">
                            <?php echo e(number_format($item->cost, 2, '.', '')); ?>

                        </td>
                        <td class="text-center ">
                            <?php echo e($item->qty ? $item->qty : 0); ?> <?php echo e($item->unit_name); ?>

                        </td>
                        <td>
                            <input type="text" class="form-control text-right qty material-qty" value=""
                                name="production[<?php echo e($tab); ?>][materials][<?php echo e($key + 1); ?>][qty]"
                                id="production_<?php echo e($tab); ?>_materials_<?php echo e($key + 1); ?>_qty"
                                data-id="<?php echo e($key + 1); ?>" readonly>

                        </td>

                        
                        
                        
                        <td class="">
                            <input type="text" class="form-control text-right total material-amount"
                                name="production[<?php echo e($tab); ?>][materials][<?php echo e($key + 1); ?>][total]"
                                id="production_<?php echo e($tab); ?>_materials_<?php echo e($key + 1); ?>_total"
                                data-id="<?php echo e($key + 1); ?>" readonly>
                        </td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <tr>
                    <td colspan="4">Total</td>
                    <td class="text-right"><span id="materialQty">0</span></td>
                    <td class="text-right"><span id="materialAmnt">0</span></td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>
<div class="col-md-6"></div>
<div class="form-group col-md-3 required">
    <label for="">Remaining Mixture</label>
    <input type="text" class="form-control" name="" id="remaining_mixture" value="<?php echo e($wastage->recyclable_wastage??'0'); ?>" readonly />
</div>
<div class="form-group col-md-3 required">
    <label for="">Used Mixture</label>
    <input type="text" class="form-control" name="used_wastage_qty" id="used_wastage_qty" onkeyup="checkUsedMixtureQty();" value="0" required />
</div>


















<?php /**PATH D:\laragon\www\insaf\Modules/Production\Resources/views/production/materials.blade.php ENDPATH**/ ?>