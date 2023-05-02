<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
    <link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title">
                        <h3 class="card-label">
                            <i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?>

                        </h3>
                    </div>
                    <div class="card-toolbar">
                        <button type="button" class="btn btn-primary btn-sm mr-3" id="print-labor-bill">
                            <i class="fas fa-print"></i> <?php echo e(__('Print')); ?>

                        </button>
                        <a href="<?php echo e(route('dashboard')); ?>" class="btn btn-warning btn-sm font-weight-bolder">
                            <i class="fas fa-arrow-left"></i> <?php echo e(__('Back')); ?>

                        </a>
                    </div>
                </div>
            </div>
            <form action="<?php echo e(route('income.statement.report')); ?>" method="GET">
                <?php echo csrf_field(); ?>
                <div class="card card-custom gutter-b">
                    <div class="card-header flex-wrap py-5">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <div class="row">
                                <div class="col-md-10">
                                    <input type="date" class="form-control" name="date">
                                </div>
                                <div class="col-md-2">
                                    <button type="submit"
                                        class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right"
                                        data-toggle="tooltip" data-theme="dark" title="<?php echo e(__('Search')); ?>"><i
                                            class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                </div>
            </form>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div id="invoice" class="col-md-12 labor-bill">
                                <style>
                                    body,
                                    html {
                                        background: #fff !important;
                                        -webkit-print-color-adjust: exact !important;
                                    }

                                    .invoice {
                                        /* position: relative; */
                                        background: #fff !important;
                                        /* min-height: 680px; */
                                    }

                                    #print-labor-bill:last-child {
                                        page-break-after: auto !important;
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
                                        background: #036;
                                        color: #fff;
                                        padding: 15px;
                                        border-bottom: 1px solid #fff
                                    }

                                    .invoice table td {
                                        padding: 10px;
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
                                        color: #fff;
                                        background: #036
                                    }

                                    .invoice table .total {
                                        background: #036;
                                        color: #fff
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

                                    .dashed-border {
                                        width: 180px;
                                        height: 2px;
                                        margin: 0 auto;
                                        padding: 0;
                                        border-top: 1px dashed #454d55 !important;
                                    }

                                    .double-border {
                                        border-top: double black !important;
                                    }

                                    @media  screen {
                                        .no_screen {
                                            display: none;
                                        }

                                        .no_print {
                                            display: block;
                                        }

                                        thead {
                                            display: table-header-group;
                                        }

                                        tfoot {
                                            display: table-footer-group;
                                        }

                                        button {
                                            display: none;
                                        }

                                        body {
                                            margin: 0;
                                        }
                                    }

                                    @media  print {

                                        body,
                                        html {
                                            -webkit-print-color-adjust: exact !important;
                                            font-family: sans-serif;
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
                                            overflow: hidden !important;
                                            background: #fff !important;
                                            margin-bottom: 100px !important;
                                        }

                                        .invoice footer {
                                            position: absolute;
                                            bottom: 0;
                                            left: 0;
                                        }

                                        .hidden-print {
                                            display: none !important;
                                        }

                                        .dashed-border {
                                            width: 180px;
                                            height: 2px;
                                            margin: 0 auto;
                                            padding: 0;
                                            border-top: 1px dashed #454d55 !important;
                                        }
                                    }

                                    @page  {
                                        /* size: auto; */
                                        margin: 5mm 5mm;
                                    }
                                </style>
                                <div class="invoice overflow-auto">
                                    <div class="col-md-12 py-5">
                                        <table>
                                            <tr>
                                                <td class="text-left" style="width: 20%;">
                                                </td>
                                                <td class="text-center" style="width: 60%;">
                                                    <h2 class="name m-0" style="text-transform: uppercase;">
                                                        <b><?php echo e(config('settings.title') ? config('settings.title') : env('APP_NAME')); ?></b>
                                                    </h2>
                                                    <?php if(config('settings.address')): ?>
                                                        <h3 style="font-weight: normal;margin:0;">
                                                            <?php echo e(config('settings.address')); ?></h3>
                                                    <?php endif; ?>
                                                    <div
                                                        style="width: 250px;background:#036;color:white;font-weight:bolder;margin:5px auto 0 auto;padding: 5px 0;border-radius: 15px;text-align:center;">
                                                        <?php echo e(__('Income Statement Report')); ?></div>
                                                </td>
                                                <td class="text-right" style="width: 20%;">
                                                    <?php if(config('settings.contact_no')): ?>
                                                        <div>
                                                            <span><?php echo e(__('Pro')); ?>:</span><span><?php echo e(config('settings.contact_no')); ?></span>
                                                        </div>
                                                    <?php endif; ?>
                                                    <div><span><?php echo e(__('Office')); ?>:</span><span><?php echo e('01716447882'); ?></span>
                                                    </div>
                                                    <div>
                                                        <span><?php echo e(__('Director')); ?>:</span><span><?php echo e('01734657951'); ?></span>
                                                    </div>
                                                    <?php if(config('settings.email')): ?>
                                                        <div>
                                                            <span><?php echo e(__('Email')); ?>:</span><span><?php echo e(config('settings.email')); ?></span>
                                                        </div>
                                                    <?php endif; ?>
                                                </td>
                                            </tr>
                                        </table>
                                        <table class="table table-bordered">
                                            <tr>
                                                <th colspan="5" class="text-center"><?php echo e(__('Income')); ?></th>
                                            </tr>
                                            <?php $__currentLoopData = $sales; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Memo No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->debit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Sale')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalSale)); ?> TK</td>
                                            </tr>
                                            <?php $__currentLoopData = $tenant; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Memo No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->debit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Tenant')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalTenant)); ?> TK</td>
                                            </tr>
                                            <?php $__currentLoopData = $incomePersonalLoan; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Voucher No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->debit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php $__currentLoopData = $incomeOfficialLoan; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Voucher No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->debit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Loan')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalIncomePersonalLoan + $totalExpenseOfficialLoan)); ?>

                                                    TK</td>
                                            </tr>
                                            <?php $__currentLoopData = $machineService; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Voucher No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->debit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Machine Service')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalMachineService)); ?> TK</td>
                                            </tr>
                                            <?php $__currentLoopData = $transportService; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Voucher No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->debit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Transport Service')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalTransportService)); ?> TK</td>
                                            </tr>
                                            <tr>
                                                <th colspan="5" class="text-center"><?php echo e(__('Expense')); ?></th>
                                            </tr>
                                            <?php $__currentLoopData = $purchases; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Memo No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->credit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Purchase')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalPurchase)); ?> TK</td>
                                            </tr>
                                            <?php $__currentLoopData = $expensePersonalLoan; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Voucher No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->credit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php $__currentLoopData = $expenseOfficialLoan; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Voucher No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->credit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Loan')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalExpensePersonalLoan + $totalExpenseOfficialLoan)); ?>

                                                    TK</td>
                                            </tr>
                                            <?php $__currentLoopData = $machinePurchase; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Voucher No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->credit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Machine Purchase')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalMachinePurchase)); ?> TK</td>
                                            </tr>
                                            <?php $__currentLoopData = $laborBill; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Voucher No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->credit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Labor Bill')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalLaborBill)); ?> TK</td>
                                            </tr>
                                            <?php $__currentLoopData = $expense; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="3" class="text-left">
                                                        <div><span><?php echo e(__('Voucher No')); ?> :
                                                            </span><span><?php echo e($value->voucher_no); ?></span></div>
                                                        <div><span><?php echo e(__('Description')); ?> :
                                                            </span><span><?php echo e($value->description); ?></span></div>
                                                    </td>
                                                    <td colspan="2" class="text-left">
                                                        <div>
                                                            <?php echo e(number_format($value->credit)); ?> TK
                                                        </div>
                                                    </td>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td colspan="4" class="text-left"><?php echo e(__('Other Expense')); ?></td>
                                                <td colspan="1" class="text-right double-border">
                                                    <?php echo e(number_format($totalExpense)); ?> TK</td>
                                            </tr>
                                            <tr>
                                                <th colspan="5" class="text-right"><?php echo e(__('Cash In Hand')); ?> :
                                                    <?php echo e($cash); ?> tk</th>
                                            </tr>
                                            <?php $__currentLoopData = $banks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $bank): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <th colspan="5" class="text-right"><?php echo e(__('Bank')); ?>

                                                        <?php echo e($bank->name); ?>: <?php echo e($bank->calculation($date, $bank->id)); ?>

                                                        tk</th>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php $__currentLoopData = $mobileBanks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $bank): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <th colspan="5" class="text-right"><?php echo e(__('Bank')); ?>

                                                        <?php echo e($bank->name); ?>: <?php echo e($bank->calculation($date, $bank->id)); ?>

                                                        tk</th>
                                                </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
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
    <script src="<?php echo e(asset('js/jquery.printarea.js')); ?>"></script>
    <script>
        $(document).ready(function() {
            $(document).on('click', '#print-labor-bill', function() {
                var mode = 'iframe'; // popup
                var close = mode == "popup";
                var options = {
                    mode: mode,
                    popClose: close
                };
                $(".labor-bill").printArea(options);
            });

        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Report\Resources/views/incomeStatement/index.blade.php ENDPATH**/ ?>