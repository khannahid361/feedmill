
<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
    <link href="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.css')); ?>" rel="stylesheet" type="text/css" />
    <link href="<?php echo e(asset('css/daterangepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
    <link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                    <div class="card-toolbar">
                        <a href="<?php echo e(route('dealer.panel.sale.add')); ?>"  class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Memo No.','name' => 'memo_no','col' => 'col-md-4']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Memo No.','name' => 'memo_no','col' => 'col-md-4']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <div class="form-group col-md-3">
                                <label for="name">Choose Your Date</label>
                                <div class="input-group">
                                    <input type="text" class="form-control daterangepicker-filed">
                                    <input type="hidden" id="start_date" name="start_date">
                                    <input type="hidden" id="end_date" name="end_date">
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="text-left" style="margin-top:28px;">
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
                            <div class="col-sm-12 table-responsive">
                                <table id="dataTable" class="table table-bordered table-hover">
                                    <thead class="bg-primary">
                                    <tr>
                                        <th>Memo No.</th>
                                        <th>Total Item</th>
                                        <th>Total Delivery</th>
                                        <th>Total</th>
                                        <th>Sale Date</th>
                                        <th>Delivery Status</th>
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
            </div>
        </div>
    </div>
    <?php echo $__env->make('sale::modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script src="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.js')); ?>" type="text/javascript"></script>
    <script src="<?php echo e(asset('js/moment.js')); ?>"></script>
    <script src="<?php echo e(asset('js/knockout-3.4.2.js')); ?>"></script>
    <script src="<?php echo e(asset('js/daterangepicker.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/bootstrap-datetimepicker.min.js')); ?>"></script>
    <script>
        function _(x){
            return document.getElementById(x);
        }
        $('.daterangepicker-filed').daterangepicker({
            callback: function(startDate, endDate, period){
                var start_date = startDate.format('YYYY-MM-DD');
                var end_date   = endDate.format('YYYY-MM-DD');
                var title = start_date + ' To ' + end_date;
                $(this).val(title);
                $('input[name="start_date"]').val(start_date);
                $('input[name="end_date"]').val(end_date);
            }
        });
        var table;
        $(document).ready(function(){
            console.log('hello')
            $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
            table = $('#dataTable').DataTable({
                "processing"    : true,
                "serverSide"    : true,
                "order"         : [],
                "responsive"    : false,
                "bInfo"         : true,
                "bFilter"       : false,
                "lengthMenu"    : [
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
                    "url": "<?php echo e(route('dealer.panel.sale.datatable.data')); ?>",
                    "type": "POST",
                    "data": function (data) {
                        data.memo_no        = $("#form-filter #memo_no").val();
                        data.start_date     = $("#form-filter #start_date").val();
                        data.end_date       = $("#form-filter #end_date").val();
                        data._token         = "<?php echo e(csrf_token()); ?>";
                    }
                },
                "columnDefs": [{
                    "targets": [0,1,2,3,4,5,6,7],
                    "orderable": false,
                    "className": "text-center"
                }
                ],
            });
            $('#btn-filter').click(function () {table.ajax.reload();});
            $('#btn-reset').click(function () {
                $('#form-filter')[0].reset();
                $('#form-filter .selectpicker').selectpicker('refresh');
                $('#form-filter #start_date').val('');
                $('#form-filter #end_date').val('');
                table.ajax.reload();
            });
            $(document).on('click', '.delete_data', function () {
                let id    = $(this).data('id');
                let name  = $(this).data('name');
                let row   = table.row($(this).parent('tr'));
                let url   = "<?php echo e(route('dealer.panel.sale.delete')); ?>";
                Swal.fire({
                    title: 'Are you sure to delete ' + name + ' data?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: url,
                            type: "POST",
                            data: { id: id, _token: "<?php echo e(csrf_token()); ?>"},
                            dataType: "JSON",
                        }).done(function (response) {
                            if (response.status == "success") {
                                Swal.fire("Deleted", response.message, "success").then(function () {
                                    table.row(row).remove().draw(false);
                                });
                            }
                            if (response.status == "error") {
                                Swal.fire('Oops...', response.message, "error");
                            }
                        }).fail(function () {
                            Swal.fire('Oops...', "Something went wrong with ajax!", "error");
                        });
                    }
                });
            });
            
            
            
            
            
            
            
            
            
        });
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('dealerpanel::layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/DealerPanel\Resources/views/sale/index.blade.php ENDPATH**/ ?>