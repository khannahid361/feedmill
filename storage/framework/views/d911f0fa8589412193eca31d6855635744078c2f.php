<?php
    $current_balance = $pre_balance;

    if (!$report_data->isEmpty()){
        foreach ($report_data as $key =>  $value){
            $current_balance += $value->debit;
            $current_balance -= $value->credit;
        }
    }
?>
<style>


    @media  print {

        body,
        html {
            background: #fff !important;
            -webkit-print-color-adjust: exact !important;
            font-family: sans-serif;
            /* font-size: 12px !important; */
            margin-bottom: 100px !important;
        }

        .m-0 {
            margin: 0 !important;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            margin: 0 !important;
        }

        .no_screen {
            display: block !important;
        }

        .no_print {
            display: none;
        }

        a {
            content: none !important;
            text-decoration: none !important;
            color: #036 !important;
        }

        .text-center {
            text-align: center !important;
        }

        .text-left {
            text-align: left !important;
        }

        .text-right {
            text-align: right !important;
        }

        .float-left {
            float: left !important;
        }

        .float-right {
            float: right !important;
        }

        .text-bold {
            font-weight: bold !important;
        }


        /* .invoice>div:last-child {
            page-break-before: always
        } */
        .hidden-print {
            display: none !important;
        }
        .dashed-border{
            width:180px;height:2px;margin:0 auto;padding:0;border-top:1px dashed #454d55 !important;
        }
    }

    @page  {
        /* size: auto; */
        margin: 5mm 5mm;

    }
</style>
<table width="100%" style="margin:0;padding:0;">
    <tr>
        <td width="100%" class="text-center">
            <h3 style="margin:0;"><?php echo e(config('settings.title') ? config('settings.title') : env('APP_NAME')); ?></h3>
            <?php if(config('settings.contact_no')): ?><p style="font-weight: normal;margin:0;"><b>Contact: </b><?php echo e(config('settings.contact_no')); ?>, <?php if(config('settings.email')): ?><b>Email: </b><?php echo e(config('settings.email')); ?><?php endif; ?></p><?php endif; ?>
            <?php if(config('settings.address')): ?><p style="font-weight: normal;margin:0;"><?php echo e(config('settings.address')); ?></p><?php endif; ?>
            <p style="font-weight: normal;margin:0;"><b>Date: </b><?php echo e(date('d-M-Y')); ?></p>
        </td>
    </tr>
</table>
<div style="width:100%;height:2px;padding:5px 0;"></div>
<div style="width:100%;height:2px;border-bottom:1px dotted #454d55;"></div>
<div style="width:100%;height:2px;padding-top:5px;"></div>
<h4 class="text-dark text-center py-3"><b> General Ledger of <?php echo e($bank_name); ?> (From <?php echo e($start_date); ?> To <?php echo e($end_date); ?>)</b></h4>
<table class="table table-borderless" style="width:100%;">
    <thead class="bg-primary">
        <tr>
            <th class="text-right">Pre Balance: <?php echo e(number_format($pre_balance,2)); ?></th>
        </tr>
        <tr>
            <th class="text-right">Current Balance: <?php echo e(number_format($current_balance,2)); ?></th>
        </tr>
    </thead>
</table>
<table class="table table-bordered" style="width:100%;">
    <thead class="bg-primary">
        <tr>
            <th class="text-center">SL.</th>
            
            <th class="text-center">Transaction Date</th>
            <th class="text-center">Particulars</th>
            <th class="text-right">Debit</th>
            <th class="text-right">Credit</th>
            <th class="text-right">Balance</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $TotalCredit=0;
        $TotalDebit=0;
        $CurBalance = $pre_balance;
        ?>
        <?php if(!$report_data->isEmpty()): ?>
            <?php $__currentLoopData = $report_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key =>  $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <?php
            $TotalDebit += $value->debit;
            $CurBalance += $value->debit;

            $TotalCredit += $value->credit;
            $CurBalance -= $value->credit;
            ?>
            <tr>
                <td class="text-center"><?php echo e($key + 1); ?></td>
                
                <td class="text-center"><?php echo e($value->voucher_date); ?></td>
                <td><?php echo e($value->description); ?></td>
                <td class="text-right"> <?php echo e(number_format($value->debit,2)); ?></td>
                <td class="text-right"> <?php echo e(number_format($value->credit,2)); ?></td>
                <td class="text-right"><?php echo e(number_format($CurBalance,2)); ?></td>
            </tr>

            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php endif; ?>
    </tbody>
    <tfoot>
        <tr class="bg-primary">
            <td colspan="3" class="text-right text-white font-weight-bolder">Total</td>
            <td class="text-right text-white font-weight-bolder"><?php echo e(number_format($TotalDebit,2)); ?></td>
            <td class="text-right text-white font-weight-bolder"><?php echo e(number_format($TotalCredit,2)); ?></td>
            <td class="text-right text-white font-weight-bolder"><?php echo e(number_format($CurBalance,2)); ?></td>
        </tr>
    </tfoot>
</table>
<?php /**PATH D:\laragon\www\insaf\Modules/Account\Resources/views/report/general-ledger/report.blade.php ENDPATH**/ ?>