<div class="modal fade" id="approve_status_modal" tabindex="-1" role="dialog" aria-labelledby="model-1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h3 class="modal-title text-white" id="model-1"></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i aria-hidden="true" class="ki ki-close text-white"></i></button>
            </div>
            <form id="approve_status_form" method="POST">
                <?php echo csrf_field(); ?>
                <div class="modal-body">
                    <input type="hidden" id="loan_id" name="loan_id">
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="start_date"><?php echo e("Start Date"); ?></label>
                            <input type="date" class="form-control" id="start_date" name="start_date" value="<?php echo e(date('Y-m-d')); ?>" required/>
                        </div>
                        <div class="form-group col-md-12">
                            <label for=""><?php echo e("Status"); ?></label>
                            <select class="form-control" id="loan_status" name="loan_status" required>
                                <option value="">Select Please</option>
                                <?php $__currentLoopData = STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($key == 1): ?>
                                    <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><?php echo e("Close"); ?></button>
                    <button type="button" class="btn btn-primary btn-sm" id="loan-status-btn"></button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php /**PATH C:\laragon\www\insaf\Modules/Loan\Resources/views/loan/modal.blade.php ENDPATH**/ ?>