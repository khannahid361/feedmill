<div class="row">
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Supervisor Name','name' => 'supervisor_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Supervisor Name','name' => 'supervisor_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
        <option value="0" <?php if(isset($employee)): ?> <?php echo e(($employee->supervisor_id == 0) ? 'selected' : ''); ?> <?php endif; ?>>Self</option>
        <?php if(!$employees->isEmpty()): ?>
        <?php $__currentLoopData = $employees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($employee->id); ?>"  <?php if(isset($employee)): ?> <?php echo e(($employee->supervisor_id == $employee->id) ? 'selected' : ''); ?> <?php endif; ?>><?php echo e($employee->name.' - '.$employee->employee_id); ?></option>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 
        <?php endif; ?>
     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Is Supervisor','name' => 'is_supervisor','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Is Supervisor','name' => 'is_supervisor','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
        <?php $__currentLoopData = IS_SUPERVISOR; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($key); ?>" <?php if(isset($employee)): ?> <?php echo e(($employee->is_supervisor == $key) ? 'selected' : ''); ?> <?php endif; ?>><?php echo e($value); ?></option>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 
     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
</div>
<div class="d-flex justify-content-between border-top mt-5 pt-10">
    <div class="mr-2">
        <button type="button" class="btn btn-light-primary btn-sm font-weight-bolder text-uppercase"   onclick="show_form(2)">Previous</button>
    </div>
    <div>
        <button type="button"  class="btn btn-primary btn-sm font-weight-bolder text-uppercase" data-wizard-type="action-next" onclick="show_form(4)">Next</button>
    </div>
</div><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/employee/section/supervisor.blade.php ENDPATH**/ ?>