<div class="col-md-12">
    <div class="row">
        <div class="table-responsive col-9">
            <table class="table table-borderless">
                <tr>
                    <td><b>Shop Name</b></td><td><b>:</b></td><td><?php echo e($dealer->shop_name); ?></td>
                    <td><b>Name</b></td><td><b>:</b></td><td><?php echo e($dealer->name); ?></td>
                </tr>
                <tr>
                    <td><b>Mobile No.</b></td><td><b>:</b></td><td><?php echo e($dealer->mobile); ?></td>
                    <td><b>Email</b></td><td><b>:</b></td><td><?php echo $dealer->email ? $dealer->email : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">No Email</span>'; ?></td>
                </tr>

                <tr>
                    <td><b>Username</b></td><td><b>:</b></td><td><?php echo e($dealer->username); ?></td>
                    <td><b>Warehouse</b></td><td><b>:</b></td><td><?php echo e($dealer->warehouse->name ?? ''); ?></td>

                </tr>
                <tr>
                    <td><b>District</b></td><td><b>:</b></td><td><?php echo e($dealer->district->name ?? ''); ?></td>
                    <td><b>Upazila</b></td><td><b>:</b></td><td><?php echo e($dealer->upazila->name ?? ''); ?></td>
                </tr>
                <tr>
                    <td><b>Address</b></td><td><b>:</b></td><td><?php echo e($dealer->address); ?></td>
                    <td><b>Area</b></td><td><b>:</b></td><td><?php echo e($dealer->area ?? ''); ?></td>
                </tr>
                <tr>

                    <td><b>Created By</b></td><td><b>:</b></td><td><?php echo e($dealer->created_by); ?></td>
                    <td><b>Modified By</b></td><td><b>:</b></td><td><?php echo e($dealer->modified_by); ?></td>
                </tr>
                <tr>

                    <td><b>Create Date</b></td><td><b>:</b></td><td><?php echo e($dealer->created_at ? date(config('settings.date_format'),strtotime($dealer->created_at)) : ''); ?></td>
                    <td><b>Modified Date</b></td><td><b>:</b></td>
                    <td>
                        <?php if($dealer->modified_by): ?>
                        <?php echo e($dealer->updated_at ? date(config('settings.date_format'),strtotime($dealer->updated_at)) : ''); ?>

                        <?php endif; ?>
                    </td>
                </tr>
                <tr>
                    <td><b>Status</b></td><td><b>:</b></td><td><?php echo STATUS_LABEL[$dealer->status]; ?></td>
                </tr>
            </table>
        </div>
        <div class="col-md-3 text-center">
            <?php if($dealer->avatar): ?>
                <img src='<?php echo e("storage/".DEALER_AVATAR_PATH.$dealer->avatar); ?>' alt='<?php echo e($dealer->name); ?>' style='width:150px;'/>
            <?php else: ?>
                <img src='images/male.svg' alt='Default Image' style='width:150px;'/>
            <?php endif; ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <h4 style="width: 150px;
            background: #fa8c15;
            color: white;
            margin: 10px auto;
            padding: 5px;">Dealer Products</h4>
        </div>
        <table class="table table-bordered">
            <thead class="bg-primary">
                <th class="text-center">SL.</th>
                <th>Product Name</th>
                <th class="text-center">Unit</th>
                <th class="text-center">Price</th>
                <th class="text-center">Commission Rate</th>
                <th class="text-center">Commission Percentage</th>
            </thead>
            <tbody>
                <?php if(!$dealer->hasManyProducts->isEmpty()): ?>
                    <?php $__currentLoopData = $dealer->hasManyProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td class="text-center"><?php echo e($key+1); ?></td>
                            <td><?php echo e($item->product->name); ?></td>
                            <td class="text-center"><?php echo e($item->product->unit->unit_name); ?></td>
                            <td class="text-right"><?php echo e($item->product->base_unit_price); ?></td>
                            <td class="text-right"><?php echo e($item->commission_rate); ?></td>
                            <td class="text-center"><?php echo e($item->product->base_unit_price > 0 ? number_format($item->commission_rate/$item->product->base_unit_price,4,'.',',') : 0); ?></td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>
<?php /**PATH D:\laragon\www\insaf\Modules/Dealer\Resources/views/view-data.blade.php ENDPATH**/ ?>