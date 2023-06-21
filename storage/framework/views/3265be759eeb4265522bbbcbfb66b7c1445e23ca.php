<div class="col-md-12 text-center">
    <?php if($user->avatar): ?>
        <img src='storage/<?php echo e(USER_PHOTO_PATH.$user->avatar); ?>' alt='<?php echo e($user->name); ?>' style='width:200px;'/>
    <?php else: ?>
        <img src='images/<?php echo e($user->gender == '1' ? 'male' : 'female'); ?>.svg' alt='Default Image' style='width:200px;'/>
    <?php endif; ?>
</div>
<div class="col-md-12">
    <div class="table-responsive">
        <table class="table table-borderless">
            <tr><td width="30%"><b>Name</b></td><td><b>:</b></td><td><?php echo e($user->name); ?></td></tr>
            <tr><td width="30%"><b>Username</b></td><td><b>:</b></td><td><?php echo e($user->username); ?></td></tr>
            <tr><td width="30%"><b>Role</b></td><td><b>:</b></td><td><?php echo e($user->role->role_name); ?></td></tr>
            <tr><td width="30%"><b>Control By</b></td><td><b>:</b></td><td><?php echo e($user->parent->name); ?></td></tr>
            <tr><td width="30%"><b>Phone</b></td><td><b>:</b></td><td><?php echo e($user->phone); ?></td></tr>
            <tr><td width="30%"><b>Email</b></td><td><b>:</b></td><td><?php echo $user->email ? $user->email : '<span class="label label-danger label-pill label-inline" style="min-width:70px !important;">No Email</span>'; ?></td></tr>
            <tr><td width="30%"><b>Gender</b></td><td><b>:</b></td><td><?php echo GENDER_LABEL[$user->gender]; ?></td></tr>
            <tr><td width="30%"><b>Status</b></td><td><b>:</b></td><td><?php echo STATUS_LABEL[$user->status]; ?></td></tr>
            <tr><td width="30%"><b>Created By</b></td><td><b>:</b></td><td><?php echo e($user->created_by); ?></td></tr>
            <?php if($user->modified_by): ?><tr><td width="30%"><b>Modified By</b></td><td><b>:</b></td><td><?php echo e($user->modified_by); ?></td></tr><?php endif; ?>
            <tr><td width="30%"><b>Create Date</b></td><td><b>:</b></td><td><?php echo e($user->created_at ? date(config('settings.date_format'),strtotime($user->created_at)) : ''); ?></td></tr>
            <?php if($user->modified_by): ?><tr><td width="30%"><b>Modified Date</b></td><td><b>:</b></td><td><?php echo e($user->updated_at ? date(config('settings.date_format'),strtotime($user->updated_at)) : ''); ?></td></tr><?php endif; ?>
            <tr><td width="30%"><b>Account Deletable</b></td><td><b>:</b></td><td><?php echo DELETABLE_LABEL[$user->deletable]; ?></td></tr>
        </table>
    </div>
</div><?php /**PATH D:\laragon\www\insaf\resources\views/user/view-data.blade.php ENDPATH**/ ?>