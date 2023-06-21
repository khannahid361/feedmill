<?php $__env->startSection('title', $page_title); ?>

<?php $__env->startSection('content'); ?>
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <!--begin::Notice-->
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title">
                    <h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3>
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-custom card-border">
                                <div class="card-header bg-primary">
                                    <div class="card-title">
                                        <h3 class="card-label text-white">Return To Supplier</h3>
                                    </div>
                                </div>
                                <div class="card-body">
                                   <form class="form-inline col-md-12" action="<?php echo e(url('return/purchase')); ?>" method="get">
                                        <div class="form-group col-md-7">
                                            <label for="memo_no">Memo No:</label>
                                            <input type="text" name="memo_no"  class="form-control col-md-10" id="memo_no" placeholder="Enter Purchase Memo No" required="required">
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-md" style="margin-top:18px;">Serach</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-custom card-border">
                                <div class="card-header bg-primary">
                                    <div class="card-title">
                                        <h3 class="card-label text-white">Return From Customer</h3>
                                    </div>
                                </div>
                                <div class="card-body">
                                   <form class="form-inline col-md-12" action="<?php echo e(url('return/sale')); ?>" method="get">
                                        <div class="form-group col-md-7">
                                            <label for="memo_no">Memo No:</label>
                                            <input type="text" name="memo_no"  class="form-control col-md-10" id="memo_no" placeholder="Enter Sale Memo No" required="required">
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-md" style="margin-top:18px;">Serach</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card card-custom card-border">
                                <div class="card-header bg-primary">
                                    <div class="card-title">
                                        <h3 class="card-label text-white">Return From Dealer</h3>
                                    </div>
                                </div>
                                <div class="card-body">
                                   <form class="form-inline col-md-12" action="<?php echo e(url('return/dealer-sale')); ?>" method="get">
                                        <div class="form-group col-md-7">
                                            <label for="memo_no">Memo No:</label>
                                            <input type="text" name="memo_no"  class="form-control col-md-10" id="memo_no" placeholder="Enter Sale Memo No" required="required">
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-md" style="margin-top:18px;">Serach</button>
                                    </form>
                                </div>
                            </div>
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/StockReturn\Resources/views/form.blade.php ENDPATH**/ ?>