<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<style>

</style>
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>

<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <form action="<?php echo e(route("salaryPayment.salary.create")); ?>" method="get" class="col-md-12 px-0">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => ''.e(__('Employee Salary')).'','name' => 'employee_id','id' => 'employee_id','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('Employee Salary')).'','name' => 'employee_id','id' => 'employee_id','col' => 'col-md-4','class' => 'selectpicker']); ?>
                            <?php $__currentLoopData = $employee; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($row->employee->id); ?>"><?php echo e($row->employee->name); ?>--<?php echo e($row->employee->employee_id); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <div class="col-md-4 required">
                            <label for="salary_month" class="col-sm-12 control-label" style="padding-left: 0px;"><?php echo e(__('file.Salary Payment Month')); ?></label>
                            <input type="text" class="form-control" name="payment_month" id="datepicker" required placeholder="Select Salary Payment Month"/>
                        </div>
                        <div class="col-md-2">
                            <div style="margin-top:28px;">
                                <div style="margin-top:28px;">
                                    <button type="submit" class="btn btn-info btn-flat"><i class="icon fa fa-arrow-right"></i> <?php echo e(__('Payment')); ?></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => ''.e(__('file.Employee')).'','name' => 'employee_id','id' => 'employee_id','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Employee')).'','name' => 'employee_id','id' => 'employee_id','col' => 'col-md-4','class' => 'selectpicker']); ?>
                            <?php $__currentLoopData = $employee; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($row->employee->id); ?>"><?php echo e($row->employee->name); ?>--<?php echo e($row->employee->employee_id); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => ''.e(__('file.Salary Payment Month')).'','name' => 'payment_month','id' => 'payment_month','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Salary Payment Month')).'','name' => 'payment_month','id' => 'payment_month','col' => 'col-md-4','class' => 'selectpicker']); ?>
                            <?php $__currentLoopData = $salary_pay; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($row->payment_month); ?>"><?php echo e(date('F-Y', strtotime($row->payment_month))); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <div class="col-md-4">
                            <div style="margin-top:28px;">
                                <div style="margin-top:28px;">
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button"
                                    data-toggle="tooltip" data-theme="dark" title="<?php echo e(__('file.Reset')); ?>">
                                    <i class="fas fa-undo-alt"></i></button>

                                    <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button"
                                    data-toggle="tooltip" data-theme="dark" title="<?php echo e(__('file.Search')); ?>">
                                    <i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        <th><?php echo e(__('file.SL')); ?></th>
                                        <th><?php echo e(__('file.Employee Name')); ?></th>
                                        <th><?php echo e(__('file.Employee ID')); ?></th>
                                        <th><?php echo e(__('file.Salary Payment Month')); ?></th>
                                        <th><?php echo e(__('file.Payment Amount')); ?></th>
                                        <th><?php echo e(__('file.Payment Status')); ?></th>
                                        <th><?php echo e(__('file.Payment Note')); ?></th>
                                        <th><?php echo e(__('file.Payment Date')); ?></th>
                                        <th><?php echo e(__('file.Created By')); ?></th>
                                        <th><?php echo e(__('file.Action')); ?></th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!--end: Datatable-->
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
<script>
    var table;
    $(document).ready(function(){

        table = $('#dataTable').DataTable({
            "processing": true, //Feature control the processing indicator
            "serverSide": true, //Feature control DataTable server side processing mode
            "order": [], //Initial no order
            "responsive": true, //Make table responsive in mobile device
            "bInfo": true, //TO show the total number of data
            "bFilter": false, //For datatable default search box show/hide
            "lengthMenu": [
                [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
                [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
            ],
            "pageLength": 10000, //number of data show per page
            "language": {
                processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                emptyTable: '<strong class="text-danger">No Data Found</strong>',
                infoEmpty: '',
                zeroRecords: '<strong class="text-danger">No Data Found</strong>'
            },
            "ajax": {
                "url": "<?php echo e(route('salaryPayment.datatable.data')); ?>",
                "type": "POST",
                "data": function (data) {
                    data.employee_id    = $("#form-filter #employee_id").val();
                    data.payment_month  = $("#form-filter #payment_month").val();
                    data._token     = _token;
                }
            },
            "columnDefs": [{
                "targets"  : [0,1,2,3,4,5,6,7,8,9],
                "orderable": false,
                "className": "text-center"
            },
            ],
            "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",
        });

        $('#btn-filter').click(function () {
            table.ajax.reload();
        });

        $('#btn-reset').click(function () {
            $('#form-filter')[0].reset();
            table.ajax.reload();
        });

        $(document).on('click', '.delete_data', function () {
            let id          = $(this).data('id');
            let name        = $(this).data('name');
            let depart_code = $(this).data('depart_code');
            let row         = table.row($(this).parent('tr'));
            let url         = "<?php echo e(route('salaryPayment.delete')); ?>";
            delete_data(id, url, table, row, name,depart_code);
        });

    });
    // Month datepicker
    var dp=$("#datepicker").datepicker( {
        format: "yyyy-mm",
        startView: "months",
        minViewMode: "months"
    });
    </script>

<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/salary-payment/index.blade.php ENDPATH**/ ?>