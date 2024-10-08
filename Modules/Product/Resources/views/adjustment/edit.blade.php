@extends('layouts.app')

@section('title', $page_title)

@push('styles')
<link rel="stylesheet" href="css/jquery-ui.css" />
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
@endpush

@section('content')
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <!--begin::Notice-->
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title">
                    <h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3>
                </div>
                <div class="card-toolbar">
                    <!--begin::Button-->
                    <a href="{{ route('adjustment') }}" class="btn btn-warning btn-sm font-weight-bolder">
                        <i class="fas fa-arrow-left"></i> Back</a>
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
                    <form id="update_form" method="post">
                        @csrf
                        <div class="row">
                            <input type="hidden" name="update_id" value="{{ $adjustment->id }}">

                            <div class="form-group col-md-4 required">
                                <label for="adjustment_no">Adjustment No.</label>
                                <input type="text" class="form-control" name="adjustment_no" id="adjustment_no" value="{{ $adjustment->adjustment_no }}"  />
                            </div>

                            <x-form.selectbox labelName="Depo" name="warehouse_id" col="col-md-4" required="required" class="selectpicker">
                                @if (!$warehouses->isEmpty())
                                @foreach ($warehouses as $id => $name)
                                    <option value="{{ $id }}" {{ $adjustment->warehouse_id == $id ? 'selected' : '' }}>{{ $name }}</option>
                                @endforeach
                                @endif
                            </x-form.selectbox>

                            <div class="form-group col-md-12">
                                <label for="product_code_name">Select Product</label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-barcode"></i></span>
                                    </div>
                                    <input type="text" class="form-control" name="product_code_name" id="product_code_name" placeholder="Please type product code and select...">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered" id="product_table">
                                    <thead class="bg-primary">
                                        <th width="35%">Name</th>
                                        <th width="10%" class="text-center">Base Unit</th>
                                        <th width="10%" class="text-center">Qty Base Unit</th>
                                        <th width="10%" class="text-right">Base Unit Price</th>
                                        <th width="10%" class="text-right">Tax</th>
                                        <th width="15%" class="text-right">Sub Total</th>
                                        <th class="text-center"><i class="fas fa-trash text-white"></i></th>
                                    </thead>
                                    <tbody>
                                        @php
                                            $temp_unit_name = [];
                                        @endphp
                                        @if (!$adjustment->products->isEmpty())
                                            @foreach ($adjustment->products as $key => $adjustment_product)
                                                <tr>
                                                    @php
                                                        // dd($adjustment_product->product_variant->item_code);
                                                        $tax = DB::table('taxes')->where('rate',$adjustment_product->pivot->tax_rate)->first();
                                                        $base_unit = DB::table('units')->find($adjustment_product->pivot->base_unit_id);
                                                        $unit_name = $base_unit ? $base_unit->unit_name.' ('.$base_unit->unit_code.')' : '';
                                                    @endphp
                                                    <td>{{  $adjustment_product->name.' - ('.$adjustment_product->code.')' }}</td>
                                                    <td class="text-center">{{ $unit_name }}</td>
                                                    <td><input type="text" class="form-control base_unit_qty text-center" value="{{ $adjustment_product->pivot->base_unit_qty }}" name="products[{{ $key+1 }}][base_unit_qty]" id="products_{{ $key+1 }}_base_unit_qty" data="{{ $key+1 }}"></td>
                                                    <td class="net_unit_price text-right">{{ $adjustment_product->pivot->base_unit_price }}</td>
                                                    <td class="tax text-right">{{ number_format($adjustment_product->pivot->tax,2,'.','') }}</td>
                                                    <td class="sub-total text-right">{{ number_format($adjustment_product->pivot->total,2,'.','') }}</td>
                                                    <td class="text-center"><button type="button" class="btn btn-danger btn-sm remove-product small-btn"><i class="fas fa-trash"></i></button></td>

                                                    <input type="hidden" class="product-id" name="products[{{ $key+1 }}][id]"  value="{{ $adjustment_product->id }}">
                                                    <input type="hidden"  name="products[{{ $key+1 }}][name]" value="{{ $adjustment_product->name }}">
                                                    <input type="hidden" class="product-code" name="products[{{ $key+1 }}][code]" value="{{ $adjustment_product->code }}">
                                                    <input type="hidden" class="product-unit" name="products[{{ $key+1 }}][base_unit_id]" value="{{ $adjustment_product->pivot->base_unit_id }}">
                                                    <input type="hidden" class="product-price" name="products[{{ $key+1 }}][base_unit_price]" value="{{ $adjustment_product->pivot->base_unit_price }}">
                                                    <input type="hidden" class="tax-rate" name="products[{{ $key+1 }}][tax_rate]" value="{{ $adjustment_product->pivot->tax_rate }}">
                                                    @if ($tax)
                                                    <input type="hidden" class="tax-name" value="{{ $tax->name }}">
                                                    @else
                                                    <input type="hidden" class="tax-name" value="No Tax">
                                                    @endif
                                                    <input type="hidden" class="tax-method" value="{{ $adjustment_product->tax_method }}">
                                                    <input type="hidden" class="tax-value" name="products[{{ $key+1 }}][tax]" value="{{ $adjustment_product->pivot->tax }}">
                                                    <input type="hidden" class="subtotal-value" name="products[{{ $key+1 }}][subtotal]" value="{{ $adjustment_product->pivot->total }}">
                                                </tr>
                                            @endforeach
                                        @endif
                                    </tbody>
                                    <tfoot class="bg-primary">
                                        <th colspan="2" class="font-weight-bolder">Total</th>
                                        <th id="total-qty" class="text-center font-weight-bolder">{{ number_format($adjustment->total_qty,2,'.','') }}</th>
                                        <th></th>
                                        <th id="total-tax" class="text-right font-weight-bolder">{{ number_format($adjustment->total_tax,2,'.','') }}</th>
                                        <th id="total" class="text-right font-weight-bolder">{{ number_format($adjustment->grand_total,2,'.','') }}</th>
                                        <th></th>
                                    </tfoot>
                                </table>
                            </div>

                            <div class="form-group col-md-12">
                                <label for="shipping_cost">Note</label>
                                <textarea  class="form-control" name="note" id="note" cols="30" rows="3">{{ $adjustment->note }}</textarea>
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered">
                                    <thead class="bg-primary">
                                        <th><strong>Items</strong><span class="float-right" id="item">{{ $adjustment->item.'('.$adjustment->total_qty.')' }}</span></th>
                                        <th><strong>Grand Total</strong><span class="float-right" id="grand_total">{{ number_format($adjustment->grand_total,2,'.','') }}</span></th>
                                    </thead>
                                </table>
                            </div>
                            <div class="col-md-12">
                                <input type="hidden" name="total_qty" value="{{ $adjustment->total_qty }}">
                                <input type="hidden" name="total_tax" value="{{ $adjustment->total_tax }}">
                                <input type="hidden" name="total_price" value="{{ $adjustment->total_price }}">
                                <input type="hidden" name="item" value="{{ $adjustment->item }}">
                                <input type="hidden" name="grand_total" value="{{ $adjustment->grand_total }}">
                            </div>
                            <div class="form-grou col-md-12 text-center pt-5">
                                <a href="{{ route('adjustment') }}" class="btn btn-danger btn-sm mr-3"><i class="far fa-window-close"></i> Cancel</a>
                                <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i> Update</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!--end: Datatable-->
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
@endsection

@push('scripts')
<script src="js/jquery-ui.js"></script>
<script>
$(document).ready(function () {

    //array data depend on warehouse
    var product_array = [];
    var product_code  = [];
    var product_name  = [];
    var product_qty   = [];
    var product_price = [];
    var tax_rate             = [];
    var tax_name             = [];
    var tax_method           = [];

    var rowindex;
    var row_product_price;
    var rownumber = $('#product_table tbody tr:last').index();

    for (rowindex = 0; rowindex <= rownumber; rowindex++) {
        product_price.push(parseFloat($('#product_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.product-price').val()));
        var quantity = parseFloat($('#product_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.base_unit_qty').val());
        tax_rate.push(parseFloat($('#product_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.tax-rate').val()));
        tax_name.push($('#product_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.tax-name').val());
        tax_method.push($('#product_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.tax-method').val());
    }
    console.log(tax_rate);

    $('#product_code_name').autocomplete({
        // source: "{{url('product-autocomplete-search')}}",
        source: function( request, response ) {
          // Fetch data
          $.ajax({
            url:"{{url('barcode/product-autocomplete-search')}}",
            type: 'post',
            dataType: "json",
            data: {
               _token: _token,
               search: request.term
            },
            success: function( data ) {
               response( data );
            }
          });
        },
        minLength: 3,
        response: function(event, ui) {
            if (ui.content.length == 1) {
                var data = ui.content[0].code;
                $(this).autocomplete( "close" );
                productSearch(data);
            };
        },
        select: function (event, ui) {
            // $('.product_search').val(ui.item.value);
            // $('.product_id').val(ui.item.id);
            var data = ui.item.code;
            productSearch(data);
        },
    }).data('ui-autocomplete')._renderItem = function (ul, item) {
        return $("<li class='ui-autocomplete-row'></li>")
            .data("item.autocomplete", item)
            .append(item.label)
            .appendTo(ul);
    };



    $('#product_table').on('keyup','.base_unit_qty',function(){
        rowindex = $(this).closest('tr').index();
        if($(this).val() < 1 && $(this).val() != ''){
            $('#product_table tbody tr:nth-child('+(rowindex + 1)+') .qty').val(1);
            notification('error','Qunatity can\'t be less than 1');
            calculateProductData(1);
        }else{
            calculateProductData($(this).val());
        }

    });

    $('#product_table').on('click','.remove-product',function(){
        $(this).closest('tr').remove();
        rowindex = $(this).closest('tr').index();
        product_price.splice(rowindex,1);
        tax_rate.splice(rowindex,1);
        tax_name.splice(rowindex,1);
        tax_method.splice(rowindex,1);
        calculateTotal();
    });

    @if (!$adjustment->products->isEmpty())
    var count = "{{ count($adjustment->products) + 1 }}";
    @else
    var count = 1;
    @endif

    function productSearch(data) {
        $.ajax({
            url: '{{ route("barcode.search.product") }}',
            type: 'POST',
            data: {
                data: data,_token:_token
            },
            success: function(data) {
                var flag = 1;
                $('.product-code').each(function(i){
                    if($(this).val() == data.code){
                        notification('error','This product already added in table!');
                        flag = 0;
                    }
                });
                $('#product_code_name').val('');
                if(flag)
                {
                    var newRow = $('<tr>');
                    var cols = '';
                    cols += `<td>`+data.name+` (`+data.code+`)</td>`;
                    cols += `<td class="text-center">${data.base_unit_name}</td>`;
                    cols += `<td><input type="text" class="form-control base_unit_qty text-center" value="1" name="products[`+count+`][base_unit_qty]" id="products_`+count+`_base_unit_qty" data="${count}"></td>`;
                    cols += `<td class="net_unit_price text-right">${data.price}</td>`;
                    cols += `<td class="tax text-right"></td>`;
                    cols += `<td class="sub-total text-right"></td>`;
                    cols += `<td class="text-center"><button type="button" class="btn btn-danger btn-sm remove-product small-btn"><i class="fas fa-trash"></i></button></td>`;

                    cols += `<input type="hidden" class="product-id" name="products[`+count+`][id]"  value="`+data.id+`">`;
                    cols += `<input type="hidden"  name="products[`+count+`][name]" value="`+data.name+`">`;
                    cols += `<input type="hidden" class="product-code" name="products[`+count+`][code]" value="`+data.code+`">`;
                    cols += `<input type="hidden" class="product-unit" name="products[`+count+`][base_unit_id]" value="`+data.base_unit_id+`">`;
                    cols += `<input type="hidden" class="product-price" name="products[`+count+`][base_unit_price]" value="`+data.price+`">`;
                    cols += `<input type="hidden" class="tax-rate" name="products[`+count+`][tax_rate]" value="`+data.tax_rate+`">`;
                    cols += `<input type="hidden" class="tax-value" name="products[`+count+`][tax]">`;
                    cols += `<input type="hidden" class="subtotal-value" name="products[`+count+`][subtotal]">`;
                    newRow.append(cols);
                    $('#product_table tbody').append(newRow);
                    product_price.push(parseFloat(data.price));
                    tax_rate.push(parseFloat(data.tax_rate));
                    tax_name.push(data.tax_name);
                    tax_method.push(data.tax_method);
                    rowindex = newRow.index();
                    calculateProductData(1);
                    count++;
                }

            }
        });
    }

    function calculateProductData(quantity){
        unitConversion();

        $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.tax-rate').val(tax_rate[rowindex].toFixed(2));

        if(tax_method[rowindex] == 1)
        {
            var tax = row_product_price * quantity * (tax_rate[rowindex]/100);
            var sub_total = (row_product_price * quantity) + tax;
        }else{
            var net_unit_price = (100 / (100 + tax_rate[rowindex])) * row_product_price;
            var tax = (row_product_price - net_unit_price) * quantity;
            var sub_total = row_product_price * quantity;
        }

        // $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(5)').text(net_unit_price.toFixed(2));
        $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(5)').text(tax.toFixed(2));
        $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.tax-value').val(tax.toFixed(2));
        $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(6)').text(sub_total.toFixed(2));
        $('#product_table tbody tr:nth-child('+(rowindex + 1)+')').find('.subtotal-value').val(sub_total.toFixed(2));

        calculateTotal();
    }

    function unitConversion()
    {
        var row_unit_operator = '*';
        var row_unit_operation_value =  parseFloat(1);
        if(row_unit_operator == '*')
        {
            row_product_price = product_price[rowindex] * row_unit_operation_value;
        }else{
            row_product_price = product_price[rowindex] / row_unit_operation_value;
        }
    }

    function calculateTotal()
    {
        //sum of qty
        var total_qty = 0;
        $('.base_unit_qty').each(function() {
            if($(this).val() == ''){
                total_qty += 0;
            }else{
                total_qty += parseFloat($(this).val());
            }
        });
        $('#total-qty').text(total_qty);
        $('input[name="total_qty"]').val(total_qty);

        //sum of tax
        var total_tax = 0;
        $('.tax').each(function() {
            total_tax += parseFloat($(this).text());
        });
        $('#total-tax').text(total_tax.toFixed(2));
        $('input[name="total_tax"]').val(total_tax.toFixed(2));

        //sum of subtotal
        var total = 0;
        $('.sub-total').each(function() {
            total += parseFloat($(this).text());
        });
        $('#total').text(total.toFixed(2));
        $('input[name="total_price"]').val(total.toFixed(2));

        calculateGrandTotal();
    }

    function calculateGrandTotal()
    {
        var item           = $('#product_table tbody tr:last').index();
        var total_qty      = parseFloat($('#total-qty').text());
        var subtotal       = parseFloat($('#total').text());
        item = ++item + '(' + total_qty + ')';
        $('#item').text(item);
        $('input[name="item"]').val($('#product_table tbody tr:last').index() + 1);
        $('#subtotal,#grand_total').text(subtotal.toFixed(2));
        $('input[name="grand_total"]').val(subtotal.toFixed(2));
    }


});

function store_data(){
    var rownumber = $('table#product_table tbody tr:last').index();
    if (rownumber < 0) {
        notification("error","Please insert product to order table!")
    }else{
        let form = document.getElementById('update_form');
        let formData = new FormData(form);
        let url = "{{route('adjustment.update')}}";
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
                $('#update_form').find('.is-invalid').removeClass('is-invalid');
                $('#update_form').find('.error').remove();
                if (data.status == false) {
                    $.each(data.errors, function (key, value) {
                        var key = key.split('.').join('_');
                        $('#update_form input#' + key).addClass('is-invalid');
                        $('#update_form textarea#' + key).addClass('is-invalid');
                        $('#update_form select#' + key).parent().addClass('is-invalid');
                        $('#update_form #' + key).parent().append(
                            '<small class="error text-danger">' + value + '</small>');
                    });
                } else {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        window.location.replace("{{ route('adjustment') }}");

                    }
                }

            },
            error: function (xhr, ajaxOption, thrownError) {
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    }

}

</script>
@endpush
