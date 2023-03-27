<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                    <div class="card-toolbar">
                        <button type="button" class="btn btn-primary btn-sm mr-3" id="print-invoice"> <i class="fas fa-print"></i> Print</button>
                        <a href="<?php echo e(route('transfer.inventory')); ?>" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a>
                    </div>
                </div>
            </div>
            <div class="card card-custom" style="padding-bottom: 100px !important;">
                <div class="card-body" style="padding-bottom: 100px !important;">
                    <div class="col-md-12 col-lg-12"  style="width: 100%;">
                        <div id="invoice">
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.invoice-style','data' => []]); ?>
<?php $component->withName('invoice-style'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <div class="invoice overflow-auto">
                                <div>
                                    <table width="100%" style="margin:0;padding:0;">
                                        <tr>
                                            <td width="100%" class="text-center">
                                                <h3 style="margin:0;"><?php echo e(config('settings.title') ? config('settings.title') : env('APP_NAME')); ?></h3>
                                                <?php if(config('settings.address')): ?><p style="font-weight: normal;margin:0;"><b><?php echo e(config('settings.address')); ?></b></p><?php endif; ?>
                                                <?php if(config('settings.contact_no')): ?><p style="font-weight: normal;margin:0;"><b>Contact: </b><?php echo e(config('settings.contact_no')); ?>

                                                    <?php if(config('settings.email')): ?><b>, Email: </b><?php echo e(config('settings.email')); ?><?php endif; ?></p><?php endif; ?>
                                                <p style="font-weight:bold; margin: 10px auto 5px auto;background: black; border-radius: 10px;width: 250px;color: white;text-align: center;padding:5px 0;}">Transfer Challan</p>
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="width: 100%;height:3px;border-top:2px dashed #000;margin-bottom:5px;"></div>
                                    <table id="info_table">
                                        <tr>
                                            <td width="50%">
                                                <table>
                                                    <tr><td><b>Challan No.</b></td><td><b>: </b><?php echo e($transfer->challan_no); ?></td></tr>
                                                    <tr><td><b>Transfer Date</b></td><td><b>: </b><?php echo e(date('d-M-Y',strtotime($transfer->transfer_date))); ?></td></tr>
                                                    <tr><td><b>Transfer Status</b></td><td><b>: </b><?php echo e($transfer->transfer_status == 1 ? 'Transferred' : 'Pending'); ?></td></tr>
                                                    <tr><td><b>Driver Name</b></td><td><b>: </b><?php echo e($transfer->driver_name); ?></td></tr>
                                                    <tr><td><b>From</b></td><td><b>: </b><?php echo e($transfer->from_warehouse->name); ?></td></tr>
                                                </table>
                                            </td>
                                            <td width="50%">
                                                <table>
                                                    <tr><td><b>Driver Mobile No.</b></td><td><b>: </b><?php echo e($transfer->dmobile_no); ?></td></tr>
                                                    <tr><td><b>Shipping Cost</b></td><td><b>: </b><?php echo e($transfer->shipping_cost); ?></td></tr>
                                                    <tr><td><b>Received Cost</b></td><td><b>: </b><?php echo e($transfer->received_cost); ?></td></tr>
                                                    <tr><td><b>Receive Status</b></td><td><b>: </b><?php if($transfer->receive_status == 1): ?>
                                                                <?php echo e('Received'); ?>

                                                            <?php elseif($transfer->receive_status == 2): ?>
                                                                <?php echo e('Partial'); ?>

                                                            <?php else: ?>
                                                                <?php echo e('Pending'); ?>

                                                            <?php endif; ?></td></tr>
                                                    <?php if(empty(Auth::user()->warehouse_id)): ?>
                                                        <tr><td><b>Receive Date</b></td><td><b>: </b><?php echo e($transfer->receive_date ? date('d-M-Y',strtotime($transfer->receive_date)) : ''); ?></td></tr>
                                                        <tr><td><b>To</b></td><td><b>: </b><?php echo e($transfer->to_warehouse->name); ?></td></tr>
                                                    <?php endif; ?>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table  id='product_table'>
                                        <tbody>
                                        <tr>
                                            <td class="text-center"><b>SL.</b></td>
                                            <td class="text-left"><b>PRODUCT</b></td>
                                            <td class="text-center"><b>UNIT</b></td>
                                            <td class="text-center"><b>TRANSFER QTY</b></td>
                                            <td class="text-center"><b>RECEIVE QTY</b></td>
                                            <td class="text-center"><b>DAMAGE QTY</b></td>
                                            <?php if(empty(Auth::user()->warehouse_id)): ?>
                                                <td class="text-center no_print"><b>COST</b></td>
                                                <td class="text-right no_print"><b>TRANSFER VALUE</b></td>
                                                <td class="text-right no_print"><b>RECEIVE VALUE</b></td>
                                                <td class="text-right no_print"><b>DAMAGE VALUE</b></td>
                                            <?php endif; ?>
                                        </tr>
                                        <?php if(!$transfer->hasManyProducts->isEmpty()): ?>
                                            <?php
                                                $total_receive_qty = $total_damage_qty = $total_receive_value = $total_damage_value = 0;
                                            ?>
                                            <?php $__currentLoopData = $transfer->hasManyProducts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php
                                                    $total_receive_qty += $item->receive_qty;
                                                    $total_damage_qty  += $item->damage_qty;
                                                    $total_receive_value += ($item->receive_qty ?? 0) * $item->net_unit_cost;
                                                    $total_damage_value += ($item->damage_qty ?? 0) * $item->net_unit_cost;
                                                ?>
                                                <tr>
                                                    <td class="text-center"><?php echo e($key+1); ?></td>
                                                    <td class="text-left"><?php echo e($item->product->name); ?><br><b>Code: </b><?php echo e($item->product->code); ?></td>
                                                    <td class="text-center"><?php echo e($item->unit->unit_name); ?></td>
                                                    <td class="text-center"><?php echo e(number_format($item->transfer_qty,2,'.',',')); ?></td>
                                                    <td class="text-center"><?php echo e(number_format($item->receive_qty,2,'.',',')); ?></td>
                                                    <td class="text-center"><?php echo e(number_format($item->damage_qty,2,'.',',')); ?></td>
                                                    <?php if(empty(Auth::user()->warehouse_id)): ?>
                                                        <td class="text-right no_print"><?php echo e(number_format($item->net_unit_cost,2,'.',',')); ?></td>
                                                        <td class="text-right no_print"><?php echo e(number_format($item->total,2,'.',',')); ?></td>
                                                        <td class="text-right no_print"><?php echo e(number_format((($item->receive_qty ?? 0) * $item->net_unit_cost),2,'.',',')); ?></td>
                                                        <td class="text-right no_print"><?php echo e(number_format((($item->damage_qty ?? 0) * $item->net_unit_cost),2,'.',',')); ?></td>
                                                    <?php endif; ?>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td class="text-left" colspan="3"><b>TOTAL</b></td>
                                                <td class="text-center"><b><?php echo e(number_format($transfer->total_qty,2,'.',',')); ?></b></td>
                                                <td class="text-center"><b><?php echo e(number_format($total_receive_qty,2,'.',',')); ?></b></td>
                                                <td class="text-center"><b><?php echo e(number_format($total_damage_qty,2,'.',',')); ?></b></td>
                                                <?php if(empty(Auth::user()->warehouse_id)): ?>
                                                    <td></td>
                                                    <td class="text-right no_print"><b><?php echo e(number_format($transfer->grand_total,2,'.',',')); ?></b></td>
                                                    <td class="text-right no_print"><b><?php echo e(number_format($total_receive_value,2,'.',',')); ?></b></td>
                                                    <td class="text-right no_print"><b><?php echo e(number_format($total_damage_value,2,'.',',')); ?></b></td>
                                                <?php endif; ?>
                                            </tr>
                                        <?php endif; ?>
                                        </tbody>
                                    </table>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-size-10">
                                                    <p style="margin:35px 0 0 0;padding:0;text-transform: capitalize;font-weight:normal;"><?php echo e($transfer->created_by); ?><br> <?php echo e(date('Y-m-d',strtotime($transfer->created_at))); ?></p>
                                                    <p class="dashed-border"></p>
                                                    <p style="margin:0;padding:0;text-transform: capitalize;font-weight:normal;">Created By</p>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="font-size-10">
                                                    <p style="margin:0;padding:0;"><?php echo e($transfer->receive_dealer->username); ?><br> <?php echo e(date('Y-m-d',strtotime($transfer->receive_date))); ?></p>
                                                    <p class="dashed-border"></p>
                                                    <p style="margin:0;padding:0;text-transform: capitalize;font-weight:normal;">Received By</p>
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
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
<script src="<?php echo e(asset('js/jquery.printarea.js')); ?>"></script>
<script>
$(document).ready(function () {
    $(document).on('click','#print-invoice',function(){
        var mode = 'iframe';
        var close = mode == "popup";
        var options = {
            mode: mode,
            popClose: close
        };
        $("#invoice").printArea(options);
    });
});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Transfer\Resources/views/details.blade.php ENDPATH**/ ?>