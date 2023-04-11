<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
    <link href="plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
    <link href="css/daterangepicker.min.css" rel="stylesheet" type="text/css" />
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
                </div>
            </div>
            <!--end::Notice-->
            <!--begin::Card-->
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Batch No.','name' => 'batch_no','col' => 'col-md-3']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Batch No.','name' => 'batch_no','col' => 'col-md-3']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <div class="form-group col-md-3">
                                <label for="name">Choose Date</label>
                                <div class="input-group">
                                    <input type="text" class="form-control daterangepicker-filed">
                                    <input type="hidden" id="start_date" name="start_date">
                                    <input type="hidden" id="end_date" name="end_date">
                                </div>
                            </div>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Warehouse','name' => 'warehouse_id','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Warehouse','name' => 'warehouse_id','col' => 'col-md-3','class' => 'selectpicker']); ?>
                                <?php if(!$warehouses->isEmpty()): ?>
                                    <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($id); ?>"><?php echo e($name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
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
                                <?php $__currentLoopData = APPROVE_STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                             <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Production Status','name' => 'production_status','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Production Status','name' => 'production_status','col' => 'col-md-3','class' => 'selectpicker']); ?>
                                <?php $__currentLoopData = PRODUCTION_STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                             <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                            <div class="col-md-9">
                                <div style="margin-top:28px;">
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right"
                                        type="button" data-toggle="tooltip" data-theme="dark" title="Reset">
                                        <i class="fas fa-undo-alt"></i></button>

                                    <button id="btn-filter"
                                        class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button"
                                        data-toggle="tooltip" data-theme="dark" title="Search">
                                        <i class="fas fa-search"></i></button>
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
                                            <th>Sl</th>
                                            <th>Batch No.</th>
                                            <th>Product Name</th>
                                            <th>Warehouse</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Expire In</th>
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
    <?php echo $__env->make('production::production.status-modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
    <script src="plugins/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
    <script src="js/moment.js"></script>
    <script src="js/knockout-3.4.2.js"></script>
    <script src="js/daterangepicker.min.js"></script>
    <script>
        var table;
        $(document).ready(function() {
            $('.daterangepicker-filed').daterangepicker({
                callback: function(startDate, endDate, period) {
                    var start_date = startDate.format('YYYY-MM-DD');
                    var end_date = endDate.format('YYYY-MM-DD');
                    var title = start_date + ' To ' + end_date;
                    $(this).val(title);
                    $('input[name="start_date"]').val(start_date);
                    $('input[name="end_date"]').val(end_date);
                }
            });
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
                "pageLength": 25, //number of data show per page
                "language": {
                    processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable: '<strong class="text-danger">No Data Found</strong>',
                    infoEmpty: '',
                    zeroRecords: '<strong class="text-danger">No Data Found</strong>'
                },
                "ajax": {
                    "url": "<?php echo e(route('expired.product.report.datatable.data')); ?>",
                    "type": "POST",
                    "data": function(data) {
                        data.batch_no = $("#form-filter #batch_no").val();
                        data.start_date = $("#form-filter #start_date").val();
                        data.end_date = $("#form-filter #end_date").val();
                        data.warehouse_id = $("#form-filter #warehouse_id").val();
                        data.status = $("#form-filter #status").val();
                        data.production_status = $("#form-filter #production_status").val();
                        data.transfer_status = $("#form-filter #transfer_status").val();
                        data._token = _token;
                    }
                },
                "columnDefs": [{
                        "targets": [6],
                        "orderable": false,
                        "className": "text-center"
                    },
                    {
                        "targets": [0, 1, 2, 3, 4, 5],
                        "className": "text-center"
                    }

                ],
                "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",

                "buttons": [
                    <?php if(permission('production-report')): ?>
                        {
                            'extend': 'colvis',
                            'className': 'btn btn-secondary btn-sm text-white',
                            'text': 'Column',
                            'columns': ':gt(0)'
                        }, {
                            "extend": 'print',
                            'text': 'Print',
                            'className': 'btn btn-secondary btn-sm text-white',
                            "title": "<?php echo e($page_title); ?> List",
                            "orientation": "landscape", //portrait
                            "pageSize": "A4", //A3,A5,A6,legal,letter
                            "exportOptions": {
                                columns: ':visible:not(:eq(8))'
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
                        }, {
                            "extend": 'csv',
                            'text': 'CSV',
                            'className': 'btn btn-secondary btn-sm text-white',
                            "title": "<?php echo e($page_title); ?> List",
                            "filename": "<?php echo e(strtolower(str_replace(' ', '-', $page_title))); ?>-list",
                            "exportOptions": {
                                columns: ':visible:not(:eq(8))'
                            }
                        }, {
                            "extend": 'excel',
                            'text': 'Excel',
                            'className': 'btn btn-secondary btn-sm text-white',
                            "title": "<?php echo e($page_title); ?> List",
                            "filename": "<?php echo e(strtolower(str_replace(' ', '-', $page_title))); ?>-list",
                            "exportOptions": {
                                columns: ':visible:not(:eq(8))'
                            },
                        }, {
                            "extend": 'pdf',
                            'text': 'PDF',
                            'className': 'btn btn-secondary btn-sm text-white',
                            "title": "<?php echo e($page_title); ?> List",
                            "filename": "<?php echo e(strtolower(str_replace(' ', '-', $page_title))); ?>-list",
                            "orientation": "landscape", //portrait
                            "pageSize": "A4", //A3,A5,A6,legal,letter
                            "exportOptions": {
                                columns: ':visible:not(:eq(8))'
                            },
                            customize: function(doc) {
                                doc.defaultStyle.fontSize =
                                7; //<-- set fontsize to 16 instead of 10
                                doc.styles.tableHeader.fontSize = 7;
                                doc.pageMargins = [5, 5, 5, 5];
                            }
                        },
                    <?php endif; ?>
                ],
            });

            $('#btn-filter').click(function() {
                table.ajax.reload();
            });

            $('#btn-reset').click(function() {
                $('#form-filter')[0].reset();
                $('#form-filter .selectpicker').selectpicker('refresh');
                $('input[name="start_date"]').val('');
                $('input[name="end_date"]').val('');
                table.ajax.reload();
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Report\Resources/views/expired-product.blade.php ENDPATH**/ ?>