

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
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Product','name' => 'product_id','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Product','name' => 'product_id','col' => 'col-md-4','class' => 'selectpicker']); ?>
                            <?php if(!$products->isEmpty()): ?>
                            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($product->id); ?>"><?php echo e($product->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                        <div class="form-group col-md-4">
                            <label for="name">Choose Your Date</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed" value="">
                                <input type="hidden" id="start_date" name="start_date" value="">
                                <input type="hidden" id="end_date" name="end_date" value="">
                            </div>
                        </div>
                        
                        <div class="col-md-4">
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
                </form>
            </div>
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row" style="position:relative;">
                        <div class="col-sm-12">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        <th class="text-center">Date</th>
                                        <th>Product</th>
                                        <th class="text-center">Unit</th>
                                        
                                        <th class="text-right">Prev. Qty</th>
                                        <?php if(permission('finish-goods-stock-price-view')): ?>
                                        <th class="text-right">Prev. Rate</th>
                                        <th class="text-right">Prev. Value</th>
                                        <?php endif; ?>
                                        
                                        <th class="text-center">Batch No.</th>
                                        <th class="text-center">SRINV No.</th>
                                        <th class="text-right">Stock In Qty</th>
                                        <?php if(permission('finish-goods-stock-price-view')): ?>
                                        <th class="text-right">Stock In Rate</th>
                                        <th class="text-right">Stock In Value</th>
                                        <?php endif; ?>

                                        <th class="text-center">Invoice No.</th>
                                        <th class="text-right">Stock Out Qty</th>
                                        <?php if(permission('finish-goods-stock-price-view')): ?>
                                        <th class="text-right">Stock Out Rate</th>
                                        <th class="text-right">Stock Out Value</th>
                                        <?php endif; ?>
                                       
                                        <th class="text-right">Curr. Qty</th>
                                        
                                        <th class="text-right">Curr. Rate</th>
                                        <th class="text-right">Curr. Value</th>
                                        
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                        <div class="col-md-12 d-none" id="table-loader" style="position: absolute;top:80px;left:0;">
                            <div style="width: 120px;
                            height: 70px;
                            background: white;
                            text-align: center;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            border: 1px solid #ddd;
                            border-radius: 5px;
                            margin: 0 auto;">
                                <i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i>
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

<?php $__env->startPush('scripts'); ?>
<script src="js/knockout-3.4.2.js"></script>
<script src="js/moment.js"></script>
<script src="js/daterangepicker.min.js"></script>
<script>
    $('.daterangepicker-filed').daterangepicker({
        callback: function(startDate, endDate, period){
            var start_date = startDate.format('YYYY-MM-DD');
            var end_date   = endDate.format('YYYY-MM-DD');
            var title = start_date + ' To ' + end_date;
            $(this).val(title);
            $('input[name="start_date"]').val(start_date);
            $('input[name="end_date"]').val(end_date);
        }
    });
    var table;
    $(document).ready(function(){

    
        $('#btn-filter').click(function () {
            let start_date = $('#start_date').val();
            let end_date   = $('#end_date').val();
            let product_id = $('#product_id option:selected').val();
            if(product_id)
            {
                $.ajax({
                    url: "<?php echo e(route('product.stock.ledger.data')); ?>",
                    type: "POST",
                    data: {start_date:start_date,end_date:end_date,product_id:product_id,_token:_token},
                    beforeSend: function(){
                        $('#table-loader').removeClass('d-none');
                    },
                    complete: function(){
                        $('#table-loader').addClass('d-none');
                    },
                    success:function(data){
                        if(data)
                        {
                            $('#dataTable tbody').html('');
                            $('#dataTable tbody').html(data);
                        }else{
                            $('#dataTable tbody').html('');
                        }
                    },
                    error: function (xhr, ajaxOption, thrownError) {
                        console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                    }
                });
            }else{
                notification('error','Please select material');
            }
        });
    
        $('#btn-reset').click(function () {
            $('#form-filter')[0].reset();
            $('#form-filter .selectpicker').selectpicker('refresh');
            $('#form-filter #start_date').val('');
            $('#form-filter #end_date').val('');
            $('#dataTable tbody').html('');
        });
 
    });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/StockLedger\Resources/views/finished-goods-ledger/index.blade.php ENDPATH**/ ?>