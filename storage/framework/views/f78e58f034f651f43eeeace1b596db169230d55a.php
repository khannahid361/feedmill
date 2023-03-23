<?php echo $__env->make('dealerpanel::includes.mobile-header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<div class="d-flex flex-column flex-root">
    <div class="d-flex flex-row flex-column-fluid page">
       <?php echo $__env->make('dealerpanel::includes.sidebar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
           <?php echo $__env->make('dealerpanel::includes.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
            <div class="content  d-flex flex-column flex-column-fluid" id="kt_content">
                <?php echo $__env->make('dealerpanel::includes.sub-header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                <?php echo $__env->yieldContent('content'); ?>
            </div>
           <?php echo $__env->make('dealerpanel::includes.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        </div>
    </div>
</div>
<?php echo $__env->make('dealerpanel::includes.user-profile', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->make('dealerpanel::includes.scroll-top', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->make('dealerpanel::design.scripts', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php /**PATH C:\laragon\www\insaf\Modules/DealerPanel\Resources/views/includes/layout.blade.php ENDPATH**/ ?>