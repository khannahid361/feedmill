<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<style>

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
                    <?php if(permission('allowances-add')): ?>
                        <a href="javascript:void(0);" onclick="showFormModal('<?php echo e(__('file.Add New Allowances')); ?>','<?php echo e(__('file.Save')); ?>')" class="btn btn-primary btn-sm font-weight-bolder">
                            <i class="fas fa-plus-circle"></i> <?php echo e(__('file.Add New')); ?>

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
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => ''.e(__('file.Allowances Name')).'','name' => 'allowances_name','col' => 'col-md-4']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Allowances Name')).'','name' => 'allowances_name','col' => 'col-md-4']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <div class="col-md-8">
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
                                        <th><?php echo e(__('file.Allowances Name')); ?></th>
                                        <th><?php echo e(__('file.Labour Name')); ?></th>
                                        <th><?php echo e(__('file.Allowances Month')); ?></th>
                                        <th><?php echo e(__('file.Allowances Amount')); ?></th>
                                        <th><?php echo e(__('file.Allowances Purpose')); ?></th>
                                        <th><?php echo e(__('file.Status')); ?></th>
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
<?php echo $__env->make('hrm::allowances.modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
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
            "pageLength": 25, //number of data show per page
            "language": {
                processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                emptyTable: '<strong class="text-danger">No Data Found</strong>',
                infoEmpty: '',
                zeroRecords: '<strong class="text-danger">No Data Found</strong>'
            },
            "ajax": {
                "url": "<?php echo e(route('allowances.datatable.data')); ?>",
                "type": "POST",
                "data": function (data) {
                    data.allowances_name   = $("#form-filter #allowances_name").val();
                    data._token             = _token;
                }
            },
            "columnDefs": [{
                "targets"  : [0,1,2,3,4,5,6,7,8],
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

        $(document).on('click', '#save-btn', function () {
            let form        = document.getElementById('store_or_update_form');
            let formData    = new FormData(form);
            let url         = "<?php echo e(route('allowances.store.or.update')); ?>";
            let id          = $('#update_id').val();
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
                    url: "<?php echo e(route('allowances.edit')); ?>",
                    type: "POST",
                    data: { id: id,_token: _token},
                    dataType: "JSON",
                    success: function (data) {
                        if(data.status == 'error'){
                            notification(data.status,data.message)
                        }else{
                            $('#store_or_update_form #update_id').val(data.id);
                            $('#store_or_update_form #employee_id').val(data.employee_id);
                            $('#store_or_update_form #allowances_name').val(data.allowances_name);
                            $('#store_or_update_form #allowances_month').val(data.allowances_month);
                            $('#store_or_update_form #allowances_amount').val(data.allowances_amount);
                            $('#store_or_update_form #allowances_description').val(data.allowances_description);
                            $('#store_or_update_form #status').val(data.status);
                            $('#store_or_update_form .selectpicker').selectpicker('refresh');
                            $('#store_or_update_modal').modal({
                                keyboard: false,
                                backdrop: 'static',
                            });
                            $('#store_or_update_modal .modal-title').html(
                                '<i class="fas fa-edit text-white"></i> <span><?php echo e(__('file.Edit')); ?> ' + data.name + '</span>');
                            $('#store_or_update_modal #save-btn').text('<?php echo e(__('file.Update')); ?>');
                        }
                    },
                    error: function (xhr, ajaxOption, thrownError) {
                        console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                    }
                });
            }
        });

    });
    // Month datepicker
    var dp=$("#allowances_month").datepicker( {
        format: "yyyy-mm",
        startView: "months",
        minViewMode: "months"
    });
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/labour/allowances/index.blade.php ENDPATH**/ ?>