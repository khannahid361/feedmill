<div class="col-md-9">
    <div class="table-responsive">
        <table class="table table-borderless">
            <tr>
                <td><b>Material Name</b></td>
                <td><b>:</b></td>
                <td><?php echo e($material->material_name); ?></td>

                <td><b>Material Code</b></td>
                <td><b>:</b></td>
                <td><?php echo e($material->material_code); ?></td>
            </tr>
            <tr>
                <td><b>Cost</b></td>
                <td><b>:</b></td>
                <td><?php echo e($material->cost ? number_format($material->cost,2) : 0); ?></td>

                <td><b>Unit</b></td>
                <td><b>:</b></td>
                <td><?php echo e($material->unit->unit_name); ?></td>
            </tr>
            <tr>
                <td><b>Purchase Unit</b></td>
                <td><b>:</b></td>
                <td><?php echo e($material->purchase_unit->unit_name); ?></td>

                <td><b>Stock Quantity</b></td>
                <td><b>:</b></td>
                <td><?php echo $material->qty ? $material->qty : '<span class="label label-danger"">0</span>'; ?></td>
            </tr>
            <tr>
                <td><b>Opening Stock Quantity</b></td>
                <td><b>:</b></td>
                <td><?php echo $material->opening_stock_qty ? $material->opening_stock_qty : '<span class=" label
                        label-danger"">0</span>'; ?></td>

                <td><b>Opening Cost</b></td>
                <td><b>:</b></td>
                <td><?php echo $material->opening_cost ? $material->opening_cost : '<span class="label label-danger"">0</span>'; ?></td>
            </tr>
            <tr>
                <td><b>Stock Alert Quantity</b></td>
                <td><b>:</b></td>
                <td><?php echo $material->alert_qty ? $material->alert_qty : '<span class=" label label-danger"">0</span>'; ?>

                </td>

                <td><b>Status</b></td>
                <td><b>:</b></td>
                <td><?php echo STATUS_LABEL[$material->status]; ?></td>
            </tr>
            <tr>
                <td><b>Created By</b></td>
                <td><b>:</b></td>
                <td><?php echo e($material->created_by); ?></td>

                <td><b>Modified By</b></td>
                <td><b>:</b></td>
                <td><?php echo e($material->modified_by ? $material->modified_by : ''); ?></td>
            </tr>
            <tr>
                <td><b>Create Date</b></td>
                <td><b>:</b></td>
                <td><?php echo e($material->created_at ? date(config('settings.date_format'),strtotime($material->created_at)) : ''); ?>

                </td>

                <td><b>Modified Date</b></td>
                <td><b>:</b></td>
                <td><?php echo e($material->updated_at ? date(config('settings.date_format'),strtotime($material->updated_at)) : ''); ?>

                </td>
            </tr>
        </table>
    </div>
</div>
<div class="col-md-3 text-center">
    <?php if($material->material_image): ?>
    <img src='storage/<?php echo e(MATERIAL_IMAGE_PATH.$material->material_image); ?>' alt='<?php echo e($material->material_name); ?>'
        style='width:200px;' />
    <?php else: ?>
    <img src='images/default.svg' alt='Default Image' style='width:200px;' />
    <?php endif; ?>
</div>
<?php /**PATH C:\laragon\www\insaf\Modules/Material\Resources/views/view-modal-data.blade.php ENDPATH**/ ?>