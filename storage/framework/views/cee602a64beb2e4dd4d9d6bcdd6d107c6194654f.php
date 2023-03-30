<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>

    <div class="d-flex flex-column-fluid" style="background: #fff;">
        <div class="container-fluid" >
            <form id="store_or_update_form" method="post">
                <?php echo csrf_field(); ?>
                <div class="card card-custom" style="margin-top: -24px;border-top: 4px solid #00c0ef;">
                    <div class="card-body" style="border: 2px solid #eaf2f2;">
                        <!--begin: Datatable-->
                        <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="storeData()"><i class="fas fa-money-bill"></i><?php echo e(__('file.PAYMENT SUBMIT')); ?></button>
                                        <a href="<?php echo e(route('labourSalaryPayment')); ?>"><button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><?php echo e(__('file.BACK')); ?></button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card card-custom gutter-b" >
                    <h3 style="padding: 19px 9px;text-align: center;">Payment Month: <?php echo e(date('F-Y', strtotime($payment_month))); ?></h3>
                    <div class="col-sm-12">
                        <div class="row">
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => ''.e(__('file.Payment Method')).'','name' => 'payment_type','required' => 'required','col' => 'col-md-6','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Payment Method')).'','name' => 'payment_type','required' => 'required','col' => 'col-md-6','class' => 'selectpicker']); ?>
                                <option value="1"><?php echo e(__('Bank Account')); ?></option>
                                <option value="2"><?php echo e(__('bKash')); ?></option>
                                <option value="3"><?php echo e(__('Nagad')); ?></option>
                                <option value="4"><?php echo e(__('Hand Cash')); ?></option>
                             <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <div class="col-md-6 form-group required">
                                <label for="note"><?php echo e(__('file.Note')); ?></label>
                                <div class="input-group" >
                                    <input type="text" class="form-control"  name="note" id="note" required="required"  value="" placeholder="Payment Note">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <!--begin: Datatable-->
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12" style="margin-top: -2%;">
                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead class="bg-primary">
                                        <tr>
                                            <th class="text-center" rowspan="5"><?php echo e(__('SL')); ?></th>
                                            <th class="text-center" rowspan="5"><?php echo e(__('Labour ID')); ?></th>
                                            <th class="text-center" rowspan="5"><?php echo e(__('Labour Name')); ?></th>
                                            <th class="text-center" colspan="7"><?php echo e(__('Total Gross Salary')); ?></th>
                                            <th class="text-center" rowspan="3"><?php echo e(__('Total')); ?></th>
                                            <th class="text-center" colspan="4"><?php echo e(__('Total Deductions')); ?></th>
                                            <th class="text-center" rowspan="3"><?php echo e(__('Total')); ?></th>
                                            <th class="text-center" rowspan="3"><?php echo e(__('Net Payable')); ?></th>
                                            <th class="text-center" rowspan="3"><?php echo e(__('Bonus')); ?></th>
                                            <th class="text-center" rowspan="3"><?php echo e(__('Payment')); ?></th>
                                        </tr>
                                        <tr>
                                            <th rowspan="2">Basic Wages</th>
                                            <th rowspan="2">Daily Wages</th>
                                            <th rowspan="2">Wages Per Hour</th>
                                            <th rowspan="2">Working Days</th>
                                            <th colspan="2">Overtime</th>
                                            <th rowspan="2">Others</th>
                                            <th colspan="2">Absence</th>
                                            <th rowspan="2">Wages Advance</th>
                                            <th rowspan="2">Others</th>
                                        </tr>
                                        <tr>
                                            <th>Hour</th>
                                            <th>Taka</th>
                                            <th>Hour</th>
                                            <th>Taka</th>
                                        </tr>
                                        <tr>
                                            <th>1</th>
                                            <th>2</th>
                                            <th>3</th>
                                            <th>4</th>
                                            <th>5</th>
                                            <th>6</th>
                                            <th>7</th>
                                            <th>8</th>
                                            <th>9</th>
                                            <th>10</th>
                                            <th>11</th>
                                            <th>12</th>
                                            <th>13</th>
                                            <th>14</th>
                                            <th>15</th>
                                            <th>16</th>
                                        </tr>
                                        <tr>
                                            <th></th>
                                            <th>(1/<?php echo e($total_days); ?>)</th>
                                            <th>(2/8)</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php $__currentLoopData = $salary; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php
                                            $allowances         = \Modules\HRM\Entities\Allowances::where('type',2)->where('status',1)->where('allowances_month',$payment_month)->where('employee_id',$row->id)->get();
                                            $allowance          = $allowances->SUM('allowances_amount');
                                            $deducts            = \Modules\HRM\Entities\Deduction::where('type',2)->where('status',1)->where('deduction_month',$payment_month)->where('employee_id',$row->id)->get();
                                            $deduct             = $deducts->SUM('deduction_amount');
                                            $salary_advances    = \Modules\HRM\Entities\LabourAdvance::where('advance_month',$payment_month)->where('status',1)->where('labour_id',$row->id)->get();
                                            $salary_advance     = $salary_advances->SUM('advance_amount');
                                            $bonus_amount       = $bonus ? ($row->basic_salary /100) * $bonus : 0;
                                        ?>
                                        <tr>
                                            <input type="hidden" name="labour_id[]" value="<?php echo e($row->id); ?>">
                                            <input type="hidden" name="basic_salary[]" value="<?php echo e($row->basic_salary); ?>">

                                            <input type="hidden" name="total_working_days[]" value="">
                                            <input type="hidden" name="avg_overtime_hour[]" value="">
                                            <input type="hidden" name="overtime_amount[]" value="">

                                            <input type="hidden" name="total_gross_salary[]" value="<?php echo e($row->basic_salary + $allowance); ?>">
                                            <input type="hidden" name="avg_absence_hour[]" value="">
                                            <input type="hidden" name="absence_amount[]" value="">

                                            <input type="hidden" name="salary_advance[]" value="<?php echo e($salary_advance); ?>">
                                            <input type="hidden" name="other_deduction[]" value="<?php echo e($deduct); ?>">
                                            <input type="hidden" name="total_deduction[]" value="<?php echo e($deduct); ?>">
                                            <input type="hidden" name="net_payable[]" value="<?php echo e((($row->basic_salary + $allowance) - $deduct)- $salary_advance); ?>">
                                            <input type="hidden" name="bonus[]" value="<?php echo e($bonus_amount); ?>">
                                            <input type="hidden" name="payable_salary[]" value="<?php echo e(((($row->basic_salary + $allowance) - $deduct) + $bonus_amount )- $salary_advance); ?>">
                                            <input type="hidden" name="payment_month[]" value="<?php echo e($payment_month); ?>">



                                            <td><?php echo e($key+1); ?></td>
                                            <td><?php echo e($row->name); ?></td>
                                            <td><?php echo e($row->labour_id); ?></td>
                                            <td class="text-right"><?php echo e($row->basic_salary); ?>/-TK</td>
                                            <td class="text-right"><?php echo e(number_format($row->basic_salary / $total_days,2)); ?>/-TK</td>
                                            <td class="text-right"><?php echo e(number_format(($row->basic_salary / $total_days)/8,2)); ?>/-TK</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td><?php echo e($allowance); ?>/-TK</td>
                                            <td><?php echo e($row->basic_salary + $allowance); ?>/-TK</td>
                                            <td></td>
                                            <td></td>
                                            <td class="text-right"><?php echo e($salary_advance); ?>/-TK</td>
                                            <td><?php echo e($deduct); ?>/-TK</td>
                                            <td><?php echo e($deduct); ?>/-TK</td>
                                            <td><?php echo e((($row->basic_salary + $allowance) - $deduct)- $salary_advance); ?>/-TK</td>
                                            <td><?php echo e($bonus_amount); ?>/-TK</td>
                                            <td style="width: 10%;">
                                                <input type="text" class="form-control payment_amount number-only text-right" name="payment_amount[]" value="<?php echo e(((($row->basic_salary + $allowance) - $deduct) + $bonus_amount )- $salary_advance); ?>">
                                            </td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--end: Datatable-->
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
            let form     = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url      = "<?php echo e(route('labourSalaryPayment.store.or.update')); ?>";
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
                        if (data.status == 'success') { window.location.replace("<?php echo e(route('labourSalaryPayment')); ?>"); }
                    }
                },
                error        : function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
            });
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/labour/salary-payment/create.blade.php ENDPATH**/ ?>