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
                                <?php
                                    $currentYear = date('Y');
                                    $nextYear = $currentYear + 1;
                                ?>

                                <div class="col-md-12">
                                    <table class="table table-bordered" id="commission_table">
                                        <thead class="bg-primary">
                                            <th>Dealer Name</th>
                                            <th>Month</th>
                                            <th>Year</th>
                                            <th class="text-center">Target Qty</th>
                                            <th class="text-center">Commission Amount</th>
                                            <th class="text-center"></th>
                                        </thead>
                                        <tbody id="commission">
                                            <tr>
                                                <td>
                                                    <input type="hidden" name="commission[0][dealer_id]"
                                                        id="commission_0_dealer_id" value="<?php echo e($dealer->dealer_id); ?>">
                                                    <input type="text" readonly name="" id=""
                                                        value="<?php echo e($dealer->dealer->name); ?>" class="form-control">
                                                </td>
                                                <td>
                                                    <select name="month" id="month_id" class="form-control selectpicker"
                                                        required>
                                                        <option value="1"
                                                            <?php if($dealer->month == 1): ?> ? selected <?php endif; ?>>January
                                                        </option>
                                                        <option value="2"
                                                            <?php if($dealer->month == 2): ?> ? selected <?php endif; ?>>February
                                                        </option>
                                                        <option value="3"
                                                            <?php if($dealer->month == 3): ?> ? selected <?php endif; ?>>March
                                                        </option>
                                                        <option value="4"
                                                            <?php if($dealer->month == 4): ?> ? selected <?php endif; ?>>April
                                                        </option>
                                                        <option value="5"
                                                            <?php if($dealer->month == 5): ?> ? selected <?php endif; ?>>May</option>
                                                        <option value="6"
                                                            <?php if($dealer->month == 6): ?> ? selected <?php endif; ?>>June
                                                        </option>
                                                        <option value="7"
                                                            <?php if($dealer->month == 7): ?> ? selected <?php endif; ?>>July
                                                        </option>
                                                        <option value="8"
                                                            <?php if($dealer->month == 8): ?> ? selected <?php endif; ?>>August
                                                        </option>
                                                        <option value="9"
                                                            <?php if($dealer->month == 9): ?> ? selected <?php endif; ?>>September
                                                        </option>
                                                        <option value="10"
                                                            <?php if($dealer->month == 10): ?> ? selected <?php endif; ?>>October
                                                        </option>
                                                        <option value="11"
                                                            <?php if($dealer->month == 11): ?> ? selected <?php endif; ?>>November
                                                        </option>
                                                        <option value="12"
                                                            <?php if($dealer->month == 12): ?> ? selected <?php endif; ?>>December
                                                        </option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select name="year" id="year_id" class="form-control selectpicker"
                                                        required>
                                                        <option value="<?php echo e($currentYear); ?>"
                                                            <?php if($dealer->year == $currentYear): ?> selected <?php endif; ?>>
                                                            <?php echo e($currentYear); ?></option>
                                                        <option value="<?php echo e($nextYear); ?>"
                                                            <?php if($dealer->year == $nextYear): ?> selected <?php endif; ?>>
                                                            <?php echo e($nextYear); ?></option>
                                                    </select>
                                                </td>
                                                <td><input type="text" name="commission[0][qty]" id="commission_0_qty_id"
                                                        class="form-control" required value="<?php echo e($dealer->qty); ?>"></td>
                                                <td><input type="text" name="commission[0][commission_amount]"
                                                        id="commission_0_commission_amount_id" class="form-control" required
                                                        value="<?php echo e($dealer->commission_amount); ?>"></td>
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
        function store_data() {
            let form = document.getElementById('commission_store_form');
            let formData = new FormData(form);
            let url = "<?php echo e(route('dealer.monthly.commission.update', $dealer->id)); ?>";
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

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\insaf\Modules/Dealer\Resources/views/monthly_target/edit.blade.php ENDPATH**/ ?>