

<?php $__env->startSection('title', $page_title); ?>

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
                    <a href="<?php echo e(route('role')); ?>" class="btn btn-secondary btn-sm font-weight-bolder"> 
                        <i class="fas fa-arrow-circle-left"></i> Back
                    </a>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-header pt-5 text-center">
                <h5 class="text-center w-100 m-0"><?php echo e($role->role_name); ?> Role Details</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-12">
                        <ul id="permission" class="text-left"  style="list-style: none;">
                            <?php if(!empty($permission_modules)): ?>
                                <?php $__currentLoopData = $permission_modules; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($menu->submenu->isEmpty()): ?>
                                        <li class="<?php if($menu->type == 2): ?> <?php echo e('mb-5'); ?> <?php endif; ?>">
                                            <?php if(collect($role_module)->contains($menu->id)): ?> 
                                            <i class="fas fa-check-circle text-success"></i>
                                            <?php else: ?>
                                            <i class="fas fa-times-circle text-danger"></i>
                                            <?php endif; ?>
                                            <b><?php echo $menu->type == 1 ? $menu->divider_title.' <small>(Divider)</small>' : $menu->module_name; ?></b>
                                            <?php if(!$menu->permission->isEmpty()): ?>
                                                <ul style="list-style: none;">
                                                    <?php $__currentLoopData = $menu->permission; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $permission): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <li>
                                                            
                                                            <?php if(collect($role_permission)->contains($permission->id)): ?> 
                                                            <i class="fas fa-check-circle text-success"></i>
                                                            <?php else: ?>
                                                            <i class="fas fa-times-circle text-danger"></i>
                                                            <?php endif; ?>
                                                            <?php echo e($permission->name); ?>

                                                        </li>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                            <?php endif; ?>
                                        </li>
                                    <?php else: ?> 
                                    <li>
                                        
                                        <?php if(collect($role_module)->contains($menu->id)): ?> 
                                        <i class="fas fa-check-circle text-success"></i>
                                        <?php else: ?>
                                        <i class="fas fa-times-circle text-danger"></i>
                                        <?php endif; ?>
                                        <b><?php echo $menu->type == 1 ? $menu->divider_title.' <small>(Divider)</small>' : $menu->module_name; ?></b>
                                            <ul style="list-style: none;">
                                                <?php $__currentLoopData = $menu->submenu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $submenu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php if($submenu->submenu->isEmpty()): ?>
                                                        <li class="<?php if($menu->type == 2): ?> <?php echo e('mb-5'); ?> <?php endif; ?>">
                                                            <?php if(collect($role_module)->contains($submenu->id)): ?> 
                                                            <i class="fas fa-check-circle text-success"></i>
                                                            <?php else: ?>
                                                            <i class="fas fa-times-circle text-danger"></i>
                                                            <?php endif; ?>
                                                            <b><?php echo e($submenu->module_name); ?></b>
                                                            <?php if(!$submenu->permission->isEmpty()): ?>
                                                                <ul style="list-style: none;">
                                                                    <?php $__currentLoopData = $submenu->permission; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $permission): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <li>
                                                                        <?php if(collect($role_permission)->contains($permission->id)): ?> 
                                                                        <i class="fas fa-check-circle text-success"></i>
                                                                        <?php else: ?>
                                                                        <i class="fas fa-times-circle text-danger"></i>
                                                                        <?php endif; ?>
                                                                        <?php echo e($permission->name); ?>

                                                                    </li>
                                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                </ul>
                                                            <?php endif; ?>
                                                        </li>
                                                    <?php else: ?> 
                                                    <li>
                                                        <?php if(collect($role_module)->contains($menu->id)): ?> 
                                                        <i class="fas fa-check-circle text-success"></i>
                                                        <?php else: ?>
                                                        <i class="fas fa-times-circle text-danger"></i>
                                                        <?php endif; ?>
                                                        <b><?php echo e($submenu->module_name); ?></b>
                                                        <ul style="list-style: none;">
                                                            <?php $__currentLoopData = $submenu->submenu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sub_submenu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <li class="<?php if($submenu->type == 2): ?> <?php echo e('mb-5'); ?> <?php endif; ?>">
                                                                    <?php if(collect($role_module)->contains($sub_submenu->id)): ?> 
                                                                    <i class="fas fa-check-circle text-success"></i>
                                                                    <?php else: ?>
                                                                    <i class="fas fa-times-circle text-danger"></i>
                                                                    <?php endif; ?>
                                                                    <b><?php echo e($sub_submenu->module_name); ?></b>
                                                                    <?php if(!$sub_submenu->permission->isEmpty()): ?>
                                                                        <ul style="list-style: none;">
                                                                            <?php $__currentLoopData = $sub_submenu->permission; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $permission): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                            <li>
                                                                                <?php if(collect($role_permission)->contains($permission->id)): ?> 
                                                                                <i class="fas fa-check-circle text-success"></i>
                                                                                <?php else: ?>
                                                                                <i class="fas fa-times-circle text-danger"></i>
                                                                                <?php endif; ?>
                                                                                <?php echo e($permission->name); ?>

                                                                            </li>
                                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                        </ul>
                                                                    <?php endif; ?>
                                                                </li>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                        </ul>
                                                    <?php endif; ?>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </ul>
                                    </li>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\resources\views/role/view.blade.php ENDPATH**/ ?>