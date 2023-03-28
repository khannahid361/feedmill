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
            <form id="loan-form" method="post">
                <?php echo csrf_field(); ?>
                <div class="card card-custom">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="vendor_id">Loan Categories</label>
                                <select class="form-control selectpicker" id="loan_categories_id" name="loan_categories_id" data-live-search="true"  required="required">
                                    <option value="">Select Loan Categories</option>
                                    <?php $__currentLoopData = $loanCategories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($value->id); ?>"><?php echo e($value->name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="bank_id">Bank</label>
                                <select class="form-control selectpicker" id="bank_id" name="bank_id" data-live-search="true"  required="required">
                                    <option value="">Select Bank</option>
                                    <?php $__currentLoopData = $banks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($value->id); ?>"><?php echo e($value->bank_name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="reference_no"><?php echo e('Reference No'); ?></label>
                                <input type="text" class="form-control" id="reference_no" name="reference_no" placeholder="<?php echo e('Please Enter Reference No'); ?>"  required="required"/>
                            </div>
                            <div class="col-md-4"><br/>
                                <label for="loan_amount"><?php echo e('Loan Amount'); ?></label>
                                <input type="text" class="form-control input" id="loan_amount" name="loan_amount" data-type="loan_amount" placeholder="<?php echo e('Please Enter Loan Amount'); ?>"  required="required"/>
                            </div>
                            <div class="col-md-2"><br/>
                                <label for="loan_percentage_percent"><?php echo e('Loan Percentage(%)'); ?></label>
                                <input type="text" class="form-control input" id="loan_percentage_percent" name="loan_percentage_percent" data-type="loan_percentage_percent" placeholder="<?php echo e('Please Enter Loan Percentage'); ?>" required="required"/>
                            </div>
                            <div class="col-md-2"><br/>
                                <label for="loan_percentage_tk"><?php echo e('Loan Percentage(tk)'); ?></label>
                                <input type="text" class="form-control input" id="loan_percentage_tk" name="loan_percentage_tk" data-type="loan_percentage_tk" placeholder="<?php echo e('Please Enter Loan Percentage'); ?>" required="required"/>
                            </div>
                            <div class="col-md-4"><br/>
                                <label for="total_amount"><?php echo e('Total Amount'); ?></label>
                                <input type="text" class="form-control bg-primary text-white" id="total_amount" name="total_amount"  readonly/>
                            </div>
                            <div class="col-md-4"><br/>
                                <label for="processing_charge"><?php echo e('Processing Charge'); ?></label>
                                <input type="text" class="form-control" id="processing_charge" name="processing_charge" placeholder="<?php echo e('Please Enter Processing Charge'); ?>"/>
                            </div>
                            <div class="col-md-4"><br/>
                                <label for="misc_charge"><?php echo e('MISC Charge'); ?></label>
                                <input type="text" class="form-control" id="misc_charge" name="misc_charge" placeholder="<?php echo e('Please Enter MISC Charge'); ?>"/>
                            </div>
                            <div class="col-md-4"><br/>
                                <label for="apply_date"><?php echo e('Apply Date'); ?></label>
                                <input type="date" class="form-control" id="apply_date" name="apply_date" required="required"/>
                            </div>
                            <div class="col-md-4"><br/>
                                <label for="total_installment_month"><?php echo e('Total Installment Month'); ?></label>
                                <input type="text" class="form-control input" id="total_installment_month" name="total_installment_month" data-type="total_installment_month" placeholder="<?php echo e('Please Enter Total Installment Month'); ?>" required="required"/>
                            </div>
                            <div class="col-md-4"><br/>
                                <label for="monthly_installment"><?php echo e('Monthly Installment'); ?></label>
                                <input type="text" class="form-control bg-primary text-white" id="monthly_installment" name="monthly_installment" readonly/>
                            </div>
                            <div class="col-md-4"><br/>
                                <label for="document"><?php echo e('Document'); ?></label>
                                <input type="file" class="form-control" id="document" name="document"  required="required"/>
                            </div>
                            <div class="col-md-12"><br/>
                                <label for="note"><?php echo e('Note'); ?></label>
                                <textarea class="form-control" id="note" name="note" rows="6"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group col-md-12 pt-5 text-center">
                    <a class="btn btn-danger btn-sm mr-3" href="<?php echo e(route('loan.add')); ?>"><i class="fas fa-sync-alt"></i> Reset</a>
                    <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i> Save</button>
                </div>
            </form>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script>
        function _(x){
            return document.getElementById(x);
        }
        $(document).on('input','.input',function(){
            let type = $(this).data('type');
            if(type == 'loan_amount'){
                _('total_amount').value = + parseInt($(this).val()) + + ( parseInt($(this).val()) * parseInt(_('loan_percentage_percent').value)) / 100;
                _('loan_percentage_tk').value = ( parseInt($(this).val()) * parseInt(_('loan_percentage_percent').value)) / 100;
                _('monthly_installment').value = _('total_amount').value / _('total_installment_month').value;
            }else if(type == 'loan_percentage_percent'){
                if(_('loan_amount').value != ''){
                    _('total_amount').value = + parseInt(_('loan_amount').value) + + ( parseInt(_('loan_amount').value)) * parseInt($(this).val()) / 100;
                    _('loan_percentage_tk').value = ( parseInt(_('loan_amount').value)) * parseInt($(this).val()) / 100;
                    _('monthly_installment').value = _('total_amount').value / _('total_installment_month').value;
                }else{
                    notification('error','<?php echo e("Loan Amount Field Empty"); ?>');
                }
            }else if(type == 'loan_percentage_tk'){
                if(_('loan_amount').value != ''){
                    _('total_amount').value = + parseInt(_('loan_amount').value) + + parseInt($(this).val());
                    _('loan_percentage_percent').value = ( parseInt($(this).val()) * 100 / parseInt(_('loan_amount').value));
                    _('monthly_installment').value = _('total_amount').value / _('total_installment_month').value;
                }else{
                    notification('error','<?php echo e("Loan Amount Field Empty"); ?>');
                }
            }else if(type == 'total_installment_month'){
                if(_('total_amount').value != ''){
                    _('monthly_installment').value = _('total_amount').value / $(this).val();
                }else{
                    _('total_installment_month').value = '';
                    notification('error','<?php echo e("Total Amount Field Empty"); ?>');
                }
            }
        });
        function store_data(){
            let form     = document.getElementById('loan-form');
            let formData = new FormData(form);
            let url      = "<?php echo e(url('loan/store')); ?>";
            $.ajax({
                url         : url,
                type        : "POST",
                data        : formData,
                dataType    : "JSON",
                contentType : false,
                processData : false,
                cache       : false,
                beforeSend  : function () {
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete    : function () {
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success     : function (data) {
                    $('#loan-form').find('.is-invalid').removeClass('is-invalid');
                    $('#loan-form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function (key, value) {
                            var key = key.split('.').join('_');
                            $('#loan-form input#' + key).addClass('is-invalid');
                            $('#loan-form textarea#' + key).addClass('is-invalid');
                            $('#loan-form select#' + key).parent().addClass('is-invalid');
                            $('#loan-form #' + key).parent().append('<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        notification(data.status, data.message);
                        if (data.status == 'success') { window.location.replace("<?php echo e(url('loan')); ?>");  }
                    }
                },
                error      : function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
            });
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Loan\Resources/views/loan/create.blade.php ENDPATH**/ ?>