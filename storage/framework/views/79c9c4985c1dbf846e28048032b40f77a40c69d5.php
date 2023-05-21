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
                <div class="card-toolbar">
                    <!--begin::Button-->
                    <a href="<?php echo e(route('product')); ?>" class="btn btn-warning btn-sm font-weight-bolder">
                        <i class="fas fa-arrow-left"></i> Back</a>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom" style="padding-bottom: 100px !important;">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="text-center p-3"><?php echo e($product->name); ?></h4>
                    </div>
                    <?php if(!empty($product->image)): ?>
                    <div class="col-md-3">
                        <img src="<?php echo e(asset('storage/'.PRODUCT_IMAGE_PATH.$product->image)); ?>" alt="<?php echo e($product->name); ?>" style="max-width: 100%;">
                    </div>
                    <?php else: ?>
                    <div class="col-md-3">
                        <img src="<?php echo e(asset('images/product.svg')); ?>" alt="<?php echo e($product->name); ?>" style="max-width: 60%;">
                    </div>

                    <?php endif; ?>
                    <div class="col-md-9 pt-5 table-responsive">
                        <table class="table table-borderless table-hover">
                            <tr>
                                <td><b>Category</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e($product->category->name); ?></td>
                                <td><b>Barcode Symbol</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e(BARCODE_SYMBOL[$product->barcode_symbology] ?? ''); ?></td>
                            </tr>
                            <tr>
                                <td><b>Barcode</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e($product->code); ?></td>
                                <td><b>Cost</b></td> <td class="text-center"><b>:</b></td> <td>BDT <?php echo e(number_format($product->cost,2)); ?></td>
                            </tr>
                            <tr>
                                <td><b>Unit</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e($product->base_unit->unit_name.'('.$product->base_unit->unit_code.')'); ?></td>
                                

                                <td><b>Price</b></td> <td class="text-center"><b>:</b></td> <td>BDT <?php echo e(number_format($product->base_unit_price,2)); ?></td>
                                
                            </tr>
                            <tr>
                                <td><b>Stock Qunatity Base Unit</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e(number_format($product->base_unit_qty,2)); ?></td>
                                
                                <td><b>Alert Quantity</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e($product->alert_quantity); ?></td>

                            </tr>
                            <tr>
                                <td><b>Tax</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e($product->tax->rate); ?>%</td>
                                <td><b>Tax Method</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e(TAX_METHOD[$product->tax_method]); ?></td>

                            </tr>
                            <tr>
                                <td><b>Created By</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e($product->created_by); ?></td>
                                <td><b>Created At</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e(date('j-F-Y h:i:sA',strtotime($product->created_at))); ?></td>

                            </tr>
                            <tr>
                                <td><b>Updated By</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e($product->modified_by ? $product->modified_by : ''); ?></td>
                                <td><b>Updated At</b></td> <td class="text-center"><b>:</b></td> <td><?php echo e($product->modified_by ? date('j-F-Y h:i:sA',strtotime($product->updated_at)) : ''); ?></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="card card-custom mt-5">
                    <div class="card-header">
                        <div class="card-toolbar">
                            <ul class="nav nav-bold nav-pills">

                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#materials">Materials</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#description">Description</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="tab-content">

                            <div class="tab-pane fade show active" id="materials" role="tabpanel" aria-labelledby="materials">
                                <?php if(!$product->product_material->isEmpty()): ?>
                                <ol>
                                    <?php $__currentLoopData = $product->product_material; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <li><?php echo e($item->material_name); ?></li>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </ol>
                                <?php endif; ?>
                            </div>
                            <div class="tab-pane fade" id="description" role="tabpanel" aria-labelledby="description">
                                <?php if(!empty($prduct->description)): ?>
                                    <div class="padding-top-10px text-justify">
                                        <?php echo $prduct->description; ?>

                                    </div>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Product\Resources/views/details.blade.php ENDPATH**/ ?>