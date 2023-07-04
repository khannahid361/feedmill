<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('css/jquery-ui.css')); ?>" />
    <link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
    <style>
        .customer.table td {
            vertical-align: top !important;
            padding: 0 !important;
        }
    </style>
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title">
                        <h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3>
                    </div>
                    <div class="card-toolbar">
                        <a href="<?php echo e(route('dealer.monthly.commission')); ?>"
                            class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <form action="" id="commission_store_form" method="post" enctype="multipart/form-data">
                            <?php echo csrf_field(); ?>
                            <div class="row">
                                <div class="form-group col-md-3 required">
                                    <label for="month_id">Select Month</label>
                                    <select name="month[]" id="month_id" class="form-control selectpicker" required
                                        multiple>
                                        <option value="1">January</option>
                                        <option value="2">February</option>
                                        <option value="3">March</option>
                                        <option value="4">April</option>
                                        <option value="5">May</option>
                                        <option value="6">June</option>
                                        <option value="7">July</option>
                                        <option value="8">August</option>
                                        <option value="9">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                    </select>
                                </div>
                                <?php
                                    $currentYear = date('Y');
                                    $nextYear = $currentYear + 1;
                                ?>
                                <div class="form-group col-md-3 required">
                                    <label for="year_id">Select Year</label>
                                    <select name="year" id="year_id" class="form-control selectpicker" required>
                                        <option value="<?php echo e($currentYear); ?>"><?php echo e($currentYear); ?></option>
                                        <option value="<?php echo e($nextYear); ?>"><?php echo e($nextYear); ?></option>
                                    </select>
                                </div>
                                <div class="col-md-12">
                                    <table class="table table-bordered" id="commission_table">
                                        <thead class="bg-primary">
                                            <th>Dealer Name</th>
                                            <th class="text-center">Target Qty</th>
                                            <th class="text-center">Commission Amount Per Bag</th>
                                            <th class="text-center"></th>
                                        </thead>
                                        <tbody id="commission">
                                            <tr>
                                                <td>
                                                    <select name="commission[0][dealer_id]" id="commission_0_dealer_id"
                                                        required class="form-control selectpicker" required>
                                                        <option value="">Select Please</option>
                                                        <?php $__currentLoopData = $dealers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <option value="<?php echo e($value->id); ?>"><?php echo e($value->name); ?>

                                                            </option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    </select>
                                                </td>
                                                <td><input type="text" name="commission[0][qty]" id="commission_0_qty_id"
                                                        class="form-control" required value="0"></td>
                                                <td><input type="text" name="commission[0][commission_amount]"
                                                        id="commission_0_commission_amount_id" class="form-control" required
                                                        value="0"></td>
                                                <td class="text-center"><button type="button"
                                                        class="btn btn-success btn-sm small-btn btn-md add-dealer"><i
                                                            class="fas fa-plus"></i></button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="form-group col-md-12 text-center pt-5">
                                    <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn"
                                        onclick="store_data()"><i class="fas fa-save"></i> Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
    <script src="<?php echo e(asset('js/jquery-ui.js')); ?>"></script>
    <script src="<?php echo e(asset('js/moment.js')); ?>"></script>
    <script src="<?php echo e(asset('js/bootstrap-datetimepicker.min.js')); ?>"></script>
    <script>
        var serials = 0;
        //add
        $('#commission_table').on('click', '.add-dealer', function() {
            serials++;
            commission_row_add(serials);
        });

        function commission_row_add(index) {
            let html = `<tr data-row-id="${index}">
                                                <td>
                                                    <select name="commission[${index}][dealer_id]" id="dealer_id_${index}" required
                                                        class="form-control selectpicker dealerSelect" required>
                                                        <option value="">Select Please</option>
                                                        <?php $__currentLoopData = $dealers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <option value="<?php echo e($value->id); ?>"><?php echo e($value->name); ?>

                                                            </option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    </select>
                                                </td>
                                                <td><input type="text" name="commission[${index}][qty]" id="qty_id_${index}"
                                                        class="form-control" required value="0"></td>
                                                <td><input type="text" name="commission[${index}][commission_amount]" id="commission_amount_${index}"
                                                        class="form-control" required value="0"></td>
                                                <td class="text-center"><button type="button"
                                                        class="btn btn-danger btn-sm small-btn btn-md delete-dealer"><i
                                                            class="fas fa-minus"></i></button></td>
                                            </tr>`;
            $('#commission_table').append(html);
            $('.selectpicker').selectpicker('refresh');
        }
        //delete
        $('#commission_table').on('click', '.delete-dealer', function() {
            var row = $(this).closest("tr");
            var rowId = row.data("row-id");
            remove_commission_row(rowId);
        });

        function remove_commission_row(index) {
            var rowToRemove = $("#commission_table").find("tr[data-row-id='" + index + "']");
            rowToRemove.remove();
        }

        function store_data() {
            let selectedMonths = $('#month_id').val();
            if (!selectedMonths || selectedMonths.length === 0) {
                notification('error', 'Please Select Month');
                return;
            }
            let form = document.getElementById('commission_store_form');
            let formData = new FormData(form);
            let url = "<?php echo e(route('dealer.monthly.commission.store')); ?>";
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
                    $('#commission_store_form').find('.is-invalid').removeClass('is-invalid');
                    $('#commission_store_form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function(key, value) {
                            var key = key.split('.').join('_');
                            $('#commission_store_form input#' + key).addClass('is-invalid');
                            $('#commission_store_form textarea#' + key).addClass('is-invalid');
                            $('#commission_store_form select#' + key).parent().addClass('is-invalid');
                            $('#commission_store_form #' + key).parent().append(
                                '<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        notification(data.status, data.message);
                        if (data.status == 'success') {
                            window.location.replace("<?php echo e(route('dealer.monthly.commission')); ?>");
                        }
                    }
                },
                error: function(xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Dealer\Resources/views/monthly_target/create.blade.php ENDPATH**/ ?>