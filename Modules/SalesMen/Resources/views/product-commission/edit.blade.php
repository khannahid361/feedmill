@extends('layouts.app')
@section('title', $page_title)
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3></div>
                    <div class="card-toolbar">
                        <a href="{{ url('sr-product-commission') }}" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a>
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <form action="" id="update_form" method="post" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" name="update_id" value="{{$details->id}}"/>
                            <div class="row">
                                <div class="col-md-4"><label for="name">Commission Name</label><input type="text" class="form-control" id="name" name="name" value="{{$details->name}}"/></div>
                                <div class="col-md-4"></div>
                                <div class="col-md-4"></div>
                                <div class="col-md-12">
                                    <br/><br/>
                                    <table class="table table-bordered">
                                        <thead class="bg-primary">
                                        <tr>
                                            <th>Product Name</th>
                                            <th>Quantity</th>
                                            <th>Total Price</th>
                                            <th>Commission Percent</th>
                                            <th>Commission Amount</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <select class="form-control selectpicker" id="product_id" name="product_id">
                                                    <option value="">Select Please</option>
                                                    @foreach($products as $product)
                                                        <option value="{{$product->id}}" data-price="{{$product->base_unit_price}}" @if($product->id == $details->product_id) selected="selected" @endif>{{$product->name}}</option>
                                                    @endforeach
                                                </select>
                                                <input type="hidden" id="product_price" name="product_price" value="{{$details->product_price}}"/>
                                            </td>
                                            <td><input type="text" class="form-control input" id="quantity" name="quantity" data-type="quantity" value="{{$details->quantity}}" placeholder="Give Product Input"/></td>
                                            <td><input type="text" class="form-control" id="total_price" value="{{$details->quantity * $details->product_price}}" readonly/></td>
                                            <td><input type="number" class="form-control input" id="commission_percent" name="commission_percent" data-type="commission_percent" value="{{$details->commission_percent}}" placeholder="Give Product Commission Percent"/></td>
                                            <td><input type="text" class="form-control" id="commission_amount" name="commission_amount" value="{{$details->commission_amount}}" readonly/> </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-4"></div>
                                <div class="col-md-4 text-center">
                                    <button type="button" class="btn btn-success btn-sm mr-3" onclick="updateData()"><i class="fas fa-save"></i> Update</button>
                                </div>
                                <div class="col-md-4"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    <script>
        function _(x){
            return document.getElementById(x);
        }
        $(document).on('input','.input',function(){
            let type = $(this).data('type');
            if(type == 'quantity'){
                if(_('product_id').value == ''){
                    notification('error','Please Choose Product');
                    $(this).val('');
                }else{
                    calculation();
                }
            }else if(type == 'commission_percent'){
                if(_('quantity').value == ''){
                    notification('error','Please Give Quantity');
                    $(this).val('');
                }else{
                    calculation();
                }
            }
        })
        function calculation(){
            _('total_price').value       = parseFloat($('#product_id').find(':selected').data('price')) * parseFloat(_('quantity').value);
            _('product_price').value     = $('#product_id').find(':selected').data('price');
            _('commission_amount').value = parseFloat(_('total_price').value) / 100 * parseFloat(_('commission_percent').value);
        }
        function updateData(){
            if(_('name').value != '' && _('product_id').value != '' && _('quantity').value != '' && _('commission_amount').value != '' && _('commission_percent').value != ''){
                let form     = document.getElementById('update_form');
                let formData = new FormData(form);
                let url      = "{{route('sr.product.commission.update')}}";
                $.ajax({
                    url             : url,
                    type            : "POST",
                    data            : formData,
                    dataType        : "JSON",
                    contentType     : false,
                    processData     : false,
                    cache           : false,
                    beforeSend      : function(){
                        $('#save-btn').addClass('spinner spinner-white spinner-right');
                    },
                    complete        : function(){
                        $('#save-btn').removeClass('spinner spinner-white spinner-right');
                    },
                    success         : function (data) {
                        notification(data.status, data.message);
                        if (data.status == 'success') {
                            window.location.replace("{{ route('sr.product.commission') }}");
                        }
                    },
                    error           : function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
                });
            }else{
                notification('error','Input Field Empty')
            }
        }
    </script>
@endpush
