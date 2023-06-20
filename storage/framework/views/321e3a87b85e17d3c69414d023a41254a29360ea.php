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
                    <div class="form-group col-md-12 required">
                      <label for="date">Date</label>
                      <input type="text" class="form-control date" name="date" id="date" value="<?php echo e(date('Y-m-d')); ?>" readonly />
                  </div>
                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Depo','name' => 'warehouse_id','col' => 'col-md-12','required' => 'required','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Depo','name' => 'warehouse_id','col' => 'col-md-12','required' => 'required','class' => 'selectpicker']); ?>
                      <?php if(!$warehouses->isEmpty()): ?>
                          <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <option value="<?php echo e($value->id); ?>"><?php echo e($value->name); ?></option>
                          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      <?php endif; ?>
                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Expense Type','name' => 'expense_item_id','col' => 'col-md-12','required' => 'required','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Expense Type','name' => 'expense_item_id','col' => 'col-md-12','required' => 'required','class' => 'selectpicker']); ?>
                      <?php if(!$expense_items->isEmpty()): ?>
                          <?php $__currentLoopData = $expense_items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <option value="<?php echo e($value->id); ?>"><?php echo e($value->name); ?></option>
                          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      <?php endif; ?>
                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Payment Type','name' => 'payment_type','required' => 'required','onchange' => 'account_list(this.value)','col' => 'col-md-12','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Payment Type','name' => 'payment_type','required' => 'required','onchange' => 'account_list(this.value)','col' => 'col-md-12','class' => 'selectpicker']); ?>
                      <?php $__currentLoopData = SALE_PAYMENT_METHOD; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                      <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                      <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                   <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                  <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Account','name' => 'account_id','required' => 'required','col' => 'col-md-12','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Account','name' => 'account_id','required' => 'required','col' => 'col-md-12','class' => 'selectpicker']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                  <div class="form-group col-md-12 required">
                    <label for="amount">Amount</label>
                    <input type="text" class="form-control" name="amount" id="amount">
                </div>
                  <div class="form-group col-md-12">
                    <label for="remarks">Remarks</label>
                    <textarea  class="form-control" name="remarks" id="remarks" cols="30" rows="3"></textarea>
                </div>
                </div>
            </div>
            <!-- /modal body -->

            <!-- Modal Footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary btn-sm" id="save-btn"></button>
            </div>
            <!-- /modal footer -->
        </form>
      </div>
      <!-- /modal content -->

    </div>
  </div>
<?php /**PATH D:\laragon\www\insaf\Modules/Expense\Resources/views/expense/modal.blade.php ENDPATH**/ ?>