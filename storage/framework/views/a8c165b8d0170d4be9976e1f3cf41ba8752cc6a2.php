

<?php $__env->startSection('title', $page_title); ?>

<?php $__env->startPush('styles'); ?>
<link href="plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" type="text/css" />
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
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Manage</button>
                        <div class="dropdown-menu" style="">
                            <a class="dropdown-item" href="<?php echo e(url('customer')); ?>">Customer</a>
                            <a class="dropdown-item" href="<?php echo e(url('customer-ledger')); ?>">Customer Ledger</a>
                            <a class="dropdown-item" href="<?php echo e(url('paid-customer')); ?>">Paid Customer</a>
                            <a class="dropdown-item" href="<?php echo e(url('customer-advance')); ?>">Customer Advance</a>
                        </div>
                    </div>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <?php if(Auth::user()->warehouse_id): ?>
                        <input type="hidden" name="warehouse_id" id="warehouse_id" value="<?php echo e(Auth::user()->warehouse_id); ?>">
                        <?php else: ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Warehouse','name' => 'warehouse_id','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Warehouse','name' => 'warehouse_id','col' => 'col-md-3','class' => 'selectpicker']); ?>
                            <?php if(!$warehouses->isEmpty()): ?>
                                <?php $__currentLoopData = $warehouses; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $id => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($id); ?>"><?php echo e($name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'District','name' => 'district_id','col' => 'col-md-3','class' => 'selectpicker','onchange' => 'getUpazilaList(this.value,1);customer_list();']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'District','name' => 'district_id','col' => 'col-md-3','class' => 'selectpicker','onchange' => 'getUpazilaList(this.value,1);customer_list();']); ?>
                            <?php if(!$locations->isEmpty()): ?>
                                <?php $__currentLoopData = $locations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $location): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($location->type == 1 && $location->parent_id == null): ?>
                                    <option value="<?php echo e($location->id); ?>"><?php echo e($location->name); ?></option>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Upazila','name' => 'upazila_id','col' => 'col-md-3','class' => 'selectpicker','onchange' => 'getAreaList(this.value,1);customer_list();']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Upazila','name' => 'upazila_id','col' => 'col-md-3','class' => 'selectpicker','onchange' => 'getAreaList(this.value,1);customer_list();']); ?>
                            <?php if(!$locations->isEmpty()): ?>
                                <?php $__currentLoopData = $locations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $location): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($location->type == 2 && $location->parent_id == auth()->user()->district_id): ?>
                                    <option value="<?php echo e($location->id); ?>"><?php echo e($location->name); ?></option>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Area','name' => 'area_id','col' => 'col-md-3','class' => 'selectpicker','onchange' => 'customer_list()']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Area','name' => 'area_id','col' => 'col-md-3','class' => 'selectpicker','onchange' => 'customer_list()']); ?>
                            <?php if(!$locations->isEmpty()): ?>
                                <?php $__currentLoopData = $locations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $location): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($location->type == 4 && $location->grand_grand_parent_id == auth()->user()->district_id): ?>
                                    <option value="<?php echo e($location->id); ?>"><?php echo e($location->name); ?></option>
                                    <?php endif; ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endif; ?>
                         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.form.selectbox','data' => ['labelName' => 'Customer','name' => 'customer_id','col' => 'col-md-3','class' => 'selectpicker']]); ?>
<?php $component->withName('form.selectbox'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['labelName' => 'Customer','name' => 'customer_id','col' => 'col-md-3','class' => 'selectpicker']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
                        
                        <div class="<?php echo e(Auth::user()->warehouse_id ? 'col-md-12' : 'col-md-9'); ?>">
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
                                        <th>Customer Name</th>
                                        <th>Shop Name</th>
                                        <th>Mobile</th>
                                        <th>Warehouse</th>
                                        <th>District</th>
                                        <th>Upazila</th>
                                        <th>Area</th>
                                        <th>Group</th>
                                        <th>Balance</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                                <tfoot>
                                    <tr class="bg-primary">
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th style="text-align: right !important;font-weight:bold;">Total</th>
                                        <th style="text-align: right !important;font-weight:bold;"></th>
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
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script src="plugins/custom/datatables/datatables.bundle.js" type="text/javascript"></script>
<script>
var table;
$("#kt_body").addClass("aside-minimize");
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
            "url": "<?php echo e(route('credit.customer.datatable.data')); ?>",
            "type": "POST",
            "data": function (data) {
                data.warehouse_id  = $("#form-filter #warehouse_id").val();
                data.district_id  = $("#form-filter #district_id").val();
                data.upazila_id  = $("#form-filter #upazila_id").val();
                data.area_id     = $("#form-filter #area_id").val();
                data.customer_id = $("#form-filter #customer_id").val();
                data._token      = _token;
            }
        },
        "columnDefs": [
            {
                "targets": [9],
                "orderable": false,
                "className": "text-right"
            },
            {
                "targets": [0,3,4,5,6,7,8],
                "className": "text-center"
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
                "title": "<?php echo e($page_title); ?> List",
                "orientation": "landscape", //portrait
                "pageSize": "A4", //A3,A5,A6,legal,letter
                "exportOptions": {
                    columns: function (index, data, node) {
                        return table.column(index).visible();
                    }
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
                    columns: function (index, data, node) {
                        return table.column(index).visible();
                    }
                },
                footer:true
            },
            {
                "extend": 'excel',
                'text':'Excel',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "<?php echo e($page_title); ?> List",
                "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>-list",
                "exportOptions": {
                    columns: function (index, data, node) {
                        return table.column(index).visible();
                    }
                },
                footer:true
            },
            {
                "extend": 'pdf',
                'text':'PDF',
                'className':'btn btn-secondary btn-sm text-white',
                "title": "<?php echo e($page_title); ?> List",
                "filename": "<?php echo e(strtolower(str_replace(' ','-',$page_title))); ?>-list",
                "orientation": "landscape", //portrait
                "pageSize": "A4", //A3,A5,A6,legal,letter
                "exportOptions": {
                    columns: function (index, data, node) {
                        return table.column(index).visible();
                    }
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

            total = api.column(9).data().reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

            // Total over this page
            pageTotal = api.column(9, { page: 'current'}).data().reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );

            // Update footer
            $( api.column( 9 ).footer() ).html('= '+number_format(total) +' Tk');
        }
    });

    $('#btn-filter').click(function () {
        table.ajax.reload();
    });

    $('#btn-reset').click(function () {
        $('#form-filter')[0].reset();
        $('#form-filter .selectpicker').selectpicker('refresh');
        table.ajax.reload();
        customer_list();
    });




});
customer_list();
function customer_list()
{
    let warehouse_id = document.getElementById('warehouse_id').value;
    let district_id = document.getElementById('district_id').value;
    let upazila_id = document.getElementById('upazila_id').value;
    let area_id = document.getElementById('area_id').value;
    $.ajax({
        url:"<?php echo e(url('credit-customer-list')); ?>",
        type:"POST",
        data:{upazila_id:upazila_id,district_id:district_id,area_id:area_id,warehouse_id:warehouse_id,_token:_token},
        dataType:"JSON",
        success:function(data){
            html = `<option value="">Select Please</option>`;
            $.each(data, function(key, value) {
                html += `<option value="${value.id}">${value.name} - ${value.mobile} (${value.shop_name})</option>`;
            });
            $('#form-filter #customer_id').empty().append(html);
            $('#form-filter #customer_id.selectpicker').selectpicker('refresh');
      
        },
    });

}
function getUpazilaList(district_id,selector,upazila_id=''){
    $.ajax({
        url:"<?php echo e(url('district-id-wise-upazila-list')); ?>/"+district_id,
        type:"GET",
        dataType:"JSON",
        success:function(data){
            html = `<option value="">Select Please</option>`;
            $.each(data, function(key, value) {
                html += '<option value="'+ key +'">'+ value +'</option>';
            });
            if(selector == 1)
            {
                $('#form-filter #upazila_id').empty();
                $('#form-filter #upazila_id').append(html);
            }else{
                $('#store_or_update_form #upazila_id').empty();
                $('#store_or_update_form #upazila_id').append(html);
            }
            $('.selectpicker').selectpicker('refresh');
            if(upazila_id){
                $('#store_or_update_form #upazila_id').val(upazila_id);
                $('#store_or_update_form #upazila_id.selectpicker').selectpicker('refresh');
            }
      
        },
    });
}
function getAreaList(upazila_id,selector,area_id=''){
    $.ajax({
        url:"<?php echo e(url('upazila-id-wise-area-list')); ?>/"+upazila_id,
        type:"GET",
        dataType:"JSON",
        success:function(data){
            html = `<option value="">Select Please</option>`;
            $.each(data, function(key, value) {
                html += '<option value="'+ key +'">'+ value +'</option>';
            });
            if(selector == 1)
            {
                $('#form-filter #area_id').empty();
                $('#form-filter #area_id').append(html);
            }else{
                $('#store_or_update_form #area_id').empty();
                $('#store_or_update_form #area_id').append(html);
            }
            $('.selectpicker').selectpicker('refresh');
            if(area_id){
                $('#store_or_update_form #area_id').val(area_id);
                $('#store_or_update_form #area_id.selectpicker').selectpicker('refresh');
            }
      
        },
    });
}
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/Customer\Resources/views/credit-customer/index.blade.php ENDPATH**/ ?>