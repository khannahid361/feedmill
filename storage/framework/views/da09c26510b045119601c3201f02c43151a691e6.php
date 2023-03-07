

<?php $__env->startSection('title', $page_title); ?>

<?php $__env->startPush('styles'); ?>
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<link href="css/pages/wizard/wizard-4.css" rel="stylesheet" type="text/css" />
<style>
    .wizard.wizard-4 .wizard-nav .wizard-steps {
        flex-direction: column;
    }

    .wizard.wizard-4 .wizard-nav .wizard-steps .wizard-step .wizard-wrapper {
        flex: 1;
        display: flex;
        align-items: center;
        flex-wrap: unset !important;
        color: #3F4254;
        padding: 2rem 2.5rem !important;
        height: 100px !important;
    }

    .wizard.wizard-4 .wizard-nav .wizard-steps .wizard-step {
        width: 100% !important;

    }
</style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <!--begin::Notice-->
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title">
                    <h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3>
                </div>
                <div class="card-toolbar">
                    <!--begin::Button-->
                    <a href="<?php echo e(route('leave.application')); ?>" class="btn btn-secondary btn-sm font-weight-bolder">
                        <i class="fas fa-arrow-circle-left"></i> Back
                    </a>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-body">
                <div class="wizard wizard-4" id="kt_wizard" data-wizard-state="first" data-wizard-clickable="true">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-custom card-shadowless rounded-top-0">
                                <div class="card-body p-0">
                                    <div class="row justify-content-center py-8 px-8 py-lg-15 px-lg-10">
                                        <div class="col-xl-12 col-xxl-12">
                                            <table id="dataTable" class="table table-bordered table-hover">
                                                <thead class="bg-primary">
                                                    <tr>
                                                        <th>Leave Name</th>
                                                        <th>Total</th>
                                                        <th>Used</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="show_all_leave_data">
                                                    <?php if(!$leaves->isEmpty()): ?>
                                                    <?php $__currentLoopData = $leaves; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $leave): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <tr>
                                                        <td><?php echo e($leave->name.'('.$leave->short_name.')'); ?></td>
                                                        <td><?php echo e($leave->number); ?></td>
                                                        <td id="userd_<?php echo $leave->id; ?>"></td>
                                                    </tr>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <?php endif; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-xl-12 col-xxl-12">
                                            <!--begin: Wizard Form-->
                                            <form class="form mt-0 mt-lg-10 fv-plugins-bootstrap fv-plugins-framework" id="store_or_update_form" method="POST">
                                                <?php echo csrf_field(); ?>
                                                <input type="hidden" name="update_id" id="update_id" value="<?php echo e(isset($leaveapplication) ? $leaveapplication->id : ''); ?>">
                                                <input type="hidden" name="leave_type" id="leave_type" value="<?php echo e(isset($leaveapplication) ? $leaveapplication->leave_type : ''); ?>">
                                                <div class="row">
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Employee','name' => 'employee_id','onchange' => 'getTotalLeaveTakenList(this.value)','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Employee','name' => 'employee_id','onchange' => 'getTotalLeaveTakenList(this.value)','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                                        <?php if(!$employees->isEmpty()): ?>
                                                        <?php $__currentLoopData = $employees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($employee->id); ?>" <?php if(isset($leaveapplication)): ?> <?php echo e(($leaveapplication->employee_id == $employee->id) ? 'selected' : ''); ?> <?php endif; ?>>
                                                            <?php echo e($employee->name); ?>

                                                        </option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                        <?php endif; ?>
                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Alternative Employee','name' => 'alternative_employee','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Alternative Employee','name' => 'alternative_employee','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                                        <?php if(!$employees->isEmpty()): ?>
                                                        <?php $__currentLoopData = $employees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employeee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($employeee->id); ?>" <?php if(isset($leaveapplication)): ?> <?php echo e(($leaveapplication->alternative_employee == $employeee->id) ? 'selected' : ''); ?> <?php endif; ?>>
                                                            <?php echo e($employeee->name); ?>

                                                        </option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                        <?php endif; ?>
                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Leave','name' => 'leave_id','onchange' => 'getLeaveType(this.value)','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Leave','name' => 'leave_id','onchange' => 'getLeaveType(this.value)','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                                        <?php if(!$leaves->isEmpty()): ?>
                                                        <?php $__currentLoopData = $leaves; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $leave): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($leave->id); ?>" <?php if(isset($leaveapplication)): ?> <?php echo e(($leaveapplication->leave_id == $leave->id) ? 'selected' : ''); ?> <?php endif; ?>>
                                                            <?php echo e($leave->name); ?>

                                                        </option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                        <?php endif; ?>
                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Start Date','name' => 'start_date','required' => 'required','value' => ''.e(isset($leaveapplication) ? $leaveapplication->start_date : '').'','col' => 'col-md-4','class' => 'date']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Start Date','name' => 'start_date','required' => 'required','value' => ''.e(isset($leaveapplication) ? $leaveapplication->start_date : '').'','col' => 'col-md-4','class' => 'date']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'End Date','name' => 'end_date','required' => 'required','value' => ''.e(isset($leaveapplication) ? $leaveapplication->end_date : '').'','col' => 'col-md-4','class' => 'date']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'End Date','name' => 'end_date','required' => 'required','value' => ''.e(isset($leaveapplication) ? $leaveapplication->end_date : '').'','col' => 'col-md-4','class' => 'date']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['type' => 'text','labelName' => 'Leave Number','name' => 'number_leave','value' => ''.e(isset($leaveapplication) ? $leaveapplication->number_leave : '').'','required' => 'required','col' => 'col-md-4','property' => 'readonly']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['type' => 'text','labelName' => 'Leave Number','name' => 'number_leave','value' => ''.e(isset($leaveapplication) ? $leaveapplication->number_leave : '').'','required' => 'required','col' => 'col-md-4','property' => 'readonly']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Employee Location','name' => 'employee_location','value' => ''.e(isset($leaveapplication) ? $leaveapplication->employee_location : '').'','col' => 'col-md-4']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Employee Location','name' => 'employee_location','value' => ''.e(isset($leaveapplication) ? $leaveapplication->employee_location : '').'','col' => 'col-md-4']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Submission','name' => 'submission','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Submission','name' => 'submission','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                                        <?php $__currentLoopData = $submissions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $items): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($key); ?>" <?php if(isset($leaveapplication)): ?> <?php echo e(($leaveapplication->submission == $key) ? 'selected' : ''); ?> <?php endif; ?>><?php echo e($items); ?></option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Deletable','name' => 'deletable','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Deletable','name' => 'deletable','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                                        <?php $__currentLoopData = $deletable; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($key); ?>" <?php if(isset($leaveapplication)): ?> <?php echo e(($leaveapplication->deletable == $key) ? 'selected' : ''); ?> <?php endif; ?>><?php echo e($item); ?></option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Purpose','name' => 'purpose','value' => ''.e(isset($leaveapplication) ? $leaveapplication->purpose : '').'','row' => '8','col' => 'col-md-12','required' => 'required']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Purpose','name' => 'purpose','value' => ''.e(isset($leaveapplication) ? $leaveapplication->purpose : '').'','row' => '8','col' => 'col-md-12','required' => 'required']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                </div>
                                        </div>
                                        <div class="d-flex justify-content-between border-top mt-5 pt-10">

                                            <div>
                                                <button type="button" class="btn btn-primary btn-sm font-weight-bolder text-uppercase" id="save-btn" onclick="store_data()">Submit</button>
                                            </div>
                                        </div>

                                        </form>
                                        <!--end: Wizard Form-->
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </div>
    </div>
    <!--end::Card-->
</div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="js/moment.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script>
    $(document).ready(function() {
        $('.date').datetimepicker({
            format: 'YYYY-MM-DD',
            ignoreReadonly: true
        });
        
        $(document).on('focusout', '#end_date', function() {
            var edate = new Date($('#end_date').val());
            var sdate = new Date($('#start_date').val());
            
            days = (edate- sdate) / (1000 * 60 * 60 * 24);
            days=days+1;
            $("#number_leave").val(days);
        });
    });

    function store_data() {
        let form = document.getElementById('store_or_update_form');
        let formData = new FormData(form);
        let url = "<?php echo e(route('leave.application.store.or.update')); ?>";
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "JSON",
            contentType: false,
            processData: false,
            cache: false,
            beforeSend: function() {
                $('#save-btn').addClass('spinner spinner-white spinner-right');
            },
            complete: function() {
                $('#save-btn').removeClass('spinner spinner-white spinner-right');
            },
            success: function(data) {
                $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                $('#store_or_update_form').find('.error').remove();
                if (data.status == false) {
                    $.each(data.errors, function(key, value) {
                        var key = key.split('.').join('_');
                        $('#store_or_update_form input#' + key).addClass('is-invalid');
                        $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                        $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                        $('#store_or_update_form #' + key).parent().append(
                            '<small class="error text-danger">' + value + '</small>');

                    });
                } else {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        window.location.replace("<?php echo e(route('leave.application')); ?>");
                    }
                }

            },
            error: function(xhr, ajaxOption, thrownError) {
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    }

    function loadFile(event, target_id) {
        var output = document.getElementById(target_id);
        output.src = URL.createObjectURL(event.target.files[0]);
    };

    function getTotalLeaveTakenList(employee_id) {
        $.ajax({
            url: "<?php echo e(url('employee-id-wise-leave-list')); ?>/" + employee_id,
            type: "GET",
            dataType: "JSON",
            success: function(data) {
                var stuff = "";
                var sl = 1;
                $.each(data.list, function(key, val) {

                    stuff = stuff + "<tr class='" + val.id + "tr'>" +
                        "<td>" + val.name + "</td>" +
                        "<td>" + val.lnumber + "</td>" +
                        "<td>" + val.sumleave + "</td>" +
                        "</tr>";
                });

                $("#show_all_leave_data").html(stuff);
            },
        });
    }

    function getLeaveType(leave_id) {
        $.ajax({
            url: "<?php echo e(url('leave-type-wise-leave')); ?>/" + leave_id,
            type: "GET",
            dataType: "JSON",
            success: function(data) {
                $('#leave_type').val(data);
            },
        });
    }

    /*****************************************
     * End :: Dynamic Experience Input Field *
     ******************************************/
</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/leave-application/form.blade.php ENDPATH**/ ?>