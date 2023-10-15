@extends('layouts.app')

@section('title', $page_title)

@push('styles')
    <link href="css/tagify.css" rel="stylesheet" type="text/css"/>
    <style>
        .tagsinput {
            height: calc(1.5em + 1.3rem + 2px) !important;
        }
    </style>
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
                        <a href="{{ route('recipe') }}" class="btn btn-warning btn-sm font-weight-bolder">
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
                                    <input type="hidden" name="update_id" id="update_id" value="{{ $recipe->id }}">

                                    <div class="col-md-4 form-group required">
                                        <label for="recipe_date">Date</label>
                                        <input type="date" name="recipe_date" id="recipe_date"
                                               class="form-control"
                                               value="{{ $recipe->recipe_date }}">
                                    </div>
                                    <div class="col-md-4 form-group required">
                                        <label for="recipe_code">Recipe Code</label>
                                        <input type="text" name="recipe_code" id="recipe_code"
                                               value="{{ $recipe->recipe_code }}" class="form-control" readonly>
                                    </div>
                                    <div class="col-md-4 form-group required">
                                        <label for="recipe_name">Recipe Name</label>
                                        <input type="text" name="recipe_name" id="recipe_name"
                                               class="form-control" value="{{ $recipe->recipe_name }}">
                                    </div>

                                    <x-form.selectbox labelName="Product" name="product_id" required="required"
                                                      col="col-md-4" class="selectpicker">
                                        @if (!$products->isEmpty())
                                            @foreach ($products as $product)
                                                <option value="{{ $product->id }}"
                                                        @if( $product->id == $recipe->product_id) selected @endif>{{ $product->name }}</option>
                                            @endforeach
                                        @endif
                                    </x-form.selectbox>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-12 pt-5" id="material-section">
                                <div class="row"
                                     style="position: relative;border: 1px solid #E4E6EF;padding: 10px 0 0 0; margin: 0;border-radius:5px;">
                                    <div
                                        style="width: 100px;background: #fa8c15;text-align: center;margin: 0 auto;color: white;padding: 5px 0;position: absolute;top:-16px;left:10px;">
                                        Materials
                                    </div>

                                    <div class="col-md-12 pt-5 material_section">
                                        @php
                                            $totalMaterials = 0;
                                        @endphp
                                        {{-- @dd($product->product_materials) --}}
                                        @if (!$recipe->product_materials->isEmpty())
                                            @foreach ($recipe->product_materials as $key => $value)
                                                <div class="row {{ $key == 0 ? '' : 'row_remove' }}">
                                                    <div class="form-group col-md-5 required">
                                                        @if ($key == 0)
                                                            <label for="materials_{{ $key + 1 }}_id"
                                                                   class="form-control-label">Material Name</label>
                                                        @endif
                                                        <select name="materials[{{ $key + 1 }}][id]"
                                                                id="materials_{{ $key + 1 }}_id" required="required"
                                                                class="form-control selectpicker material"
                                                                data-live-search="true"
                                                                data-live-search-placeholder="Search">
                                                            <option value="">Select Please</option>
                                                            @if (!$materials->isEmpty())
                                                                @foreach ($materials as $material)
                                                                    <option value="{{ $material->id }}"
                                                                        {{ $value->material_id == $material->id ? 'selected' : '' }}>
                                                                        {{ $material->material_name }}</option>
                                                                @endforeach
                                                            @endif
                                                        </select>
                                                    </div>
                                                    @php
                                                        $totalMaterials += $value->qty;
                                                    @endphp
                                                    <div class="form-group col-md-5 required">
                                                        @if ($key == 0)
                                                            <label for="materials_{{ $key + 1 }}_id"
                                                                   class="form-control-label">Material Quantity</label>
                                                        @endif
                                                        <input type="text"
                                                               class="form-control qty text-center material-qty"
                                                               name="materials[{{ $key + 1 }}][qty]"
                                                               id="materials_qty_{{ $key + 1 }}_id"
                                                               value="{{ $value->qty }}" required data-row="1"
                                                               data-select-id="materials_{{ $key + 1 }}_id"
                                                               onkeyup="getMaterialQuantity()">
                                                    </div>
                                                    @if ($key == 0)
                                                        <div class="form-group col-md-2" style="padding-top: 28px;">
                                                            <button type="button" id="add-material"
                                                                    class="btn btn-success btn-sm" data-toggle="tooltip"
                                                                    data-placement="top" data-original-title="Add More">
                                                                <i class="fas fa-plus-square"></i>
                                                            </button>
                                                        </div>
                                                    @else
                                                        <div class="form-group col-md-2">
                                                            <button type="button" class="btn btn-danger btn-sm remove"
                                                                    data-toggle="tooltip" data-placement="top"
                                                                    data-original-title="Remove">
                                                                <i class="fas fa-minus-square"></i>
                                                            </button>
                                                        </div>
                                                    @endif
                                                </div>
                                            @endforeach
                                        @endif
                                    </div>
                                    <div class="col-md-12 pt-5 text-center">
                                        <h5 style="margin-left:50%">Total Material Quantity <span
                                                id="materialQty">{{ $totalMaterials }}</span></h5>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-12 pt-5">
                                <button type="button" class="btn btn-primary btn-sm" id="update-btn">Update</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--end::Card-->
        </div>
    </div>
@endsection

@push('scripts')
    <script src="js/spartan-multi-image-picker.min.js"></script>
    <script>
        $(document).ready(function () {
            $(document).on('change', '.material', function () {
                let totalMaterial = 0;
                $('.material-qty').each(function () {
                    let material = $(this).attr('data-select-id');
                    let materialQty = $('#' + material).find(":selected").val();
                    if (materialQty != '') {
                        totalMaterial = totalMaterial + parseFloat($(this).val() || 0);
                    }
                });
                $('#materialQty').text(totalMaterial);
            });
        });

        $(document).ready(function () {
            /** Start :: Add More Material Field **/
                @if (!$product->product_material->isEmpty())
            var material_count = "{{ count($product->product_material) }}";
            @else
            var material_count = 1;
            @endif
            function add_more_material_field(row) {
                html = ` <div class="row row_remove">
                    <div class="form-group col-md-5 required">
                        <select name="materials[` + row + `][id]" id="materials_` + row + `_id" required="required" class="form-control selectpicker material" data-live-search="true"
                                                    data-live-search-placeholder="Search">
                            <option value="">Select Please</option>
                            @if (!$materials->isEmpty())
                    @foreach ($materials as $material)
                    <option value="{{ $material->id }}">{{ $material->material_name }}</option>
                                @endforeach
                    @endif
                    </select>
                </div>
                 <div class="form-group col-md-5 required">
                <input type="text" class="form-control qty text-center material-qty" name="materials[` + row +
                    `][qty]" id="materials_qty_` + row +
                    `_id" value="{{ $value->qty }}" required  data-row="1" data-select-id="materials_` + row + `_id" onkeyup="getMaterialQuantity()">
                                            </div>
                    <div class="form-group col-md-2">
                        <button type="button" class="btn btn-danger btn-sm remove" data-toggle="tooltip"
                            data-placement="top" data-original-title="Remove">
                            <i class="fas fa-minus-square"></i>
                        </button>
                    </div>
                </div>`;
                $('.material_section').append(html);
                $('.selectpicker').selectpicker('refresh');
            }

            $(document).on('click', '#add-material', function () {
                material_count++;
                add_more_material_field(material_count);
            });
            $(document).on('click', '.remove', function () {
                material_count--;
                $(this).closest('.row_remove').remove();
                getMaterialQuantity();
            });

            /****************************/
            $(document).on('click', '#update-btn', function () {
                let form = document.getElementById('store_or_update_form');
                let formData = new FormData(form);

                $.ajax({
                    url: "{{ route('recipe.store.or.update') }}",
                    type: "POST",
                    data: formData,
                    dataType: "JSON",
                    contentType: false,
                    processData: false,
                    cache: false,
                    beforeSend: function () {
                        $('#update-btn').addClass('spinner spinner-white spinner-right');
                    },
                    complete: function () {
                        $('#update-btn').removeClass('spinner spinner-white spinner-right');
                    },
                    success: function (data) {
                        $('#store_or_update_form').find('.is-invalid').removeClass(
                            'is-invalid');
                        $('#store_or_update_form').find('.error').remove();
                        if (data.status == false) {
                            $.each(data.errors, function (key, value) {
                                var key = key.split('.').join('_');
                                $('#store_or_update_form input#' + key).addClass(
                                    'is-invalid');
                                $('#store_or_update_form textarea#' + key).addClass(
                                    'is-invalid');
                                $('#store_or_update_form select#' + key).parent()
                                    .addClass('is-invalid');
                                if (key == 'code') {
                                    $('#store_or_update_form #' + key).parents(
                                        '.form-group').append(
                                        '<small class="error text-danger">' +
                                        value + '</small>');
                                } else {
                                    $('#store_or_update_form #' + key).parent()
                                        .append(
                                            '<small class="error text-danger">' +
                                            value + '</small>');
                                }
                            });
                        } else {
                            notification(data.status, data.message);
                            if (data.status == 'success') {
                                window.location.replace("{{ route('recipe') }}");
                            }
                        }
                    },
                    error: function (xhr, ajaxOption, thrownError) {
                        console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr
                            .responseText);
                    }
                });
            });
        });

        function getMaterialQuantity() {
            $('.material').trigger('change');
        }
    </script>
@endpush
