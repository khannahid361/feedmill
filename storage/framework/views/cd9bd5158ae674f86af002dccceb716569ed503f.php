
<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<link href="<?php echo e(asset('css/daterangepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.css')); ?>" rel="stylesheet" type="text/css" />
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                <div class="card-toolbar">
                    <?php if(permission('purchase-add')): ?>
                    <a href="<?php echo e(route('purchase.create')); ?>"  class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Memo No.','name' => 'memo_no','col' => 'col-md-4']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Memo No.','name' => 'memo_no','col' => 'col-md-4']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                        <div class="form-group col-md-4">
                            <label for="name">Choose Date</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed">
                                <input type="hidden" id="start_date" name="start_date">
                                <input type="hidden" id="end_date" name="end_date">
                            </div>
                        </div>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Supplier','name' => 'supplier_id','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Supplier','name' => 'supplier_id','col' => 'col-md-4','class' => 'selectpicker']); ?>
                            <?php if(!$suppliers->isEmpty()): ?>
                                <?php $__currentLoopData = $suppliers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $supplier): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($supplier->id); ?>"><?php echo e($supplier->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Purchase Status','name' => 'purchase_status','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Purchase Status','name' => 'purchase_status','col' => 'col-md-4','class' => 'selectpicker']); ?>
                            <?php $__currentLoopData = PURCHASE_STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Payment Status','name' => 'payment_status','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Payment Status','name' => 'payment_status','col' => 'col-md-4','class' => 'selectpicker']); ?>
                            <?php $__currentLoopData = PAYMENT_STATUS; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($key); ?>"><?php echo e($value); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <div class="col-md-4">
                            <div style="margin-top:28px;">
                                <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>
                                <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-body">
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>Memo No.</th>
                                        <th>Supplier Name</th>
                                        <th>Total Item</th>
                                        <th>Total</th>
                                        <th>Grand Total</th>
                                        <th>Paid Amount</th>
                                        <th>Due Amount</th>
                                        <th>Purchase Date</th>
                                        <th>Purchase Status</th>
                                        <th>Payment Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $__env->make('purchase::payment.add', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->make('purchase::payment.paymentListModal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->make('purchase::statusModal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
<script src="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.js')); ?>" type="text/javascript"></script>
<script src="<?php echo e(asset('js/moment.js')); ?>"></script>
<script src="<?php echo e(asset('js/knockout-3.4.2.js')); ?>"></script>
<script src="<?php echo e(asset('js/daterangepicker.min.js')); ?>"></script>
<script>
    function _(x){
        return document.getElementById(x);
    }
let table;
$(document).ready(function(){
    $('.daterangepicker-filed').daterangepicker({
        callback: function(startDate, endDate, period){
            var start_date = startDate.format('YYYY-MM-DD');
            var end_date   = endDate.format('YYYY-MM-DD');
            var title      = start_date + ' To ' + end_date;
            $(this).val(title);
            $('input[name="start_date"]').val(start_date);
            $('input[name="end_date"]').val(end_date);
        }
    });
    table = $('#dataTable').DataTable({
        "processing": true,
        "serverSide": true,
        "order"     : [],
        "responsive": true,
        "bInfo"     : true,
        "bFilter"   : false,
        "lengthMenu": [
            [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
            [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
        ],
        "pageLength": 25,
        "language"  : {
            processing : `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
            emptyTable : '<strong class="text-danger">No Data Found</strong>',
            infoEmpty  : '',
            zeroRecords: '<strong class="text-danger">No Data Found</strong>'
        },
        "ajax": {
            "url" : "<?php echo e(route('purchase.datatable.data')); ?>",
            "type": "POST",
            "data": function (data) {
                data.memo_no         = $("#form-filter #memo_no").val();
                data.supplier_id     = $("#form-filter #supplier_id option:selected").val();
                data.from_date       = $("#form-filter #start_date").val();
                data.to_date         = $("#form-filter #end_date").val();
                data.purchase_status = $("#form-filter #purchase_status option:selected").val();
                data.payment_status  = $("#form-filter #payment_status option:selected").val();
                data._token          = _token;
            }
        },
        "columnDefs": [{
                "targets": [0,1,2,3,4,5,6,7,8,9,10],
                "orderable": false,
                "className": "text-center"
            },
        ],
        "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" + "<'row'<'col-sm-12'tr>>" + "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",
    });
    $('#btn-filter').click(function () {table.ajax.reload();});
    $('#btn-reset').click(function () {
        $('#form-filter')[0].reset();
        $('#form-filter .selectpicker').selectpicker('refresh');
        $('input[name="start_date"]').val('');
        $('input[name="end_date"]').val('');
        table.ajax.reload();
    });
    $(document).on('click', '.delete_data', function () {
        let id    = $(this).data('id');
        let name  = $(this).data('name');
        let row   = table.row($(this).parent('tr'));
        let url   = "<?php echo e(route('purchase.delete')); ?>";
        delete_data(id, url, table, row, name);
    });
    $(document).on('click', '.add_payment', function () {
        let id = $(this).data('id');
        let due = $(this).data('due');
        if(id && due) {
            $('#payment_form')[0].reset();
            $('#payment_form').find('.is-invalid').removeClass('is-invalid');
            $('#payment_form').find('.error').remove();
            $('.cheque_number').addClass('d-none');
            $('.selectpicker').selectpicker('refresh');
            if (id) {
                $('#payment_modal #payment_id').val('');
                $('#payment_modal #purchase_id').val(id);
                $('#payment_modal #amount,#payment_modal #due_amount').val(due);
                $('#payment_modal').modal({
                    keyboard: false,
                    backdrop: 'static',
                });
                $('#payment_modal .modal-title').html('<i class="fas fa-dollar-sign"></i> <span>Add Payment</span>');
            }
        }
    });
    $(document).on('click', '.edit-payment', function () {
        let id = $(this).data('id');
        let purchase_id = $(this).data('purchaseid');
        let amount = $(this).data('amount');
        let due = $(this).data('due');
        let payment_method = $(this).data('paymentmethod');
        let account_id = $(this).data('accountid');
        let cheque_no = $(this).data('chequeno');
        let payment_note = $(this).data('note');
        if(id) {
            $('#payment_form')[0].reset();
            $('#payment_form').find('.is-invalid').removeClass('is-invalid');
            $('#payment_form').find('.error').remove();
            $('.cheque_number').addClass('d-none');
            $('.selectpicker').selectpicker('refresh');
            if (id) {
                $('#payment_modal #payment_id').val(id);
                $('#payment_modal #purchase_id').val(purchase_id);
                $('#payment_modal #amount').val(amount);
                $('#payment_modal #due_amount').val(due);
                $('#payment_modal #payment_method').val(payment_method);
                $('#payment_modal #account_id').val(account_id);
                $('#payment_modal #payment_note').val(payment_note);
                account_list(payment_method,account_id);
                if(payment_method == 2){
                    $('.cheque_number').removeClass('d-none');
                    $('#cheque_number').val(cheque_no);
                }else{
                    $('.cheque_number').addClass('d-none');
                    $('#cheque_number').val('');
                }
                $('.selectpicker').selectpicker('refresh');
                $('#payment_view_modal').modal('hide');
                $('#payment_modal').modal({
                    keyboard: false,
                    backdrop: 'static',
                });
                $('#payment_modal .modal-title').html('<i class="fas fa-edit"></i> <span>Edit Payment</span>');
            }
        }
    });
    $(document).on('click','#payment-save-btn', function(e){
        e.preventDefault();
        let id = $('#payment_id').val();
        let method;
        if (id) {
            method = 'update';
        } else {
            method = 'add';
        }
        let form = document.getElementById('payment_form');
        let formData = new FormData(form);
        $.ajax({
            url: "<?php echo e(route('purchase.payment.store.or.update')); ?>",
            type: "POST",
            data: formData,
            dataType: "JSON",
            contentType: false,
            processData: false,
            cache: false,
            beforeSend: function(){
                $('#payment-save-btn').addClass('spinner spinner-white spinner-right');
            },
            complete: function(){
                $('#payment-save-btn').removeClass('spinner spinner-white spinner-right');
            },
            success: function (data) {
                $('#payment_form').find('.is-invalid').removeClass('is-invalid');
                $('#payment_form').find('.error').remove();
                if (data.status == false) {
                    $.each(data.errors, function (key, value) {
                        var key = key.split('.').join('_');
                        $('#payment_form input#' + key).addClass('is-invalid');
                        $('#payment_form textarea#' + key).addClass('is-invalid');
                        $('#payment_form select#' + key).parent().addClass('is-invalid');
                        $('#payment_form #' + key).parent().append('<small class="error text-danger">' + value + '</small>');
                    });
                } else {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        if (method == 'update') {
                            table.ajax.reload(null, false);
                        } else {
                            table.ajax.reload();
                        }
                        $('#payment_modal').modal('hide');
                    }
                }
            },
            error: function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
        });
    });
    $(document).on('click', '.view_payment_list', function () {
        let id = $(this).data('id');
        if (id) {
            payment_list(id);
            $('#payment_view_modal').modal({
                keyboard: false,
                backdrop: 'static',
            });
            $('#payment_view_modal .modal-title').html('<i class="fas fa-file-invoice-dollar"></i> <span>Payment List</span>');
        }
    });
    $(document).on('click', '.delete-payment', function () {
        let id    = $(this).data('id');
        let purchase_id    = $(this).data('purchaseid');
        Swal.fire({
            title: 'Are you sure to delete data?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: "<?php echo e(route('purchase.payment.delete')); ?>",
                    type: "POST",
                    data: { id: id, _token: _token},
                    dataType: "JSON",
                }).done(function (response) {
                    if (response.status == "success") {
                        Swal.fire("Deleted", response.message, "success").then(function () {
                            payment_list(purchase_id);
                            table.ajax.reload(null, false);
                        });
                    }
                    if (response.status == "error") {
                        Swal.fire('Oops...', response.message, "error");
                    }
                }).fail(function () {
                    Swal.fire('Oops...', "Somthing went wrong with ajax!", "error");
                });
            }
        });
    });
    $(document).on('change', '#payment_method', function () {
        if($('#payment_method option:selected').val() == 2) {
            $('.cheque_number').removeClass('d-none');
        }else{
            $('.cheque_number').addClass('d-none');
        }
        account_list($('#payment_method option:selected').val());
    });
    });
    function account_list(payment_method,account_id='') {
        $.ajax({
                url: "<?php echo e(route('account.list')); ?>",
                type: "POST",
                data: { payment_method: payment_method,_token: _token},
                success: function (data) {
                    $('#payment_form #account_id').html('');
                    $('#payment_form #account_id').html(data);
                    $('#payment_form #account_id.selectpicker').selectpicker('refresh');
                    if(account_id) {
                        $('#payment_form #account_id').val(account_id);
                        $('#payment_form #account_id.selectpicker').selectpicker('refresh');
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
            });
    }
    function payment_list(id) {
        $.ajax({
            url: "<?php echo e(route('purchase.payment.show')); ?>",
            type: "POST",
            data: { id: id,_token: _token},
            success: function (data) {
                $('#payment_view_modal #payment-list tbody').html();
                $('#payment_view_modal #payment-list tbody').html(data);
            },
            error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
        });
    }
$(document).on('click','.change_status',function(){
    $('#purchase_status_form #purchase_change_status_id').val($(this).data('id'));
    $('#purchase_status_modal').modal({
        keyboard: false,
        backdrop: 'static',
    });
    $('#purchase_status_modal .modal-title').html('<span>Change Purchase Status</span>');
    $('#purchase_status_modal #change-status-btn').text('Change Status');
});
$(document).on('click','#change-status-btn',function(){
    let id      = _('purchase_change_status_id').value;
    let status  = _('purchase_change_status').value;
    // let status  = $('#purchase_status_form #purchase_status').val;
    // console.log(id,status);
    if(status != ''){
        $.ajax({
            url        : "<?php echo e(url('purchase/change-status')); ?>" + "/" + + id + "/" + status,
            dataType   : "JSON",
            beforeSend : function(){
                $('#change-status-btn').addClass('kt-spinner kt-spinner--md kt-spinner--light');
            },
            complete   : function(){
                $('#change-status-btn').removeClass('kt-spinner kt-spinner--md kt-spinner--light');
            },
            success: function (data) {
                notification(data.status, data.message);
                if (data.status == 'success') {
                    window.location.replace("<?php echo e(route('purchase')); ?>");
                }
            },
            error: function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
        });
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\insaf_erp_b2gsoft\Modules/Purchase\Resources/views/index.blade.php ENDPATH**/ ?>