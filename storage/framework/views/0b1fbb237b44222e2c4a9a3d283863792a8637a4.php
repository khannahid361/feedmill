

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
                    <!--begin::Button-->
                    <button type="button" id="print-report" class="btn btn-primary btn-sm font-weight-bolder"> 
                        <i class="fas fa-print"></i> Print</button>
                    <?php if(permission('bank-access')): ?>
                    <a href="<?php echo e(route('bank')); ?>" class="btn btn-primary btn-sm font-weight-bolder ml-3"> 
                        <i class="fas fa-university"></i> Manage Bank</a>
                    <?php endif; ?>
                    <?php if(permission('bank-transaction-access')): ?>
                    <a href="<?php echo e(route('bank.transaction')); ?>" class="btn btn-primary btn-sm font-weight-bolder ml-3"> 
                        <i class="far fa-money-bill-alt"></i> Bank Transaction</a>
                    <?php endif; ?>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row justify-content-center">
                        <div class="form-group col-md-3">
                            <label for="name">Choose Your Date</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed">
                                <input type="hidden" id="from_date" name="from_date" >
                                <input type="hidden" id="to_date" name="to_date" >
                            </div>
                        </div>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Bank Name','name' => 'bank_name','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Bank Name','name' => 'bank_name','required' => 'required','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <?php if(!$banks->isEmpty()): ?>
                                <?php $__currentLoopData = $banks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $bank): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($bank->bank_name); ?>"><?php echo e($bank->bank_name.' - '.$bank->account_number); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <div class="col-md-6">
                            <div style="margin-top:28px;">    
                                <div style="margin-top:28px;">    
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button"
                                    data-toggle="tooltip" data-theme="dark" title="Reset">
                                    <i class="fas fa-undo-alt"></i></button>
    
                                    <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button"
                                    data-toggle="tooltip" data-theme="dark" title="Search">
                                    <i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row" id="report">
                        <style>
                            @media  print {

                                body,
                                html {
                                    background: #fff !important;
                                    -webkit-print-color-adjust: exact !important;
                                    font-family: sans-serif;
                                }
                            }
                        </style>
                        <div class="col-md-12 pb-5">
                            <div class="row">
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
                            </div>
                        </div>
                        <div class="col-md-12">
                            <table id="bank-ledger-table" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>Date</th>
                                        <th>Bank Name</th>
                                        <th>Description</th>
                                        <th>Withdraw / Deposit ID</th>
                                        <th class="text-right">Debit (+)</th>
                                        <th class="text-right">Credit (-)</th>
                                        <th class="text-right">Balance</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
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
<script src="js/moment.js"></script>
<script src="js/knockout-3.4.2.js"></script>
<script src="js/daterangepicker.min.js"></script>
<script src="js/jquery.printarea.js"></script>
<script>
$(document).ready(function(){
    $('.daterangepicker-filed').daterangepicker({
        callback: function(startDate, endDate, period){
            var start_date = startDate.format('YYYY-MM-DD');
            var end_date   = endDate.format('YYYY-MM-DD');
            var title = start_date + ' To ' + end_date;
            $(this).val(title);
            $('input[name="from_date"]').val(start_date);
            $('input[name="to_date"]').val(end_date);
        }
    });

    $(document).on('click','#btn-filter',function(){
        let from_date = $('#from_date').val();
        let to_date   = $('#to_date').val();
        let bank_name = $('#bank_name option:selected').val();
        if(bank_name)
        {
            $.ajax({
                url: "<?php echo e(route('bank.ledger.data')); ?>",
                type: "POST",
                data: {from_date:from_date,to_date:to_date,bank_name:bank_name,_token:_token},
                success:function(data){
                    if(data)
                    {
                        $('#bank-ledger-table tbody').html('');
                        $('#bank-ledger-table tbody').html(data);
                    }else{
                        $('#bank-ledger-table tbody').html('');
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }else{
            notification('error','Please select bank');
        }
        
    });
    $(document).on('click','#btn-reset',function(){
        $('#form-filter')[0].reset();
        $('#form-filter #from_date').val('');
        $('#form-filter #to_date').val('');
        $('#form-filter #bank_name').val('');
        $('#form-filter .selectpicker').selectpicker('refresh');
        $('#bank-ledger-table tbody').html('');
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
});
</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Bank\Resources/views/bank-ledger.blade.php ENDPATH**/ ?>