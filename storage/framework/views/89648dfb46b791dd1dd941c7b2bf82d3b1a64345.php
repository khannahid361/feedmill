<?php if(!empty($ledger)): ?>
    <?php $__currentLoopData = $ledger; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <tr>
        <td><?php echo e($item->voucher_date); ?></td>
        <td><?php echo e($item->name); ?></td>
        <td><?php echo e($item->description); ?></td>
        <td><?php echo e($item->voucher_no); ?></td>
        <td class="text-right text-success"><?php echo e(config('settings.currency_position') == '1' ? config('settings.currency_symbol').number_format($item->debit_amount,2) : number_format($item->debit_amount,2).config('settings.currency_symbol')); ?></td>
        <td class="text-right text-danger"><?php echo e(config('settings.currency_position') == '1' ? config('settings.currency_symbol').number_format($item->credit_amount,2) : number_format($item->credit_amount,2).config('settings.currency_symbol')); ?></td>
        <td class="text-right text-primary"><?php echo e(config('settings.currency_position') == '1' ? config('settings.currency_symbol').number_format($item->balance,2) : number_format($item->balance,2).config('settings.currency_symbol')); ?></td>
    </tr>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    <tr>
        <td colspan="4" class="text-right"><b>Grand Total</b></td>
        <td class="text-right text-success"><b><?php echo e(config('settings.currency_position') == '1' ? config('settings.currency_symbol').$total_debit : $total_debit.config('settings.currency_symbol')); ?></b></td>
        <td class="text-right text-danger"><b><?php echo e(config('settings.currency_position') == '1' ? config('settings.currency_symbol').$total_credit : $total_credit.config('settings.currency_symbol')); ?></b></td>
        <td class="text-right text-primary"><b><?php echo e(config('settings.currency_position') == '1' ? config('settings.currency_symbol').$balance : $balance.config('settings.currency_symbol')); ?></b></td>
    </tr>
<?php else: ?> 
<tr><td colspan="7" class="text-center text-danger"><b>No Data Found</b></td></tr>
<?php endif; ?><?php /**PATH D:\laragon\www\insaf\Modules/MobileBank\Resources/views/ledger-data.blade.php ENDPATH**/ ?>