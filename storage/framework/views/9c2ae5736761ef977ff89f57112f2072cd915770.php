
<div class="modal fade" id="store_or_update_modal" tabindex="-1" role="dialog" aria-labelledby="model-1" aria-hidden="true">
    <div class="modal-dialog" role="document">

      <!-- Modal Content -->
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header bg-primary">
          <h3 class="modal-title text-white" id="model-1"></h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <i aria-hidden="true" class="ki ki-close text-white"></i>
          </button>
        </div>
        <!-- /modal header -->
        <form id="store_or_update_form" method="post">
          <?php echo csrf_field(); ?>
            <!-- Modal Body -->
            <div class="modal-body">
                <div class="row">
                    <input type="hidden" name="update_id" id="update_id"/>
                    <div class="col-md-12 required">
                        <label for="salary_month" class="col-sm-12 control-label" style="padding-left: 0px;"><?php echo e(__('Bonus Name')); ?></label>
                        <input type="text" class="form-control" name="bonus_name" id="bonus_name" required="required" placeholder="Bonus Name"/>
                    </div>
                    <div class="col-md-12 required">
                        <label for="salary_month" class="col-sm-12 control-label" style="padding-left: 0px;"><?php echo e(__('Bonus Month')); ?></label>
                        <input type="text" class="form-control" name="bonus_month" id="datepicker" required="required" placeholder="Select Bonus Month"/>
                    </div>
                    <div class="col-md-12 required">
                        <label for="salary_month" class="col-sm-12 control-label" style="padding-left: 0px;"><?php echo e(__('Bonus Percentage (Basic Salary)')); ?></label>
                        <input type="text" class="form-control" name="bonus_percentage" id="bonus_percentage" required="required" placeholder="Bonus Percentage( % )"/>
                    </div>
                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => ''.e(__('Bonus Description')).'','name' => 'bonus_description','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter Bonus Description']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('Bonus Description')).'','name' => 'bonus_description','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter Bonus Description']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                    <div class="col-md-12 required" >
                        <label for="employee_id" class="col-sm-12 control-label" style="padding-left: 0px;"><?php echo e(__('file.Status')); ?></label>
                        <select class="selectpicker form-control" name="status" id="status" data-live-search="true">
                            <option value="">Select</option>
                            <option value="1"  id="selectBox">Active</option>
                            <option value="2"  id="selectBox">Inactive</option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- /modal body -->
            <!-- Modal Footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><?php echo e(__('file.Close')); ?></button>
            <button type="button" class="btn btn-primary btn-sm" id="save-btn"></button>
            </div>
            <!-- /modal footer -->
        </form>
      </div>
      <!-- /modal content -->
    </div>
  </div>


<?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/bonus/modal.blade.php ENDPATH**/ ?>