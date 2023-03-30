<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title">
                        <h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3>
                    </div>
                    <div class="card-toolbar">
                        <button type="button" class="btn btn-primary btn-sm mr-3" id="print-invoice"> <i class="fas fa-print"></i><?php echo e(__('file.Print')); ?></button>
                        <a href="<?php echo e(route('salaryPayment')); ?>" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i><?php echo e(__('file.Back')); ?></a>
                    </div>
                </div>
            </div>
            <div class="card card-custom" style="padding-bottom: 100px !important;">
                <div class="card-body" style="padding-bottom: 100px !important;">
                    <div class="col-md-12 col-lg-12"  style="width: 100%;">
                        <div id="invoice">
                            <style>
                                body,html {
                                    background: #fff !important;
                                    -webkit-print-color-adjust: exact !important;
                                }
                                .invoice {
                                    /* position: relative; */
                                    background: #fff !important;
                                    /* min-height: 680px; */
                                }
                                .invoice header {
                                    padding: 10px 0;
                                    margin-bottom: 20px;
                                    border-bottom: 1px solid #036;
                                }
                                .invoice .company-details {
                                    text-align: right
                                }
                                .invoice .company-details .name {
                                    margin-top: 0;
                                    margin-bottom: 0;
                                }
                                .invoice .contacts {
                                    margin-bottom: 20px;
                                }
                                .invoice .invoice-to {
                                    text-align: left;
                                }
                                .invoice .invoice-to .to {
                                    margin-top: 0;
                                    margin-bottom: 0;
                                }
                                .invoice .invoice-details {
                                    text-align: right;
                                }
                                .invoice .invoice-details .invoice-id {
                                    margin-top: 0;
                                    color: #036;
                                }
                                .invoice main {
                                    padding-bottom: 50px
                                }
                                .invoice main .thanks {
                                    margin-top: -100px;
                                    font-size: 2em;
                                    margin-bottom: 50px;
                                }
                                .invoice main .notices {
                                    padding-left: 6px;
                                    border-left: 6px solid #036;
                                }
                                .invoice table {
                                    width: 100%;
                                    border-collapse: collapse;
                                    border-spacing: 0;
                                    margin-bottom: 20px;
                                }
                                .invoice table th {
                                    background: #034d97;
                                    color: white;
                                    padding: 10px;
                                    border : 2px solid black;
                                }
                                .invoice table td {
                                    padding: 9px;
                                    border-bottom: 1px solid #fff
                                }
                                .invoice table th {
                                    white-space: nowrap;
                                }
                                .invoice table td h3 {
                                    margin: 0;
                                    color: #036;
                                }
                                .invoice table .qty {
                                    text-align: center;
                                }
                                .invoice table .price,
                                .invoice table .discount,
                                .invoice table .tax,
                                .invoice table .total {
                                    text-align: right;
                                }
                                .invoice table .no {
                                    color: black;
                                    background: white;
                                    border : 2px solid black !important;
                                }
                                .invoice table .total {
                                    background: white;
                                    color: black;
                                    border : 2px solid black !important;
                                }
                                .invoice table tbody tr:last-child td {
                                    border: none
                                }
                                .invoice table tfoot td {
                                    background: 0 0;
                                    border-bottom: none;
                                    white-space: nowrap;
                                    text-align: right;
                                    padding: 10px 20px;
                                    border-top: 1px solid #aaa;
                                    font-weight: bold;
                                }
                                .invoice table tfoot tr:first-child td {
                                    border-top: none
                                }
                                /* .invoice table tfoot tr:last-child td {
                                    color: #036;
                                    border-top: 1px solid #036
                                } */
                                .invoice table tfoot tr td:first-child {
                                    border: none
                                }
                                .invoice footer {
                                    width: 100%;
                                    text-align: center;
                                    color: #777;
                                    border-top: 1px solid #aaa;
                                    padding: 8px 0
                                }
                                .invoice a {
                                    content: none !important;
                                    text-decoration: none !important;
                                    color: #036 !important;
                                }
                                .page-header,
                                .page-header-space {
                                    height: 100px;
                                }
                                .page-footer,
                                .page-footer-space {
                                    height: 20px;

                                }
                                .page-footer {
                                    position: fixed;
                                    bottom: 0;
                                    width: 100%;
                                    text-align: center;
                                    color: #777;
                                    border-top: 1px solid #aaa;
                                    padding: 8px 0
                                }
                                .page-header {
                                    position: fixed;
                                    top: 0mm;
                                    width: 100%;
                                    border-bottom: 1px solid black;
                                }
                                .page {
                                    page-break-after: always;
                                }
                                .dashed-border{
                                    width:180px;height:2px;margin:0 auto;padding:0;border-top:1px dashed #454d55 !important;
                                }
                                @media  screen {
                                    .no_screen {display: none;}
                                    .no_print {display: block;}
                                    thead {display: table-header-group;}
                                    tfoot {display: table-footer-group;}
                                    button {display: none;}
                                    body {margin: 0;}
                                }
                                @media  print {
                                    body,
                                    html {
                                        /* background: #fff !important; */
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
                                    .invoice {
                                        /* font-size: 11px!important; */
                                        overflow: hidden !important;
                                        background: #fff !important;
                                        margin-bottom: 100px !important;
                                    }
                                    .invoice footer {
                                        position: absolute;
                                        bottom: 0;
                                        left: 0;
                                        /* page-break-after: always */
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
                            <div class="invoice overflow-auto">
                                <div>
                                    <table>
                                        <tr>
                                            <td width="20%"></td>
                                            <td width="80%" class="text-right">
                                                <h2 class="name m-0" style="text-transform: uppercase;"><b><?php echo e(config('settings.title') ? config('settings.title') : env('APP_NAME')); ?></b></h2>
                                                <?php if(config('settings.contact_no')): ?><p style="font-weight: normal;margin:0;"><b><?php echo e(__('file.Contact No')); ?>.: </b><?php echo e(config('settings.contact_no')); ?>, <?php if(config('settings.email')): ?><b><?php echo e(__('file.Email')); ?>: </b><?php echo e(config('settings.email')); ?><?php endif; ?></p><?php endif; ?>
                                                <h5 style="font-weight: normal;margin:0;"><b>Corporate Office :</b> Ga 81/C Gulshan Badda Link Road,Opposite Side Off Primer Bank Ltd,Dhaka Bangladesh</h5>
                                                <p style="font-weight: normal;margin:0;"><b><?php echo e(__('file.Date')); ?>: </b><?php echo e(date('d-M-Y')); ?></p>
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="width: 100%;height:3px;border-top:1px solid #036;border-bottom:1px solid #036;"></div>
                                    <table>
                                        <tr>
                                            <td width="20%">
                                                <div class="invoice-to">
                                                    <div class="text-grey-light text-right"><b><?php echo e(__('Customer Name')); ?> :</b></div>
                                                    <div class="text-grey-light text-right"><b><?php echo e(__('Customer ID')); ?> :</b></div>
                                                    <div class="text-grey-light text-right"><b><?php echo e(__('Customer Department')); ?> :</b></div>
                                                    <div class="text-grey-light text-right"><b><?php echo e(__('Customer Designation')); ?> :</b></div>
                                                </div>
                                            </td>
                                            <td width="30%">
                                                <div class="invoice-to">
                                                    <div class="text-grey-light text-left"><?php echo e($payslip->employee->name); ?></div>
                                                    <div class="text-grey-light text-left"><?php echo e($payslip->employee->employee_id); ?></div>
                                                    <div class="text-grey-light text-left"><?php echo e($payslip->employee->department->name); ?></div>
                                                    <div class="text-grey-light text-left"><?php echo e($payslip->employee->designation->name); ?></div>
                                                </div>
                                            </td>
                                            <td width="35%" class="text-right">
                                                <div class="m-0 date"><b><?php echo e(__('Payment Date')); ?>:</b></div>

                                            </td>
                                            <td width="15%" class="text-right">
                                                <div class="m-0 date text-left"><?php echo e(date('Y-m-d', strtotime($payslip->created_at))); ?></div>

                                            </td>
                                        </tr>
                                    </table>
                                    <div class="box" style="display: flex">
                                        <table border="0" cellspacing="0" cellpadding="0" style="width:50% !important;" class="table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="text-center" colspan="4"><?php echo e(__('file.Total Allowance')); ?></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-right"><?php echo e(__('file.House Rent Allowance')); ?> :</td>
                                                    <td class="text-right"><?php echo e($allowance->house_rent_allowance); ?>/-TK</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right"><?php echo e(__('file.Medical Allowance')); ?> :</td>
                                                    <td class="text-right"><?php echo e($allowance->medical_allowance); ?>/-TK</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right"><?php echo e(__('file.Transport Allowance')); ?> :</td>
                                                    <td class="text-right"><?php echo e($allowance->transport_allowance); ?>/-TK</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right" ><?php echo e(__('file.Mobile Allowance')); ?> :</td>
                                                    <td class="text-right"><?php echo e($allowance->mobile_allowance); ?>/-TK</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-right"><?php echo e(__('file.Other Allowance')); ?> :</td>
                                                    <td class="text-right"><?php echo e($allowance->other_allowance); ?>/-TK</td>
                                                </tr>
                                                <?php
                                                    $allowances = 0;
                                                ?>
                                                <?php $__currentLoopData = $other_allowance; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td class="text-right"><?php echo e($row->allowances_name); ?> :</td>
                                                    <td class="text-right"><?php echo e($row->allowances_amount); ?>/-TK
                                                        <?php
                                                            $allowances += $row->allowances_amount
                                                        ?>
                                                    </td>
                                                </tr>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </tbody>
                                            <tfoot>
                                            </tfoot>
                                        </table>
                                        <table border="0" cellspacing="0" cellpadding="0" style="width:50% !important;" class="table-bordered">
                                            <thead>
                                            <tr>
                                                <th class="text-center"  colspan="4"><?php echo e(__('file.Total Deduction')); ?></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-right" colspan="2"><?php echo e(__('file.Attendance Deduction')); ?> :</td>
                                                    <td class="text-right" colspan="2" style="padding-right: 4%;">0/-TK</td><br>
                                                </tr>
                                                <tr>
                                                    <td class="text-right" colspan="2"><?php echo e(__('file.Provident Fund Deduction')); ?> :</td>
                                                    <td class="text-right" colspan="2" style="padding-right: 4%;"><?php echo e($deduction->provident_fund_deduction); ?>/-TK</td><br>
                                                </tr>
                                                <tr>
                                                    <td class="text-right" colspan="2"><?php echo e(__('file.Tax Deduction')); ?> :</td>
                                                    <td class="text-right" colspan="2" style="padding-right: 4%;"><?php echo e($deduction->tax_deduction); ?>/-TK</td><br>
                                                </tr>
                                                <tr>
                                                    <td class="text-right" colspan="2"><?php echo e(__('file.Other Deduction')); ?> :</td>
                                                    <td class="text-right" colspan="2" style="padding-right: 4%;"><?php echo e($deduction->other_deduction); ?>/-TK</td><br>
                                                </tr>
                                                <?php $__currentLoopData = $other_deduction; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td class="text-right" colspan="2"><?php echo e($row->deduction_name); ?> :</td>
                                                    <td class="text-right" colspan="2" style="padding-right: 4%;"><?php echo e($row->deduction_amount); ?>/-TK</td><br>
                                                </tr>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                            </tbody>
                                        </table>
                                    </div>
                                    <table>
                                        <tfoot>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="2"  class="text-right"><?php echo e(__('BASIC SALARY')); ?>:</td>
                                                <td class="text-right"><?php echo e($allowance->basic_salary); ?>/-TK</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="text-right"></td>
                                                <td colspan="2"  class="text-right"><?php echo e(__('TOTAL ALLOWANCE')); ?>:</td>
                                                <td class="text-right">
                                                    <?php echo e($payslip->total_allowance); ?>/-TK
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="text-right"></td>
                                                <td colspan="2"  class="text-right"><?php echo e(__('GROSS SALARY')); ?>:</td>
                                                <td class="text-right"><?php echo e(($payslip->gross_salary)); ?>/-TK</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="2"  class="text-right"><?php echo e(__('SALARY ADVANCE')); ?>:</td>
                                                <td class="text-right">- <?php echo e($payslip->salary_advance); ?>/-TK</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="2"  class="text-right"><?php echo e(__('TOTAL DEDUCTION')); ?>:</td>
                                                <td class="text-right">- <?php echo e(($payslip->total_deduction)); ?>/-TK</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="2"  class="text-right"><?php echo e(__('BONUS')); ?>:</td>
                                                <td class="text-right"><?php echo e($payslip->bonus); ?>/-TK</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="2"  class="text-right"><?php echo e(__('NET PAYABLE')); ?>:</td>
                                                <td class="text-right"><?php echo e($payslip->net_salary); ?>/-TK</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="2"  class="text-right"><?php echo e(__('file.DUE AMOUNT')); ?>:</td>
                                                <td class="text-right"><?php echo e($payslip->net_salary - $payslip->payment_amount); ?>/-TK</td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"></td>
                                                <td colspan="2"  class="text-right"><?php echo e(__('PAYABLE')); ?>:</td>
                                                <td class="text-right"><?php echo e($payslip->payment_amount); ?>/-TK</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    <table>
                                        <tr>
                                            <td>
                                                <div class="thanks"><h4><?php echo e(__('file.Thank you!')); ?></h4></div>
                                                <div class="notices">
                                                    <div><?php echo e(__('file.Note')); ?>:</div>
                                                    <div class="notice"><?php echo e($payslip->note); ?></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-size-10" style="width:250px;float:left;">
                                                    <p style="margin:0;padding:0;"><b class="text-uppercase"></b>
                                                        <br> </p>
                                                    <p class="dashed-border"></p>
                                                    <p style="margin:0;padding:0;"><?php echo e(__('file.Received By')); ?></p>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="font-size-10" style="width:250px;float:right;">
                                                    <p style="margin:0;padding:0;"><b class="text-uppercase"><?php echo e(\Illuminate\Support\Facades\Auth::user()->name); ?></b></p>
                                                    <p class="dashed-border"></p>
                                                    <p style="margin:0;padding:0;"><?php echo e(__('file.Authorized By')); ?></p>
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
            //QR Code Print
            $(document).on('click','#print-invoice',function(){
                var mode = 'iframe'; // popup
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/salary-payment/payslip.blade.php ENDPATH**/ ?>