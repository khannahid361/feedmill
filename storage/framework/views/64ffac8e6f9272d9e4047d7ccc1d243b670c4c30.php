<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                    <div class="card-toolbar">
                        <button type="button" class="btn btn-primary btn-sm mr-3" id="print-invoice"> <i class="fas fa-print"></i> Print</button>
                        <a href="<?php echo e(route('sale')); ?>" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a>
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
                                    background: #fff !important;
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
                                    padding: 10px;
                                    border-bottom: 1px solid #fff
                                }
                                .invoice table td {
                                    padding: 5px;
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
                                    padding: 5px;
                                    border-top: 1px solid #aaa;
                                    font-weight: bold;
                                }
                                .invoice table tfoot tr:first-child td {
                                    border-top: none
                                }
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
                                        margin-bottom: 100px !important;
                                        position: relative;
                                    }
                                    .invoice footer {
                                        position: absolute;
                                        bottom: 0;
                                        left: 0;
                                    }
                                    .hidden-print {
                                        display: none !important;
                                    }
                                    .dashed-border{
                                        width:180px;height:2px;margin:0 auto;padding:0;border-top:1px dashed #454d55 !important;
                                    }
                                }
                                @page  {
                                    margin: 5mm 5mm;
                                }
                            </style>
                            <div class="invoice" style="position: relative;">
                                <div>
                                    <table>
                                        <tr>
                                            <td class="text-center">

                                                <h1 class="name m-0" style="text-transform: uppercase;"><b><?php echo e(config('settings.title') ? config('settings.title') : env('APP_NAME')); ?></b></h1>
                                                <?php if(config('settings.address')): ?><p style="font-weight: normal;margin:0;"><b>Address: </b><?php echo e(config('settings.address')); ?></p><?php endif; ?>
                                                <?php if(config('settings.contact_no')): ?><p style="font-weight: normal;margin:0;"><b>Contact No.: </b><?php echo e(config('settings.contact_no')); ?>, <?php if(config('settings.email')): ?><b>Email: </b><?php echo e(config('settings.email')); ?><?php endif; ?></p><?php endif; ?>
                                                <p style="font-weight: normal;margin:0;"><b>Factory Address: </b>Bakua, Ullapara-6760, Sirajganj</p>
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="width: 100%;height:3px;border-top:2px solid #036;"></div>
                                    <table>
                                        <tr>
                                            <td>Warehouse</td>
                                            <td>Customer</td>
                                            <td>Delivery Date</td>
                                        </tr>
                                        <tr>
                                            <td><?php echo e($details->warehouse->name); ?></td>
                                            <td><?php echo e($details->customer->name); ?></td>
                                            <td><?php echo e($details->delivery_date); ?></td>
                                        </tr>
                                    </table>
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <thead>
                                        <tr class="text-center">
                                            <th>SL</th>
                                            <th>Product</th>
                                            <th>Delivered Quantity</th>
                                            <th>Delivery Quantity</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php if(!$details->deliveryProduct->isEmpty()): ?>
                                            <?php $__currentLoopData = $details->deliveryProduct; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr class="text-center">
                                            <td><?php echo e($loop->index + 1); ?></td>
                                            <td><?php echo e($value->product->name); ?></td>
                                            <td><?php echo e($value->delivered_qty); ?></td>
                                            <td><?php echo e($value->delivery_qty); ?></td>
                                        </tr>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <td colspan="2"></td>
                                            <td><button type="button" class="btn btn-primary btn-block text-right">Total Delivery Quantity</button></td>
                                            <td><button type="button" class="btn btn-primary btn-block text-left"><?php echo e($details->total_delivery_quantity); ?></button></td>
                                        </tr>
                                        </tfoot>
                                    </table>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="text-center">
                                                <div class="font-size-10" style="width:250px;float:left;padding-top:75px;">
                                                    <p style="margin:0;padding:0;"></p>
                                                    <p class="dashed-border"></p>
                                                    <p style="margin:0;padding:0;text-transform: capitalize;font-weight:normal;">Customer Signature & Date</p>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="font-size-10" style="width:250px;float:right;padding-top:75px;">
                                                    <p class="dashed-border"></p>
                                                    <p style="margin:0;padding:0;text-transform: capitalize;font-weight:normal;">Authorised By</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="no_screen" style="position: absolute;top:40%;left:10%;opacity:0.2;">
                                    <img src="<?php echo e(asset('storage/'.LOGO_PATH.config('settings.logo'))); ?>" style="width: 80%;" alt="Logo" />
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Sale\Resources/views/invoice.blade.php ENDPATH**/ ?>