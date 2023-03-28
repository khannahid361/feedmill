<?php $__env->startSection('title', $page_title); ?>
<?php $__env->startPush('styles'); ?>
    <link rel="stylesheet" href="<?php echo e(asset('css/jquery-ui.css')); ?>" />
    <link href="<?php echo e(asset('css/bootstrap-datetimepicker.min.css')); ?>" rel="stylesheet" type="text/css" />
    <style>
        .customer.table td{
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
                    <div class="card-title"><h3 class="card-label"><i class="<?php echo e($page_icon); ?> text-primary"></i> <?php echo e($sub_title); ?></h3></div>
                    <div class="card-toolbar">
                        <a href="<?php echo e(route('dealer.panel.sale.index')); ?>" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <form action="" id="sale_store_form" method="post" enctype="multipart/form-data">
                            <?php echo csrf_field(); ?>
                            <div class="row">
                                <div class="form-group col-md-3 required">
                                    <label for="memo_no">Memo No.</label>
                                    <input type="text" class="fcs form-control" name="memo_no" id="memo_no" value="<?php echo e($memo_no); ?>"/>
                                </div>
                                <div class="form-group col-md-3 required">
                                    <label for="sale_date">Sale Date</label>
                                    <input type="text" class="fcs form-control date" name="sale_date" id="sale_date" value="<?php echo e(date('Y-m-d')); ?>" readonly />
                                </div>
                                <div class="col-md-3">
                                    <label for="dealer_id">Dealer</label>
                                    <select class="form-control" id="dealer_id" disabled>
                                        <?php $__currentLoopData = $dealer; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($value->id); ?>" <?php if($value->id == Auth::guard('dealer')->user()->id): ?> selected="selected" <?php endif; ?>><?php echo e($value->name); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                                <input type="hidden" name="dealer_id" value="<?php echo e(Auth::guard('dealer')->user()->id); ?>">
                                <div class="form-group col-md-3">
                                    <label for="document">Attach Document <i class="fas fa-info-circle" data-toggle="tooltip" data-theme="dark" title="Maximum Allowed File Size 5MB and Format (png,jpg,jpeg,svg,webp,pdf,csv,xlxs)"></i></label>
                                    <input type="file" class="form-control fcs" name="document" id="document">
                                </div>
                                <div class="col-md-12">
                                    <table class="table table-bordered" id="product_table">
                                        <thead class="bg-primary">
                                        <th>Name</th>
                                        <th class="text-center">Code</th>
                                        <th class="text-center">Sale Unit</th>
                                        <th class="text-center">Available Qty</th>
                                        <th class="text-center">Qty</th>
                                        <th class="text-center">Free Qty</th>
                                        <th class="text-right">Net Sale Unit Price</th>
                                        <th class="text-right">Tax</th>
                                        <th class="text-right">Subtotal</th>
                                        <th class="text-center"><i class="fas fa-trash text-white"></i></th>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="col-md-3">
                                                <select name="products[1][pro_id]" id="product_list_1" class="fcs col-md-12 product_name form-control" onchange="getProductDetails(this,1)"  data-live-search="true" data-row="1">
                                                    <?php if(!$products->isEmpty()): ?>
                                                        <option value="0">Please Select</option>
                                                        <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <option value="<?php echo e($product->product_id); ?>"><?php echo e($product->name); ?></option>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    <?php endif; ?>
                                                </select>
                                            </td>
                                            <td class="product-code_tx_1 text-center" id="products_code_1" data-row="1"></td>
                                            <td class="unit-name_tx_1 text-center" id="products_unit_1" data-row="1"></td>
                                            <td class="available-qty_tx_1 text-center" id="products_available_qty_1" data-row="1"></td>
                                            <td><input type="text" class="fcs form-control qty text-center" name="products[1][qty]" id="products_qty_1" value="1" data-row="1"></td>
                                            <td><input type="text" class="fcs form-control free_qty text-center bg-secondary" name="products[1][free_qty]" id="products_free_qty_1" value="0" data-row="1" readonly></td>
                                            <td><input type="text" class="fcs text-right form-control net_unit_price bg-secondary" name="products[1][net_unit_price]" id="products_net_unit_price_1" data-row="1" readonly></td>
                                            <td class="tax text-right" id="tax_tx_1" data-row="1"></td>
                                            <td class="sub-total text-right" id="sub_total_tx_1" data-row="1"></td>
                                            <td class="text-center"></td>
                                            <input type="hidden" class="product-id_vl_1" name="products[1][id]" id="products_id_vl_1" data-row="1">
                                            <input type="hidden" class="product-code_vl_1" name="products[1][code]" id="products_code_vl_1" data-row="1">
                                            <input type="hidden" class="product-unit_vl_1" name="products[1][unit]"  id="products_unit_vl_1" data-row="1">
                                            <input type="hidden" class="stock-qty_vl_1" name="products[1][stock_qty]" id="products_stock_qty_1"  data-row="1">
                                            <input type="hidden" class="free-stock-qty_vl_1" name="products[1][free_stock_qty]" id="products_free_stock_qty_1"  data-row="1">
                                            <input type="hidden" class="tax-rate" name="products[1][tax_rate]" id="tax_rate_vl_1" data-row="1">
                                            <input type="hidden" class="tax-value" name="products[1][tax]" id="tax_value_vl_1" data-row="1">
                                            <input type="hidden" class="subtotal-value" name="products[1][subtotal]" id="subtotal_value_vl_1" data-row="1">
                                        </tr>
                                        </tbody>
                                        <tfoot class="bg-primary">
                                        <th colspan="4" class="font-weight-bolder">Total</th>
                                        <th id="total-qty" class="text-center font-weight-bolder">0.00</th>
                                        <th id="total-free-qty" class="text-center font-weight-bolder">0.00</th>
                                        <th></th>
                                        <th id="total-tax" class="text-right font-weight-bolder">0.00</th>
                                        <th id="total" class="text-right font-weight-bolder">0.00</th>
                                        <th class="text-center"><button type="button" class="btn btn-success btn-md add-product"><i class="fas fa-plus"></i></button></th>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="col-md-12">
                                    <table class="table table-bordered">
                                        <thead class="bg-primary">
                                        <th><strong>Items</strong><span class="float-right" id="item">0(0)</span></th>
                                        <th><strong>Total</strong><span class="float-right" id="subtotal">0.00</span></th>
                                        </thead>
                                    </table>
                                </div>
                                <div class="col-md-12">
                                    <input type="hidden" name="total_qty">
                                    <input type="hidden" name="total_free_qty">
                                    <input type="hidden" name="total_tax">
                                    <input type="hidden" name="total_price">
                                    <input type="hidden" name="item">
                                    <input type="hidden" name="total_commission" id="total_commission">
                                </div>
                                <div class="form-group col-md-12 text-center pt-5">
                                    <button type="button" class="btn btn-danger btn-sm mr-3" onclick="window.location.replace('<?php echo e(route("dealer.panel.sale.add")); ?>');"><i class="fas fa-sync-alt"></i> Reset</button>
                                    <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i> Save</button>
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
        var product_array             = [];
        var product_code              = [];
        var product_name              = [];
        var product_qty               = [];
        var product_free_qty          = [];
        var product_price             = [];
        var tax_rate                  = [];
        var tax_name                  = [];
        var tax_method                = [];
        var unit_name                 = [];
        var unit_operator             = [];
        var unit_operation_value      = [];
        var temp_unit_name            = [];
        var temp_unit_operator        = [];
        var temp_unit_operation_value = [];
        var rowindex;
        var customer_group_rate;
        var row_product_price;
        $("input,select,textarea").bind("keydown", function (e) {
            var keyCode = e.keyCode || e.which;
            if(keyCode == 13) {
                e.preventDefault();
                $('input, select, textarea')
                    [$('input,select,textarea').index(this)+1].focus();
            }
        });
        $(document).ready(function () {
            $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
            $('#dealer_id').on('change',function(){
                var id = $(this).val();
                $.get('<?php echo e(url("dealer/previous-balance")); ?>/'+id,function(data){
                    $('#previous_due').val(parseFloat(data).toFixed(2));
                });
            });
            $('#product_table').on('keyup','.qty',function(){
                rowindex = $(this).closest('tr').index();
                if(parseFloat($(this).val()) < 1 && parseFloat($(this).val()) != ''){
                    $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .qty').val(1);
                    notification('error','Quantity can\'t be less than 1');
                }
                checkQuantity($(this).val(),true,free_qty=0,rowindex,input=2);
            });
            $('#product_table').on('keyup','.free_qty',function(){
                rowindex = $(this).closest('tr').index();
                if(parseFloat($(this).val()) < 0){
                    notification('error','Free qty must be greater than 0');
                    $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .free_qty').val('');
                }
                calculateTotal();
            });
            $('#product_table').on('keyup','.net_unit_price',function(){
                rowindex = $(this).closest('tr').index();
                if($(this).val() < 1 && $(this).val() != ''){
                    $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .net_unit_price').val(1);
                    notification('error','Net unit price can\'t be less than 1');
                }else{
                    product_price[rowindex] = $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .net_unit_price').val();
                }
                var qty = $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .qty').val();
                let free_qty = $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .free_qty').val();
                if(parseFloat($(this).val()) == ''){
                    free_qty = 0;
                }
                if(qty > 0){
                    checkQuantity(qty,true,0,rowindex,input=1);
                }
            });
            $('#product_table').on('click','.remove-product',function(){
                rowindex = $(this).closest('tr').index();
                product_price.splice(rowindex,1);
                tax_rate.splice(rowindex,1);
                tax_name.splice(rowindex,1);
                tax_method.splice(rowindex,1);
                unit_name.splice(rowindex,1);
                unit_operator.splice(rowindex,1);
                unit_operation_value.splice(rowindex,1);
                $(this).closest('tr').remove();
                calculateTotal();
            });
            var count = 1;
            $('#product_table').on('click','.add-product',function(){
                count++;
                product_row_add(count);
            });
            function product_row_add(count){
                var newRow = $('<tr>');
                var cols = '';
                cols += `<td>
                    <select name="products[${count}][pro_id]" id="product_list_${count}" class="fcs selectpicker col-md-12  products-alls product_details_${count} form-control" onchange="getProductDetails(this,${count})" data-live-search="true" data-row="${count}">
                        <?php if(!$products->isEmpty()): ?>
                        <option value="0">Please Select</option>
                        <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <option value="<?php echo e($product->product_id); ?>"><?php echo e($product->name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endif; ?>
                    </select>
                    </td>`;
                cols += `<td class="product-code_tx_${count} text-center" id="products_code_${count}" data-row="${count}"></td>`
                cols += `<td class="unit-name_tx_${count} text-center" id="products_unit_${count}" data-row="${count}"></td>`;
                cols += `<td class="available-qty_tx_${count} text-center" id="products_available_qty_${count}" data-row="${count}"></td>`;
                cols += `<td><input type="text" class="fcs form-control qty text-center" name="products[${count}][qty]" id="products_qty_${count}" value="1" data-row="${count}"></td>`;
                cols += `<td><input type="text" class="fcs form-control free_qty text-center bg-secondary" name="products[${count}][free_qty]" id="products_free_qty_${count}" value="0" data-row="${count}" readonly></td>`;
                cols += `<td><input type="text" class="fcs text-right form-control net_unit_price bg-secondary" name="products[${count}][net_unit_price]" id="products_net_unit_price_${count}" data-row="${count}" readonly></td>`;
                cols += `<td class="tax text-right" id="tax_tx_${count}" data-row="${count}"></td>`;
                cols += `<td class="sub-total text-right" id="sub_total_tx_${count}" data-row="${count}"></td>`;
                cols += `<td class="text-center" data-row="${count}"><button type="button" class="btn btn-danger btn-md remove-product"><i class="fas fa-trash"></i></button></td>`;
                cols += `<input type="hidden" class="product-id_vl_${count}" name="products[${count}][id]" id="products_id_vl_${count}" data-row="${count}">`;
                cols += `<input type="hidden" class="product-code_vl_${count}" name="products[${count}][code]" id="products_code_vl_${count}" data-row="${count}">`;
                cols += `<input type="hidden" class="product-unit_vl_${count}" name="products[${count}][unit]" id="products_unit_vl_${count}">`;
                cols += `<input type="hidden" class="stock-qty_vl_${count}" name="products[${count}][stock_qty]" id="products_stock_qty_${count}"  data-row="${count}">`;
                cols += `<input type="hidden" class="free-stock-qty_vl_${count}" name="products[${count}][free_stock_qty]" id="products_free_stock_qty_${count}" data-row="${count}">`;
                cols += `<input type="hidden" class="tax-rate" name="products[${count}][tax_rate]" id="tax_rate_vl_${count}" data-row="${count}">`;
                cols += `<input type="hidden" class="tax-value" name="products[${count}][tax]" id="tax_value_vl_${count}" data-row="${count}">`;
                cols += `<input type="hidden" class="subtotal-value" name="products[${count}][subtotal]" id="subtotal_value_vl_${count}" data-row="${count}">`;
                newRow.append(cols);
                $('#product_table tbody').append(newRow);
                $('#product_table .selectpicker').selectpicker();
            }
        });
        function product_search(data,row) {
            var dealer_id  = $('#dealer_id option:selected').val();
            rowindex = $('#product_list_'+row).closest('tr').index();
            var temp_data = $('#product_list_'+row).val();
            if(!dealer_id){
                $('#product_list_'+row).val('');
                $('#product_table #product_list_'+row+'.selectpicker').selectpicker('refresh');
                notification('error','Please select Dealer');
            }else {
                $.ajax({
                    url: '<?php echo e(route("dealer.panel.product.search.with.id")); ?>',
                    type: 'POST',
                    data: {data: data, _token: "<?php echo e(csrf_token()); ?>"},
                    success: function (data) {
                        console.log(data);
                        temp_unit_name = data.unit_name.split(',');
                        $('#products_code_' + row).text(data.code);
                        $('#products_unit_' + row).text(temp_unit_name[0]);
                        $('#products_available_qty_' + row).text(data.qty);
                        $('#products_net_unit_price_' + row).val(data.price);
                        $('#tax_tx_' + row).text(data.tax_name);
                        $('#products_id_vl_' + row).val(data.id);
                        $('#products_code_vl_' + row).val(data.code);
                        $('#products_unit_vl_' + row).val(temp_unit_name[0]);
                        $('#products_stock_qty_' + row).val(data.qty);
                        $('#products_free_stock_qty_' + row).val(data.qty);
                        $('#tax_rate_vl_' + row).val(data.tax_rate);
                        if (product_price[rowindex] == 'undefined') {
                            product_price.push(parseFloat(data.price));
                        } else {
                            product_price[rowindex] = (parseFloat(data.price));
                        }
                        product_qty.push(data.qty);
                        product_free_qty.push(data.free_qty);
                        tax_rate.push(parseFloat(data.tax_rate));
                        tax_name.push(data.tax_name);
                        tax_method.push(data.tax_method);
                        unit_name.push(data.unit_name);
                        unit_operator.push(data.unit_operator);
                        unit_operation_value.push(data.unit_operation_value);
                        checkQuantity(1, true, 0, rowindex, input = 2);
                    }
                });
            }
        }
        function checkQuantity(sale_qtyadd,flag,free_qty=0,rowindex,input=2){
            var sale_qty=0;
            if(free_qty != 0){
                sale_qty = (sale_qtyadd + free_qty);
            }else{
                sale_qty = sale_qtyadd;
            }
            var operator = unit_operator[rowindex].split(',');
            var operation_value = unit_operation_value[rowindex].split(',');
            if(operator[0] == '*') {
                total_qty = sale_qty * operation_value[0];
            }else if(operator[0] == '/'){
                total_qty = sale_qty / operation_value[0];
            }
            if(parseFloat(total_qty) > parseFloat(product_qty[rowindex])){
                notification('error','Quantity exceed stock quantity');
                if(flag) {
                    sale_qty = sale_qty.substring(0,sale_qty.length - 1);
                    $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.qty').val(sale_qty);
                }else{
                    return;
                }
            }
            if(!flag) {
                $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.qty').val(sale_qty);
            }
            calculateProductData(sale_qtyadd,rowindex,input);
        }
        function calculateProductData(quantity,rowindex,input=2){
            unitConversion(rowindex);
            $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.tax-rate').val(tax_rate[rowindex].toFixed(2));
            $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.unit-name').text(unit_name[rowindex].slice(0,unit_name[rowindex].indexOf(",")));
            if(tax_method[rowindex] == 1) {
                var net_unit_price = row_product_price - 0;
                var tax = net_unit_price * quantity * (tax_rate[rowindex]/100);
                var sub_total = (net_unit_price * quantity) + tax;
            }else{
                var sub_total_unit = row_product_price - 0;
                var net_unit_price = (100 / (100 + tax_rate[rowindex])) * sub_total_unit;
                var tax = (sub_total_unit - net_unit_price) * quantity;
                var sub_total = sub_total_unit * quantity;
            }if(input==2){
                $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.net_unit_price').val(net_unit_price.toFixed(2));
            }
            $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(8)').text(tax.toFixed(2));
            $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.tax-value').val(tax.toFixed(2));
            $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(9)').text(sub_total.toFixed(2));
            $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.subtotal-value').val(sub_total.toFixed(2));
            calculateTotal();
        }
        function unitConversion(rowindex) {
            var row_unit_operator = unit_operator[rowindex].slice(0,unit_operator[rowindex].indexOf(','));
            var row_unit_operation_value = unit_operation_value[rowindex].slice(0,unit_operation_value[rowindex].indexOf(','));
            row_unit_operation_value = parseFloat(row_unit_operation_value);
            if(row_unit_operator == '*') {
                row_product_price = product_price[rowindex] * row_unit_operation_value;
            }else{
                row_product_price = product_price[rowindex] / row_unit_operation_value;
            }
        }
        function calculateTotal() {
            var total_qty = 0;
            var total_free_qty = 0;
            $('.qty').each(function() {
                if($(this).val() == ''){
                    total_qty += 0;
                }else{
                    total_qty += parseFloat($(this).val());
                }
            });
            $('#total-qty').text(total_qty);
            $('input[name="total_qty"]').val(total_qty);
            $('.free_qty').each(function() {
                if($(this).val() == ''){
                    total_free_qty += 0;
                }else{
                    total_free_qty += parseFloat($(this).val());
                }
            });
            $('#total-free-qty').text(total_free_qty);
            $('input[name="total_free_qty"]').val(total_free_qty);
            var total_tax = 0;
            $('.tax').each(function() {
                total_tax += parseFloat($(this).text());
            });
            $('#total-tax').text(total_tax.toFixed(2));
            $('input[name="total_tax"]').val(total_tax.toFixed(2));
            var total = 0;
            $('.sub-total').each(function() {
                total += parseFloat($(this).text());
            });
            $('#total').text(total.toFixed(2));
            $('input[name="total_price"]').val(total.toFixed(2));
            calculateGrandTotal();
        }
        function calculateGrandTotal() {
            var item           = $('#product_table tbody tr:last').index();
            var total_qty      = parseFloat($('#total-qty').text());
            var total_free_qty = parseFloat($('#total-free-qty').text());
            var subtotal       = parseFloat($('#total').text());
            var order_tax      = parseFloat($('select[name="order_tax_rate"]').val());
            var order_discount = parseFloat($('#order_discount').val());
            var shipping_cost  = parseFloat($('#shipping_cost').val());
            var labor_cost     = parseFloat($('#labor_cost').val());
            if(!order_discount){
                order_discount = 0.00;
            }
            if(!shipping_cost){
                shipping_cost = 0.00;
            }
            if(!labor_cost){
                labor_cost = 0.00;
            }
            item = ++item + '(' + (total_qty+total_free_qty) + ')';
            order_tax = (subtotal - order_discount) * (order_tax / 100);
            var grand_total = (subtotal + order_tax + shipping_cost + labor_cost) - order_discount;
            var previous_due = parseFloat($('#previous_due').val());
            var net_total = grand_total + previous_due;
            var total_commission = (subtotal - order_discount);
            $('#item').text(item);
            $('input[name="item"]').val($('#product_table tbody tr:last').index() + 1);
            $('#subtotal').text(subtotal.toFixed(2));
            $('#order_total_tax').text(order_tax.toFixed(2));
            $('input[name="order_tax"]').val(order_tax.toFixed(2));
            $('#shipping_total_cost').text(shipping_cost.toFixed(2));
            $('#labor_total_cost').text(labor_cost.toFixed(2));
            $('#grand_total').text(grand_total.toFixed(2));
            $('input[name="grand_total"]').val(grand_total.toFixed(2));
            $('input[name="net_total"]').val(net_total.toFixed(2));
            $('input[name="net_total"]').val(net_total.toFixed(2));
            $('input[name="total_commission"]').val(total_commission.toFixed(2));
            if($('#payment_status option:selected').val() == 1) {
                $('#paid_amount').val(net_total.toFixed(2));
                $('#due_amount').val(parseFloat(0).toFixed(2));
            }else if($('#payment_status option:selected').val() == 2){
                var paid_amount = $('#paid_amount').val();
                $('#due_amount').val(parseFloat(net_total-paid_amount).toFixed(2));
            }else{
                $('#due_amount').val(parseFloat(net_total).toFixed(2));
            }
        }
        $('input[name="order_discount"]').on('input',function(){
            if(parseFloat($(this).val()) > parseFloat($('input[name="grand_total"]').val())) {
                notification('error','Order discount can\'t exceed grand total amount');
                $('input[name="order_discount"]').val(parseFloat(0));
            }
            calculateGrandTotal();
        });
        $('input[name="shipping_cost"]').on('input',function(){
            calculateGrandTotal();
        });
        $('input[name="labor_cost"]').on('input',function(){
            calculateGrandTotal();
        });
        $('select[name="order_tax_rate"]').on('change',function(){
            calculateGrandTotal();
        });
        $('#payment_status').on('change',function(){
            if($(this).val() != 3){
                $('.payment').removeClass('d-none');
                $('#paid_amount').val($('input[name="net_total"]').val());
                $('#due_amount').val(parseFloat(0).toFixed(2));
            }else{
                $('#paid_amount').val(0);
                $('#due_amount').val(parseFloat($('input[name="net_total"]').val()).toFixed(2));
                $('.payment').addClass('d-none');
            }
        });
        $('#payment_method').on('change',function(){
            if($(this).val() != 1){
                $('.reference_no').removeClass('d-none');
            }else{
                $('.reference_no').addClass('d-none');
            }
        });
        $('#paid_amount').on('input',function(){
            var payable_amount = parseFloat($('input[name="net_total"]').val());
            var paid_amount = parseFloat($(this).val());

            if(paid_amount > payable_amount){
                $('#paid_amount').val(payable_amount.toFixed(2));
                notification('error','Paid amount cannot be bigger than net total amount');
            }
            $('#due_amount').val((payable_amount - parseFloat($('#paid_amount').val())).toFixed(2));
        });
        function getProductDetails(value,rowindex){
            product_search($(value).val(),rowindex);
        }
        function loadProduct(warehouse_id=null,rowcount){
            $.ajax({
                url:"<?php echo e(url('sale/product-select-search')); ?>",
                type: 'post',
                data: { _token: "<?php echo e(csrf_token()); ?>",warehouse_id:warehouse_id},
                success: function( data ) {
                    var html = `<option value="">Select Please</option>`;
                    $.each(data, function(key, value) {
                        html += '<option value="'+ value.id +'">'+ value.label +'</option>';
                    });
                    $('#product_table #product_list_'+rowcount).empty().html(html);
                    $('#product_table #product_list_'+rowcount+'.selectpicker').selectpicker('refresh');
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
        function account_list(payment_method) {
            $.ajax({
                url    : "<?php echo e(route('account.list')); ?>",
                type   : "POST",
                data   : { payment_method: payment_method,_token: "<?php echo e(csrf_token()); ?>"},
                success: function (data) {
                    $('#sale_store_form #account_id').empty().html(data);
                    $('#sale_store_form #account_id.selectpicker').selectpicker('refresh');
                },
                error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
            });
        }
        function store_data(){
            var rownumber = $('table#product_table tbody tr:last').index();
            if (rownumber < 0) {
                notification("error","Please insert product to order table!")
            }else{
                let form = document.getElementById('sale_store_form');
                let formData = new FormData(form);
                let url = "<?php echo e(route('dealer.panel.sale.store')); ?>";
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
                        $('#sale_store_form').find('.is-invalid').removeClass('is-invalid');
                        $('#sale_store_form').find('.error').remove();
                        if (data.status == false) {
                            $.each(data.errors, function (key, value) {
                                var key = key.split('.').join('_');
                                $('#sale_store_form input#' + key).addClass('is-invalid');
                                $('#sale_store_form textarea#' + key).addClass('is-invalid');
                                $('#sale_store_form select#' + key).parent().addClass('is-invalid');
                                $('#sale_store_form #' + key).parent().append('<small class="error text-danger">' + value + '</small>');
                            });
                        } else {
                            notification(data.status, data.message);
                            if (data.status == 'success') {
                                window.location.replace("<?php echo e(route('dealer.panel.sale.index')); ?>");
                            }
                        }
                    },
                    error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
                });
            }
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('dealerpanel::layouts.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\insaf\Modules/DealerPanel\Resources/views/sale/create.blade.php ENDPATH**/ ?>