<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?><link href="<?php echo e(asset('css/daterangepicker.min.css')); ?>" rel="stylesheet" type="text/css" /><?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                    <div class="card-toolbar">
                        <?php if(permission('loan-add')): ?><a href="<?php echo e(route('loan.add')); ?>" class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a><?php endif; ?>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <div class="col-md-3">
                                <label for="vendor_id">Loan Categories</label>
                                <select class="form-control selectpicker" id="loan_categories_id" name="loan_categories_id" data-live-search="true">
                                    <option value="">Select Loan Categories</option>
                                    <?php $__currentLoopData = $loanCategories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($value->id); ?>"><?php echo e($value->name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label for="bank_id">Bank</label>
                                <select class="form-control selectpicker" id="bank_id" name="bank_id" data-live-search="true">
                                    <option value="">Select Bank</option>
                                    <?php $__currentLoopData = $banks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($value->id); ?>"><?php echo e($value->bank_name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Total Amount','name' => 'total_amount','col' => 'col-md-2','placeholder' => 'Enter Total Amount']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Total Amount','name' => 'total_amount','col' => 'col-md-2','placeholder' => 'Enter Total Amount']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Monthly Installment','name' => 'monthly_installment','col' => 'col-md-3','placeholder' => 'Enter Monthly Installment']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Monthly Installment','name' => 'monthly_installment','col' => 'col-md-3','placeholder' => 'Enter Monthly Installment']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <div class="col-md-2">
                                <div style="margin-top:28px;">
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>
                                    <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead class="bg-primary">
                                    <tr>
                                        <th>Sl</th>
                                        <th>Categories</th>
                                        <th>Bank</th>
                                        <th>Branch</th>
                                        <th>Account</th>
                                        <th>Total Amount</th>
                                        <th>Monthly Installment</th>
                                        <th>Status</th>
                                        <th>Created By</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php echo $__env->make('loan::loan.modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script src="<?php echo e(asset('js/knockout-3.4.2.js')); ?>"></script>
    <script src="<?php echo e(asset('js/daterangepicker.min.js')); ?>"></script>
    <script>
        function _(x){
            return document.getElementById(x);
        }
        let table;
        $(document).ready(function(){
            table = $('#dataTable').DataTable({
                "processing": true,
                "serverSide": true,
                "order"     : [],
                "responsive": true,
                "bInfo"     : true,
                "bFilter"   : false,
                "lengthMenu": [
                    [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
                    [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
                ],
                "pageLength": 25,
                "language"  : {
                    processing : `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable : '<strong class="text-danger">No Data Found</strong>',
                    infoEmpty  : '',
                    zeroRecords: '<strong class="text-danger">No Data Found</strong>'
                },
                "ajax": {
                    "url" : "<?php echo e(route('loan.datatable.data')); ?>",
                    "type": "POST",
                    "data": function (data) {
                        data.vendor_id      = $("#form-filter #vendor_id").val();
                        data.car_seat_id    = $("#form-filter #car_seat_id").val();
                        data.name           = $("#form-filter #name").val();
                        data._token         = _token;
                    }
                },
                "columnDefs"   : [{
                    "targets"  : [0,1,2,3,4,5,6,7,8,9],
                    "orderable": false,
                    "className": "text-center"
                },],
                "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" + "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",
            });
            $('#btn-filter').click(function () { table.ajax.reload(); });
            $('#btn-reset').click(function () {
                $('#form-filter')[0].reset();
                $('#form-filter .selectpicker').selectpicker('refresh');
                table.ajax.reload();
            });
            $(document).on('click','.change_status',function(){
                $('#approve_status_form #loan_id').val($(this).data('id'));
                $('#approve_status_modal').modal({
                    keyboard: false,
                    backdrop: 'static',
                });
                $('#approve_status_modal .modal-title').html('<span><?php echo e('Change Loan Status'); ?></span>');
                $('#approve_status_modal #loan-status-btn').text('<?php echo e("Change Status"); ?>');

            });
            $(document).on('click','#loan-status-btn',function(){
                if(_('start_date').value != '' && _('loan_status').value != ''){
                    $.ajax({
                        url       : "<?php echo e(route('loan.change.status')); ?>",
                        type      : "POST",
                        data      : {loan_id:_('loan_id').value,start_date:_('start_date').value,loan_status:_('loan_status').value,_token:_token},
                        dataType  : "JSON",
                        beforeSend: function(){
                            $('#loan-status-btn').addClass('kt-spinner kt-spinner--md kt-spinner--light');
                        },
                        complete  : function(){
                            $('#loan-status-btn').removeClass('kt-spinner kt-spinner--md kt-spinner--light');
                        },
                        success   : function (data) {
                            notification(data.status, data.message);
                            if (data.status == 'success') {
                                $('#approve_status_modal').modal('hide');
                                table.ajax.reload(null, false);
                            }
                        },
                        error     : function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
                    });
                }else{
                    notification('error','Input Field Empty');
                }
            });
            $(document).on('click', '.delete_data', function () {
                let id    = $(this).data('id');
                let name  = $(this).data('name');
                let row   = table.row($(this).parent('tr'));
                let url   = "<?php echo e(route('loan.delete')); ?>";
                delete_data(id, url, table, row, name);
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Loan\Resources/views/loan/index.blade.php ENDPATH**/ ?>