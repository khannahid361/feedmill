
<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
    <link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                    <div class="card-toolbar">
                        <?php if(permission('supplier-payment-access')): ?>
                            <a href="<?php echo e(route('supplier.payment')); ?>"  class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-circle-left"></i> Back</a>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <form id="supplier-payment-form" method="post">
                            <?php echo csrf_field(); ?>
                            <div class="row">
                                <div class="form-group col-md-3 required">
                                    <label for="voucher_no">Voucher No</label>
                                    <input type="text" class="form-control" name="voucher_no" id="voucher_no" value="<?php echo e($voucher_no); ?>" readonly />
                                </div>
                                <div class="form-group col-md-3 required">
                                    <label for="voucher_date">Date</label>
                                    <input type="text" class="form-control date" name="voucher_date" id="voucher_date" value="<?php echo e(date('Y-m-d')); ?>" readonly />
                                </div>
                                <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Supplier','name' => 'supplier_id','onchange' => 'dueAmount(this.value)','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Supplier','name' => 'supplier_id','onchange' => 'dueAmount(this.value)','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']); ?>
                                    <?php if(!$suppliers->isEmpty()): ?>
                                        <?php $__currentLoopData = $suppliers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $supplier): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($supplier->id); ?>"><?php echo e($supplier->name.' - '.$supplier->mobile); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php endif; ?>
                                 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                <div class="form-group col-md-3">
                                    <label for="due_amount">Due Amount</label>
                                    <input type="text" class="form-control"  id="due_amount" readonly />
                                </div>
                                <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Payment Type','name' => 'payment_type','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Payment Type','name' => 'payment_type','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                    <?php $__currentLoopData = PAYMENT_METHOD; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Account','name' => 'account_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Account','name' => 'account_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Amount','name' => 'amount','required' => 'required','col' => 'col-md-4','placeholder' => '0.00']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Amount','name' => 'amount','required' => 'required','col' => 'col-md-4','placeholder' => '0.00']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
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
                                <div class="form-group col-md-12 text-center">
                                    <button type="button" class="btn btn-danger btn-sm mr-3"><i class="fas fa-sync-alt"></i> Reset</button>
                                    <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i> Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script src="<?php echo e(asset('js/moment.js')); ?>"></script>
    <script src="<?php echo e(asset('js/bootstrap-datetimepicker.min.js')); ?>"></script>
    <script>
        $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
        $(document).on('change', '#payment_type', function () {
            $.ajax({
                url: "<?php echo e(route('account.list')); ?>",
                type: "POST",
                data: { payment_method: $('#payment_type option:selected').val(),_token: _token},
                success: function (data) {
                    $('#supplier-payment-form #account_id').html('');
                    $('#supplier-payment-form #account_id').html(data);
                    $('#supplier-payment-form #account_id.selectpicker').selectpicker('refresh');
                },
                error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
            });
        });
        function dueAmount(supplier_id) {
            $.ajax({
                url: "<?php echo e(url('supplier/due-amount')); ?>/"+supplier_id,
                type: "GET",
                dataType: "JSON",
                success: function (data) {
                    data ? $('#due_amount').val(parseFloat(data).toFixed(2)) : $('#due_amount').val('0.00');
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
        function store_data(){
            let form = document.getElementById('supplier-payment-form');
            let formData = new FormData(form);
            let url = "<?php echo e(route('supplier.payment.store')); ?>";
            $.ajax({
                url        : url,
                type       : "POST",
                data       : formData,
                dataType   : "JSON",
                contentType: false,
                processData: false,
                cache      : false,
                beforeSend : function(){
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete   : function(){
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success    : function (data) {
                    $('#supplier-payment-form').find('.is-invalid').removeClass('is-invalid');
                    $('#supplier-payment-form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function (key, value) {
                            var key = key.split('.').join('_');
                            $('#supplier-payment-form input#' + key).addClass('is-invalid');
                            $('#supplier-payment-form textarea#' + key).addClass('is-invalid');
                            $('#supplier-payment-form select#' + key).parent().addClass('is-invalid');
                            $('#supplier-payment-form #' + key).parent().append(
                                '<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        notification(data.status, data.message);
                        window.location.replace("<?php echo e(url('supplier-payment')); ?>");
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
            });
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH H:\laragon\www\insaf\Modules/Account\Resources/views/supplier-payment/create.blade.php ENDPATH**/ ?>