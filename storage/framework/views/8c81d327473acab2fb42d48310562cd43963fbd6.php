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
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="" class="table table-bordered table-hover">
                                    <thead class="bg-primary">
                                        <tr>
                                            <th>Sl</th>
                                            <th>Participent Name</th>
                                            <th>Participent Group</th>
                                            <th>Participent Contact Number</th>
                                            <th>Participent Address</th>
                                            <th style="float:right">Balance</th>
                                        </tr>
                                    </thead>
                                    <?php
                                        $total = 0;
                                    ?>
                                    <?php $__empty_1 = true; $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                        <?php
                                            $total += $item['balance'];
                                        ?>
                                        <tr>
                                            <th><span style="color:black;"><?php echo e($item['sl']); ?></span></th>
                                            <th><span style="color:black;"><?php echo e($item['name']); ?></span></th>
                                            <th><span style="color:black;"><?php echo e($item['mobile']); ?></span></th>
                                            <th><span style="color:black;"><?php echo e($item['address']); ?></span></th>
                                            <th><span style="color:black;"><?php echo e($item['group']); ?></span></th>
                                            <th><span style="color:black;float:right"><?php echo e($item['balance']); ?></span></th>
                                        </tr>

                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                        <tr>!!! Sorry No Data Available !!!</tr>
                                    <?php endif; ?>
                                    <tfoot class="bg-primary">
                                        <tr>
                                            <th colspan="5">Total</th>
                                            <th><span style="float:right"><?php echo e($total); ?></span></th>
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
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Report\Resources/views/due-report-show.blade.php ENDPATH**/ ?>