@extends('layouts.app')

@section('title', $page_title)

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
                        <a href="{{ url('product-stock-report') }}" class="btn btn-warning btn-sm font-weight-bolder">
                            <i class="fas fa-arrow-left"></i> Back</a>
                        <!--end::Button-->
                    </div>
                </div>
            </div>
            <!--end::Notice-->
            <!--begin::Card-->
            <div class="card card-custom" style="padding-bottom: 100px !important;">
                <div class="card-body">
                    <form id="store_or_update_form" action="{{ route('convert.product.bag.store') }}" method="post"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-10">
                                <div class="row">
                                    <x-form.selectbox labelName="Product" name="product_id" col="col-md-3"
                                        class="selectpicker" onchange="setProductQty();">
                                        @foreach ($products as $key => $value)
                                            <option value="{{ $value->id }}" data-qty="{{ $value->qty }}">
                                                {{ $value->name }}</option>
                                        @endforeach
                                    </x-form.selectbox>

                                    <x-form.textbox labelName="Available Qty" name="available_qty" required col="col-md-3" />

                                    <x-form.selectbox labelName="Unit" name="unit" required col="col-md-3"
                                        class="selectpicker" onchange="convertToBag();">
                                        <option value="50">50 Kg Bag</option>
                                    </x-form.selectbox>

                                    <x-form.textbox labelName="Bag Quantity" name="bag_qty" required col="col-md-3" />
                                    <x-form.textbox labelName="Remaining Quantity" name="qty" required col="col-md-3" />
                                </div>
                                <input type="submit" name="" id="" value="Convert"
                                    class="btn btn-primary btn-md" onclick="return validateForm();">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        function setProductQty() {
            let product_id = $('#product_id');
            let qty = product_id.find(':selected').data('qty');
            $('#available_qty').val(qty);
            let unit = $('#unit').val() || 0;
            if (unit != 0) {
                convertToBag();
            }
        }

        function convertToBag() {
            let unit = $('#unit').val() || 0;
            if (unit != 0) {
                let qty = $('#available_qty').val();
                let bag = qty / unit;
                let newQty = qty%unit;
                bag = parseInt(bag);
                $('#bag_qty').val(bag);
                $('#qty').val(newQty);
            } else {
                $('#bag_qty').val('');
                $('#qty').val('');
            }
        }

        function validateForm() {
            let product_id = $('#product_id').val();
            let qty = $('#qty').val();
            let unit = $('#unit').val();
            let bag_qty = $('#bag_qty').val();

            if (product_id === '' || qty === '' || unit === '' || bag_qty === '') {
                alert('Please fill in all the fields.');
                return false;
            }
            return true;
        }
    </script>
@endpush
