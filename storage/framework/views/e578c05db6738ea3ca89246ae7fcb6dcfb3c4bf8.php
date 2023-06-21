<div class="col-md-12">
    <div class="row">
        <div class="table-responsive col-9">
            <table class="table table-borderless">
                <tr>
                    <td><b>Shop Name</b></td><td><b>:</b></td><td><?php echo e($customer->shop_name); ?></td>
                    <td><b>Name</b></td><td><b>:</b></td><td><?php echo e($customer->name); ?></td>
                </tr>
                <tr>
                    <td><b>Mobile No.</b></td><td><b>:</b></td><td><?php echo e($customer->mobile); ?></td>
                    <td><b>Email</b></td><td><b>:</b></td><td><?php echo $customer->email ? $customer->email : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">No Email</span>'; ?></td>
                </tr>

                <tr>
                    <td><b>Customer Group</b></td><td><b>:</b></td><td><?php echo e($customer->customer_group->group_name); ?></td>
                    <td><b>District</b></td><td><b>:</b></td><td><?php echo e($customer->district->name ?? ''); ?></td>
                </tr>
                <tr>
                    <td><b>Upazila</b></td><td><b>:</b></td><td><?php echo e($customer->upazila->name ?? ''); ?></td>
                    <td><b>Depo</b></td><td><b>:</b></td><td><?php echo e($customer->warehouse->name ?? ''); ?></td>
                </tr>
                <tr>
                    <td><b>Area</b></td><td><b>:</b></td><td><?php echo e($customer->area ?? ''); ?></td>
                    <td><b>Address</b></td><td><b>:</b></td><td><?php echo e($customer->address); ?></td>
                </tr>
                <tr>
                    <td><b>Status</b></td><td><b>:</b></td><td><?php echo STATUS_LABEL[$customer->status]; ?></td>
                    <td><b>Created By</b></td><td><b>:</b></td><td><?php echo e($customer->created_by); ?></td>
                </tr>
                <tr>
                    <td><b>Modified By</b></td><td><b>:</b></td><td><?php echo e($customer->modified_by); ?></td>
                    <td><b>Create Date</b></td><td><b>:</b></td><td><?php echo e($customer->created_at ? date(config('settings.date_format'),strtotime($customer->created_at)) : ''); ?></td>
                </tr>
                <tr>
                    <td><b>Modified Date</b></td><td><b>:</b></td>
                    <td>
                        <?php if($customer->modified_by): ?>
                        <?php echo e($customer->updated_at ? date(config('settings.date_format'),strtotime($customer->updated_at)) : ''); ?>

                        <?php endif; ?>
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-3 text-center">
            <?php if($customer->avatar): ?>
                <img src='<?php echo e("storage/".CUSTOMER_AVATAR_PATH.$customer->avatar); ?>' alt='<?php echo e($customer->name); ?>' style='width:150px;'/>
            <?php else: ?>
                <img src='images/male.svg' alt='Default Image' style='width:150px;'/>
            <?php endif; ?>
        </div>
    </div>
</div>
<?php /**PATH D:\laragon\www\insaf\Modules/Customer\Resources/views/view-data.blade.php ENDPATH**/ ?>