
<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startSection('content'); ?>
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                <div class="card-toolbar">
                    <?php if($production->production_status != 3): ?>
                    <button type="button" class="btn btn-primary btn-sm mr-5" onclick="store_data()" id="save-btn"><i class="fas fa-save"></i> Save</button>
                    <button type="button" class="btn btn-primary btn-sm mr-5 change_production_status"  data-id="<?php echo e($production->id); ?>" data-name="<?php echo e($production->batch_no); ?>" data-status="<?php echo e($production->production_status); ?>"><i class="fas fa-check-circle text-white mr-2"></i> Change Production Status</button>
                    <?php endif; ?>
                    <a href="<?php echo e(route('production')); ?>" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a>
                </div>
            </div>
        </div>
        <div class="card card-custom" style="padding-bottom: 100px !important;">
            <form id="store_or_update_form" method="post">
                <?php echo csrf_field(); ?>
                <div class="card-body">
                    <div class="col-md-12 text-center">
                        <h5>
                            <b>Batch No.:</b> <?php echo e($production->batch_no); ?> <br>
                            <b>Warehouse:</b> <?php echo e($production->warehouse->name); ?> <br>
                            <b>Start Date:</b> <?php echo e(date('d-M-Y',strtotime($production->start_date))); ?>

                        </h5>
                    </div>
                    <div class="col-md-12 pt-5">
                        <?php if(!$production->products->isEmpty()): ?>
                            <?php $__currentLoopData = $production->products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="row pt-5">
                                <div class="col-md-12 text-center">
                                    <h3 class="py-3 bg-warning text-white" style="margin: 10px auto 10px auto;"><?php echo e(($key+1).' - '.$item->product->name); ?></h3>
                                </div>
                                <div class="col-md-12">
                                    <table class="table table-bordered pb-5" id="material_table_<?php echo e($key + 1); ?>">
                                        <thead class="bg-primary">
                                            <th class="text-center">Mfg. Date</th>
                                            <th class="text-center">Exp. Date</th>
                                            <th class="text-center">Unit Name</th>
                                            <th class="text-center">Finish Goods Qty <sup class="text-danger font-weight-bolder">*</sup></th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center"><?php echo e(date('d-M-Y',strtotime($item->mfg_date))); ?></td>
                                                <td class="text-center"><?php echo e(date('d-M-Y',strtotime($item->exp_date))); ?></td>
                                                <td class="text-center"><?php echo e($item->product->unit->unit_name.' ('.$item->product->unit->unit_code.')'); ?></td>
                                                <td>
                                                    <input type="text" class="form-control text-center" value="<?php echo e($item->base_unit_qty); ?>" name="production[<?php echo e($key+1); ?>][fg_qty]" id="production_<?php echo e($key+1); ?>_fg_qty" onkeyup="per_unit_cost('<?php echo e($key+1); ?>')">
                                                    <input type="hidden" class="form-control" name="production[<?php echo e($key+1); ?>][production_product_id]" value="<?php echo e($item->id); ?>">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-12 table-responsive">
                                    <table class="table table-bordered pb-5" id="material_table_<?php echo e($key + 1); ?>">
                                        <thead class="bg-primary">
                                            <th width="30%">Material</th>
                                            <th width="5%" class="text-center">Type</th>
                                            <th width="10%" class="text-center">Unit Name</th>
                                            <th width="10%" class="text-right">Rate</th>
                                            <th class="text-center">Received Qty</th>
                                            <th class="text-center">Used Qty <sup class="text-danger font-weight-bolder">*</sup></th>
                                            <th class="text-center">Damaged Qty</th>
                                            <th class="text-center">Odd Qty</th>
                                        </thead>
                                        <tbody>
                                            <?php if(!$item->materials->isEmpty()): ?>
                                                <?php $__currentLoopData = $item->materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <tr>
                                                        <td>
                                                            <?php echo e($value->material_name .' ('.$value->material_code.')'); ?>

                                                            <input type="hidden" class="form-control text-center" value="<?php echo e($value->pivot->id); ?>" name="production[<?php echo e($key+1); ?>][materials][<?php echo e($index+1); ?>][production_material_id]" id="production_<?php echo e($key+1); ?>_materials_<?php echo e($index+1); ?>_production_material_id" data-id="<?php echo e($index+1); ?>">
                                                        </td>
                                                        <td class="text-center"><?php echo e(MATERIAL_TYPE[$value->type]); ?></td>
                                                        <td class="text-center"><?php echo e($value->unit->unit_name.' ('.$value->unit->unit_code.')'); ?></td>
                                                        <td class="text-right">
                                                            <?php echo e(number_format($value->pivot->cost,2,'.','')); ?>

                                                            <input type="hidden" class="form-control text-right material_<?php echo e($key+1); ?>_cost" value="<?php echo e($value->pivot->cost); ?>" name="production[<?php echo e($key+1); ?>][materials][<?php echo e($index+1); ?>][cost]" id="production_<?php echo e($key+1); ?>_materials_<?php echo e($index+1); ?>_cost" data-id="<?php echo e($index+1); ?>">
                                                        </td>
                                                        <td class="text-center">
                                                            <?php echo e(number_format($value->pivot->qty,2,'.','')); ?>

                                                            <input type="hidden" class="form-control text-right material_<?php echo e($key+1); ?>_qty" value="<?php echo e($value->pivot->qty); ?>" name="production[<?php echo e($key+1); ?>][materials][<?php echo e($index+1); ?>][qty]" id="production_<?php echo e($key+1); ?>_materials_<?php echo e($index+1); ?>_qty" data-id="<?php echo e($index+1); ?>">
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control text-center material_<?php echo e($key+1); ?>_used_qty" value="<?php echo e($value->pivot->used_qty ?? ''); ?>" name="production[<?php echo e($key+1); ?>][materials][<?php echo e($index+1); ?>][used_qty]" id="production_<?php echo e($key+1); ?>_materials_<?php echo e($index+1); ?>_used_qty"  onkeyup="calculateRowData('<?php echo e($key+1); ?>','<?php echo e($index+1); ?>')" data-id="<?php echo e($index+1); ?>">
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control text-center material_<?php echo e($key+1); ?>_damaged_qty" value="<?php echo e($value->pivot->damaged_qty ?? ''); ?>" name="production[<?php echo e($key+1); ?>][materials][<?php echo e($index+1); ?>][damaged_qty]" id="production_<?php echo e($key+1); ?>_materials_<?php echo e($index+1); ?>_damaged_qty"  onkeyup="calculateRowData('<?php echo e($key+1); ?>','<?php echo e($index+1); ?>')" data-id="<?php echo e($index+1); ?>">
                                                        </td>
                                                        <td>
                                                            <input readonly type="text" class="form-control bg-secondary text-center material_<?php echo e($key+1); ?>_odd_qty" value="<?php echo e($value->pivot->odd_qty ?? ''); ?>" name="production[<?php echo e($key+1); ?>][materials][<?php echo e($index+1); ?>][odd_qty]" id="production_<?php echo e($key+1); ?>_materials_<?php echo e($index+1); ?>_odd_qty"  data-id="<?php echo e($index+1); ?>">
                                                        </td>
                                                    </tr>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <tr>
                                                    <td colspan="6" class="text-right font-weight-bold">Labor Cost</td>
                                                    <td colspan="2" class="text-right font-weight-bold"><input type="text" class="form-control material_<?php echo e($key+1); ?>_labor_cost" id="production_<?php echo e($key+1); ?>_labor_cost" name="production[<?php echo e($key+1); ?>][labor_cost]" value="<?php echo e($item->labor_cost ? number_format($item->labor_cost,2,'.','') : ''); ?>" onkeyup="per_unit_cost('<?php echo e($key+1); ?>')"  data-id="<?php echo e($key+1); ?>"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" class="text-right font-weight-bold">Other Cost</td>
                                                    <td colspan="2" class="text-right font-weight-bold"><input type="text" class="form-control material_<?php echo e($key+1); ?>_other_cost" id="production_<?php echo e($key+1); ?>_other_cost" name="production[<?php echo e($key+1); ?>][other_cost]" value="<?php echo e($item->labor_cost ? number_format($item->other_cost,2,'.','') : ''); ?>" onkeyup="per_unit_cost('<?php echo e($key+1); ?>')"  data-id="<?php echo e($key+1); ?>"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" class="text-right font-weight-bold">Total Cost</td>
                                                    <td colspan="2">
                                                        <?php
                                                            if(!empty($item->per_unit_cost) && !empty($item->base_unit_qty)) {
                                                                $total_cost = $item->per_unit_cost * $item->base_unit_qty;
                                                            }else{
                                                                $total_cost = '';
                                                            }
                                                        ?>
                                                        <input readonly type="text" class="form-control text-white bg-primary text-right material_<?php echo e($key+1); ?>_total_cost" value="<?php echo e($total_cost); ?>" name="production[<?php echo e($key+1); ?>][materials_total_cost]" id="production_<?php echo e($key+1); ?>_materials_total_cost"  data-id="<?php echo e($key+1); ?>">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" class="text-right font-weight-bold">Per Unit Cost</td>
                                                    <td colspan="2">
                                                        <input readonly type="text" class="form-control text-white bg-primary text-right material_<?php echo e($key+1); ?>_per_unit_cost" value="<?php echo e($item->per_unit_cost ? number_format($item->per_unit_cost,2,'.','') : ''); ?>" name="production[<?php echo e($key+1); ?>][materials_per_unit_cost]" id="production_<?php echo e($key+1); ?>_materials_per_unit_cost"  data-id="<?php echo e($key+1); ?>">
                                                    </td>
                                                </tr>
                                            <?php endif; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<?php echo $__env->make('production::production.production-status-modal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
<script src="<?php echo e(asset('js/jquery.printarea.js')); ?>"></script>
<script>
$(document).ready(function () {
    $(document).on('click','#print-qrcode',function(){
        var mode = 'iframe'; // popup
        var close = mode == "popup";
        var options = {
            mode: mode,
            popClose: close
        };
        $("#printableArea").printArea(options);
    });
    $(document).on('click','.change_production_status',function(){
        $('#production_status_form #production_id').val($(this).data('id'));
        $('#production_status_form #production_status').val($(this).data('status'));
        $('#production_status_form #production_status.selectpicker').selectpicker('refresh');
        $('#production_status_modal').modal({
            keyboard: false,
            backdrop: 'static',
        });
        $('#production_status_modal .modal-title').html('<span>Change Production Status</span>');
        $('#production_status_modal #production-status-btn').text('Change Status');
    });
    $(document).on('click','#production-status-btn',function(){
        var production_id     = $('#production_status_form #production_id').val();
        var production_status =  $('#production_status_form #production_status option:selected').val();
        if(production_id && production_status) {
            $.ajax({
                url: "<?php echo e(route('production.change.production.status')); ?>",
                type: "POST",
                data: {production_id:production_id,production_status:production_status,_token:_token},
                dataType: "JSON",
                beforeSend: function(){
                    $('#production-status-btn').addClass('spinner spinner-white spinner-right');
                },
                complete: function(){
                    $('#production-status-btn').removeClass('spinner spinner-white spinner-right');
                },
                success: function (data) {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        $('#production_status_modal').modal('hide');
                        window.location.replace("<?php echo e(url('production')); ?>");
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }else{
            notification('error','Please select status');
        }
    });
});
function calculateRowData(key,index) {
    var cost          = parseFloat($('#production_'+key+'_materials_'+index+'_cost').val());
    var qty           = parseFloat($('#production_'+key+'_materials_'+index+'_qty').val());
    var used_qty      = parseFloat($('#production_'+key+'_materials_'+index+'_used_qty').val());
    var damaged_qty   = parseFloat($('#production_'+key+'_materials_'+index+'_damaged_qty').val());
    let laborCost     = parseFloat($('#production_'+key+'_labor_cost_'+index+'').val());
    let otherCost     = parseFloat($('#production_'+key+'_other_cost_'+index+'').val());
    used_qty    = used_qty ? used_qty : 0;
    damaged_qty = damaged_qty ? damaged_qty : 0;
    laborCost = laborCost ? laborCost : 0;
    var odd_qty = 0;
    if(used_qty) {
        odd_qty    = parseFloat(qty - (used_qty + damaged_qty));
    }
    console.log('cost='+cost,'qty='+qty,'used='+used_qty,'damaged='+damaged_qty,'odd='+odd_qty);
    $('#production_'+key+'_materials_'+index+'_odd_qty').val(odd_qty.toFixed(2));
    per_unit_cost(key);
}
function per_unit_cost(key) {
    var fg_qty        = parseFloat($('#production_'+key+'_fg_qty').val());
    fg_qty      = fg_qty ? fg_qty : 0;
    var total_cost    = 0;
    var per_unit_cost = 0;
    var total_used_qty_cost = 0;
    $('#material_table_'+key+' .material_'+key+'_used_qty').each(function() {
        var row = $(this).data('id');
        if($(this).val() == ''){
            total_used_qty_cost += 0;
        }else{
            total_used_qty_cost += parseFloat($(this).val()) * parseFloat($('#production_'+key+'_materials_'+row+'_cost').val());
        }
    });
    var total_damaged_qty_cost = 0;
    $('#material_table_'+key+' .material_'+key+'_damaged_qty').each(function() {
        var row = $(this).data('id');
        if($(this).val() == ''){
            total_damaged_qty_cost += 0;
        }else{
            total_damaged_qty_cost += parseFloat($(this).val()) * parseFloat($('#production_'+key+'_materials_'+row+'_cost').val());
        }
    });
    let laborCost = $('.material_'+key+'_labor_cost').val();
    let otherCost = $('.material_'+key+'_other_cost').val();
    total_cost = +laborCost + + otherCost + +total_used_qty_cost + + total_damaged_qty_cost;
    $('.material_'+key+'_total_cost').val(parseFloat(total_cost).toFixed(2));

    if(fg_qty > 0) {
        let per_unit_cost = $('.material_'+key+'_total_cost').val()/ fg_qty;
        $('.material_'+key+'_per_unit_cost').val(parseFloat(per_unit_cost).toFixed(2));
    }else{
        $('.material_'+key+'_per_unit_cost').val('');
    }
}
function store_data(){
    let form = document.getElementById('store_or_update_form');
    let formData = new FormData(form);
    let url = "<?php echo e(url('production/store-operation')); ?>";
    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "JSON",
        contentType: false,
        processData: false,
        cache: false,
        beforeSend: function(){
            $('#save-btn').addClass('spinner spinner-white spinner-right');
        },
        complete: function(){
            $('#save-btn').removeClass('spinner spinner-white spinner-right');
        },
        success: function (data) {
            $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
            $('#store_or_update_form').find('.error').remove();
            if (data.status == false) {
                $.each(data.errors, function (key, value){
                    var key = key.split('.').join('_');
                    $('#store_or_update_form input#' + key).addClass('is-invalid');
                    $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                    $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                    $('#store_or_update_form #' + key).parent().append(
                    '<small class="error text-danger">' + value + '</small>');
                });
            } else {
                notification(data.status, data.message);
                if (data.status == 'success') {
                    window.location.replace("<?php echo e(url('production/operation',$production->id)); ?>");
                }
            }
        },
        error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
    });
}
function show_qrcode_modal(production_product_id,batch_no,product_name) {
    $('#qrcode_form')[0].reset();
    $('#qrcode_form #production_product_id').val(production_product_id);
    $('#qrcode_form #batch_no').val(batch_no);
    $('#qrcode_form #row_qty').val(1);
    $('#qrcode_modal').modal({
        keyboard: false,
        backdrop: 'static',
    });
    $('#qrcode_modal .modal-title').html('Print QR Code for '+product_name);
    load_qrcode_view();
}
function load_qrcode_view() {
    var production_product_id    = $('#qrcode_form #production_product_id').val();
    var batch_no    = $('#qrcode_form #batch_no').val();
    var row_qty     = $('#qrcode_form #row_qty').val();
    if(production_product_id && batch_no && row_qty){
        $.ajax({
            url: "<?php echo e(route('production.generate.coupon.qrcode')); ?>",
            type: "POST",
            data: {production_product_id:production_product_id,batch_no:batch_no,row_qty:row_qty,_token:_token},
            beforeSend: function(){
                $('#generate-qrcode').addClass('spinner spinner-white spinner-right');
            },
            complete: function(){
                $('#generate-qrcode').removeClass('spinner spinner-white spinner-right');
            },
            success: function (data) {
                $('#qrcode_form').find('.is-invalid').removeClass('is-invalid');
                $('#qrcode_form').find('.error').remove();
                if (data.status == false) {
                    $.each(data.errors, function (key, value) {
                        var key = key.split('.').join('_');
                        $('#qrcode_form input#' + key).addClass('is-invalid');
                        $('#qrcode_form #' + key).parent().append(
                        '<small class="error text-danger">' + value + '</small>');
                    });
                }
                if(data) {
                    $('#qrcode-section').empty().html(data);
                }
            },
            error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
        });
    }
}
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Production\Resources/views/production/operation.blade.php ENDPATH**/ ?>