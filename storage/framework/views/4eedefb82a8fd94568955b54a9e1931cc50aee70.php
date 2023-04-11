<?php $__env->startSection('title', $page_title); ?>

<?php $__env->startPush('styles'); ?>
    <link href="css/tagify.css" rel="stylesheet" type="text/css" />
    <style>
        .tagsinput {
            height: calc(1.5em + 1.3rem + 2px) !important;
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
                    <form id="store_or_update_form" method="post" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <div class="row">
                            <div class="col-md-10">
                                <div class="row">
                                    <input type="hidden" name="update_id" id="update_id" value="<?php echo e($product->id); ?>">

                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Product Name','name' => 'name','required' => 'required','value' => ''.e($product->name).'','col' => 'col-md-4','placeholder' => 'Enter product name']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Product Name','name' => 'name','required' => 'required','value' => ''.e($product->name).'','col' => 'col-md-4','placeholder' => 'Enter product name']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                                    <div class="col-md-4 form-group required">
                                        <label for="code">Code</label>
                                        <div class="input-group" id="code_section">
                                            <input type="text" class="form-control" name="code" id="code"
                                                value="<?php echo e($product->code); ?>">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text bg-primary" id="generate-code"
                                                    data-toggle="tooltip" data-theme="dark" title="Generate Code"
                                                    style="border-top-right-radius: 0.42rem;border-bottom-right-radius: 0.42rem;border:0;cursor: pointer;">
                                                    <i class="fas fa-retweet text-white"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Barcode Symbol','name' => 'barcode_symbology','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Barcode Symbol','name' => 'barcode_symbology','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                        <?php $__currentLoopData = BARCODE_SYMBOL; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($key); ?>"
                                                <?php echo e($key == $product->barcode_symbology ? 'selected' : ''); ?>>
                                                <?php echo e($value); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>


                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Category','name' => 'category_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Category','name' => 'category_id','required' => 'required','col' => 'col-md-4','class' => 'selectpicker']); ?>
                                        <?php if(!$categories->isEmpty()): ?>
                                            <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($category->id); ?>"
                                                    <?php echo e($product->category_id == $category->id ? 'selected' : ''); ?>>
                                                    <?php echo e($category->name); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>
                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                                    <div class="form-group col-md-4 required">
                                        <label for="base_unit_id">Unit</label>
                                        <select name="base_unit_id" id="base_unit_id" onchange="populate_unit(this.value,1)"
                                            class="form-control selectpicker" data-live-search="true"
                                            data-live-search-placeholder="Search">
                                            <option value="">Select Please</option>
                                            <?php if(!$units->isEmpty()): ?>
                                                <?php $__currentLoopData = $units; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $unit): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php if($unit->base_unit == null): ?>
                                                        <option value="<?php echo e($unit->id); ?>"
                                                            <?php echo e($product->base_unit_id == $unit->id ? 'selected' : ''); ?>>
                                                            <?php echo e($unit->unit_name . ' (' . $unit->unit_code . ')'); ?></option>
                                                    <?php endif; ?>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php endif; ?>
                                        </select>
                                    </div>

                                    

                                    
                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Price','name' => 'base_unit_price','value' => ''.e($product->base_unit_price).'','required' => 'required','col' => 'col-md-4 price','placeholder' => 'Enter product price']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Price','name' => 'base_unit_price','value' => ''.e($product->base_unit_price).'','required' => 'required','col' => 'col-md-4 price','placeholder' => 'Enter product price']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Alert Quantity','name' => 'alert_quantity','value' => ''.e($product->alert_quantity).'','col' => 'col-md-4 alert-qty','placeholder' => 'Enter product alert qty']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Alert Quantity','name' => 'alert_quantity','value' => ''.e($product->alert_quantity).'','col' => 'col-md-4 alert-qty','placeholder' => 'Enter product alert qty']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>


                                    <div class="col-md-4 form-group">
                                        <label for="tax_id">Product Tax</label>
                                        <select name="tax_id" id="tax_id" required="required"
                                            class="form-control selectpicker">
                                            <option value="0" selected>No Tax</option>
                                            <?php if(!$taxes->isEmpty()): ?>
                                                <?php $__currentLoopData = $taxes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tax): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <option value="<?php echo e($tax->id); ?>"
                                                        <?php echo e($product->tax_id == $tax->id ? 'selected' : ''); ?>>
                                                        <?php echo e($tax->name); ?></option>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php endif; ?>
                                        </select>
                                    </div>

                                    <div class="col-md-4 form-group">
                                        <label for="tax_method">Tax Method<span class="text-danger">*</span> <i
                                                class="fas fa-info-circle" data-toggle="tooltip" data-placement="top"
                                                data-theme="dark"
                                                title="Exclusive: Poduct price = Actual product price + Tax. Inclusive: Actual product price = Product price - Tax"></i></label>
                                        <select name="tax_method" id="tax_method" class="form-control selectpicker">
                                            <?php $__currentLoopData = TAX_METHOD; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($key); ?>"
                                                    <?php echo e($product->tax_method == $key ? 'selected' : ''); ?>>
                                                    <?php echo e($value); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="row">
                                    <div class="form-group col-md-12 mb-0 text-center">
                                        <label for="logo" class="form-control-label">Product Image</label>
                                        <div class="col=md-12 px-0  text-center">
                                            <div id="image">

                                            </div>
                                        </div>
                                        <input type="hidden" name="old_image" id="old_image"
                                            value="<?php echo e($product->image); ?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="form-group col-md-12 mt-5">
                                <label for="description">Description</label>
                                <textarea class="form-control" name="description" id="description"><?php echo e($product->description); ?></textarea>
                            </div>

                            <div class="col-md-12 pt-5" id="material-section">
                                <div class="row"
                                    style="position: relative;border: 1px solid #E4E6EF;padding: 10px 0 0 0; margin: 0;border-radius:5px;">
                                    <div
                                        style="width: 100px;background: #fa8c15;text-align: center;margin: 0 auto;color: white;padding: 5px 0;position: absolute;top:-16px;left:10px;">
                                        Materials</div>

                                    <div class="col-md-12 pt-5 material_section">
                                        <?php
                                            $totalMaterials = 0;
                                        ?>
                                        <?php if(!$product->product_materials->isEmpty()): ?>
                                            <?php $__currentLoopData = $product->product_materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <div class="row <?php echo e($key == 0 ? '' : 'row_remove'); ?>">
                                                    <div class="form-group col-md-5 required">
                                                        <?php if($key == 0): ?>
                                                            <label for="materials_<?php echo e($key + 1); ?>_id"
                                                                class="form-control-label">Material Name</label>
                                                        <?php endif; ?>
                                                        <select name="materials[<?php echo e($key + 1); ?>][id]"
                                                            id="materials_<?php echo e($key + 1); ?>_id" required="required"
                                                            class="form-control selectpicker material"
                                                            data-live-search="true" data-live-search-placeholder="Search">
                                                            <option value="">Select Please</option>
                                                            <?php if(!$materials->isEmpty()): ?>
                                                                <?php $__currentLoopData = $materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $material): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <option value="<?php echo e($material->id); ?>"
                                                                        <?php echo e($value->material_id == $material->id ? 'selected' : ''); ?>>
                                                                        <?php echo e($material->material_name); ?></option>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            <?php endif; ?>
                                                        </select>
                                                    </div>
                                                    <?php
                                                        $totalMaterials += $value->qty;
                                                    ?>
                                                    <div class="form-group col-md-5 required">
                                                        <?php if($key == 0): ?>
                                                            <label for="materials_<?php echo e($key + 1); ?>_id"
                                                                class="form-control-label">Material Quantity</label>
                                                        <?php endif; ?>
                                                        <input type="text"
                                                            class="form-control qty text-center material-qty"
                                                            name="materials[<?php echo e($key + 1); ?>][qty]"
                                                            id="materials_qty_<?php echo e($key + 1); ?>_id"
                                                            value="<?php echo e($value->qty); ?>" required data-row="1"
                                                            data-select-id="materials_<?php echo e($key + 1); ?>_id"
                                                            onkeyup="getMaterialQuantity()">
                                                    </div>
                                                    <?php if($key == 0): ?>
                                                        <div class="form-group col-md-2" style="padding-top: 28px;">
                                                            <button type="button" id="add-material"
                                                                class="btn btn-success btn-sm" data-toggle="tooltip"
                                                                data-placement="top" data-original-title="Add More">
                                                                <i class="fas fa-plus-square"></i>
                                                            </button>
                                                        </div>
                                                    <?php else: ?>
                                                        <div class="form-group col-md-2">
                                                            <button type="button" class="btn btn-danger btn-sm remove"
                                                                data-toggle="tooltip" data-placement="top"
                                                                data-original-title="Remove">
                                                                <i class="fas fa-minus-square"></i>
                                                            </button>
                                                        </div>
                                                    <?php endif; ?>
                                                </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>
                                    </div>
                                    <div class="col-md-12 pt-5 text-center">
                                        <h5 style="margin-left:50%">Total Material Quantity <span
                                                id="materialQty"><?php echo e($totalMaterials); ?></span></h5>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-12 pt-5">
                                <button type="button" class="btn btn-primary btn-sm" id="update-btn">Update</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--end::Card-->
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
    <script src="js/spartan-multi-image-picker.min.js"></script>
    <script>
        $(document).ready(function() {
            $(document).on('change', '.material', function() {
                let totalMaterial = 0;
                $('.material-qty').each(function() {
                    let material = $(this).attr('data-select-id');
                    let materialQty = $('#' + material).find(":selected").val();
                    if (materialQty != '') {
                        totalMaterial = totalMaterial + parseFloat($(this).val() || 0);
                    }
                });
                $('#materialQty').text(totalMaterial);
            });
        });

        $(document).ready(function() {

            /** Start :: Product Image **/
            $("#image").spartanMultiImagePicker({
                fieldName: 'image',
                maxCount: 1,
                rowHeight: '150px',
                groupClassName: 'col-md-12 col-sm-12 col-xs-12',
                maxFileSize: '',
                dropFileLabel: "Drop Here",
                allowedExt: '',
            });

            $("input[name='image']").prop('required', true);

            $('.remove-files').on('click', function() {
                $(this).parents(".col-md-12").remove();
            });

            <?php if(!empty($product->image)): ?>
                $('#image img').css('display', 'none');
                $('#image .spartan_remove_row').css('display', 'block');
                $('#image .img_').css('display', 'block');
                $('#image .img_').attr('src', "<?php echo e(asset('storage/' . PRODUCT_IMAGE_PATH . $product->image)); ?>");
            <?php else: ?>
                $('#image img').css('display', 'block');
                $('#image .spartan_remove_row').css('display', 'none');
                $('#image .img_').css('display', 'none');
                $('#image .img_').attr('src', '');
            <?php endif; ?>
            /** End :: Product Image **/


            /** Start :: Add More Material Field **/
            <?php if(!$product->product_material->isEmpty()): ?>
                var material_count = "<?php echo e(count($product->product_material)); ?>";
            <?php else: ?>
                var material_count = 1;
            <?php endif; ?>
            function add_more_material_field(row) {
                html = ` <div class="row row_remove">
                    <div class="form-group col-md-5 required">
                        <select name="materials[` + row + `][id]" id="materials_` + row + `_id" required="required" class="form-control selectpicker material">
                            <option value="">Select Please</option>
                            <?php if(!$materials->isEmpty()): ?>
                                <?php $__currentLoopData = $materials; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $material): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($material->id); ?>"><?php echo e($material->material_name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                        </select>
                    </div>
                     <div class="form-group col-md-5 required">
                    <input type="text" class="form-control qty text-center material-qty" name="materials[` + row +
                    `][qty]" id="materials_qty_` + row +
                    `_id" value="<?php echo e($value->qty); ?>" required  data-row="1" data-select-id="materials_` + row + `_id" onkeyup="getMaterialQuantity()">
                                            </div>
                    <div class="form-group col-md-2">
                        <button type="button" class="btn btn-danger btn-sm remove" data-toggle="tooltip"
                            data-placement="top" data-original-title="Remove">
                            <i class="fas fa-minus-square"></i>
                        </button>
                    </div>
                </div>`;
                $('.material_section').append(html);
                $('.selectpicker').selectpicker('refresh');
            }

            $(document).on('click', '#add-material', function() {
                material_count++;
                add_more_material_field(material_count);
            });
            $(document).on('click', '.remove', function() {
                material_count--;
                $(this).closest('.row_remove').remove();
                getMaterialQuantity();
            });


            //Generate Code
            $(document).on('click', '#generate-code', function() {
                $.ajax({
                    url: "<?php echo e(route('product.generate.code')); ?>",
                    type: "GET",
                    dataType: "JSON",
                    beforeSend: function() {
                        $('#generate-code').addClass('spinner spinner-white spinner-right');
                    },
                    complete: function() {
                        $('#generate-code').removeClass('spinner spinner-white spinner-right');
                    },
                    success: function(data) {
                        data ? $('#store_or_update_form #code').val(data) : $(
                            '#store_or_update_form #code').val('');
                    },
                    error: function(xhr, ajaxOption, thrownError) {
                        console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr
                            .responseText);
                    }
                });
            });

            /****************************/
            $(document).on('click', '#update-btn', function() {
                let form = document.getElementById('store_or_update_form');
                let formData = new FormData(form);

                $.ajax({
                    url: "<?php echo e(route('product.store.or.update')); ?>",
                    type: "POST",
                    data: formData,
                    dataType: "JSON",
                    contentType: false,
                    processData: false,
                    cache: false,
                    beforeSend: function() {
                        $('#update-btn').addClass('spinner spinner-white spinner-right');
                    },
                    complete: function() {
                        $('#update-btn').removeClass('spinner spinner-white spinner-right');
                    },
                    success: function(data) {
                        $('#store_or_update_form').find('.is-invalid').removeClass(
                            'is-invalid');
                        $('#store_or_update_form').find('.error').remove();
                        if (data.status == false) {
                            $.each(data.errors, function(key, value) {
                                var key = key.split('.').join('_');
                                if (key == 'barcode_symbology') {

                                } else {
                                    $('#store_or_update_form input#' + key).addClass(
                                        'is-invalid');
                                    $('#store_or_update_form textarea#' + key).addClass(
                                        'is-invalid');
                                    $('#store_or_update_form select#' + key).parent()
                                        .addClass('is-invalid');
                                    if (key == 'code') {
                                        $('#store_or_update_form #' + key).parents(
                                            '.form-group').append(
                                            '<small class="error text-danger">' +
                                            value + '</small>');
                                    } else {
                                        $('#store_or_update_form #' + key).parent()
                                            .append(
                                                '<small class="error text-danger">' +
                                                value + '</small>');
                                    }
                                }
                            });
                        } else {
                            notification(data.status, data.message);
                            if (data.status == 'success') {
                                window.location.replace("<?php echo e(route('product')); ?>");
                            }
                        }
                    },
                    error: function(xhr, ajaxOption, thrownError) {
                        console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr
                            .responseText);
                    }
                });
            });
        });

        function populate_unit(unit_id) {
            $.ajax({
                url: "<?php echo e(url('populate-unit')); ?>/" + unit_id,
                type: "GET",
                dataType: "JSON",
                success: function(data) {
                    $('#purchase_unit_id,#sale_unit_id').empty();
                    $.each(data, function(key, value) {
                        $('#purchase_unit_id,#sale_unit_id').append('<option value="' + key + '">' +
                            value + '</option>');
                    });
                    $('#purchase_unit_id.selectpicker,#sale_unit_id.selectpicker').selectpicker('refresh');
                },
            });
        }

        function getMaterialQuantity() {
            $('.material').trigger('change');
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Product\Resources/views/edit.blade.php ENDPATH**/ ?>