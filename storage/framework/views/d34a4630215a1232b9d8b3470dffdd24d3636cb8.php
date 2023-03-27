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
                        <a href="<?php echo e(route('production')); ?>" class="btn btn-warning btn-sm font-weight-bolder">
                            <i class="fas fa-arrow-left"></i> Back</a>
                        <!--end::Button-->
                    </div>
                </div>
            </div>
            <!--end::Notice-->
            <!--begin::Card-->
            <div class="card card-custom" style="padding-bottom: 100px !important;">
                <form id="store_or_update_form" method="post">
                    <?php echo csrf_field(); ?>
                    <div class="card-body">
                        <div class="col-md-12 text-center">
                            <h5>
                                <b>Batch No.:</b> <?php echo e($production->batch_no); ?> <br>
                                <b>Warehouse:</b> <?php echo e($production->warehouse->name); ?> <br>
                                <b>Start Date:</b> <?php echo e(date('d-M-Y',strtotime($production->start_date))); ?>

                                <?php if($production->end_date): ?> <br><b>Start Date:</b> <?php echo e(date('d-M-Y',strtotime($production->end_date))); ?> <?php endif; ?>
                            </h5>
                        </div>
                        <div class="col-md-12 pt-5">
                            <?php if(!$production->products->isEmpty()): ?>
                                <?php $__currentLoopData = $production->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="row pt-5">
                                        <div class="col-md-12 text-center">
                                            <h3 class="py-3 bg-warning text-white" style="margin: 10px auto 10px auto;"><?php echo e($item->product->name); ?></h3>
                                        </div>
                                        <div class="col-md-12">
                                            <table class="table table-bordered pb-5" id="material_table_<?php echo e($key + 1); ?>">
                                                <thead class="bg-primary">
                                                <th class="text-center">Mfg. Date</th>
                                                <th class="text-center">Exp. Date</th>
                                                <th class="text-center">Unit Name</th>
                                                <th class="text-center">Finish Goods Qty</th>
                                                <?php if($item->has_coupon == 1): ?>
                                                    <th class="text-center">Total Coupon</th>
                                                    <th class="text-center">Coupon Price</th>
                                                    <th class="text-center">Coupon Exp. Date</th>
                                                <?php endif; ?>

                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="text-center"><?php echo e(date('d-M-Y',strtotime($item->mfg_date))); ?></td>
                                                    <td class="text-center"><?php echo e(date('d-M-Y',strtotime($item->exp_date))); ?></td>
                                                    <td class="text-center"><?php echo e($item->product->unit->unit_name.' ('.$item->product->unit->unit_code.')'); ?></td>
                                                    <td class="text-center"><?php echo e($item->base_unit_qty); ?></td>
                                                    <?php if($item->has_coupon == 1): ?>
                                                        <td class="text-center"><?php echo e($item->total_coupon); ?></td>
                                                        <td class="text-center"><?php echo e(number_format($item->coupon_price,2,'.','')); ?></td>
                                                        <td class="text-center"><?php echo e(date('d-M-Y',strtotime($item->coupon_exp_date))); ?></td>
                                                    <?php endif; ?>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-12 table-responsive">
                                            <table class="table table-bordered pb-5" id="material_table_<?php echo e($key + 1); ?>">
                                                <thead class="bg-primary">
                                                <th width="30%">Material</th>
                                                <th width="5%" class="text-center">Type</th>
                                                <th width="10%" class="text-center">Unit Name</th>
                                                <th width="10%" class="text-right">Rate</th>
                                                <th class="text-center">Received Qty</th>
                                                <th class="text-center">Used Qty</th>


                                                </thead>
                                                <tbody>
                                                <?php if(!$item->materials->isEmpty()): ?>
                                                    <?php $__currentLoopData = $item->materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <tr>
                                                            <td> <?php echo e($value->material_name .' ('.$value->material_code.')'); ?> </td>
                                                            <td class="text-center"><?php echo e(MATERIAL_TYPE[$value->type]); ?></td>
                                                            <td class="text-center"><?php echo e($value->unit->unit_name.' ('.$value->unit->unit_code.')'); ?></td>
                                                            <td class="text-right"><?php echo e(number_format($value->pivot->cost,2,'.','')); ?> </td>
                                                            <td class="text-center"> <?php echo e(number_format($value->pivot->qty,2,'.','')); ?> </td>
                                                            <td class="text-center"><?php echo e($value->pivot->used_qty); ?></td>


                                                        </tr>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <tr>
                                                        <td colspan="5" class="text-right font-weight-bold">Total Cost</td>
                                                        <td colspan="1" class="text-right">
                                                            <?php
                                                                if(!empty($item->per_unit_cost) && !empty($item->base_unit_qty))
                                                                {
                                                                    $total_cost = $item->per_unit_cost * $item->base_unit_qty;
                                                                }else{
                                                                    $total_cost = '';
                                                                }
                                                            ?>
                                                            <?php echo e($total_cost); ?>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5" class="text-right font-weight-bold">Per Unit Cost</td>
                                                        <td colspan="1" class="text-right"><?php echo e($item->per_unit_cost ? number_format($item->per_unit_cost,2,'.','') : ''); ?></td>
                                                    </tr>
                                                <?php endif; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>

                        </div>
                    </div>
                </form>
            </div>
            <!--end::Card-->
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Production\Resources/views/production/view.blade.php ENDPATH**/ ?>