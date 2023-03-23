<!doctype html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
    <head>
        <base href="<?php echo e(asset('/')); ?>" />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
        <title><?php echo e(config('settings.title') ? config('settings.title') : config('app.name', 'Laravel')); ?> - <?php echo $__env->yieldContent('title'); ?></title>
		<link rel="icon" type="image/png" href="<?php echo e('storage/'.LOGO_PATH.config('settings.favicon')); ?>">
		<link rel="shortcut icon" href="<?php echo e('storage/'.LOGO_PATH.config('settings.favicon')); ?>" />
        <?php echo $__env->make('dealerpanel::design.styles', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </head>
    <body id="kt_body" class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-minimize-hoverable aside-fixed page-loading">
    <?php echo $__env->make('dealerpanel::includes.layout', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </body>
</html>
<?php /**PATH C:\laragon\www\insaf\Modules/DealerPanel\Resources/views/layouts/master.blade.php ENDPATH**/ ?>