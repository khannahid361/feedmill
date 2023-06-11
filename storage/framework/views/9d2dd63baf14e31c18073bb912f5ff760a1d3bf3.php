<div id="kt_header" class="header  header-fixed ">
    <div class="container-fluid d-flex align-items-center justify-content-between">
        <div class="header-menu-wrapper header-menu-wrapper-left" id="kt_header_menu_wrapper"></div>
        <div class="topbar">
            <div class="dropdown">

















            </div>
            <div class="topbar-item">
                <div class="btn btn-icon w-auto btn-clean d-flex align-items-center btn-lg px-2"
                    id="kt_quick_user_toggle">
                    <span class="text-muted font-weight-bold font-size-base d-none d-md-inline mr-1">Hi,</span>
                    <span class="text-dark-50 font-weight-bolder font-size-base d-none d-md-inline mr-3"><?php echo e(Auth::user()->username); ?></span>
                    <span class="symbol symbol-35 symbol-light-success"><img class="header-profile-user" src="<?php echo e(asset('images/profile.svg')); ?>" alt="Header Avatar"></span>
                </div>
            </div>
        </div>
    </div>
</div>
<?php /**PATH D:\laragon\www\insaf\resources\views/components/header.blade.php ENDPATH**/ ?>