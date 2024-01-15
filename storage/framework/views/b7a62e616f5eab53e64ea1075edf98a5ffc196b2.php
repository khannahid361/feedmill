<ol class="dd-list">
    <?php $__empty_1 = true; $__currentLoopData = $menu->menuItems; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
        <li class="dd-item" data-id="<?php echo e($item->id); ?>">
            <div class="pull-right item_action">
                <?php if(permission('menu-module-delete')): ?>
                <button type="button" class="btn btn-danger btn-sm btn-elevate btn-icon float-right delete_data" 
                data-id="<?php echo e($item->id); ?>" data-name="<?php echo e($item->type == 1 ? $item->divider_title : $item->module_name); ?>">
                    <i class="fas fa-trash"></i>
                </button>
                <?php endif; ?>
                <?php if(permission('menu-module-edit')): ?>
                <button data-id="<?php echo e($item->id); ?>" class="btn btn-primary btn-sm btn-elevate btn-icon float-right edit_data mr-2"><i class="fas fa-edit"></i></button>
                <?php endif; ?>
            </div>
            <div class="dd-handle">
                <?php if($item->type == 1): ?>
                    <strong>Divider: <?php echo e($item->divider_title); ?></strong>
                <?php else: ?>
                    <span> <i class="<?php echo e($item->icon_class); ?> mr-2"></i> <?php echo e($item->module_name); ?></span> <small class="url"><?php echo e($item->url); ?></small>
                <?php endif; ?>
            </div>
            <?php if(!$item->children->isEmpty()): ?>
                <ol class="dd-list">
                    <?php $__empty_2 = true; $__currentLoopData = $item->children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subitem): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_2 = false; ?>
                        <li class="dd-item" data-id="<?php echo e($subitem->id); ?>">
                            <div class="pull-right item_action">
                                <?php if(permission('menu-module-delete')): ?>
                                <button type="button" class="btn btn-danger btn-sm btn-elevate btn-icon float-right delete_data" 
                                data-id="<?php echo e($subitem->id); ?>" data-name="<?php echo e(($subitem->type == 1) ? $subitem->divider_title : $subitem->module_name); ?>">
                                    <i class="fas fa-trash"></i>
                                </button>
                                <?php endif; ?>
                                <?php if(permission('menu-module-edit')): ?>
                                <button data-id="<?php echo e($subitem->id); ?>" class="btn btn-primary btn-sm btn-elevate btn-icon float-right edit_data mr-2"><i class="fas fa-edit"></i></button>
                                <?php endif; ?>
                            </div>
                            <div class="dd-handle">
                                <?php if($subitem->type == 1): ?>
                                    <strong>Divider: <?php echo e($subitem->divider_title); ?></strong>
                                <?php else: ?>
                                    <span><i class="<?php echo e($subitem->icon_class); ?> mr-2"></i> <?php echo e($subitem->module_name); ?></span> <small class="url"><?php echo e($subitem->url); ?></small>
                                <?php endif; ?>
                            </div>
                            <?php if(!$subitem->children->isEmpty()): ?>
                            <ol class="dd-list">
                                <?php $__empty_3 = true; $__currentLoopData = $subitem->children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sub_subitem): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_3 = false; ?>
                                    <li class="dd-item" data-id="<?php echo e($sub_subitem->id); ?>">
                                        <div class="pull-right item_action">
                                            <?php if(permission('menu-module-delete')): ?>
                                            <button type="button" class="btn btn-danger btn-sm btn-elevate btn-icon float-right delete_data" 
                                            data-id="<?php echo e($sub_subitem->id); ?>" data-name="<?php echo e(($sub_subitem->type == 1) ? $sub_subitem->divider_title : $sub_subitem->module_name); ?>">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                            <?php endif; ?>
                                            <?php if(permission('menu-module-edit')): ?>
                                            <button data-id="<?php echo e($sub_subitem->id); ?>" class="btn btn-primary btn-sm btn-elevate btn-icon float-right edit_data mr-2"><i class="fas fa-edit"></i></button>
                                            <?php endif; ?>
                                        </div>
                                        <div class="dd-handle">
                                            <?php if($sub_subitem->type == 1): ?>
                                                <strong>Divider: <?php echo e($sub_subitem->divider_title); ?></strong>
                                            <?php else: ?>
                                                <span><i class="<?php echo e($sub_subitem->icon_class); ?> mr-2"></i> <?php echo e($sub_subitem->module_name); ?></span> <small class="url"><?php echo e($sub_subitem->url); ?></small>
                                            <?php endif; ?>
                                        </div>
                                        
                                    </li>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_3): ?>
                                    <div class="text-center">
                                        <strong>No menu item found</strong>
                                    </div>
                                <?php endif; ?>
                            </ol>
                        <?php endif; ?>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_2): ?>
                        <div class="text-center">
                            <strong>No menu item found</strong>
                        </div>
                    <?php endif; ?>
                </ol>
            <?php endif; ?>
        </li>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
        <div class="text-center">
            <strong>No menu item found</strong>
        </div>
    <?php endif; ?>
</ol><?php /**PATH D:\laragon\www\feedmill\resources\views/module/module-list.blade.php ENDPATH**/ ?>