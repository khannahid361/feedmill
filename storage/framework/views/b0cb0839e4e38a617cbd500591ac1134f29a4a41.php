
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <div class="bg-white text-center py-3  rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-3">
                        <img style="width : 40px" src="<?php echo e(asset('images/sale.svg')); ?>" alt="order" >
                    </span>
                        <h6 id="order" class="m-0"><?php echo e($order + $free); ?> pcs</h6>
                        <a href="javascript::void(0);" class="font-weight-bold font-size-h7 mt-2">Order</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="bg-white text-center py-3  rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-3">
                        <img style="width : 40px" src="<?php echo e(asset('images/purchase.svg')); ?>" alt="deliver">
                    </span>
                        <h6 id="deliver" class="m-0"><?php echo e(number_format($deliver)); ?> pcs</h6>
                        <a href="javascript::void(0);" class="font-weight-bold font-size-h7 mt-2">Deliver</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="bg-white text-center py-3  rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-3">
                        <img style="width : 40px" src="<?php echo e(asset('images/income.svg')); ?>" alt="income">
                    </span>
                        <h6 id="income" class="m-0"><?php echo e($order + $free - $deliver); ?> pcs</h6>
                        <a href="javascript::void(0);" class="font-weight-bold font-size-h7 mt-2">Delivery Remaining</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('dealerpanel::layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/DealerPanel\Resources/views/index.blade.php ENDPATH**/ ?>