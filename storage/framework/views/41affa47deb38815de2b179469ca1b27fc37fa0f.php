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
                    <div class="card-title">
                        <h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3>
                    </div>
                    <div class="card-toolbar">
                        
                        <a href="<?php echo e(route('dealer.monthly.commission.payment.create')); ?>"
                            class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a>
                        
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row justify-content-center">
                            <div class="form-group col-md-3">
                                <label for="name">Choose Your Date</label>
                                <div class="input-group">
                                    <input type="text" class="form-control daterangepicker-filed" value="">
                                    <input type="hidden" id="start_date" name="start_date" value="">
                                    <input type="hidden" id="end_date" name="end_date" value="">
                                </div>
                            </div>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Dealer','name' => 'dealer_coa_id','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Dealer','name' => 'dealer_coa_id','col' => 'col-md-3','class' => 'selectpicker']); ?>
                                <?php if(!$dealers->isEmpty()): ?>
                                    <?php $__currentLoopData = $dealers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dealer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($dealer->dealer_coa_id); ?>"><?php echo e($dealer->name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
                             <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <div class="col-md-3">
                                <div style="margin-top:28px;">
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right"
                                        type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i
                                            class="fas fa-undo-alt"></i></button>
                                    <button id="btn-filter"
                                        class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button"
                                        data-toggle="tooltip" data-theme="dark" title="Search"><i
                                            class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="table-responsive">
                                    <table id="dataTable" class="table table-bordered table-hover">
                                        <thead class="bg-primary">
                                            <tr>
                                                <th><?php echo e('SL'); ?></th>
                                                <th><?php echo e('Voucher Date'); ?></th>
                                                <th><?php echo e('Voucher No'); ?></th>
                                                <th><?php echo e('Dealer'); ?></th>
                                                <th><?php echo e('Account Head'); ?></th>
                                                <th><?php echo e('Description'); ?></th>
                                                <th><?php echo e('Debit'); ?></th>
                                                <th><?php echo e('Credit'); ?></th>
                                                <th><?php echo e('Balance'); ?></th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                        <tfoot>
                                            <tr class="bg-primary">
                                                <th style="text-align: right !important;font-weight:bold;" colspan="6">Total</th>
                                                <th style="text-align: right !important;font-weight:bold;"></th>
                                                <th style="text-align: right !important;font-weight:bold;"></th>
                                                <th style="text-align: right !important;font-weight:bold;"></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script src="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.js')); ?>" type="text/javascript"></script>
    <script src="<?php echo e(asset('js/moment.js')); ?>"></script>
    <script src="<?php echo e(asset('js/knockout-3.4.2.js')); ?>"></script>
    <script src="<?php echo e(asset('js/daterangepicker.min.js')); ?>"></script>
    <script>
        let table;
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
                "processing": true,
                "serverSide": true,
                "order": [],
                "responsive": false,
                "bInfo": true,
                "bFilter": false,
                "lengthMenu": [
                    [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
                    [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
                ],
                "pageLength": 25,
                "language": {
                    processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                    emptyTable: '<strong class="text-danger">No Data Found</strong>',
                    infoEmpty: '',
                    zeroRecords: '<strong class="text-danger">No Data Found</strong>'
                },
                "ajax": {
                    "url": "<?php echo e(route('dealer.monthly.commission.ledger.datatable')); ?>",
                    "type": "POST",
                    "data": function(data) {
                        data.start_date = $("#form-filter #start_date").val();
                        data.end_date = $("#form-filter #end_date").val();
                        data.dealer_coa_id = $("#form-filter #dealer_coa_id").val();
                        data._token = _token;
                    }
                },
                "columnDefs": [{
                    "targets": [0, 1, 2, 3, 4, 5, 6, 7, 8],
                    "orderable": false,
                    "className": "text-center"
                }, ],

                "footerCallback": function(row, data, start, end, display) {
                    var api = this.api(),
                        data;

                    // Remove the formatting to get integer data for summation
                    var intVal = function(i) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                    };
                    var debit = 0;
                    var credit = 0;
                    var balance = 0;
                    var currency_symbol = "<?php echo e(config('settings.currency_symbol')); ?>";
                    var currency_position = "<?php echo e(config('settings.currency_position')); ?>";
                    // Total over all pages
                    for (let index = 6; index <= 7; index++) {
                        // Total over this page
                        pageTotal = api
                            .column(index, {
                                page: 'current'
                            })
                            .data()
                            .reduce(function(a, b) {
                                return intVal(a) + intVal(b);
                            }, 0);
                        if (index == 6) {
                            debit = pageTotal;
                        } else {
                            credit = pageTotal;
                        }



                        var total = (currency_position == 1) ? currency_symbol + ' ' + number_format(
                            pageTotal) : number_format(pageTotal) + ' ' + currency_symbol;
                        // Update footer
                        $(api.column(index).footer()).html('= ' + total );
                    }
                    balance = (currency_position == 1) ? currency_symbol + ' ' + number_format((debit -
                        credit)) : number_format((debit - credit)) + ' ' + currency_symbol;
                    $(api.column(8).footer()).html('= ' + balance );
                }
            });
            $('#btn-filter').click(function() {
                table.ajax.reload();
            });
            $('#btn-reset').click(function() {
                $('#form-filter')[0].reset();
                $('#form-filter #start_date').val("");
                $('#form-filter #end_date').val("");
                $('#form-filter .selectpicker').selectpicker('refresh');
                table.ajax.reload();
            });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Dealer\Resources/views/monthly_target/ledger.blade.php ENDPATH**/ ?>