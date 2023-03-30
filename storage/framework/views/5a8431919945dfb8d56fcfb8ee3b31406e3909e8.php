<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid" style="background: #fff;">
        <div class="container-fluid" >
            <form id="store_or_update_form" method="post">
                <?php echo csrf_field(); ?>
                <div class="card card-custom gutter-b" style="border-top: 4px solid #00c0ef;margin-top: -18px;">
                    <h3 style="padding: 2px 9px;">Salary Details</h3>
                </div>
                <div class="card card-custom" style="margin-top: -24px;">
                    <div class="card-body" style="border: 2px solid #eaf2f2;">
                        <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="row">
                                                    <input type="hidden" class="form-control"  name="update_id" id="update_id"  readonly value="<?php echo e($salary->id); ?>" >
                                                    <div class="col-md-6 form-group required">
                                                        <label for="title"><?php echo e(__('Employee Name')); ?></label>
                                                        <div class="input-group required" >
                                                            <input type="hidden" class="form-control"  name="employee_id" id="employee_id" required="required" readonly value="<?php echo e($salary->employee->id); ?>">
                                                            <input type="text" class="form-control"   readonly value="<?php echo e($salary->employee->name); ?>">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 form-group required">
                                                        <label for="title"><?php echo e(__('Employee ID')); ?></label>
                                                        <div class="input-group" >
                                                            <input type="text" class="form-control"  readonly value="<?php echo e($salary->employee->employee_id); ?>">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="row">
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => ''.e(__('file.Employee Type')).'','name' => 'employee_type','required' => 'required','col' => 'col-md-6','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Employee Type')).'','name' => 'employee_type','required' => 'required','col' => 'col-md-6','class' => 'selectpicker']); ?>
                                                        <option value="1"<?php echo e($salary->employee_type == 1 ? 'selected' : ''); ?>><?php echo e(__('Provision')); ?></option>
                                                        <option value="2"<?php echo e($salary->employee_type == 2 ? 'selected' : ''); ?>><?php echo e(__('Permanent')); ?></option>
                                                        <option value="3"<?php echo e($salary->employee_type == 3 ? 'selected' : ''); ?>><?php echo e(__('Full Time')); ?></option>
                                                        <option value="4"<?php echo e($salary->employee_type == 4 ? 'selected' : ''); ?>><?php echo e(__('Part Time')); ?></option>
                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <div class="col-md-6 form-group required">
                                                        <label for="salary"><?php echo e(__('file.Basic Salary')); ?></label>
                                                        <div class="input-group" >
                                                            <input type="text" class="form-control number-only"  name="basic_salary" id="basic_salary" required="required" value="<?php echo e($salary->basic_salary); ?>" placeholder="0.00">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="card card-custom gutter-b" style="border-top: 4px solid #00a65a;margin-top:2px;">
                            <h3 style="padding: 2px 9px;">Allowances</h3>
                        </div>
                        <div class="card card-custom" style="margin-top: -24px;">
                            <div class="card-body" style="border: 2px solid #eaf2f2;">
                                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-6 form-group ">
                                                                <label for="title"><?php echo e(__('file.House Rent Allowance')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type=text step=any class="form-control number-only"   name="house_rent_allowance" id="house_rent_allowance" placeholder="0.00" value="<?php echo e($salary->house_rent_allowance); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 form-group ">
                                                                <label for="title"><?php echo e(__('Medical Allowance')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control number-only"  name="medical_allowance" id="medical_allowance" placeholder="0.00" value="<?php echo e($salary->medical_allowance); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 form-group ">
                                                                <label for="title"><?php echo e(__('Transport Allowance')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control number-only"  name="transport_allowance" id="transport_allowance" placeholder="0.00" value="<?php echo e($salary->transport_allowance); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 form-group ">
                                                                <label for="title"><?php echo e(__('Mobile Allowance')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control number-only"  name="mobile_allowance" id="mobile_allowance" placeholder="0.00" value="<?php echo e($salary->mobile_allowance); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 form-group ">
                                                                <label for="title"><?php echo e(__('Other Allowance')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control number-only"  name="other_allowance" id="other_allowance" placeholder="0.00" value="<?php echo e($salary->other_allowance); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 form-group ">
                                                                <label for="title"><?php echo e(__('Provident Fund Contribution')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control number-only"  name="provident_fund_contribution" id="provident_fund_contribution" placeholder="0.00" value="<?php echo e($salary->provident_fund_contribution); ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card card-custom gutter-b" style="border-top: 4px solid #f39c12;margin-top:2px;">
                            <h3 style="padding: 2px 9px;">Deductions</h3>
                        </div>
                        <div class="card card-custom" style="margin-top: -24px;">
                            <div class="card-body" style="border: 2px solid #eaf2f2;">
                                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12 form-group ">
                                                                <label for="title"><?php echo e(__('Tax Deduction')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control number-only"  name="tax_deduction" id="tax_deduction" placeholder="0.00" value="<?php echo e($salary->tax_deduction); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12 form-group ">
                                                                <label for="title"><?php echo e(__('Provident Fund Deduction')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control number-only"  name="provident_fund_deduction" id="provident_fund_deduction" placeholder="0.00" value="<?php echo e($salary->provident_fund_deduction); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12 form-group ">
                                                                <label for="title"><?php echo e(__('Other Deduction')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control number-only"  name="other_deduction" id="other_deduction" placeholder="0.00" value="<?php echo e($salary->other_deduction); ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6" style="margin-top: 0px;">
                        <div class="card card-custom gutter-b" style="border-top: 4px solid #3c8dbc;margin-top:2px;">
                            <h3 style="padding: 2px 9px;">Provident Fund</h3>
                        </div>
                        <div class="card card-custom" style="margin-top: -24px;">
                            <div class="card-body" style="border: 2px solid #eaf2f2;">
                                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12 form-group ">
                                                                <label for="title"><?php echo e(__('Total Provident Fund')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control number-only"  name="total_provident_fund" id="total_provident_fund" readonly placeholder="0.00" value="<?php echo e($salary->total_provident_fund); ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6" style="margin-top: 0px;">
                        <div class="card card-custom gutter-b" style="border-top: 4px solid #dd4b39;margin-top:2px;">
                            <h3 style="padding: 2px 9px;">Total Salary Details</h3>
                        </div>
                        <div class="card card-custom" style="margin-top: -24px;">
                            <div class="card-body" style="border: 2px solid #eaf2f2;">
                                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="row">
                                                            <div class="col-md-12 form-group ">
                                                                <label for="title"><?php echo e(__('file.Gross Salary')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control" readonly name="gross_salary" id="gross_salary" placeholder="0.00" value="<?php echo e($salary->gross_salary); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12 form-group ">
                                                                <label for="title"><?php echo e(__('file.Total Deduction')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control" readonly name="total_deduction" id="total_deduction" placeholder="0.00" value="<?php echo e($salary->total_deduction); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12 form-group ">
                                                                <label for="title"><?php echo e(__('file.Net Payable')); ?></label>
                                                                <div class="input-group" >
                                                                    <input type="text" class="form-control" readonly  name="net_salary" id="net_salary" placeholder="0.00" value="<?php echo e($salary->net_salary); ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card card-custom" style="margin-top: -24px;">
                    <div class="card-body" style="border: 2px solid #eaf2f2;">
                        <!--begin: Datatable-->
                        <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger btn-sm mr-3" onclick="window.location.replace('<?php echo e(route("salary")); ?>');"><i class="fas fa-sync-alt"></i> Close</button>
                                        <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="storeData()"><i class="fas fa-save"></i><?php echo e(__('file.Save')); ?></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
    <script>
        var table;
        let i = 1;
        function _(x){
            return document.getElementById(x);
        }

        function storeData(){
            let form          = document.getElementById('store_or_update_form');
            let formData      = new FormData(form);
            let url           = "<?php echo e(route('salary.update')); ?>";
            $.ajax({
                url           : url,
                type          : "POST",
                data          : formData,
                dataType      : "JSON",
                contentType   : false,
                processData   : false,
                cache         : false,
                beforeSend    : function(){
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete      : function(){
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success       : function (data) {
                    $('#purchase_store_form').find('.is-invalid').removeClass('is-invalid');
                    $('#purchase_store_form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function (key, value) {
                            var key = key.split('.').join('_');
                            $('#store_or_update_form input#' + key).addClass('is-invalid');
                            $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                            $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                            $('#store_or_update_form #' + key).parent().append('<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        notification(data.status, data.message);
                        if (data.status == 'success') { window.location.replace("<?php echo e(route('salary')); ?>"); }
                    }
                },
                error        : function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
            });
        }
    </script>
    <script>
        var table;
        $(document).ready(function(){
            calculation();
        });

        //For Calculation
        $(document).on("keyup", "#store_or_update_form", function() {
            calculation();
        });
        function calculation() {
            var sum = 0;
            var basic_salary                = $("#basic_salary").val();
            var house_rent_allowance        = $("#house_rent_allowance").val();
            var medical_allowance           = $("#medical_allowance").val();
            var transport_allowance         = $("#transport_allowance").val();
            var mobile_allowance            = $("#mobile_allowance").val();
            var provident_fund_contribution = $("#provident_fund_contribution").val();
            var other_allowance             = $("#other_allowance").val();
            var tax_deduction               = $("#tax_deduction").val();
            var provident_fund_deduction    = $("#provident_fund_deduction").val();
            var other_deduction             = $("#other_deduction").val();

            var gross_salary    = (+basic_salary + +house_rent_allowance + +medical_allowance + +transport_allowance + +mobile_allowance + +other_allowance);

            var total_deduction = (+tax_deduction + +provident_fund_deduction + +other_deduction);

            $("#total_provident_fund").val(+provident_fund_contribution + +provident_fund_deduction);

            $("#gross_salary").val(gross_salary);
            $("#total_deduction").val(total_deduction);
            $("#net_salary").val(+gross_salary - +total_deduction);
        }
    </script>
    
    <script>
        $(function(){
            $('.number-only').keypress(function(e) {
                if(isNaN(this.value+""+String.fromCharCode(e.charCode))) return false;
            })
                .on("cut copy paste",function(e){
                    e.preventDefault();
                });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/salary/edit.blade.php ENDPATH**/ ?>