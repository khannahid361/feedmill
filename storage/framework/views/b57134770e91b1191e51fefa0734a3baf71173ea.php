<div class="row">
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Father Name','name' => 'father_name','value' => ''.e(isset($employee) ? $employee->father_name : '').'','col' => 'col-md-4','required' => 'required']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Father Name','name' => 'father_name','value' => ''.e(isset($employee) ? $employee->father_name : '').'','col' => 'col-md-4','required' => 'required']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Mother Name','name' => 'mother_name','value' => ''.e(isset($employee) ? $employee->mother_name : '').'','col' => 'col-md-4','required' => 'required']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Mother Name','name' => 'mother_name','value' => ''.e(isset($employee) ? $employee->mother_name : '').'','col' => 'col-md-4','required' => 'required']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Date of Birth','name' => 'dob','value' => ''.e(isset($employee) ? $employee->dob : '').'','col' => 'col-md-4','class' => 'date','required' => 'required']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Date of Birth','name' => 'dob','value' => ''.e(isset($employee) ? $employee->dob : '').'','col' => 'col-md-4','class' => 'date','required' => 'required']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Gender','name' => 'gender','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Gender','name' => 'gender','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
        <?php $__currentLoopData = GENDER; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($key); ?>" <?php if(isset($employee)): ?> <?php echo e(($employee->gender == $key) ? 'selected' : ''); ?> <?php endif; ?>><?php echo e($value); ?></option>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 
     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Marital Status','name' => 'marital_status','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Marital Status','name' => 'marital_status','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
        <?php $__currentLoopData = MARITAL_STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($key); ?>"  <?php if(isset($employee)): ?> <?php echo e(($employee->marital_status == $key) ? 'selected' : ''); ?> <?php endif; ?>><?php echo e($value); ?></option>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 
     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Blood Group','name' => 'blood_group','col' => 'col-md-4','required' => 'required','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Blood Group','name' => 'blood_group','col' => 'col-md-4','required' => 'required','class' => 'selectpicker']); ?>
        <?php $__currentLoopData = BLOOD_GROUP; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($key); ?>" <?php if(isset($employee)): ?> <?php echo e(($employee->blood_group == $key) ? 'selected' : ''); ?> <?php endif; ?>><?php echo e($value); ?></option>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 
     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Residential Status','name' => 'residential_status','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Residential Status','name' => 'residential_status','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
        <?php $__currentLoopData = RESIDENTIAL_STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <option value="<?php echo e($key); ?>" <?php if(isset($employee)): ?> <?php echo e(($employee->residential_status == $key) ? 'selected' : ''); ?> <?php endif; ?>><?php echo e($value); ?></option>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?> 
     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Religion','name' => 'religion','value' => ''.e(isset($employee) ? $employee->religion : '').'','col' => 'col-md-4','required' => 'required']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Religion','name' => 'religion','value' => ''.e(isset($employee) ? $employee->religion : '').'','col' => 'col-md-4','required' => 'required']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'NID No.','name' => 'nid_no','value' => ''.e(isset($employee) ? $employee->nid_no : '').'','col' => 'col-md-4','required' => 'required']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'NID No.','name' => 'nid_no','value' => ''.e(isset($employee) ? $employee->nid_no : '').'','col' => 'col-md-4','required' => 'required']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
    <div class="col-md-6">
        <div class="row">
            <div class="form-group col-md-12">
                <label for="">NID Photo</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="nid_photo" id="nid_photo" onchange="loadFile(event,'show_nid_photo')" required>
                    <label class="custom-file-label" for="nid_photo">Choose file...</label>
                </div>
            </div>
            <div class="form-group col-md-12">
                <?php if(isset($employee) &&  !empty($employee->nid_photo)): ?> 
                    <img src="<?php echo e(asset('storage/'.EMPLOYEE_NID_PHOTO.$employee->nid_photo)); ?>" class="show-image" id="show_nid_photo" style="width: 150px;">
                <?php else: ?> 
                <img src="images/default.svg" class="show-image" id="show_nid_photo" style="width: 150px;">
                <?php endif; ?>
                <?php if(isset($employee) &&  !empty($employee->nid_photo)): ?> 
                <input type="hidden" name="old_nid_photo" id="old_nid_photo" value="<?php echo e($employee->nid_photo); ?>">
                <?php else: ?>
                <input type="hidden" name="old_nid_photo" id="old_nid_photo" >
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="row">
            <div class="form-group col-md-12">
                <label for="">Employee Photograph</label>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" name="photograph" id="photograph" onchange="loadFile(event,'show_photograph')" required>
                    <label class="custom-file-label" for="photograph">Choose file...</label>
                </div>
            </div>
            <div class="form-group col-md-12">
                <?php if(isset($employee) &&  !empty($employee->photograph)): ?> 
                    <img src="<?php echo e(asset('storage/'.EMPLOYEE_IMAGE_PATH.$employee->photograph)); ?>" class="show-image" id="show_photograph" style="width: 150px;">
                <?php else: ?> 
                    <img src="images/default.svg" class="show-image" id="show_photograph" style="width: 150px;">
                <?php endif; ?>
                <?php if(isset($employee) &&  !empty($employee->photograph)): ?> 
                <input type="hidden" name="old_photograph" id="old_photograph" value="<?php echo e($employee->photograph); ?>">
                <?php else: ?>
                <input type="hidden" name="old_photograph" id="old_photograph" >
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>

<div class="d-flex justify-content-between border-top mt-5 pt-10">
    <div class="mr-2">
        <button type="button" class="btn btn-light-primary btn-sm font-weight-bolder text-uppercase"   onclick="show_form(3)">Previous</button>
    </div>
    <div>
        <button type="button"  class="btn btn-primary btn-sm font-weight-bolder text-uppercase" data-wizard-type="action-next" onclick="show_form(5)">Next</button>
    </div>
</div><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/employee/section/biographical.blade.php ENDPATH**/ ?>