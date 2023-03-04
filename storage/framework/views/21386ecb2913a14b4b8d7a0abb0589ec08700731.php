
<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
    <link href="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.css')); ?>" rel="stylesheet" type="text/css" />
    <link href="<?php echo e(asset('css/daterangepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                    <div class="card-toolbar">
                        <?php if(permission('sr-product-target-add')): ?><a href="<?php echo e(route('sr.product.target.add')); ?>" class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a><?php endif; ?>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Sales Men','class' => 'selectpicker','col' => 'col-md-5','name' => 'salesmen_id']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Sales Men','class' => 'selectpicker','col' => 'col-md-5','name' => 'salesmen_id']); ?>
                                <?php if(!$salesmen->isEmpty()): ?>
                                    <?php $__currentLoopData = $salesmen; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sr): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($sr->id); ?>"><?php echo e($sr->name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
                             <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <div class="col-md-2 text-left">
                                <br/>
                                <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>
                                <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>
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
                                        <th>Sales Men</th>
                                        <th>Commission Name</th>
                                        <th>Achieved Value</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
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
    <?php echo $__env->make('salesmen::product-target.modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script src="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.js')); ?>" type="text/javascript"></script>
    <script src="<?php echo e(asset('js/knockout-3.4.2.js')); ?>"></script>
    <script>
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
                    processing  : `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable  : '<strong class="text-danger">No Data Found</strong>',
                    infoEmpty   : '',
                    zeroRecords : '<strong class="text-danger">No Data Found</strong>'
                },
                "ajax"      : {
                    "url"   : "<?php echo e(route('sr.product.target.datatable.data')); ?>",
                    "type"  : "POST",
                    "data"  : function (data) {
                        data.name           = $("#form-filter #name").val();
                        data.product_id     = $("#form-filter #product_id").val();
                        data._token         = _token;
                    }
                },
                "columnDefs"    : [{
                    "targets"   : [0,1,2,3,4,5,6,7],
                    "orderable" : false,
                    "className" : "text-center"
                }],
            });
            $('#btn-filter').click(function () {table.ajax.reload();});
            $('#btn-reset').click(function () {
                $('#form-filter')[0].reset();
                $('#form-filter .selectpicker').selectpicker('refresh');
                table.ajax.reload();
            });
            $(document).on('click', '.edit_data', function () {
                let id = $(this).data('id');
                $('#store_or_update_form')[0].reset();
                $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                $('#store_or_update_form').find('.error').remove();
                if (id) {
                    $.ajax({
                        url         : "<?php echo e(route('sr.product.target.edit')); ?>",
                        type        : "POST",
                        data        : { id: id,_token: _token},
                        dataType    : "JSON",
                        success     : function (data) {
                            if(data.status == 'error'){
                                notification(data.status,data.message)
                            }else{
                                $('#store_or_update_form #update_id').val(data.id);
                                $('#store_or_update_form #salesmen_id').val(data.salesmen_id);
                                $('#store_or_update_form #product_commission_id').val(data.product_commission_id);
                                $('#store_or_update_form #start_date').val(data.start_date);
                                $('#store_or_update_form #end_date').val(data.end_date);
                                $('#store_or_update_form #salesmen_id.selectpicker').selectpicker('refresh');
                                $('#store_or_update_form #product_commission_id.selectpicker').selectpicker('refresh');
                                $('#store_or_update_modal').modal({
                                    keyboard: false,
                                    backdrop: 'static',
                                });
                                $('#store_or_update_modal .modal-title').html('<i class="fas fa-edit text-white"></i> <span>Edit ' + data.start_date + '</span>');
                                $('#store_or_update_modal #save-btn').text('Update');
                            }
                        },
                        error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
                    });
                }
            });
            $(document).on('click', '#save-btn', function () {
                let form        = document.getElementById('store_or_update_form');
                let formData    = new FormData(form);
                let url         = "<?php echo e(route('sr.product.target.update')); ?>";
                let method      = 'update';
                store_or_update_data(table, method, url, formData);
            });
            $(document).on('click', '.delete_data', function () {
                let id    = $(this).data('id');
                let name  = $(this).data('name');
                let row   = table.row($(this).parent('tr'));
                let url   = "<?php echo e(route('sr.product.target.delete')); ?>";
                delete_data(id, url, table, row, name);
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/SalesMen\Resources/views/product-target/index.blade.php ENDPATH**/ ?>