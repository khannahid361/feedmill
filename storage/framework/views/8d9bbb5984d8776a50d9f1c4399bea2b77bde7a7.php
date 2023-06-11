<div class="modal fade" id="purchase_status_modal" tabindex="-1" role="dialog" aria-labelledby="model-1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h3 class="modal-title text-white" id="model-1"></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close text-white"></i>
                </button>
            </div>
            <form id="purchase_status_form" method="POST">
                <?php echo csrf_field(); ?>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" id="purchase_change_status_id" name="purchase_change_status_id"/>
                        <div class="form-group col-md-12 required">
                            <label for="purchase_change_status">Purchase Status</label>
                            <select class="form-control" id="purchase_change_status" name="purchase_change_status" required>
                                <option value="">Select Please</option>
                                <?php $__currentLoopData = PURCHASE_STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary btn-sm" id="change-status-btn"></button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php /**PATH D:\laragon\www\insaf\Modules/Purchase\Resources/views/statusModal.blade.php ENDPATH**/ ?>