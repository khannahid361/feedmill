<?php $__env->startSection('title', $page_title); ?>

<?php $__env->startPush('styles'); ?>
<link href="css/daterangepicker.min.css" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <!--begin::Notice-->
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title">
                    <h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3>
                </div>
                <div class="card-toolbar">
                    <button type="button" id="print-report" class="btn btn-primary btn-sm font-weight-bolder">
                        <i class="fas fa-print"></i> Print</button>

                </div>
            </div>

        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="name">Choose Your Date</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed" value="<?php echo e(date('Y-m-d')); ?> To <?php echo e(date('Y-m-d')); ?>">
                                <input type="hidden" id="start_date" name="start_date" value="<?php echo e(date('Y-m-d')); ?>">
                                <input type="hidden" id="end_date" name="end_date" value="<?php echo e(date('Y-m-d')); ?>">
                            </div>
                        </div>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'General Head','name' => 'general_head','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'General Head','name' => 'general_head','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <?php if(!$general_heads->isEmpty()): ?>
                                <?php $__currentLoopData = $general_heads; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $general_head): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($general_head->id); ?>" data-name="<?php echo e($general_head->name); ?>"><?php echo e($general_head->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Transaction Head','name' => 'transaction_head','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Transaction Head','name' => 'transaction_head','col' => 'col-md-3','class' => 'selectpicker']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        

                        <div class="col-md-12">
                            <div style="margin-top:28px;">
                                    <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button"
                                    data-toggle="tooltip" data-theme="dark" title="Search" onclick="report()">
                                    <i class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div id="report" style="width: 100%;margin:0;padding:0;">
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
                        <h4 class="text-dark text-center py-3"><b> (From To)</b></h4>
                        <table class="table table-borderless" style="width:100%;">
                            <thead class="bg-primary">
                                <tr>
                                    <th class="text-right">Pre Balance: <?php echo e(number_format(0,2)); ?></th>
                                </tr>
                                <tr>
                                    <th class="text-right">Current Balance: <?php echo e(number_format(0,2)); ?></th>
                                </tr>
                            </thead>
                        </table>
                        <table class="table table-bordered" style="width:100%;">
                            <thead class="bg-primary">
                                <tr>
                                    <th class="text-center">SL.</th>
                                    <th class="text-cnter">Transaction Date</th>
                                    <th class="text-cnter">Particulars</th>
                                    <th class="text-right">Debit</th>
                                    <th class="text-right">Credit</th>
                                    <th class="text-right">Balance</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                            <tfoot>
                                <tr class="bg-primary">
                                    <td colspan="3" class="text-right text-white font-weight-bolder">Total</td>
                                    <td class="text-right text-white font-weight-bolder">0.00</td>
                                    <td class="text-right text-white font-weight-bolder">0.00</td>
                                    <td class="text-right text-white font-weight-bolder">0.00</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <!--end: Datatable-->
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="js/jquery.printarea.js"></script>
<script src="js/moment.js"></script>
<script src="js/knockout-3.4.2.js"></script>
<script src="js/daterangepicker.min.js"></script>
<script>
$('.daterangepicker-filed').daterangepicker({
    callback: function(startDate, endDate, period){
        var start_date = startDate.format('YYYY-MM-DD');
        var end_date   = endDate.format('YYYY-MM-DD');
        var title      = start_date + ' To ' + end_date;
        $(this).val(title);
        $('input[name="start_date"]').val(start_date);
        $('input[name="end_date"]').val(end_date);
    }
});

$(document).on('click','#print-report',function(){
    var mode = 'iframe'; // popup
    var close = mode == "popup";
    var options = {
        mode: mode,
        popClose: close
    };
    $("#report").printArea(options);
});

function report()
{
    var start_date   = $('input[name="start_date"]').val();
    var end_date     = $('input[name="end_date"]').val();
    var general_head = $('#general_head option:selected').val();
    var transaction_head = $('#transaction_head option:selected').val();
    var bank_name = $('#transaction_head option:selected').data('name');
    // var warehouse_id = document.getElementById('warehouse_id').value;
    if(transaction_head){
        // if(warehouse_id){
            $.ajax({
                url:"<?php echo e(url('general-ledger/report')); ?>",
                type:"POST",
                data:{start_date:start_date,end_date:end_date,general_head:general_head,transaction_head:transaction_head,
                    bank_name:bank_name,_token:_token},
                success:function(data){
                    $('#report').empty();
                    $('#report').append(data);
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        // }else{
        //     notification('error','Please select warehouse!');
        // }
    }else{
        notification('error','Please select a transaction head');
    }

}

$(document).on('change','#general_head',function(){
    var parent_name = $('#general_head option:selected').data('name');
    $.ajax({
        url:"<?php echo e(url('general-ledger/transaction-heads')); ?>",
        type:"POST",
        data:{parent_name:parent_name,_token:_token},
        success:function(data){
            $('#transaction_head').empty();
            $('#transaction_head').html(data);
            $('#transaction_head.selectpicker').selectpicker('refresh');
        },
        error: function (xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
});

</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Account\Resources/views/report/general-ledger/index.blade.php ENDPATH**/ ?>