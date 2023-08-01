<?php $__env->startSection('title', $page_title); ?>

<?php $__env->startPush('styles'); ?>
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
    <style>
        #form-tab li a.active {
            background: #034d97 !important;
            color: white !important;
        }

        .nav-link {
            position: relative;
            border-radius: 5px !important;
            background: #E4E6EF;
            color: #7E8299;
        }

        .remove-tab {
            position: absolute;
            top: -10px;
            right: -3px;
            border-radius: 50%;
            font-size: 20px;
        }
    </style>
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
                        <a href="<?php echo e(route('production')); ?>" class="btn btn-warning btn-sm font-weight-bolder">
                            <i class="fas fa-arrow-left"></i> Back</a>
                        <!--end::Button-->
                    </div>
                </div>
            </div>
            <!--end::Notice-->
            <!--begin::Card-->
            <div class="card card-custom" style="padding-bottom: 100px !important;">
                <form id="store_or_update_form" method="post">
                    <?php echo csrf_field(); ?>
                    <input type="hidden" name="update_id" value="<?php echo e($production->id); ?>">
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="row">
                                <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Batch No.','name' => 'batch_no','value' => ''.e($production->batch_no).'','property' => 'readonly','required' => 'required','col' => 'col-md-4']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Batch No.','name' => 'batch_no','value' => ''.e($production->batch_no).'','property' => 'readonly','required' => 'required','col' => 'col-md-4']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Date','name' => 'start_date','required' => 'required','col' => 'col-md-4','property' => 'readonly','class' => 'date','value' => ''.e($production->start_date).'']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Date','name' => 'start_date','required' => 'required','col' => 'col-md-4','property' => 'readonly','class' => 'date','value' => ''.e($production->start_date).'']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Depo','name' => 'warehouse_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Depo','name' => 'warehouse_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                    <?php if(!$warehouses->isEmpty()): ?>
                                        <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($warehouse->id); ?>"
                                                <?php echo e($production->warehouse_id == $warehouse->id ? 'selected' : ''); ?>>
                                                <?php echo e($warehouse->name); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php endif; ?>
                                 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            </div>
                        </div>
                        <div class="col-md-12 pt-5">
                            <ul class="nav nav-tabs nav-tabs-2" id="form-tab" role="tablist"
                                style="border-bottom: 0px !important;justify-content: space-between;">
                                
                                <?php if(!$production->products->isEmpty()): ?>
                                    <?php $__currentLoopData = $production->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <li class="nav-item mx-0 mb-3" id="tab<?php echo e($key + 1); ?>">
                                            <a class="nav-link <?php echo e($key == 0 ? 'active' : ''); ?> text-center step  step-<?php echo e($key + 1); ?>"
                                                data-toggle="tab" href="#tab-<?php echo e($key + 1); ?>"
                                                role="tab">Product-<?php echo e($key + 1); ?></a>
                                        </li>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>

                            </ul>

                            <input type="hidden" name="tab" id="check_tab">
                            <div class="tab-content">
                                <?php if(!$production->products->isEmpty()): ?>
                                    <?php $__currentLoopData = $production->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <div class="tab-pane <?php echo e($key == 0 ? 'active' : ''); ?>  step step-<?php echo e($key + 1); ?>  p-3"
                                            id="tab-<?php echo e($key + 1); ?>" role="tabpanel">
                                            <div class="row" id="production_<?php echo e($key + 1); ?>">
                                                <div class="col-md-12 px-0" style="border-top: 5px solid #024c96;">
                                                    <div class="card card-custom card-fit card-border"
                                                        style="border-radius: 0 !important;">
                                                        <div class="card-body py-5">
                                                            <div class="row">
                                                                <div class="form-group col-md-12 required">
                                                                    <label>Product</label>
                                                                    <input type="text" class="form-control"
                                                                        value="<?php echo e($item->product->name); ?>">
                                                                    <input type="hidden" class="form-control"
                                                                        value="<?php echo e($item->id); ?>"
                                                                        name="production[<?php echo e($key + 1); ?>][production_product_id]"
                                                                        id="production_<?php echo e($key + 1); ?>_production_product_id">
                                                                    <input type="hidden" class="form-control"
                                                                        value="<?php echo e($item->product_id); ?>"
                                                                        name="production[<?php echo e($key + 1); ?>][product_id]"
                                                                        id="production_<?php echo e($key + 1); ?>_product_id">
                                                                </div>
                                                                <div class="form-group col-md-3 required">
                                                                    <label for="mfg_date">Mfg. Date</label>
                                                                    <input type="text"
                                                                        class="form-control date total-time"
                                                                        name="production[1][mfg_date]"
                                                                        id="production_1_mfg_date"
                                                                        value="<?php echo e($item->mfg_date); ?>" readonly
                                                                        onblur="setExpireTime();" />
                                                                </div>
                                                                <div class="form-group col-md-3 required">
                                                                    <label for="exp_date">Exp. Date</label>
                                                                    <input type="text"
                                                                        class="form-control date total-time"
                                                                        name="production[1][exp_date]"
                                                                        id="production_1_exp_date"
                                                                        value="<?php echo e($item->exp_date); ?>"
                                                                        onblur="setExpireTime();" readonly />
                                                                </div>
                                                                <div class="form-group col-md-3 required">
                                                                    <label for="production_1_year">Total Months </label>
                                                                    <input type="text" name="production[1][year]"
                                                                        id="production_1_year" class="form-control "
                                                                        value="<?php echo e($item->year); ?>" placeholder=""
                                                                        readonly>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 py-5">
                                                    <div class="row" id="production_materials_<?php echo e($key + 1); ?>">
                                                        <?php if(!$item->materials->isEmpty()): ?>
                                                            <div class="col-md-12 py-5 table-responsive">
                                                                <div class="col-md-12 text-center">
                                                                    <h5 class="bg-warning text-white p-3"
                                                                        style="width:250px;margin: 20px auto 10px auto;">
                                                                        Materials</h5>
                                                                </div>
                                                                <table class="table table-bordered pb-5"
                                                                    id="material_table_<?php echo e($key + 1); ?>">
                                                                    <div class="col-md-12 text-center">
                                                                        <div class="row">
                                                                            <div class="col-md-6"></div>
                                                                            <div class="col-md-2 required">
                                                                                <label style="padding-top: 10px;">Total
                                                                                    Finished Quantity</label>
                                                                            </div>
                                                                            <div class="col-md-4 mb-4">
                                                                                <input type="text"
                                                                                    class="form-control text-center finishedQty finished-qty"
                                                                                    value="<?php echo e($item->base_unit_qty); ?>"
                                                                                    name="production[<?php echo e($key + 1); ?>][base_unit_qty]"
                                                                                    id="finished_qty">
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <thead class="bg-primary">
                                                                        <th width="30%">Material</th>
                                                                        
                                                                        <th width="10%" class="text-center">Material Qty
                                                                        </th>
                                                                        <th width="10%" class="text-right">Rate</th>
                                                                        <th width="15%" class="text-center">Stk. Avl.
                                                                            Qty</th>
                                                                        <th width="15%" class="text-center">Received
                                                                            QTY</th>
                                                                        <th width="17%" class="text-right">Total</th>
                                                                    </thead>
                                                                    <?php
                                                                        $totalMaterial = 0;
                                                                        $totalAmnt = 0;
                                                                    ?>
                                                                    <tbody>
                                                                        <?php $__currentLoopData = $item->materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                        <?php
                                                                            $productId = $item->product_id;
                                                                            // $materialUnitQty =
                                                                        ?>
                                                                            <tr>
                                                                                <?php
                                                                                    $totalMaterial += $value->pivot->qty;

                                                                                    $totalAmnt += $value->pivot->cost * $value->pivot->qty;
                                                                                ?>
                                                                                <td>
                                                                                    <?php echo e($value->material_name . ' (' . $value->material_code . ')'); ?>

                                                                                    <input type="hidden"
                                                                                        class="form-control text-center"
                                                                                        value="<?php echo e($value->pivot->id); ?>"
                                                                                        name="production[<?php echo e($key + 1); ?>][materials][<?php echo e($index + 1); ?>][production_material_id]"
                                                                                        id="production_<?php echo e($key + 1); ?>_materials_<?php echo e($index + 1); ?>_production_material_id"
                                                                                        data-id="<?php echo e($index + 1); ?>"
                                                                                        readonly>
                                                                                    <input type="hidden"
                                                                                        class="form-control text-center"
                                                                                        value="<?php echo e($value->id); ?>"
                                                                                        name="production[<?php echo e($key + 1); ?>][materials][<?php echo e($index + 1); ?>][material_id]"
                                                                                        id="production_<?php echo e($key + 1); ?>_materials_<?php echo e($index + 1); ?>_material_id"
                                                                                        data-id="<?php echo e($index + 1); ?>"
                                                                                        readonly>
                                                                                    <input type="hidden"
                                                                                        class="form-control"
                                                                                        value="<?php echo e($value->unit_id); ?>"
                                                                                        name="production[<?php echo e($key + 1); ?>][materials][<?php echo e($index + 1); ?>][unit_id]"
                                                                                        id="production_<?php echo e($key + 1); ?>_materials_<?php echo e($index + 1); ?>_unit_id"
                                                                                        data-id="<?php echo e($index + 1); ?>">
                                                                                    <input type="hidden"
                                                                                        class="form-control text-right"
                                                                                        value="<?php echo e($value->pivot->cost); ?>"
                                                                                        name="production[<?php echo e($key + 1); ?>][materials][<?php echo e($index + 1); ?>][cost]"
                                                                                        id="production_<?php echo e($key + 1); ?>_materials_<?php echo e($index + 1); ?>_cost"
                                                                                        data-id="<?php echo e($index + 1); ?>"
                                                                                        readonly>
                                                                                    <input type="hidden"
                                                                                        class="form-control text-right stock_qty"
                                                                                        value="<?php echo e($value->qty); ?>"
                                                                                        name="production[<?php echo e($key + 1); ?>][materials][<?php echo e($index + 1); ?>][stock_qty]"
                                                                                        id="production_<?php echo e($key + 1); ?>_materials_<?php echo e($index + 1); ?>_stock_qty"
                                                                                        data-id="<?php echo e($index + 1); ?>">

                                                                                    <input type="hidden" class="track"
                                                                                        data-qty="<?php echo e($value->pivot->qty); ?>"
                                                                                        data-cost="<?php echo e(round($value->pivot->cost,2)); ?>"
                                                                                        data-stock_qty="<?php echo e($value->qty); ?>"
                                                                                        data-total="production_<?php echo e($key + 1); ?>_materials_<?php echo e($index + 1); ?>_total"
                                                                                        data-tab="<?php echo e($index + 1); ?>" />

                                                                                    <input type="hidden" readonly
                                                                                        name=""
                                                                                        value="<?php echo e($value->pivot->used_qty / $item->base_unit_qty); ?>"
                                                                                        class="unit-qty" id=""
                                                                                        data-id="<?php echo e($index + 1); ?>" data-tab="<?php echo e($key + 1); ?>" data-unitcost=<?php echo e($value->pivot->cost); ?>>
                                                                                </td>
                                                                                <td class="text-center">
                                                                                    <?php echo e($value->pivot->used_qty / $item->base_unit_qty); ?>

                                                                                </td>
                                                                                <td class="text-right">
                                                                                    <?php echo e(number_format($value->pivot->cost, 2, '.', '')); ?>


                                                                                </td>
                                                                                <td class="text-center">
                                                                                    <?php echo e($value->qty); ?>

                                                                                    (<?php echo e($value->unit->unit_name); ?>)
                                                                                </td>
                                                                                <td class="text-center">
                                                                                    <input type="text"
                                                                                        class="form-control text-right"
                                                                                        value="<?php echo e($value->pivot->qty); ?>"
                                                                                        name="production[<?php echo e($key + 1); ?>][materials][<?php echo e($index + 1); ?>][qty]"
                                                                                        id="production_<?php echo e($key + 1); ?>_materials_<?php echo e($index + 1); ?>_q_ty"
                                                                                        data-id="<?php echo e($index + 1); ?>"
                                                                                        readonly>
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text"
                                                                                        class="form-control text-right total material-amount"
                                                                                        value="<?php echo e(number_format($value->pivot->cost * $value->pivot->qty, 2, '.', '')); ?>"
                                                                                        name="production[<?php echo e($key + 1); ?>][materials][<?php echo e($index + 1); ?>][total]"
                                                                                        id="production_<?php echo e($key + 1); ?>_materials_<?php echo e($index + 1); ?>_total"
                                                                                        data-id="<?php echo e($index + 1); ?>"
                                                                                        readonly>
                                                                                </td>
                                                                            </tr>
                                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                        <tr>
                                                                            <td colspan="3">Total</td>
                                                                            <td class="text-right"><span
                                                                                    id="materialQty"><?php echo e($totalMaterial); ?></span>
                                                                            </td>
                                                                            <td colspan="4" class="text-right"><span
                                                                                    id="materialAmnt"><?php echo e($totalAmnt); ?></span>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        <?php endif; ?>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-3 required">
                                                    <label for="">Remaining Mixture</label>
                                                    <input type="text" class="form-control" name=""
                                                        id="remaining_mixture"
                                                        value="<?php echo e($wastage->recyclable_wastage ?? '0'); ?>" readonly />
                                                </div>
                                                <div class="form-group col-md-3 required">
                                                    <label for="">Used Mixture</label>
                                                    <input type="text" class="form-control" name="used_wastage_qty"
                                                        id="used_wastage_qty" onkeyup="checkUsedMixtureQty();"
                                                        value="<?php echo e($item->used_wastage_qty); ?>" required />
                                                </div>
                                            </div>
                                        </div>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary btn-sm mr-5 float-right"
                            onclick="check_material_stock()" id="save-btn"><i class="fas fa-sync-alt"></i>
                            Update</button>
                    </div>
                </form>
            </div>
            <!--end::Card-->
        </div>
    </div>
    <?php echo $__env->make('production::production.view-modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
    <script src="js/moment.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>
    <script>
        $(document).ready(function () {
            $(document).on('keyup', '.finished-qty', function() {
                let totalMaterial = 0;
                let totalMoney = 0;
                let finishedQty = $(this).val();
                // $('.material-amount').each(function() {
                //     let materialAmnt = $(this).val();
                //     totalMoney = totalMoney + parseFloat(materialAmnt);
                // });

                $('.unit-qty').each(function() {
                    let unit = $(this).val();
                    let materialQty = unit * finishedQty;
                    materialQty = materialQty.toFixed(2);
                    let dataId = $(this).data('id');
                    let datatab = $(this).data('tab');
                    let unitCost = $(this).data('unitcost');
                    let materialId = '#production_'+datatab+'_materials_'+dataId+'_q_ty';
                    let materialTotal = '#production_'+datatab+'_materials_'+dataId+'_total';
                    let materialAmnt = unitCost * parseFloat(materialQty);
                    materialAmnt = materialAmnt.toFixed(2);
                    totalMoney += parseFloat(materialAmnt);
                    $(materialId).val(materialQty);
                    $(materialTotal).val(materialAmnt);
                    totalMaterial = totalMaterial + parseFloat(materialQty);
                });
                $('#materialQty').text(totalMaterial);
                $('#materialAmnt').text(totalMoney);
            });
        });

        $(document).ready(function() {
            $('.date').datetimepicker({
                format: 'YYYY-MM-DD',
                ignoreReadonly: true
            });

        });


        // function calculateRowTotal(tab,row)
        // {
        //     var cost = parseFloat($('#production_'+tab+'_materials_'+row+'_cost').val());
        //     var qty = parseFloat($('#production_'+tab+'_materials_'+row+'_qty').val());
        //     var stock_qty = parseFloat($('#production_'+tab+'_materials_'+row+'_stock_qty').val());
        //     var total  = 0;
        //     if(cost > 0 && qty > 0)
        //     {
        //         if(qty > stock_qty){
        //             $('#production_'+tab+'_materials_'+row+'_qty').val(1);
        //             $('#production_'+tab+'_materials_'+row+'_total').val(parseFloat(cost).toFixed(2));
        //             notification('error','Quantity must be less than or equal to stock quantity!');
        //         }else{
        //             total = parseFloat(cost * qty).toFixed(2);
        //             $('#production_'+tab+'_materials_'+row+'_total').val(total);
        //         }
        //     }else{
        //         $('#production_'+tab+'_materials_'+row+'_total').val('');
        //     }
        // }

        function generateDate(number, tab) {
            var mfg_date = $('#production_' + tab + '_mfg_date').val();
            var exp_date = new Date(new Date(mfg_date).setFullYear(new Date(mfg_date).getFullYear() + parseInt(number)));
            $('#production_' + tab + '_exp_date').val(exp_date.toISOString().slice(0, 10));
        }


        function check_material_stock() {
            let form = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url = "<?php echo e(url('production/check-material-stock')); ?>";
            $.ajax({
                url: url,
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                cache: false,
                beforeSend: function() {
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete: function() {
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success: function(data) {
                    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                    $('#store_or_update_form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function(key, value) {
                            if(key == 'production.1.base_unit_qty')
                            {
                                $('#store_or_update_form input#finished_qty').addClass('is-invalid');
                                $('#store_or_update_form #finished_qty').parent().append(
                                    '<small class="error text-danger">Please Enter Finish Quantity</small>');
                            }
                            var key = key.split('.').join('_');
                            $('#store_or_update_form input#' + key).addClass('is-invalid');
                            $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                            $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                            $('#store_or_update_form #' + key).parent().append(
                                '<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        console.log(data);
                        if (data.status == 'success') {
                            update_data();
                        } else {
                            $('#view_modal #view-data').empty().html(data);
                            $('#view_modal').modal({
                                keyboard: false,
                                backdrop: 'static',
                            });
                            $('#view_modal .modal-title').html(
                                '<i class="fas fa-file-alt text-white"></i> <span> Material Stock Availibility Details</span>'
                            );
                        }
                    }
                },
                error: function(xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }

        function update_data() {
            let form = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url = "<?php echo e(url('production/update')); ?>";
            $.ajax({
                url: url,
                type: "POST",
                data: formData,
                dataType: "JSON",
                contentType: false,
                processData: false,
                cache: false,
                beforeSend: function() {
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete: function() {
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success: function(data) {
                    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                    $('#store_or_update_form').find('.error').remove();
                    // if (data.status == false) {
                    //     $.each(data.errors, function (key, value){
                    //         var key = key.split('.').join('_');
                    //         $('#store_or_update_form input#' + key).addClass('is-invalid');
                    //         $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                    //         $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                    //         $('#store_or_update_form #' + key).parent().append(
                    //         '<small class="error text-danger">' + value + '</small>');
                    //     });
                    // } else {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        window.location.replace("<?php echo e(url('production')); ?>");
                    }
                    // }
                },
                error: function(xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
    </script>

    <script>
        function _(x) {
            return document.getElementById(x);
        }

        $(document).on('input', '.other_cost', function() {
            let other_cost = $(this).val();
            let grand_t = $('#grand_total').val();
            let finishedqty = $('#finished_qty').val();

            _('grand_total').value = +_('g_tl').value + +other_cost;
            let a = $('#grand_total').val();

            _('cost_per_unit').value = a / finishedqty;
        });

        $(document).on('input', '.finishedQty', function() {
            let finishedQty = $(this).val();
            $('.track').each(function(i, k) {
                let s_qt = $(this).data('stock_qty') ? $(this).data('stock_qty') : 0;
                let qty = $(this).data('qty');
                if (s_qt > qty) {
                    let totalQtyCost =$(this).data('qty') * $(this)
                        .data('cost') * finishedQty;
                        totalQtyCost = totalQtyCost.toFixed(2);
                    document.getElementById($(this).data('total')).value =totalQtyCost;
                } else if (s_qt < qty) {
                    $(`#material_table_1 tbody tr:eq(${i})`).css({
                        'background': '#F64E60'
                    });
                }
            })
            calculation();
        });

        function calculation() {
            let total = 0;
            $('.total').each(function() {
                if ($(this).val() == '') {
                    total += +0;
                } else {
                    total += +$(this).val();
                }
            })
            _('g_tl').value = total;
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Production\Resources/views/production/edit.blade.php ENDPATH**/ ?>