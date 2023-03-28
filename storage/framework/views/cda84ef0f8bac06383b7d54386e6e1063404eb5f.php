<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
<link href="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.css')); ?>" rel="stylesheet" type="text/css" />
<link href="<?php echo e(asset('css/daterangepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
<style>
    #dataTable ul li{
        border-bottom: 1px solid #EBEDF3;
        margin-bottom: 5px;
    }
    #dataTable ul li:last-child{
        border-bottom: 0;
        margin-bottom: 0;
    }
    #dataTable tbody tr td:nth-child(10),
    #dataTable tbody tr td:nth-child(11),
    #dataTable tbody tr td:nth-child(12),
    #dataTable tbody tr td:nth-child(13),
    #dataTable tbody tr td:nth-child(14),
    #dataTable tbody tr td:nth-child(15),
    #dataTable tbody tr td:nth-child(16),
    #dataTable tbody tr td:nth-child(17) {
        padding-left: 0px !important;
        padding-right: 0px !important;
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
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.textbox','data' => ['labelName' => 'Memo No.','name' => 'memo_no','col' => 'col-md-2']]); ?>
<?php $component->withName('form.textbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Memo No.','name' => 'memo_no','col' => 'col-md-2']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <div class="form-group col-md-3">
                            <label for="name">Choose Your Date</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed">
                                <input type="hidden" id="start_date" name="start_date">
                                <input type="hidden" id="end_date" name="end_date">
                            </div>
                        </div>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Customer','name' => 'customer_id','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Customer','name' => 'customer_id','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <?php if(!$customer->isEmpty()): ?>
                                <?php $__currentLoopData = $customer; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($value->id); ?>"><?php echo e($value->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <div class="col-md-2">
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
                        <div class="col-sm-12 table-responsive">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>Memo No</th>
                                        <th>Customer</th>
                                        <th>Sale Date</th>
                                        <th>Item</th>
                                        <th>Total Quantity</th>
                                        <th>Total Free Quantity</th>
                                        <th>Total Delivery Quantity</th>
                                        <th>Total Price</th>
                                        <th>Grand Total</th>
                                        <th>Paid Amount</th>
                                        <th>Created By</th>
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
<?php $__env->stopSection(); ?>
<?php $__env->startPush('scripts'); ?>
<script src="<?php echo e(asset('plugins/custom/datatables/datatables.bundle.js')); ?>" type="text/javascript"></script>
<script src="<?php echo e(asset('js/moment.js')); ?>"></script>
<script src="<?php echo e(asset('js/knockout-3.4.2.js')); ?>"></script>
<script src="<?php echo e(asset('js/daterangepicker.min.js')); ?>"></script>
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
var warehouse_name = '';
$(document).ready(function(){
    table = $('#dataTable').DataTable({
        "processing": true, //Feature control the processing indicator
        "serverSide": true, //Feature control DataTable server side processing mode
        "order": [], //Initial no order
        "responsive": false, //Make table responsive in mobile device
        "bInfo": true, //TO show the total number of data
        "bFilter": false, //For datatable default search box show/hide
        "lengthMenu": [
            [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
            [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
        ],
        "pageLength": 10000, //number of data show per page
        "language": {
            processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
            emptyTable: '<strong class="text-danger">No Data Found</strong>',
            infoEmpty: '',
            zeroRecords: '<strong class="text-danger">No Data Found</strong>'
        },
        "ajax": {
            "url": "<?php echo e(route('sales.report.datatable.data')); ?>",
            "type": "POST",
            "data": function (data) {
                data.memo_no        = $("#form-filter #memo_no").val();
                data.start_date     = $("#form-filter #start_date").val();
                data.end_date       = $("#form-filter #end_date").val();
                data.customer_id    = $("#form-filter #customer_id").val();
                data._token         = _token;
            }
        },
        "columnDefs": [{
                "targets": [0,1,2,3,4,5,6,7,8,9,10],
                "orderable": false,
                "className": "text-center"
            }
        ],
        "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",

        "buttons": [

            {
                "extend": 'print',
                'text':'Print',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "<?php echo e(config('settings.title') ? config('settings.title') : env('APP_NAME')); ?> <br> <?php echo e(config('settings.address')); ?><br> <?php echo e($page_title); ?> List <br> Date: <?php echo e(date('Y-m-d')); ?> ",
                "orientation": "landscape", //portrait
                "pageSize": "A4", //A3,A5,A6,legal,letter
                "exportOptions": {
                    columns: [0,1,2,3,4,5,6]
                },
                customize: function (win) {
                    $(win.document.body).addClass('bg-white');
                    $(win.document.body).find('table thead').css({'background':'#034d97'});
                    $(win.document.body).find('table tfoot tr').css({'background-color':'#034d97'});
                    $(win.document.body).find('h1').css('text-align', 'center');
                    $(win.document.body).find('h1').css('font-size', '15px');
                    $(win.document.body).find('table').css( 'font-size', 'inherit' );
                },
                footer:true
            },
            {
                "extend": 'csv',
                'text':'CSV',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "<?php echo e(config('settings.title') ? config('settings.title') : env('APP_NAME')); ?> <br> <?php echo e(config('settings.address')); ?><br> <?php echo e($page_title); ?> List <br> Date: <?php echo e(date('Y-m-d')); ?> ",
                "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>-list",
                "exportOptions": {
                    columns: [0,1,2,3,4,5,6]
                },
                footer:true
            },
            {
                "extend": 'excel',
                'text':'Excel',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "<?php echo e(config('settings.title') ? config('settings.title') : env('APP_NAME')); ?> <br> <?php echo e(config('settings.address')); ?><br> <?php echo e($page_title); ?> List <br> Date: <?php echo e(date('Y-m-d')); ?> ",
                "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>-list",
                "exportOptions": {
                    columns: [0,1,2,3,4,5,6]
                },
                footer:true
            },
            {
                "extend": 'pdf',
                'text':'PDF',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "<?php echo e(config('settings.title') ? config('settings.title') : env('APP_NAME')); ?> <br> <?php echo e(config('settings.address')); ?><br> <?php echo e($page_title); ?> List <br> Date: <?php echo e(date('Y-m-d')); ?> ",
                "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>-list",
                "orientation": "landscape", //portrait
                "pageSize": "A4", //A3,A5,A6,legal,letter
                "exportOptions": {
                    columns: [0,1,2,3,4,5,6]
                },
                customize: function(doc) {
                    doc.defaultStyle.fontSize = 7; //<-- set fontsize to 16 instead of 10
                    doc.styles.tableHeader.fontSize = 7;
                    doc.pageMargins = [5,5,5,5];
                },
                footer:true
            },
        ],
    });
    $('#btn-filter').click(function () {  table.ajax.reload();});
    $('#btn-reset').click(function () {
        $('#form-filter')[0].reset();
        $('#form-filter .selectpicker').selectpicker('refresh');
        $('#form-filter #start_date').val("<?php echo e(date('Y-m-d')); ?>");
        $('#form-filter #end_date').val("<?php echo e(date('Y-m-d')); ?>");
        table.ajax.reload();
    });
});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Report\Resources/views/sales-report.blade.php ENDPATH**/ ?>