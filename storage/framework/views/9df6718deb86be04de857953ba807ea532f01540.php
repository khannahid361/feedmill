<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startSection('content'); ?>
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                <div class="card-toolbar">
                    <button type="button" class="btn btn-primary btn-sm mr-3" id="print-invoice"> <i class="fas fa-print"></i> Print</button>
                    
                    <a href="<?php echo e(route('dealer.monthly.commission.payment')); ?>" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a>
                    
                </div>
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-body">
                <div class="col-md-12 col-lg-12 d-flex flex-wrap justify-content-center">
                    <div class="col-md-6">
                        <div class="card card-custom card-border">
                            <div class="card-body">
                                <div id="printableArea" style="width: 100%;margin:0;padding:0;">
                                    <link href="<?php echo e(asset('css/print.css')); ?>" rel="stylesheet" type="text/css" />
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
                                    <div style="width:100%;height:2px;border-bottom:1px dotted #454d55;padding-bottom:25px;"></div>
                                    <div style="width:100%;height:2px;padding-top:5px;"></div>
                                    <table class="table table-borderless" style="width:100%;" id="invoice-table" border="0">
                                        <tr>
                                            <td width="25%"><b>Voucher No</b></td><td width="5%"><b>:</b></td><td width="70%" class="text-left"><?php echo e($data->voucher_no); ?></td>
                                        </tr>
                                        <tr>
                                            <td width="25%"><b>Name</b></td><td width="5%"><b>:</b></td><td width="70%" class="text-left"><?php echo e($data->coa->name); ?></td>
                                        </tr>
                                        <tr>
                                            <td width="25%"><b>Amount</b></td><td width="5%"><b>:</b></td><td width="70%" class="text-left"><?php echo e(number_format($data->debit,2,'.',',')); ?>Tk</td>
                                        </tr>
                                        <tr>
                                            <td width="25%"><b>Remarks</b></td><td width="5%"><b>:</b></td><td width="70%" class="text-left"><?php echo e($data->description); ?></td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-size-10" style="width:250px;float:right;padding-top:50px;">
                                                    <p style="margin:0;padding:0;"><b class="text-uppercase"><?php echo e($data->created_by); ?></b>
                                                        <br> <?php echo e(date('d-M-Y h:i:s A',strtotime($data->created_at))); ?></p>
                                                    <p class="dashed-border m-0"></p>
                                                    <p style="margin:0;padding:0;">Signature</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="js/jquery.printarea.js"></script>
<script>
$(document).ready(function () {
    //QR Code Print
    $(document).on('click','#print-invoice',function(){
        var mode = 'iframe'; // popup
        var close = mode == "popup";
        var options = {
            mode: mode,
            popClose: close
        };
        $("#printableArea").printArea(options);
    });
});

</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Account\Resources/views/monthly-commission-payment/print.blade.php ENDPATH**/ ?>