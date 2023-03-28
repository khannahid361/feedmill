<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
    <link href="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.css')); ?>" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title">
                        <h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3>
                    </div>
                    <div class="card-toolbar">
                        <?php if(permission('loan-categories-store-update')): ?>
                            <a href="javascript:void(0);" onclick="showFormModal('<?php echo e('Add New Name'); ?>','<?php echo e('Save'); ?>')" class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> <?php echo e('Add New'); ?></a>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead class="bg-primary">
                                    <tr>
                                        <th><?php echo e('SL'); ?></th>
                                        <th><?php echo e('Name'); ?></th>
                                        <th><?php echo e('Status'); ?></th>
                                        <th><?php echo e('Created By'); ?></th>
                                        <th><?php echo e('Action'); ?></th>
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
    <?php echo $__env->make('loan::loanCategories.modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script src="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.js')); ?>" type="text/javascript"></script>
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
                "pageLength"   : 25,
                "language"     : {
                    processing : `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable : '<strong class="text-danger"><?php echo e('No Data Found'); ?></strong>',
                    infoEmpty  : '',
                    zeroRecords: '<strong class="text-danger"><?php echo e('No Data Found'); ?></strong>'
                },
                "ajax"    : {
                    "url" : "<?php echo e(route('loan.categories.datatable.data')); ?>",
                    "type": "POST",
                    "data": function (data) {
                        data._token         = _token;
                    }
                },
                "columnDefs": [{
                        "targets"  : [0,1,2,3,4],
                        "orderable": false,
                        "className": "text-center"
                    }],
                "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" + "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",
            });
            $('#btn-filter').click(function () {table.ajax.reload();});
            $('#btn-reset').click(function () {$('#form-filter')[0].reset();table.ajax.reload();});
            $(document).on('click', '#save-btn', function () {
                let form     = document.getElementById('store_or_update_form');
                let formData = new FormData(form);
                let url      = "<?php echo e(route('loan.categories.store.or.update')); ?>";
                let id       = $('#update_id').val();
                let method;
                if (id) {
                    method = 'update';
                } else {
                    method = 'add';
                }
                store_or_update_data(table, method, url, formData);
            });
            $(document).on('click', '.edit_data', function () {
                let id = $(this).data('id');
                $('#store_or_update_form')[0].reset();
                $('#store_or_update_form .select').val('');
                $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                $('#store_or_update_form').find('.error').remove();
                if (id) {
                    $.ajax({
                        url     : "<?php echo e(route('loan.categories.edit')); ?>",
                        type    : "POST",
                        data    : { id: id,_token: _token},
                        dataType: "JSON",
                        success : function (data) {
                            if(data.status == 'error'){
                                notification(data.status,data.message)
                            }else{
                                $('#store_or_update_form #update_id').val(data.id);
                                $('#store_or_update_form #name').val(data.name);
                                $('#store_or_update_form #status').val(data.status);
                                $('#store_or_update_form #status.selectpicker').selectpicker('refresh');
                                $('#store_or_update_modal').modal({
                                    keyboard: false,
                                    backdrop: 'static',
                                });
                                $('#store_or_update_modal .modal-title').html('<i class="fas fa-edit text-white"></i> <span><?php echo e('Edit'); ?> ' + data.name + '</span>');
                                $('#store_or_update_modal #save-btn').text('<?php echo e('Update'); ?>');
                            }
                        },
                        error: function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
                    });
                }
            });
            $(document).on('click', '.delete_data', function () {
                let id    = $(this).data('id');
                let name  = $(this).data('name');
                let row   = table.row($(this).parent('tr'));
                let url   = "<?php echo e(route('loan.categories.delete')); ?>";
                delete_data(id, url, table, row, name);
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Loan\Resources/views/loanCategories/index.blade.php ENDPATH**/ ?>