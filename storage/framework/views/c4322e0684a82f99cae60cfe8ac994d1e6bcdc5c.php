<?php if(!$payments->isEmpty()): ?>
    <?php $__currentLoopData = $payments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $payment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <tr>
        <td class="text-center"><?php echo e(date(config('settings.date_format',strtotime($payment->created_at)))); ?></td>
        <td class="text-right"><?php echo e(number_format($payment->amount,2)); ?></td>
        <td class="text-center"><?php echo e(PAYMENT_METHOD[$payment->payment_method]); ?></td>
        <td><?php echo e($payment->account->name); ?></td>
        <td><?php echo e($payment->cheque_no ? $payment->cheque_no : ''); ?></td>
        <td><?php echo e($payment->payment_note ? $payment->payment_note : ''); ?></td>
        <td class="text-center">
            <button type="button" class="btn btn-primary btn-sm mr-3 edit-payment" data-id="<?php echo e($payment->id); ?>"
                data-purchaseid="<?php echo e($payment->purchase_id); ?>" data-amount="<?php echo e($payment->amount); ?>" data-due="<?php echo e($payment->purchase->grand_total - $payment->purchase->paid_amount); ?>"
                data-paymentmethod="<?php echo e($payment->payment_method); ?>" data-accountid="<?php echo e($payment->account_id); ?>"
                data-chequeno="<?php echo e($payment->cheque_no); ?>" data-note="<?php echo e($payment->payment_note); ?>"> <i class="fas fa-edit"></i></button>
            <button type="button" class="btn btn-danger btn-sm delete-payment" data-id="<?php echo e($payment->id); ?>" data-purchaseid="<?php echo e($payment->purchase_id); ?>"> <i class="fas fa-trash"></i></button>
        </td>
    </tr>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php else: ?>
<tr>
    <td colspan="8" class="text-danger text-center">No Data Found</td>
</tr>
<?php endif; ?><?php /**PATH C:\laragon\www\insaf\Modules/Purchase\Resources/views/payment/view.blade.php ENDPATH**/ ?>