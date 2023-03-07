

<?php $__env->startSection('title', $page_title); ?>

<?php $__env->startPush('styles'); ?>
<link href="plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
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
                    <div class="row justify-content-center">
                        <div class="form-group col-md-4">
                            <label for="name">Choose Your Date</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed" value="<?php echo e(date('Y-m-d')); ?> To <?php echo e(date('Y-m-d')); ?>">
                                <input type="hidden" id="start_date" name="start_date" value="<?php echo e(date('Y-m-d')); ?>">
                                <input type="hidden" id="end_date" name="end_date" value="<?php echo e(date('Y-m-d')); ?>">
                            </div>
                        </div>
                        <?php if(Auth::user()->warehouse_id): ?>
                        <input type="hidden" name="warehouse_id" id="warehouse_id" value="<?php echo e(Auth::user()->warehouse_id); ?>">
                        <?php else: ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Showroom','name' => 'warehouse_id','col' => 'col-md-4','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Showroom','name' => 'warehouse_id','col' => 'col-md-4','class' => 'selectpicker']); ?>
                            <?php if(!$warehouses->isEmpty()): ?>
                                <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($value->id); ?>"><?php echo e($value->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php endif; ?>

                        <div class="<?php echo e((Auth::user()->warehouse_id) ? 'col-md-8' : 'col-md-4'); ?>">
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
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        <th>Sl</th>
                                        <?php if(empty(Auth::user()->warehouse_id)): ?>
                                        <th>Warehouse</th>
                                        <?php endif; ?>
                                        <th>Date</th>
                                        <th>Collection Received</th>
                                        <th>Payment</th>
                                        <th>Closing Balance</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                                <tfoot>
                                    <tr class="bg-primary">
                                        <th></th>
                                        <?php if(empty(Auth::user()->warehouse_id)): ?>
                                        <th></th>
                                        <?php endif; ?>
                                        <th style="text-align: right !important;font-weight:bold;">Total</th>
                                        <th style="text-align: right !important;font-weight:bold;"></th>
                                        <th style="text-align: right !important;font-weight:bold;"></th>
                                        <th style="text-align: right !important;font-weight:bold;"></th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                <!--end: Datatable-->
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
<?php echo $__env->make('report::closing-report.view', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="plugins/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
<script src="js/moment.js"></script>
<script src="js/knockout-3.4.2.js"></script>
<script src="js/daterangepicker.min.js"></script>
<script>
$("#kt_body").addClass("aside-minimize");
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

    table = $('#dataTable').DataTable({
        "processing": true, //Feature control the processing indicator
        "serverSide": true, //Feature control DataTable server side processing mode
        "order": [], //Initial no order
        "responsive": true, //Make table responsive in mobile device
        "bInfo": true, //TO show the total number of data
        "bFilter": false, //For datatable default search box show/hide
        "lengthMenu": [
            [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
            [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
        ],
        "pageLength": 25, //number of data show per page
        "language": { 
            processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
            emptyTable: '<strong class="text-danger">No Data Found</strong>',
            infoEmpty: '',
            zeroRecords: '<strong class="text-danger">No Data Found</strong>'
        },
        "ajax": {
            "url": "<?php echo e(route('closing.report.datatable.data')); ?>",
            "type": "POST",
            "data": function (data) {
                data.start_date   = $("#form-filter #start_date").val();
                data.end_date     = $("#form-filter #end_date").val();
                data.warehouse_id      = $("#form-filter #warehouse_id").val();
                data._token       = _token;
            }
        },
        "columnDefs": [
            {
             <?php if(empty(Auth::user()->warehouse_id)): ?>
            "targets": [6],
            <?php else: ?>
            "targets": [5],
            <?php endif; ?>
                
                "orderable": false,
                "className": "text-center"
            },
            {
                <?php if(empty(Auth::user()->warehouse_id)): ?>
                "targets": [0,1,2],
                <?php else: ?>
                "targets": [0,1],
                <?php endif; ?>
                "className": "text-center"
            },
            {
                <?php if(empty(Auth::user()->warehouse_id)): ?>
                "targets": [3,4,5],
                <?php else: ?>
                "targets": [2,3,4],
                <?php endif; ?>
                "className": "text-right"
            },
        ],
        "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",

        "buttons": [
            {
                'extend':'colvis','className':'btn btn-secondary btn-sm text-white','text':'Column','columns': ':gt(0)'
            },
            {
                "extend": 'print',
                'text':'Print',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "<?php echo e($page_title); ?>",
                "orientation": "landscape", //portrait
                "pageSize": "A4", //A3,A5,A6,legal,letter
                "exportOptions": {
                    <?php if(empty(Auth::user()->warehouse_id)): ?>
                    columns: ':visible:not(:eq(6))' 
                    <?php else: ?>
                    columns: ':visible:not(:eq(5))' 
                    <?php endif; ?>
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
                "title": "<?php echo e($page_title); ?> List",
                "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>-list",
                "exportOptions": {
                    <?php if(empty(Auth::user()->warehouse_id)): ?>
                    columns: ':visible:not(:eq(6))' 
                    <?php else: ?>
                    columns: ':visible:not(:eq(5))' 
                    <?php endif; ?>
                },
                footer:true
            },
            {
                "extend": 'excel',
                'text':'Excel',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "<?php echo e($page_title); ?>",
                "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>",
                "exportOptions": {
                    <?php if(empty(Auth::user()->warehouse_id)): ?>
                    columns: ':visible:not(:eq(6))' 
                    <?php else: ?>
                    columns: ':visible:not(:eq(5))' 
                    <?php endif; ?>
                },
                footer:true
            },
            {
                "extend": 'pdf',
                'text':'PDF',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "<?php echo e($page_title); ?>",
                "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>",
                "orientation": "landscape", //portrait
                "pageSize": "A4", //A3,A5,A6,legal,letter
                "exportOptions": {
                    <?php if(empty(Auth::user()->warehouse_id)): ?>
                    columns: ':visible:not(:eq(6))' 
                    <?php else: ?>
                    columns: ':visible:not(:eq(5))' 
                    <?php endif; ?>
                },
                footer:true,
                customize: function(doc) {
                doc.defaultStyle.fontSize = 7; //<-- set fontsize to 16 instead of 10 
                doc.styles.tableHeader.fontSize = 7;
                doc.styles.tableFooter.fontSize = 7;
                doc.pageMargins = [5,5,5,5];
            }  
            },
        ],
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;

            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
            <?php if(empty(Auth::user()->warehouse_id)): ?>
            var start = 3;
            var end = 5;
            <?php else: ?>
            var start = 2;
            var end = 4;
            <?php endif; ?>
            
            // Total over all pages
            for (let index = start; index <= end; index++) {
                // Total over this page
                total = api
                    .column( index )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
    
                // Total over this page
                pageTotal = api
                    .column(index, { page: 'current'} )
                    .data()
                    .reduce( function (a, b) {
                        return intVal(a) + intVal(b);
                    }, 0 );
    
                // Update footer
                $( api.column( index ).footer() ).html('= '+number_format(total) +' Tk');
            }
        }
    });

    $('#btn-filter').click(function () {
        table.ajax.reload();
    });

    $('#btn-reset').click(function () {
        $('#form-filter')[0].reset();
        $('#form-filter #start_date').val('');
        $('#form-filter #end_date').val('');
        table.ajax.reload();
    });

    $(document).on('click', '.view_data', function () {
        let id = $(this).data('id');
        if (id) {
            $.ajax({
                url: "<?php echo e(route('closing.report.show')); ?>",
                type: "POST",
                data: { id: id,_token: _token},
                success: function (data) {
                    $('#view_modal #view-data').html('');
                    $('#view_modal #view-data').html(data);
                    $('#view_modal').modal({
                        keyboard: false,
                        backdrop: 'static',
                    });
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
    });

    $(document).on('click', '.delete_data', function () {
        let id    = $(this).data('id');
        let name  = $(this).data('name');
        let row   = table.row($(this).parent('tr'));
        let url   = "<?php echo e(route('closing.report.delete')); ?>";
        delete_data(id, url, table, row, name);
    });

});
</script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Report\Resources/views/closing-report/report.blade.php ENDPATH**/ ?>