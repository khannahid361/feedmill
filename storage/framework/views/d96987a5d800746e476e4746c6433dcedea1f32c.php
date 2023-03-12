<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
    <style>
        .card {
            border-radius: 10px;
            box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.3);
            background-color: #ffffff;
            padding: 10px 30px 40px;
        }

        .drop_box {
            margin: 10px 0;
            padding: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            border: 3px dotted #a3a3a3;
            border-radius: 5px;
        }

        .drop_box h4 {
            font-size: 16px;
            font-weight: 400;
            color: #2e2e2e;
        }

        .drop_box p {
            margin-top: 10px;
            margin-bottom: 20px;
            font-size: 12px;
            color: #a3a3a3;
        }

        .btn {
            text-decoration: none;
            background-color: #005af0;
            color: #ffffff;
            padding: 10px 20px;
            transition: 0.3s;
        }

        .btn:hover {
            text-decoration: none;
            background-color: #ffffff;
            color: #005af0;
        }
        .form input {
            margin: 10px 0;
            width: 100%;
            background-color: #e2e2e2;
            padding: 12px 20px;
            border-radius: 4px;
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
                        <?php if(permission('labour-add')): ?>
                            <a href="<?php echo e(route('labour')); ?>" class="btn btn-primary btn-sm font-weight-bolder">
                                <i class="fas fa-arrow-left"></i> Back
                            </a>
                        <?php endif; ?>
                        <!--end::Button-->
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
                            <div class="col-sm-12">
                                <form id="store_or_update_form" method="post">
                                    <?php echo csrf_field(); ?>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <input type="hidden" name="update_id" id="update_id" value=""/>
                                                <div class="row">
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => ''.e(__('file.Labour ID')).'','name' => 'labour_id','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter Labour ID']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Labour ID')).'','name' => 'labour_id','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter Labour ID']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => ''.e(__('file.Name')).'','name' => 'name','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter name']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Name')).'','name' => 'name','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter name']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => ''.e(__('file.Contact No')).'','name' => 'contact_no_one','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter Contact No']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Contact No')).'','name' => 'contact_no_one','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter Contact No']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => ''.e(__('file.Emergency Contact')).'','name' => 'emergency_contact','col' => 'col-md-12','placeholder' => 'Enter Emergency Contact']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Emergency Contact')).'','name' => 'emergency_contact','col' => 'col-md-12','placeholder' => 'Enter Emergency Contact']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => ''.e(__('file.Gender')).'','name' => 'gender','required' => 'required','col' => 'col-md-12','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Gender')).'','name' => 'gender','required' => 'required','col' => 'col-md-12','class' => 'selectpicker']); ?>
                                                        <option value="1"><?php echo e(__('Male')); ?></option>
                                                        <option value="2"><?php echo e(__('Female')); ?></option>
                                                        <option value="3"><?php echo e(__('Others')); ?></option>
                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => ''.e(__('file.Address')).'','name' => 'present_address','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter Address']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Address')).'','name' => 'present_address','required' => 'required','col' => 'col-md-12','placeholder' => 'Enter Address']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => ''.e(__('file.Blood Group')).'','name' => 'blood_group','col' => 'col-md-12','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Blood Group')).'','name' => 'blood_group','col' => 'col-md-12','class' => 'selectpicker']); ?>
                                                        <option value="A+"><?php echo e(__('A+')); ?></option>
                                                        <option value="A+"><?php echo e(__('A-')); ?></option>
                                                        <option value="B+"><?php echo e(__('B+')); ?></option>
                                                        <option value="B-"><?php echo e(__('B-')); ?></option>
                                                        <option value="O+"><?php echo e(__('O+')); ?></option>
                                                        <option value="O-"><?php echo e(__('O-')); ?></option>
                                                        <option value="AB+"><?php echo e(__('AB+')); ?></option>
                                                        <option value="AB-"><?php echo e(__('AB-')); ?></option>
                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="row">
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => ''.e(__('file.National ID Number')).'','name' => 'id_number','col' => 'col-md-12','placeholder' => 'Enter ID Number']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.National ID Number')).'','name' => 'id_number','col' => 'col-md-12','placeholder' => 'Enter ID Number']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <div class="form-group col-md-12 ">
                                                        <label for="sale_date"><?php echo e(__('file.Date of Birth')); ?></label>
                                                        <input type="date" class="form-control date" id="date_of_birth" name="date_of_birth" value="<?php echo e(date('Y-m-d')); ?>"/>
                                                    </div>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => ''.e(__('file.Marital Status')).'','name' => 'marital_status','col' => 'col-md-12','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Marital Status')).'','name' => 'marital_status','col' => 'col-md-12','class' => 'selectpicker']); ?>
                                                        <option value="1"><?php echo e(__('Married')); ?></option>
                                                        <option value="2"><?php echo e(__('Single')); ?></option>
                                                        <option value="3"><?php echo e(__('Divorced')); ?></option>
                                                        <option value="4"><?php echo e(__('Separated')); ?></option>
                                                        <option value="5"><?php echo e(__('Widowed')); ?></option>
                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <div class="form-group col-md-12 required">
                                                        <label for="sale_date"><?php echo e(__('file.Joining Date')); ?></label>
                                                        <input type="date" class="form-control date" id="joining_date" name="joining_date" required="required" value="<?php echo e(date('Y-m-d')); ?>"/>
                                                    </div>
                                                    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => ''.e(__('file.Branch')).'','name' => 'branch_id','required' => 'required','col' => 'col-md-12','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => ''.e(__('file.Branch')).'','name' => 'branch_id','required' => 'required','col' => 'col-md-12','class' => 'selectpicker']); ?>
                                                        <?php $__currentLoopData = $branch; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $row): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($row->id); ?>"><?php echo e($row->name); ?></option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                                                    <div class="col-md-12 form-group required">
                                                        <label for="salary"><?php echo e(__('file.Basic Salary')); ?></label>
                                                        <div class="input-group" >
                                                            <input type="text" class="form-control number-only"  name="basic_salary" id="basic_salary" required="required" value="" placeholder="0.00">
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <div class="card">
                                                            <h3>Upload File</h3>
                                                            <div class="drop_box">
                                                                <header>
                                                                    <h4>Select File here</h4>
                                                                </header>
                                                                <p>Files Supported: PDF, doc</p>
                                                                <input type="file"  accept=".doc,.pdf" name="resume" id="fileID" style="margin-left: 36%;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><?php echo e(__('file.Close')); ?></button>
                                        <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="storeData()"><i class="fas fa-save"></i><?php echo e(__('file.Save')); ?></button>
                                    </div>
                                </form>
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
    <script>
        var table;
        let i = 1;
        function _(x){
            return document.getElementById(x);
        }

        function storeData(){
            let form     = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url      = "<?php echo e(route('labour.store.or.update')); ?>";
            $.ajax({
                url           : url,
                type          : "POST",
                data          : formData,
                dataType      : "JSON",
                contentType   : false,
                processData   : false,
                cache         : false,
                beforeSend    : function(){
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete      : function(){
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success       : function (data) {
                    $('#purchase_store_form').find('.is-invalid').removeClass('is-invalid');
                    $('#purchase_store_form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function (key, value) {
                            var key = key.split('.').join('_');
                            $('#store_or_update_form input#' + key).addClass('is-invalid');
                            $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                            $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                            $('#store_or_update_form #' + key).parent().append('<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        notification(data.status, data.message);
                        if (data.status == 'success') { window.location.replace("<?php echo e(route('labour')); ?>"); }
                    }
                },
                error        : function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
            });
        }
    </script>

    
    <script>
        $(function(){
            $('.number-only').keypress(function(e) {
                if(isNaN(this.value+""+String.fromCharCode(e.charCode))) return false;
            })
                .on("cut copy paste",function(e){
                    e.preventDefault();
                });
        });
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/HRM\Resources/views/labour/create.blade.php ENDPATH**/ ?>