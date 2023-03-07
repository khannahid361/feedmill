<div class="row">
    <div class="col-md-12" id="education_section">
        <?php if(isset($employee) && !$employee->educations->isEmpty()): ?> 
            <?php $__currentLoopData = $employee->educations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="row <?php echo e(($key != 0) ? 'education' : ''); ?>">
                <div class="form-group col-md-4">
                    <label>Degree</label>
                    <input type="text" class="form-control" name="education[<?php echo e($key + 1); ?>][degree]" value="<?php echo e($value->degree); ?>" id="education_<?php echo e($key + 1); ?>_degree">
                </div>
                <div class="form-group col-md-4">
                    <label>Major</label>
                    <input type="text" class="form-control" name="education[<?php echo e($key + 1); ?>][major]" value="<?php echo e($value->major); ?>" id="education_<?php echo e($key + 1); ?>_major">
                </div>
                <div class="form-group col-md-4">
                    <label>Institute</label>
                    <input type="text" class="form-control" name="education[<?php echo e($key + 1); ?>][institute]" value="<?php echo e($value->institute); ?>" id="education_<?php echo e($key + 1); ?>_institute">
                </div>
                <div class="form-group col-md-4">
                    <label>Passing Year</label>
                    <input type="text" class="form-control" name="education[<?php echo e($key + 1); ?>][passing_year]" value="<?php echo e($value->passing_year); ?>" id="education_<?php echo e($key + 1); ?>_passing_year">
                </div>
                <div class="form-group col-md-4">
                    <label>Result</label>
                    <input type="text" class="form-control" name="education[<?php echo e($key + 1); ?>][result]" value="<?php echo e($value->result); ?>" id="education_<?php echo e($key + 1); ?>_result">
                </div>
                <?php if($key != 0): ?>
                <div class="form-group col-md-4 text-right" style="padding-top: 28px;">
                    <button type="button" class="btn btn-danger btn-sm remove_education" data-toggle="tooltip" data-placement="top" data-original-title="Remove">
                        <i class="fas fa-minus-square"></i>
                    </button>
                </div>
                <?php endif; ?>
            </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php else: ?>  
        <div class="row">
            <div class="form-group col-md-4">
                <label>Degree</label>
                <input type="text" class="form-control" name="education[1][degree]" id="education_1_degree">
            </div>
            <div class="form-group col-md-4">
                <label>Major</label>
                <input type="text" class="form-control" name="education[1][major]" id="education_1_major">
            </div>
            <div class="form-group col-md-4">
                <label>Institute</label>
                <input type="text" class="form-control" name="education[1][institute]" id="education_1_institute">
            </div>
            <div class="form-group col-md-4">
                <label>Passing Year</label>
                <input type="text" class="form-control" name="education[1][passing_year]" id="education_1_passing_year">
            </div>
            <div class="form-group col-md-4">
                <label>Result</label>
                <input type="text" class="form-control" name="education[1][result]" id="education_1_result">
            </div>
        </div>
        <?php endif; ?>
       
    </div>
    <div class="col-md-12 text-right border-top pt-5">
        <button type="button" id="add_education" class="btn btn-success btn-sm" data-toggle="tooltip" data-placement="top" data-original-title="Add More">
            <i class="fas fa-plus-square"></i>
        </button>
    </div>
</div>
<div class="d-flex justify-content-between border-top mt-5 pt-10">
    <div class="mr-2">
        <button type="button" class="btn btn-light-primary btn-sm font-weight-bolder text-uppercase"   onclick="show_form(4)">Previous</button>
    </div>
    <div>
        <button type="button"  class="btn btn-primary btn-sm font-weight-bolder text-uppercase" data-wizard-type="action-next" onclick="show_form(6)">Next</button>
    </div>
</div><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/employee/section/educational.blade.php ENDPATH**/ ?>