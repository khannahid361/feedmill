<div class="col-md-12"><p><b>Voucher No :</b> <?php echo e($voucher[0]->voucher_no); ?></p></div>
<div class="col-md-12"><p><b>Date :</b> <?php echo e(date('d-M-Y',strtotime($voucher[0]->voucher_date))); ?></p></div>
<div class="col-md-12">
    <div class="table-responsive">
        <table class="table table-bordered" id="debit-voucher-table">
            <thead class="bg-primary">
                <th width="40%">Account Name</th>
                <th width="25%" class="text-right">Debit</th>
                <th width="25%" class="text-right">Credit</th>
            </thead>
            <tbody>
                <?php
                    $total_debit = 0;
                    $total_credit = 0;
                ?>
                <?php if(!$voucher->isEmpty()): ?>
                    <?php $__currentLoopData = $voucher; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $journal): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php
                        $total_debit += $journal->debit;
                        $total_credit += $journal->credit;
                    ?>
                    <tr>
                        <td><?php echo e($journal->coa->name); ?></td>
                        <td class="text-right"><?php echo e(number_format($journal->debit,2,'.','')); ?></td>
                        <td class="text-right"><?php echo e(number_format($journal->credit,2,'.','')); ?></td>
                    </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
            </tbody>
            <tfoot>
                <tr class="bg-primary">
                    <th class="text-right">Total</th>
                    <th class="text-right"><?php echo e(number_format($total_debit,2,'.','')); ?></th>
                    <th class="text-right"> <?php echo e(number_format($total_credit,2,'.','')); ?></th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
<div class="col-md-12"><p><b>Remarks :</b> <?php echo e($voucher[0]->description); ?></p></div>
<?php /**PATH D:\laragon\www\insaf\Modules/Account\Resources/views/contra-voucher/view-modal-data.blade.php ENDPATH**/ ?>