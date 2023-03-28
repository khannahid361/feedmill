<div class="modal fade" id="store_or_update_modal" tabindex="-1" role="dialog" aria-labelledby="model-1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h3 class="modal-title text-white" id="model-1"></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i aria-hidden="true" class="ki ki-close text-white"></i></button>
            </div>
            <form id="store_or_update_form" method="post">
            <?php echo csrf_field(); ?>
                <div class="modal-body">
                    <div class="row">
                        <input type="hidden" name="update_id" id="update_id"/>
                        <div class="col-md-12">
                            <label for="name"><?php echo e('Name'); ?></label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="<?php echo e('Enter Name'); ?>"/><br/>
                        </div>
                        <div class="col-md-12">
                            <label for="status"><?php echo e('Status'); ?></label>
                            <select class="form-control" id="status" name="status">
                                <option value=""><?php echo e('Select Please'); ?></option>
                                <?php $__currentLoopData = STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><?php echo e('Close'); ?></button>
                    <button type="button" class="btn btn-primary btn-sm" id="save-btn"></button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php /**PATH C:\laragon\www\insaf\Modules/Loan\Resources/views/loanCategories/modal.blade.php ENDPATH**/ ?>