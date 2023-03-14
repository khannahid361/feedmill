

<?php $__env->startSection('title', $page_title); ?>

<?php $__env->startPush('styles'); ?>
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<style>
    #form-tab li a.active{
        background: #034d97 !important;
        color: white !important;
    }
    .nav-link{
        position: relative;
        border-radius: 5px !important;
        background: #E4E6EF;
        color: #7E8299;
    }
    .remove-tab{
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
                    <button type="button" class="btn btn-primary btn-sm mr-5" onclick="check_material_stock()" id="save-btn"><i class="fas fa-save"></i> Save</button>
                    <a href="<?php echo e(route('production')); ?>" class="btn btn-warning btn-sm font-weight-bolder">
                        <i class="fas fa-arrow-left"></i> Back</a>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom" style="padding-bottom: 100px !important;">
            <form id="store_or_update_form" method="post" enctype="multipart/form-data">
                <?php echo csrf_field(); ?>
                <div class="card-body">
                    <div class="col-md-12">
                        <div class="row">
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Batch No.','name' => 'batch_no','value' => ''.e($batch_no).'','required' => 'required','property' => 'readonly','col' => 'col-md-4']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Batch No.','name' => 'batch_no','value' => ''.e($batch_no).'','required' => 'required','property' => 'readonly','col' => 'col-md-4']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Date','name' => 'start_date','required' => 'required','col' => 'col-md-4','class' => 'date','property' => 'readonly','value' => ''.e(date('Y-m-d')).'']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Date','name' => 'start_date','required' => 'required','col' => 'col-md-4','class' => 'date','property' => 'readonly','value' => ''.e(date('Y-m-d')).'']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                            <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Warehouse','name' => 'warehouse_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Warehouse','name' => 'warehouse_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                <?php if(!$warehouses->isEmpty()): ?>
                                    <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($warehouse->id); ?>" <?php echo e($warehouse->id == 1 ? 'selected' : ''); ?>><?php echo e($warehouse->name); ?></option>
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










                            <input type="hidden" name="tab" id="check_tab">
                            <div class="tab-content">
                                <div class="tab-pane active step step-1 p-3" id="tab-1" role="tabpanel">
                                    <div class="row" id="production_1">
                                        <div class="col-md-12 px-0" style="border-top: 5px solid #024c96;">
                                            <div class="card card-custom card-fit card-border" style="border-radius: 0 !important;">
                                                <div class="card-body py-5">
                                                    <div class="row">
                                                        <div class="form-group col-md-12 required">
                                                            <label >Product</label>
                                                            <select name="production[1][product_id]" id="production_1_product_id"  onchange="materialData(this.value,1)" class="form-control selectpicker">
                                                                <option value="">Select Please</option>
                                                                <?php if(!$products->isEmpty()): ?>
                                                                    <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <option value="<?php echo e($id); ?>"><?php echo e($name); ?></option>
                                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                <?php endif; ?>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-3 required">
                                                            <label >Total Year</label>
                                                            <select name="production[1][year]" id="production_1_year"  onchange="generateDate(this.value,1)" class="form-control selectpicker">
                                                                <?php for($i = 1; $i <= 3; $i++): ?>
                                                                <option value="<?php echo e($i); ?>" <?php echo e($i == 1 ? 'selected' : ''); ?>><?php echo e($i); ?></option>
                                                                <?php endfor; ?>
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-3 required">
                                                            <label for="mfg_date">Mfg. Date</label>
                                                            <input type="text" class="form-control date" name="production[1][mfg_date]" id="production_1_mfg_date" value="<?php echo e(date('Y-m-d')); ?>" readonly />
                                                        </div>
                                                        <div class="form-group col-md-3 required">
                                                            <label for="exp_date">Exp. Date</label>
                                                            <input type="text" class="form-control date" name="production[1][exp_date]" id="production_1_exp_date" value="<?php echo e(date('Y-m-d',strtotime('+1 year'))); ?>" readonly />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 py-5">
                                            <div class="row" id="production_materials_1">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
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
    // function _(x){
    //     return document.getElementById(x);
    // }
$(document).ready(function () {
    $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
    var tabcount = 1;
    function add_new_tab(tab){

        tab_btn_html = `<li class="nav-item mx-0 mb-3" id="tab`+tab+`">
                            <a class="nav-link text-center step  step-`+tab+`" data-toggle="tab" href="#tab-`+tab+`" role="tab">Product-`+tab+` <i data-tab="`+tab+`" class="fas fa-times-circle text-danger remove-tab ml-5 bg-white"></i></a>
                        </li>`;
        $('#form-tab li:last').before(tab_btn_html);

        tab_content_html = `<div class="tab-pane  step step-`+tab+`  p-3" id="tab-`+tab+`" role="tabpanel">
                                <div class="row"  id="production_`+tab+`">
                                    <div class="col-md-12 px-0" style="border-top: 5px solid #024c96;">
                                        <div class="card card-custom card-fit card-border" style="border-radius: 0 !important;">
                                            <div class="card-body py-5">
                                                <div class="row">
                                                    <div class="form-group col-md-12 required">
                                                        <label >Product</label>
                                                        <select name="production[`+tab+`][product_id]" id="production_`+tab+`_product_id"  onchange="materialData(this.value,`+tab+`)" class="form-control selectpicker">
                                                            <option value="">Select Please</option>
                                                            <?php if(!$products->isEmpty()): ?>
                                                                <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <option value="<?php echo e($id); ?>"><?php echo e($name); ?></option>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            <?php endif; ?>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3 required">
                                                        <label >Total Year</label>
                                                        <select name="production[`+tab+`][year]" id="production_`+tab+`_year"  onchange="generateDate(this.value,`+tab+`)" class="form-control selectpicker">
                                                            <?php for($i = 1; $i <= 3; $i++): ?>
                                                            <option value="<?php echo e($i); ?>" <?php echo e($i == 1 ? 'selected' : ''); ?>><?php echo e($i); ?></option>
                                                            <?php endfor; ?>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3 required">
                                                        <label for="mfg_date">Mfg. Date</label>
                                                        <input type="text" class="form-control date" name="production[`+tab+`][mfg_date]" id="production_`+tab+`_mfg_date" value="<?php echo e(date('Y-m-d')); ?>" readonly />
                                                    </div>
                                                    <div class="form-group col-md-3 required">
                                                        <label for="exp_date">Exp. Date</label>
                                                        <input type="text" class="form-control date" name="production[`+tab+`][exp_date]" id="production_`+tab+`_exp_date" value="<?php echo e(date('Y-m-d',strtotime('+1 year'))); ?>" readonly />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 py-5">
                                        <div class="row" id="production_materials_`+tab+`">

                                        </div>
                                    </div>
                                </div>
                            </div>`
        $('.tab-content').append(tab_content_html);
        $('.selectpicker').selectpicker('refresh');
        $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
    }

    $(document).on('click','#add-new-tab',function(){
        tabcount++;
        add_new_tab(tabcount);
    });
    $(document).on('click','.remove-tab',function(){
        var tab = $(this).data('tab');
        Swal.fire({
            title: 'Are you sure to delete Tab-' + tab + '?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.value) {

                if($('#form-tab li#tab'+tab).is(':nth-last-child(2)'))
                {
                    tabcount--;
                }
                $('#tab'+tab+',.tab-pane#tab-'+tab).remove();
                $('#tab'+(tab-1)+' a, .tab-pane#tab-'+(tab-1)).addClass('active');
                Swal.fire("Removed", "Tab Removed Successfully", "success");
            }
        });
    });

});


function materialData(product_id,tab)
{
    $.ajax({
        url:"<?php echo e(url('production/product-materials')); ?>",
        data:{product_id:product_id,tab:tab,_token:_token},
        type:"POST",
        success:function(data){
            $('#production_materials_'+tab).empty().html(data);
        },
    });
}
function calculateRowTotal(tab,row)
{
    var finishedQty = parseFloat($('#finished_qty_'+tab+'').val());
    var q_ty = parseFloat($('#production_'+tab+'_materials_'+row+'_q_ty').val());


    var cost        = parseFloat($('#production_'+tab+'_materials_'+row+'_cost').val());
    console.log(cost);
    var qty         = parseFloat($('#production_'+tab+'_materials_'+row+'_qty').val());
    var stock_qty   = parseFloat($('#production_'+tab+'_materials_'+row+'_stock_qty').val());
    var total       = 0;

    // if(cost > 0 && q_ty > 0) {
    //     if(q_ty > stock_qty){
            $('#production_'+tab+'_materials_'+row+'_qty').val(1);
            total = parseFloat(cost * q_ty).toFixed(2);
            $('#production_'+tab+'_materials_'+row+'_total').val(parseFloat(total).toFixed(2));
            notification('error','Quantity must be less than or equal to stock quantity!');
        // }else{
        //     total = parseFloat(cost * q_ty).toFixed(2);
        //     $('#production_'+tab+'_materials_'+row+'_total').val(parseFloat(total).toFixed(2));
        //     // $('#production_'+tab+'_materials_'+row+'_total').val(total);
        // }
    // }else{
    //     $('#production_'+tab+'_materials_'+row+'_total').val('');
    // }
}

function generateDate(number,tab)
{
    var mfg_date = $('#production_'+tab+'_mfg_date').val();
    var exp_date = new Date(new Date(mfg_date).setFullYear(new Date(mfg_date).getFullYear() + parseInt(number)));
    $('#production_'+tab+'_exp_date').val(exp_date.toISOString().slice(0, 10));
}


function check_material_stock()
{
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
                console.log(data);
                if (data.status == 'success') {
                    store_data();
                }else{
                    $('#view_modal #view-data').empty().html(data);
                    $('#view_modal').modal({
                        keyboard: false,
                        backdrop: 'static',
                    });
                    $('#view_modal .modal-title').html('<i class="fas fa-file-alt text-white"></i> <span> Material Stock Availibility Details</span>');
                }
            }
        },
        error: function (xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}
function store_data(){
    let form = document.getElementById('store_or_update_form');
    let formData = new FormData(form);
    let url = "<?php echo e(url('production/store')); ?>";
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
                notification(data.status, data.message);
                if (data.status == 'success') {
                    window.location.replace("<?php echo e(url('production')); ?>");
                }
        },
        error: function (xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}

</script>

<script>
    function _(x){
        return document.getElementById(x);
    }

    $(document).on('input','.other_cost',function(){
        let other_cost  = $(this).val();
        let grand_t     = $('#grand_total').val();
        let finishedqty = $('#finished_qty').val();

        _('grand_total').value = + _('g_tl').value + + other_cost;
        let a = $('#grand_total').val();

        _('cost_per_unit').value = a  / finishedqty;
    });

    $(document).on('input','.finishedQty',function(){
        let finishedQty = $(this).val();
        $('.track').each(function(i, k){
            let s_qt    = $(this).data('stock_qty') ? $(this).data('stock_qty') : 0;
            let qty     = $(this).data('qty');
            if(s_qt > qty){
                document.getElementById($(this).data('total')).value = $(this).data('qty') * $(this).data('cost') * finishedQty;
            }else if(s_qt < qty) {
                $(`#material_table_1 tbody tr:eq(${i})`).css({'background': 'red'});
                // $(this).addClass('active-bg');
                // $('.active-bg').style('color', 'red');
                // $(".active-bg").css("color", "red");

            }
        })
        calculation();
    });
    function calculation(){
        let total      = 0;
        $('.total').each(function(){
            if($(this).val() == ''){
                total += + 0;
            }else{
                total += + $(this).val();
            }
        })
    _('g_tl').value                     = total;
    }
</script>

<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\insaf_erp_b2gsoft\Modules/Production\Resources/views/production/create.blade.php ENDPATH**/ ?>