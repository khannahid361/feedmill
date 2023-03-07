<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<link href="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.css')); ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
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
                    <?php if(permission('employee-add')): ?>
                    <a href="<?php echo e(route('employee.add')); ?>" class="btn btn-primary btn-sm font-weight-bolder">
                        <i class="fas fa-plus-circle"></i> Add New
                    </a>
                    <?php endif; ?>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Employee ID','name' => 'employee_id','col' => 'col-md-3','placeholder' => 'Enter employee id']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Employee ID','name' => 'employee_id','col' => 'col-md-3','placeholder' => 'Enter employee id']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Name','name' => 'name','col' => 'col-md-3','placeholder' => 'Enter name']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Name','name' => 'name','col' => 'col-md-3','placeholder' => 'Enter name']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Phone No.','name' => 'phone','col' => 'col-md-3','placeholder' => 'Enter phone number']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Phone No.','name' => 'phone','col' => 'col-md-3','placeholder' => 'Enter phone number']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Email','name' => 'email','col' => 'col-md-3','placeholder' => 'Enter email']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Email','name' => 'email','col' => 'col-md-3','placeholder' => 'Enter email']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Department','name' => 'department_id','col' => 'col-md-3','onchange' => 'getDivisionList(this.value)','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Department','name' => 'department_id','col' => 'col-md-3','onchange' => 'getDivisionList(this.value)','class' => 'selectpicker']); ?>
                            <?php if(!$departments->isEmpty()): ?>
                            <?php $__currentLoopData = $departments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $department): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($department->id); ?>"><?php echo e($department->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Division','name' => 'division_id','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Division','name' => 'division_id','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <?php if(!$divisions->isEmpty()): ?>
                            <?php $__currentLoopData = $divisions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $division): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($division->id); ?>" <?php if(isset($employee)): ?> <?php echo e(($employee->division_id == $division->id) ? 'selected' : ''); ?> <?php endif; ?>><?php echo e($division->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Designation','name' => 'designation_id','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Designation','name' => 'designation_id','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <?php if(!$designations->isEmpty()): ?>
                            <?php $__currentLoopData = $designations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $designation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($designation->id); ?>"><?php echo e($designation->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Supervisor Name','name' => 'supervisor_id','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Supervisor Name','name' => 'supervisor_id','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <option value="0">Self</option>
                            <?php if(!$employees->isEmpty()): ?>
                            <?php $__currentLoopData = $employees; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $employee): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($employee->id); ?>"><?php echo e($employee->name.' - '.$employee->employee_id); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Job Status','name' => 'job_status','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Job Status','name' => 'job_status','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <?php $__currentLoopData = JOB_STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Duty Type','name' => 'duty_type','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Duty Type','name' => 'duty_type','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <?php $__currentLoopData = DUTY_TYPE; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Status','name' => 'status','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Status','name' => 'status','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <option value="1">Active</option>
                            <option value="2">Inactive</option>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <div class="col-md-3">
                            <div style="margin-top:28px;">
                                <div style="margin-top:28px;">
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>
                                    <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>
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
                            <div class="table-responsive">
                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead class="bg-primary">
                                        <tr>
                                            <?php if(permission('employee-bulk-delete')): ?>
                                            <th>
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="select_all" onchange="select_all()">
                                                    <label class="custom-control-label" for="select_all"></label>
                                                </div>
                                            </th>
                                            <?php endif; ?>
                                            <th>Sl</th>
                                            <th>Photo</th>
                                            <th>Employee ID</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>NID NO</th>
                                            <th>Desgination</th>
                                            <th>Department</th>
                                            <th>Division</th>
                                            <th>Supervisor</th>
                                            <th>Salary</th>
                                            <th>Job Status</th>
                                            <th>Duty Type</th>
                                            <th>Blood Group</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end: Datatable-->
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>

<?php echo $__env->make('hrm::employee.modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->make('hrm::employee.benifitsmodal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.js')); ?>" type="text/javascript"></script>
<script src="<?php echo e(asset('js/moment.js')); ?>"></script>
<script src="<?php echo e(asset('js/bootstrap-datetimepicker.min.js')); ?>"></script>
<script>
    var table;
    $(document).ready(function() {
        $('.date').datetimepicker({
            format: 'YYYY-MM-DD',
            ignoreReadonly: true
        });
        table = $('#dataTable').DataTable({
            "processing": true, //Feature control the processing indicator
            "serverSide": true, //Feature control DataTable server side processing mode
            "order": [], //Initial no order
            "responsive": false, //Make table responsive in mobile device
            "bInfo": true, //TO show the total number of data
            "bFilter": false, //For datatable default search box show/hide
            "lengthMenu": [
                [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
                [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
            ],
            "pageLength": 25, //number of data show per page
            "language": {
                processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                emptyTable: '<strong class="text-danger">No Data Found</strong>',
                infoEmpty: '',
                zeroRecords: '<strong class="text-danger">No Data Found</strong>'
            },
            "ajax": {
                "url": "<?php echo e(route('employee.datatable.data')); ?>",
                "type": "POST",
                "data": function(data) {
                    data.employee_id = $("#form-filter #employee_id").val();
                    data.name = $("#form-filter #name").val();
                    data.phone = $("#form-filter #phone").val();
                    data.email = $("#form-filter #email").val();
                    data.warehouse_id = $("#form-filter #warehouse_id option:selected").val();
                    data.department_id = $("#form-filter #department_id option:selected").val();
                    data.division_id = $("#form-filter #division_id option:selected").val();
                    data.designation_id = $("#form-filter #designation_id option:selected").val();
                    data.supervisor_id = $("#form-filter #supervisor_id option:selected").val();
                    data.status = $("#form-filter #status").val();
                    data._token = _token;
                }
            },
            "columnDefs": [{
                    <?php if(permission('employee-bulk-delete')): ?>
                    "targets": [0, 17],
                    <?php else: ?> "targets": [16],
                    <?php endif; ?>

                    "orderable": false,
                    "className": "text-center"
                },
                {
                    <?php if(permission('employee-bulk-delete')): ?>
                    "targets": [1, 2, 3, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16],
                    <?php else: ?> "targets": [0, 1, 2, 4, 6, 7, 8, 9, 10, 12, 13, 14, 15],
                    <?php endif; ?> "className": "text-center"
                },
                {
                    <?php if(permission('employee-bulk-delete')): ?>
                    "targets": [12],
                    <?php else: ?> "targets": [11],
                    <?php endif; ?> "className": "text-right"
                }
            ],
            "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",

            "buttons": [
                <?php if(permission('employee-report')): ?> {
                    'extend': 'colvis',
                    'className': 'btn btn-secondary btn-sm text-white',
                    'text': 'Column',
                    'columns': ':gt(0)'
                },
                {
                    "extend": 'print',
                    'text': 'Print',
                    'className': 'btn btn-secondary btn-sm text-white',
                    "title": "<?php echo e($page_title); ?> List",
                    "orientation": "landscape", //portrait
                    "pageSize": "A4", //A3,A5,A6,legal,letter
                    "exportOptions": {
                        <?php if(permission('employee-bulk-delete')): ?>
                        columns: ':visible:not(:eq(0),:eq(17))'
                        <?php else: ?>
                        columns: ':visible:not(:eq(16))'
                        <?php endif; ?>
                    },
                    customize: function(win) {
                        $(win.document.body).addClass('bg-white');
                        $(win.document.body).find('table thead').css({
                            'background': '#034d97'
                        });
                        $(win.document.body).find('table tfoot tr').css({
                            'background-color': '#034d97'
                        });
                        $(win.document.body).find('h1').css('text-align', 'center');
                        $(win.document.body).find('h1').css('font-size', '15px');
                        $(win.document.body).find('table').css('font-size', 'inherit');
                    },
                },
                {
                    "extend": 'csv',
                    'text': 'CSV',
                    'className': 'btn btn-secondary btn-sm text-white',
                    "title": "<?php echo e($page_title); ?> List",
                    "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>-list",
                    "exportOptions": {
                        <?php if(permission('employee-bulk-delete')): ?>
                        columns: ':visible:not(:eq(0),:eq(17))'
                        <?php else: ?>
                        columns: ':visible:not(:eq(16))'
                        <?php endif; ?>
                    },
                },
                {
                    "extend": 'excel',
                    'text': 'Excel',
                    'className': 'btn btn-secondary btn-sm text-white',
                    "title": "<?php echo e($page_title); ?> List",
                    "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>-list",
                    "exportOptions": {
                        <?php if(permission('employee-bulk-delete')): ?>
                        columns: ':visible:not(:eq(0),:eq(17))'
                        <?php else: ?>
                        columns: ':visible:not(:eq(16))'
                        <?php endif; ?>
                    },
                },
                {
                    "extend": 'pdf',
                    'text': 'PDF',
                    'className': 'btn btn-secondary btn-sm text-white',
                    "title": "<?php echo e($page_title); ?> List",
                    "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>-list",
                    "orientation": "landscape", //portrait
                    "pageSize": "A4", //A3,A5,A6,legal,letter
                    "exportOptions": {
                        <?php if(permission('employee-bulk-delete')): ?>
                        columns: ':visible:not(:eq(0),:eq(17))'
                        <?php else: ?>
                        columns: ':visible:not(:eq(16))'
                        <?php endif; ?>
                    },
                    customize: function(doc) {
                        doc.defaultStyle.fontSize = 7; //<-- set fontsize to 16 instead of 10
                        doc.styles.tableHeader.fontSize = 7;
                        doc.pageMargins = [5, 5, 5, 5];
                    }
                },
                <?php endif; ?>
                <?php if(permission('employee-bulk-delete')): ?> {
                    'className': 'btn btn-danger btn-sm delete_btn d-none text-white',
                    'text': 'Delete',
                    action: function(e, dt, node, config) {
                        multi_delete();
                    }
                },
                <?php endif; ?>

                // <?php if(permission('employee-benifit-setup')): ?> {
                //     'className': 'btn btn-success btn-sm delete_btn d-none text-white',
                //     'text': 'Employee Benifit Set',
                //     action: function(e, dt, node, config) {
                //         //showing_shift_model();
                //         showFormModalForBenifits('Employee Benifit', 'Save');
                //     }
                // },
                // <?php endif; ?>

                <?php if(permission('employee-shift-change')): ?> {
                    'className': 'btn btn-info btn-sm delete_btn d-none text-white',
                    'text': 'Shift Change',
                    action: function(e, dt, node, config) {
                        //showing_shift_model();
                        showFormModal('Employee Shift Changing', 'Save');
                    }
                }
                <?php endif; ?>
            ],
        });

        $('#btn-filter').click(function() {
            table.ajax.reload();
        });

        $('#btn-reset').click(function() {
            $('#form-filter')[0].reset();
            $('#form-filter .selectpicker').selectpicker('refresh');
            table.ajax.reload();
        });

        $(document).on('click', '.delete_data', function() {
            let id = $(this).data('id');
            let name = $(this).data('name');
            let row = table.row($(this).parent('tr'));
            let url = "<?php echo e(route('employee.delete')); ?>";
            delete_data(id, url, table, row, name);
        });

        function multi_delete() {
            let ids = [];
            let rows;
            $('.select_data:checked').each(function() {
                ids.push($(this).val());
                rows = table.rows($('.select_data:checked').parents('tr'));
            });
            if (ids.length == 0) {
                Swal.fire({
                    type: 'error',
                    title: 'Error',
                    text: 'Please checked at least one row of table!',
                    icon: 'warning',
                });
            } else {
                let url = "<?php echo e(route('employee.bulk.delete')); ?>";
                bulk_delete(ids, url, table, rows);
            }
        }

        $(document).on('click', '#save-btn', function() {
            let ids = [];
            let rows;
            let start_date = $('#start_date').val();
            let end_date = $('#start_date').val();
            let shift_id = $('#shift_id').val();
            $('.select_data:checked').each(function() {
                ids.push($(this).val());
                rows = table.rows($('.select_data:checked').parents('tr'));
            });
            if (ids.length == 0) {
                Swal.fire({
                    type: 'error',
                    title: 'Error',
                    text: 'Please checked at least one row of table!',
                    icon: 'warning',
                });
            } else {
                let url = "<?php echo e(route('employee.change.shift')); ?>";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        ids: ids,
                        start_date: start_date,
                        end_date: end_date,
                        shift_id: shift_id,
                        _token: _token
                    },
                    dataType: "JSON",
                }).done(function(response) {

                    if (response.status == "success") {
                        Swal.fire("Saved", response.message, "success").then(function() {

                            table.rows(rows).remove().draw(false);
                            $('#select_all').prop('checked', false);
                            $('.delete_btn').addClass('d-none');
                            $('#store_or_update_modal').modal('hide');
                        });
                    }
                    if (response.status == "error") {
                        Swal.fire('Oops...', response.message, "error");
                    }
                });
            }
        });
        $(document).on('click', '#save-btn-benifit', function() {
            let ids = [];
            let benifit_ids = [];
            let rows;
            $('.select_data:checked').each(function() {
                ids.push($(this).val());
                rows = table.rows($('.select_data:checked').parents('tr'));
            });
            $('.benifits_checked:checked').each(function() {
                benifit_ids.push($(this).val());
            });
            if (ids.length == 0) {
                Swal.fire({
                    type: 'error',
                    title: 'Error',
                    text: 'Please checked at least one row of table!',
                    icon: 'warning',
                });
            } else {
                let url = "<?php echo e(route('employee.setup.allowance.deduction')); ?>";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        ids: ids,
                        benifit_ids: benifit_ids,
                        _token: _token
                    },
                    dataType: "JSON",
                }).done(function(response) {

                    if (response.status == "success") {
                        Swal.fire("Saved", response.message, "success").then(function() {

                            table.rows(rows).remove().draw(false);
                            $('#select_all').prop('checked', false);
                            $('.delete_btn').addClass('d-none');
                            $('#store_or_update_modal_benifit').modal('hide');
                        });
                    }
                    if (response.status == "error") {
                        Swal.fire('Oops...', response.message, "error");
                    }
                });
            }
        });

        $(document).on('click', '.change_status', function() {
            let id = $(this).data('id');
            let name = $(this).data('name');
            let status = $(this).data('status');
            let row = table.row($(this).parent('tr'));
            let url = "<?php echo e(route('employee.change.status')); ?>";
            change_status(id, url, table, row, name, status);
        });

        function showing_shift_model() {
            $('#store_or_update_modal').show();
        }


    });

    function showFormModalForBenifits(modal_title, btn_text) {
        //$('#store_or_update_modal_benifit')[0].reset();
        $('#store_or_update_modal_benifit #update_id').val('');
        $('#store_or_update_modal_benifit').find('.is-invalid').removeClass('is-invalid');
        $('#store_or_update_modal_benifit').find('.error').remove();
        $('#store_or_update_modal_benifit .selectpicker').selectpicker('refresh');
        $('#store_or_update_modal_benifit table tbody').find("tr:gt(0)").remove();

        $('#store_or_update_modal_benifit').modal({
            keyboard: false,
            backdrop: 'static',
        });
        $('#store_or_update_modal .modal-title').html('<i class="fas fa-plus-square text-white"></i> ' + modal_title);
        $('#store_or_update_modal #save-btn').text(btn_text);
    }

    function getDivisionList(department_id) {
        $.ajax({
            url: "<?php echo e(url('department-id-wise-division-list')); ?>/" + department_id,
            type: "GET",
            dataType: "JSON",
            success: function(data) {
                html = `<option value="">Select Please</option>`;
                $.each(data, function(key, value) {
                    html += '<option value="' + key + '">' + value + '</option>';
                });
                $('#division_id').empty();
                $('#division_id').append(html);
                $('.selectpicker').selectpicker('refresh');
            },
        });
    }
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/employee/index.blade.php ENDPATH**/ ?>