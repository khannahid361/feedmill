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
                    <div class="row">
                        <div class="col-md-12 pt-5 table-responsive">
                            <table class="table table-borderless table-hover">
                                <tr>
                                    <td><b>Recipe Name</b></td>
                                    <td class="text-center"><b>:</b></td>
                                    <td>{{ $product->recipe_name }}</td>
                                    <td><b>Recipe Code</b></td>
                                    <td class="text-center"><b>:</b></td>
                                    <td>{{ $product->recipe_code }}</td>
                                </tr>
                                <tr>
                                    <td><b>Product</b></td>
                                    <td class="text-center"><b>:</b></td>
                                    <td>{{ $product->product->name }}</td>
                                    <td><b>Created Date</b></td>
                                    <td class="text-center"><b>:</b></td>
                                    <td>{{ date("d-m-Y", strtotime($product->recipe_date)) }}</td>
                                </tr>
                                <tr>
                                    <td><b>Created By</b></td>
                                    <td class="text-center"><b>:</b></td>
                                    <td>{{ $product->created_by }}</td>
                                    <td><b>Modified By</b></td>
                                    <td class="text-center"><b>:</b></td>
                                    <td>{{ $product->modified_by ?? "<span class='label label-rounded label-danger'></span>" }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="card card-custom mt-5">
                        <div class="card-header">
                            <div class="card-toolbar">
                                <ul class="nav nav-bold nav-pills">

                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#materials">Materials</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="tab-content">
                                @php
                                    $totalQty = 0;
                                @endphp
                                <div class="tab-pane fade show active" id="materials" role="tabpanel"
                                     aria-labelledby="materials">
                                    @if (!$product->product_material->isEmpty())
                                        <table class="table table-bordered table-striped" style="width: 50%">
                                            @foreach ($product->product_material as $key => $item)
                                                <tr>
                                                    <td>{{ $item->material_name }}</td>
                                                    <td>{{ $product->product_materials[$key]->qty }}</td>
                                                    @php
                                                        $totalQty += $product->product_materials[$key]->qty;
                                                    @endphp
                                                </tr>
                                            @endforeach
                                            <tr>
                                                <td><strong>Total</strong></td>
                                                <td><strong>{{ $totalQty }}</strong></td>
                                            </tr>
                                        </table>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end::Card-->
        </div>
    </div>
@endsection
