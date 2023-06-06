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
                        <a href="{{ route('product') }}" class="btn btn-warning btn-sm font-weight-bolder">
                            <i class="fas fa-arrow-left"></i> Back</a>
                        <!--end::Button-->
                    </div>
                </div>
            </div>
            <!--end::Notice-->
            <!--begin::Card-->
            <div class="card card-custom" style="padding-bottom: 100px !important;">
                <div class="card-body">
                    <form id="store_or_update_form" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-10">
                                <div class="row">
                                    <x-form.selectbox labelName="Barcode Symbol" name="barcode_symbology" col="col-md-4"
                                        class="selectpicker">
                                        @foreach ($products as $key => $value)
                                            <option value="{{ $key }}" {{ $key == 1 ? 'selected' : '' }}>
                                                {{ $value }}</option>
                                        @endforeach
                                    </x-form.selectbox>

                                    <x-form.selectbox labelName="Category" name="category_id" required="required"
                                        col="col-md-4" class="selectpicker">
                                        @if (!$categories->isEmpty())
                                            @foreach ($categories as $category)
                                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                            @endforeach
                                        @endif
                                    </x-form.selectbox>

                                    <x-form.textbox labelName="Price" name="base_unit_price" required="required"
                                    col="col-md-4" />

                                    <x-form.textbox labelName="Price" name="base_unit_price" required="required"
                                    col="col-md-4" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')

@endpush
