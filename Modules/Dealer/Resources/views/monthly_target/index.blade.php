@extends('layouts.app')
@section('title', $page_title)
@push('styles')
    <link href="{{ asset('plugins/custom/datatables/datatables.bundle.css') }}" rel="stylesheet" type="text/css" />
@endpush
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title">
                        <h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3>
                    </div>
                    <div class="card-toolbar">
                        @if (permission('dealer-add'))
                            <a href="{{ url('dealer/add') }}" class="btn btn-primary btn-sm font-weight-bolder"><i
                                    class="fas fa-plus-circle"></i> Add New</a>
                        @endif
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row">
                            <x-form.textbox labelName="Shop Name" name="shop_name" col="col-md-3" />
                            <x-form.textbox labelName="Dealer Name" name="name" col="col-md-3" />
                            <x-form.textbox labelName="Mobile" name="mobile" col="col-md-3" />
                            @if (Auth::user()->warehouse_id)
                                <input type="hidden" name="warehouse_id" id="warehouse_id"
                                    value="{{ Auth::user()->warehouse_id }}">
                            @else
                                <x-form.selectbox labelName="Warehouse" name="warehouse_id" required="required"
                                    col="col-md-3" class="selectpicker">
                                    @if (!$warehouses->isEmpty())
                                        @foreach ($warehouses as $id => $name)
                                            <option value="{{ $id }}">{{ $name }}</option>
                                        @endforeach
                                    @endif
                                </x-form.selectbox>
                            @endif
                            <x-form.selectbox labelName="District" name="district_id" col="col-md-3" class="selectpicker"
                                onchange="getUpazilaList(this.value)">
                                @if (!$districts->isEmpty())
                                    @foreach ($districts as $id => $name)
                                        <option value="{{ $id }}">{{ $name }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <x-form.selectbox labelName="Upazila" name="upazila_id" col="col-md-3" class="selectpicker">
                                @if (!$upazilas->isEmpty())
                                    @foreach ($upazilas as $id => $name)
                                        <option value="{{ $id }}">{{ $name }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <x-form.selectbox labelName="Status" name="status" col="col-md-3" class="selectpicker">
                                @foreach (STATUS as $key => $value)
                                    <option value="{{ $key }}">{{ $value }}</option>
                                @endforeach
                            </x-form.selectbox>
                            <div class="{{ Auth::user()->warehouse_id ? 'col-md-6' : 'col-md-3' }}">
                                <div style="margin-top:28px;">
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right"
                                        type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i
                                            class="fas fa-undo-alt"></i></button>
                                    <button id="btn-filter"
                                        class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button"
                                        data-toggle="tooltip" data-theme="dark" title="Search"><i
                                            class="fas fa-search"></i></button>
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
                                            <th>Sl</th>
                                            <th>Dealer Name</th>
                                            <th>Product</th>
                                            <th>Year</th>
                                            <th>Month</th>
                                            <th>Target Quantity</th>
                                            <th>Commission Maount</th>
                                            <th>Status</th>
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
@endsection
