<div class="col-md-12">
    <div class="row">
        <div class="table-responsive col-9">
            <table class="table table-borderless">
                <tr>
                    <td><b>Dealer Name</b></td><td><b>:</b></td><td><?php echo e($dealer->dealer->name); ?></td>
                    <td><b>Year</b></td><td><b>:</b></td><td><?php echo e($dealer->year); ?></td>
                </tr>
                <tr>
                    <td><b>Target Quantity</b></td><td><b>:</b></td><td><?php echo e($dealer->qty); ?></td>
                    <td><b>Acheived Qty</b></td><td><b>:</b></td><td><?php echo e($dealer->acheived_qty); ?></td>
                </tr>

                <tr>
                    <td><b>Commission Amount</b></td><td><b>:</b></td><td><?php echo e($dealer->commission_amount); ?></td>
                    <td><b>Paid Amount</b></td><td><b>:</b></td><td><?php echo e($dealer->paid_amount); ?></td>
                </tr>
                <tr>
                    <td><b>Due Amount</b></td><td><b>:</b></td><td><?php echo e($dealer->due_amount); ?></td>
                    <td><b>Created By</b></td><td><b>:</b></td><td><?php echo e($dealer->created_by); ?></td>
                </tr>
                <tr>
                    <td><b>Modified By</b></td><td><b>:</b></td><td><?php echo e($dealer->modified_by); ?></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<?php /**PATH D:\laragon\www\insaf\Modules/Dealer\Resources/views/yearly_target/view-data.blade.php ENDPATH**/ ?>