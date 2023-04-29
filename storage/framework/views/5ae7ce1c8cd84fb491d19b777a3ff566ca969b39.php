
<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title">
                    <h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3>
                </div>
            </div>
        </div>
        <form id="contra-voucher-form" method="post">
            <?php echo csrf_field(); ?>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="form-group col-md-4 required">
                                <label for="voucher_no">Voucher No</label>
                                <input type="text" class="form-control" name="voucher_no" id="voucher_no" value="<?php echo e($voucher_no); ?>" readonly />
                            </div>
                            <div class="form-group col-md-4 required">
                                <label for="voucher_date">Date</label>
                                <input type="text" class="form-control date" name="voucher_date" id="voucher_date" value="<?php echo e(date('Y-m-d')); ?>" readonly />
                            </div>
                            <div class="form-group col-md-4">
                                <button type="button" class="btn btn-success btn-block" style="margin-top: 25px"><?php echo e('Contra Voucher'); ?></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-md-6">
                                <table class="table table-bordered" id="contra-voucher-debit-table">
                                    <thead  class="bg-primary">
                                    <tr class="text-right">
                                        <th width="10%"></th>
                                        <th width="55%"><?php echo e('Account Nam'); ?></th>
                                        <th width="35%"><?php echo e('Debit'); ?></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="text-center">
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm add-more" id="add_more_debit_account" data-type="debit" data-toggle="tooltip" data-placement="top" data-original-title="Add More"><i class="fas fa-plus-square"></i></button>
                                        </td>
                                        <td>
                                            <select name="contraAccount[1][debitId]" id="contraAccount_1_debitId" class="form-control selectpicker">
                                                <option value="">Select Please</option>
                                                <?php if(!$transactional_accounts->isEmpty()): ?>
                                                    <?php $__currentLoopData = $transactional_accounts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $coa): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($coa->id); ?>"><?php echo e($coa->name); ?></option>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <?php endif; ?>
                                            </select>
                                            <input type="hidden" name="contraAccount[1][creditId]" value="0"/>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control debit-amount onInput" name="contraAccount[1][debitAmount]" id="contraAccount_1_debitAmount"/>
                                            <input type="hidden" name="contraAccount[1][creditAmount]" value="0"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td class="text-right" colspan="2">Total</td>
                                        <td><input type="text" class="form-control text-right bg-primary text-white" name="debit_grand_total" id="debit_grand_total" placeholder="0.00" readonly></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <table class="table table-bordered" id="contra-voucher-credit-table">
                                    <thead  class="bg-primary">
                                    <tr>
                                        <th width="35%"><?php echo e('Credit'); ?></th>
                                        <th width="55%"><?php echo e('Account Name'); ?></th>
                                        <th width="10%"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="text-center">
                                        <td>
                                            <input type="hidden" name="contraAccount[2][debitAmount]" value="0"/>
                                            <input type="text" class="form-control credit-amount onInput" name="contraAccount[2][creditAmount]" id="contraAccount_2_creditAmount"/>
                                        </td>
                                        <td>
                                            <input type="hidden" name="contraAccount[2][debitId]" value="0"/>
                                            <select name="contraAccount[2][creditId]" id="contraAccount_2_creditId" class="form-control selectpicker">
                                                <option value="">Select Please</option>
                                                <?php if(!$transactional_accounts->isEmpty()): ?>
                                                    <?php $__currentLoopData = $transactional_accounts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $coa): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($coa->id); ?>"><?php echo e($coa->name); ?></option>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <?php endif; ?>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm add-more" id="add_more_credit_account" data-type="credit" data-toggle="tooltip" data-placement="top" data-original-title="Add More"><i class="fas fa-plus-square"></i></button>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td><input type="text" class="form-control text-right bg-primary text-white" name="credit_grand_total" id="credit_grand_total" placeholder="0.00" readonly></td>
                                        <td class="text-left" colspan="2">Total</td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textarea','data' => ['labelName' => 'Remarks','name' => 'remarks','col' => 'col-md-12']]); ?>
<?php $component->withName('form.textarea'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Remarks','name' => 'remarks','col' => 'col-md-12']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-12 pt-5 text-center">
                <button type="button" class="btn btn-danger btn-sm mr-3"><i class="fas fa-sync-alt"></i> Reset</button>
                <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i> Save</button>
            </div>
        </form>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
<script src="<?php echo e(asset('js/moment.js')); ?>"></script>
<script src="<?php echo e(asset('js/bootstrap-datetimepicker.min.js')); ?>"></script>
<script>
        $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
        let contraDebitAccount  = 100;
        let contraCreditAccount = 10000;
        function _(x){
            return document.getElementById(x);
        }
        $(document).on('click','.add-more',function(){
           let type = $(this).data('type');
           if(type == 'debit'){
               if($('.credit-amount').length == 1) {
                   html = `<tr class="text-center">
                          <td>
                            <button type="button" class="btn btn-danger btn-sm remove" data-type="debit-remove" data-toggle="tooltip" data-placement="top" data-original-title="Remove"> <i class="fas fa-minus-square"></i></button>
                          </td>
                          <td>
                            <select name="contraAccount[` + contraDebitAccount + `][debitId]" id="contraAccount_` + contraDebitAccount + `_debitId" class="form-control selectpicker">
                            <option value="">Select Please</option>
                            <?php if(!$transactional_accounts->isEmpty()): ?>
                            <?php $__currentLoopData = $transactional_accounts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $coa): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($coa->id); ?>"><?php echo e($coa->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                            </select>
                            <input type="hidden" name="contraAccount[` + contraDebitAccount + `][creditId]" value="0"/>
                          </td>
                          <td>
                          <input type="text" class="form-control debit-amount onInput" name="contraAccount[` + contraDebitAccount + `][debitAmount]" id="contraAccount_` + contraDebitAccount + `_debitAmount"/>
                          <input type="hidden" name="contraAccount[` + contraDebitAccount + `][creditAmount]" value="0"/>
                          </td>
                        </tr>`
                   $('#contra-voucher-debit-table tbody').append(html);
                   $('.selectpicker').selectpicker('refresh');
                   contraDebitAccount++;
               }else{
                   notification('error','You Can\'t Create Multiple Debit Field & Multiple Credit Field');
               }
           }else{
               if($('.debit-amount').length == 1) {
                   html = `
                        <tr class="text-center">
                           <td>
                             <input type="hidden" name="contraAccount[` + contraCreditAccount + `][debitAmount]" value="0"/>
                             <input type="text" class="form-control credit-amount onInput" name="contraAccount[` + contraCreditAccount + `][creditAmount]" id="contraAccount_` + contraCreditAccount + `_creditAmount"/>
                           </td>
                           <td>
                             <input type="hidden" name="contraAccount[` + contraCreditAccount + `][debitId]" value="0"/>
                             <select name="contraAccount[` + contraCreditAccount + `][creditId]" id="contraAccount_` + contraCreditAccount + `_creditId" class="form-control selectpicker">
                             <option value="">Select Please</option>
                             <?php if(!$transactional_accounts->isEmpty()): ?>
                             <?php $__currentLoopData = $transactional_accounts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $coa): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                             <option value="<?php echo e($coa->id); ?>"><?php echo e($coa->name); ?></option>
                             <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                             <?php endif; ?>
                             </select>
                           </td>
                           <td><button type="button" class="btn btn-danger btn-sm remove" data-type="credit-remove" data-toggle="tooltip" data-placement="top" data-original-title="Remove"> <i class="fas fa-minus-square"></i></button></td>
                        </tr>`
                   $('#contra-voucher-credit-table tbody').append(html);
                   $('.selectpicker').selectpicker('refresh');
                   contraCreditAccount++;
               }else{
                   notification('error','You Can\'t Create Multiple Debit Field & Multiple Credit Field');
               }
           }
        });
        $(document).on('click','.remove',function(){ $(this).parent().parent().remove(); calculation(); });
        $(document).on('input','.onInput',function(){  calculation(); });
        function calculation(){
            let debitAmount = 0;
            let creditAmount = 0;
          $('.debit-amount').each(function(){
              if($(this).val() == ''){
                  debitAmount += + 0;
              }else{
                  debitAmount += + $(this).val();
              }
          });
          $('.credit-amount').each(function(){
              if($(this).val() == ''){
                  creditAmount += + 0;
              }else{
                  creditAmount += + $(this).val();
              }
          });
          _('debit_grand_total').value = debitAmount;
          _('credit_grand_total').value = creditAmount;
        }
        function store_data(){
            let form = document.getElementById('contra-voucher-form');
            let formData = new FormData(form);
            let url = "<?php echo e(url('contra-voucher/store')); ?>";
            if(_('debit_grand_total').value > 0 &&  _('credit_grand_total').value > 0) {
                if(_('debit_grand_total').value == _('credit_grand_total').value) {
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: formData,
                        dataType: "JSON",
                        contentType: false,
                        processData: false,
                        cache: false,
                        beforeSend: function () {
                            $('#save-btn').addClass('spinner spinner-white spinner-right');
                        },
                        complete: function () {
                            $('#save-btn').removeClass('spinner spinner-white spinner-right');
                        },
                        success: function (data) {
                            $('#contra-voucher-form').find('.is-invalid').removeClass('is-invalid');
                            $('#contra-voucher-form').find('.error').remove();
                            if (data.status == false) {
                                $.each(data.errors, function (key, value) {
                                    var key = key.split('.').join('_');
                                    $('#contra-voucher-form input#' + key).addClass('is-invalid');
                                    $('#contra-voucher-form textarea#' + key).addClass('is-invalid');
                                    $('#contra-voucher-form select#' + key).parent().addClass('is-invalid');
                                    $('#contra-voucher-form #' + key).parent().append('<small class="error text-danger">' + value + '</small>');
                                });
                            } else {
                                notification(data.status, data.message);
                                if (data.status == 'success') {
                                    window.location.replace("<?php echo e(url('contra-voucher')); ?>");
                                }
                            }
                        },
                        error: function (xhr, ajaxOption, thrownError) {
                            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                        }
                    });
                }else{
                    notification('error','<?php echo e(__('file.Debit Total & Credit Total Must Be Equal')); ?>');
                }
            }else{
                notification('error','<?php echo e(__('file.Debit Total & Credit Total Amount Must Greater Than 0')); ?>');
            }
        }
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Account\Resources/views/contra-voucher/create.blade.php ENDPATH**/ ?>