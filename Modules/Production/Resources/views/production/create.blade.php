@extends('layouts.app')

@section('title', $page_title)

@push('styles')
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
    <style>
        #form-tab li a.active {
            background: #034d97 !important;
            color: white !important;
        }

        .nav-link {
            position: relative;
            border-radius: 5px !important;
            background: #E4E6EF;
            color: #7E8299;
        }

        .remove-tab {
            position: absolute;
            top: -10px;
            right: -3px;
            border-radius: 50%;
            font-size: 20px;
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
                        <a href="{{ route('production') }}" class="btn btn-warning btn-sm font-weight-bolder">
                            <i class="fas fa-arrow-left"></i> Back</a>
                        <!--end::Button-->
                    </div>
                </div>
            </div>
            <!--end::Notice-->
            <!--begin::Card-->
            <div class="card card-custom" style="padding-bottom: 100px !important;">
                <form id="store_or_update_form" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="row">
                                <x-form.textbox labelName="Batch No." name="batch_no" value="{{ $batch_no }}"
                                                required="required" property="readonly" col="col-md-4"/>
                                <x-form.textbox labelName="Date" name="start_date" required="required" col="col-md-4"
                                                class="date" property="readonly" value="{{ date('Y-m-d') }}"/>
                                <x-form.selectbox labelName="Factory" name="warehouse_id" required="required"
                                                  col="col-md-4"
                                                  class="selectpicker">
                                    @if (!$warehouses->isEmpty())
                                        @foreach ($warehouses as $warehouse)
                                            <option value="{{ $warehouse->id }}"
                                                {{ $warehouse->id == 1 ? 'selected' : '' }}>{{ $warehouse->name }}</option>
                                        @endforeach
                                    @endif
                                </x-form.selectbox>
                            </div>
                        </div>
                        <div class="col-md-12 pt-5">
                            {{--                        <ul class="nav nav-tabs nav-tabs-2" id="form-tab" role="tablist" style="border-bottom: 0px !important;justify-content: space-between;"> --}}
                            {{--                            <li class="nav-item mx-0 mb-3" id="tab1"> --}}
                            {{--                                <a class="nav-link active text-center step  step-1" data-toggle="tab" href="#tab-1" role="tab">Product-1</a> --}}
                            {{--                            </li> --}}

                            {{--                            <li class="nav-item"> --}}
                            {{--                                <a class="nav-link text-center bg-success text-white" id="add-new-tab" style="cursor: pointer;"><i class="fas fa-plus-circle mr-2 text-white"></i> Add More</a> --}}
                            {{--                            </li> --}}
                            {{--                        </ul> --}}

                            <input type="hidden" name="tab" id="check_tab">
                            <div class="tab-content">
                                <div class="tab-pane active step step-1 p-3" id="tab-1" role="tabpanel">
                                    <div class="row" id="production_1">
                                        <div class="col-md-12 px-0" style="border-top: 5px solid #024c96;">
                                            <div class="card card-custom card-fit card-border"
                                                 style="border-radius: 0 !important;">
                                                <div class="card-body py-5">
                                                    <div class="row">
                                                        <div class="form-group col-md-8 required">
                                                            <label>Product</label>
                                                            <select name="production[1][product_id]"
                                                                    id="production_1_product_id"
                                                                    onchange="getRecipe(this.value,1);"
                                                                    class="form-control selectpicker">
                                                                <option value="">Select Please</option>
                                                                @if (!$products->isEmpty())
                                                                    @foreach ($products as $id => $name)
                                                                        <option value="{{ $id }}">
                                                                            {{ $name }}</option>
                                                                    @endforeach
                                                                @endif
                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-4 required">
                                                            <label>Recipe</label>
                                                            <select id="production_1_recipe_id"
                                                                    name="production[1][recipe_id]"
                                                                    class="form-control selectpicker"
                                                                    onchange="materialData(this.value,1);" data-live-search="true">

                                                            </select>
                                                        </div>
                                                        <div class="form-group col-md-3 required">
                                                            <label for="mfg_date">Mfg. Date</label>
                                                            <input type="text" class="form-control date total-time"
                                                                   name="production[1][mfg_date]"
                                                                   id="production_1_mfg_date"
                                                                   value="{{ date('Y-m-d') }}" readonly
                                                                   onblur="setExpireTime();"/>
                                                        </div>
                                                        <div class="form-group col-md-3 required">
                                                            <label for="exp_date">Exp. Date</label>
                                                            <input type="text" class="form-control date total-time"
                                                                   name="production[1][exp_date]"
                                                                   id="production_1_exp_date"
                                                                   value="{{ date('Y-m-d') }}" onblur="setExpireTime();"
                                                                   readonly/>
                                                        </div>
                                                        <div class="form-group col-md-3 required d-none">
                                                            <label for="production_1_year">Total Months </label>
                                                            <input type="text" name="production[1][year]"
                                                                   id="production_1_year" class="form-control "
                                                                   value="0"
                                                                   placeholder="" readonly>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12 py-5">
                                            <div class="row" id="production_materials_1">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary btn-sm mr-5 float-right"
                                onclick="check_material_stock()" id="save-btn"><i class="fas fa-save"></i> Save
                        </button>
                    </div>
                </form>
            </div>
            <!--end::Card-->
        </div>
    </div>
    @include('production::production.view-modal')
@endsection

@push('scripts')
    <script src="js/moment.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>

    <script>
        // function _(x){
        //     return document.getElementById(x);
        // }
        $(document).ready(function () {
            $('.date').datetimepicker({
                format: 'YYYY-MM-DD',
                ignoreReadonly: true
            });
            var tabcount = 1;

            function add_new_tab(tab) {

                tab_btn_html = `<li class="nav-item mx-0 mb-3" id="tab` + tab + `">
                            <a class="nav-link text-center step  step-` + tab + `" data-toggle="tab" href="#tab-` +
                    tab + `" role="tab">Product-` + tab + ` <i data-tab="` + tab + `" class="fas fa-times-circle text-danger remove-tab ml-5 bg-white"></i></a>
                        </li>`;
                $('#form-tab li:last').before(tab_btn_html);

                tab_content_html = `<div class="tab-pane  step step-` + tab + `  p-3" id="tab-` + tab + `" role="tabpanel">
                                <div class="row"  id="production_` + tab + `">
                                    <div class="col-md-12 px-0" style="border-top: 5px solid #024c96;">
                                        <div class="card card-custom card-fit card-border" style="border-radius: 0 !important;">
                                            <div class="card-body py-5">
                                                <div class="row">
                                                    <div class="form-group col-md-12 required">
                                                        <label >Product</label>
                                                        <select name="production[` + tab +
                    `][product_id]" id="production_` + tab + `_product_id"  onchange="materialData(this.value,` +
                    tab + `)" class="form-control selectpicker">
                                                            <option value="">Select Please</option>
                                                            @if (!$products->isEmpty())
                    @foreach ($products as $id => $name)
                    <option value="{{ $id }}">{{ $name }}</option>
                                                                @endforeach
                    @endif
                    </select>
                </div>
                <div class="form-group col-md-3 required">
                    <label >Total Year</label>
                    <select name="production[` + tab + `][year]" id="production_` +
                    tab + `_year"  onchange="generateDate(this.value,` + tab +
                    `)" class="form-control selectpicker">
                                                            @for ($i = 1; $i <= 3; $i++)
                    <option value="{{ $i }}" {{ $i == 1 ? 'selected' : '' }}>{{ $i }}</option>
                                                            @endfor
                    </select>
                </div>
                <div class="form-group col-md-3 required">
                    <label for="mfg_date">Mfg. Date</label>
                    <input type="text" class="form-control date" name="production[` +
                    tab + `][mfg_date]" id="production_` + tab +
                    `_mfg_date" value="{{ date('Y-m-d') }}" readonly />
                                                    </div>
                                                    <div class="form-group col-md-3 required">
                                                        <label for="exp_date">Exp. Date</label>
                                                        <input type="text" class="form-control date" name="production[` +
                    tab + `][exp_date]" id="production_` + tab + `_exp_date" value="{{ date('Y-m-d', strtotime('+1 year')) }}" readonly />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 py-5">
                                        <div class="row" id="production_materials_` + tab + `">

                                        </div>
                                    </div>
                                </div>
                            </div>`
                $('.tab-content').append(tab_content_html);
                $('.selectpicker').selectpicker('refresh');
                $('.date').datetimepicker({
                    format: 'YYYY-MM-DD',
                    ignoreReadonly: true
                });
            }

            $(document).on('click', '#add-new-tab', function () {
                tabcount++;
                add_new_tab(tabcount);
            });
            $(document).on('click', '.remove-tab', function () {
                var tab = $(this).data('tab');
                Swal.fire({
                    title: 'Are you sure to delete Tab-' + tab + '?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {

                        if ($('#form-tab li#tab' + tab).is(':nth-last-child(2)')) {
                            tabcount--;
                        }
                        $('#tab' + tab + ',.tab-pane#tab-' + tab).remove();
                        $('#tab' + (tab - 1) + ' a, .tab-pane#tab-' + (tab - 1)).addClass('active');
                        Swal.fire("Removed", "Tab Removed Successfully", "success");
                    }
                });
            });
        });


        function materialData(recipe_id, tab) {
            let product_id = $('#production_1_product_id').val();
            $.ajax({
                url: "{{ url('production/product-materials') }}",
                data: {
                    recipe_id: recipe_id,
                    product_id : product_id,
                    tab: tab,
                    _token: _token
                },
                type: "POST",
                success: function (data) {
                    $('#production_materials_' + tab).empty().html(data);
                },
            });
        }

        function getRecipe(product_id, tab) {
            $.ajax({
                url: "{{ url('production/product-recipes') }}",
                data: {
                    product_id: product_id,
                    tab: tab,
                    _token: _token
                },
                type: "POST",
                success: function (data) {
                    let $selectBox = $('#production_' + tab + '_recipe_id');
                    $selectBox.empty();
                    $selectBox.append(`<option>Select Recipe</option>`);
                    data.forEach(recipe => {
                        $selectBox.append(`<option value="${recipe.id}">${recipe.recipe_name}(${recipe.recipe_code})</option>`);
                    });
                    $selectBox.selectpicker('refresh');
                },
                error: function (error) {
                    console.error('Error fetching data:', error);
                },
            });
        }

        function generateDate(number, tab) {
            var mfg_date = $('#production_' + tab + '_mfg_date').val();
            var exp_date = new Date(new Date(mfg_date).setFullYear(new Date(mfg_date).getFullYear() + parseInt(number)));
            $('#production_' + tab + '_exp_date').val(exp_date.toISOString().slice(0, 10));
        }


        function check_material_stock() {
            let form = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url = "{{ url('production/check-material-stock') }}";
            $.ajax({
                url: url,
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                cache: false,
                beforeSend: function () {
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete: function () {
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success: function (data) {
                    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                    $('#store_or_update_form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function (key, value) {
                            if (key == 'production.1.expected_unit_qty') {
                                $('#store_or_update_form input#finished_qty').addClass('is-invalid');
                                $('#store_or_update_form #finished_qty').parent().append(
                                    '<small class="error text-danger">Please Enter Finish Quantity</small>'
                                );
                            }
                            var key = key.split('.').join('_');
                            $('#store_or_update_form input#' + key).addClass('is-invalid');
                            $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                            $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                            $('#store_or_update_form #' + key).parent().append(
                                '<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        if (data.status == 'success') {
                            store_data();
                        } else {
                            $('#view_modal #view-data').empty().html(data);
                            $('#view_modal').modal({
                                keyboard: false,
                                backdrop: 'static',
                            });
                            $('#view_modal .modal-title').html(
                                '<i class="fas fa-file-alt text-white"></i> <span> Material Stock Availibility Details</span>'
                            );
                        }
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }

        function store_data() {
            let form = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url = "{{ url('production/store') }}";
            $.ajax({
                url: url,
                type: "POST",
                data: formData,
                dataType: "JSON",
                contentType: false,
                processData: false,
                cache: false,
                beforeSend: function () {
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete: function () {
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success: function (data) {
                    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                    $('#store_or_update_form').find('.error').remove();
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        window.location.replace("{{ url('production') }}");
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
    </script>

    <script>
        $(document).ready(function () {
            $(document).on('keyup', '.finished-qty', function () {
                let totalMaterial = 0;
                let totalMoney = 0;
                $('.material-qty').each(function () {
                    let materialQty = $(this).val();
                    totalMaterial = totalMaterial + parseFloat(materialQty);
                });
                $('.material-amount').each(function () {
                    let materialAmnt = $(this).val();
                    totalMoney = totalMoney + parseFloat(materialAmnt);
                });
                $('#materialQty').text(totalMaterial);
                $('#materialAmnt').text(totalMoney);
            });
        });

        function _(x) {
            return document.getElementById(x);
        }

        $(document).on('input', '.other_cost', function () {
            let other_cost = $(this).val();
            let grand_t = $('#grand_total').val();
            let finishedqty = $('#finished_qty').val();

            _('grand_total').value = +_('g_tl').value + +other_cost;
            let a = $('#grand_total').val();
            _('cost_per_unit').value = a / finishedqty;
        });

        $(document).on('input', '.finishedQty', function () {

            // console.log(qty);
            let finishedQty = $(this).val();
            $('.track').each(function (i, k) {
                let s_qt = $(this).data('stock_qty') ? $(this).data('stock_qty') : 0;
                let qtys = $(this).data('qtys');
                let trackAmount = $(this).data('qtys') * $(this).data(
                    'cost') * finishedQty;
                trackAmount = trackAmount.toFixed(2);
                document.getElementById($(this).data('total')).value = trackAmount;

            });
            $('.track_qty').each(function (i, k) {
                let s_qt = $(this).data('stock_qty') ? $(this).data('stock_qty') : 0;
                let qty = $(this).data('qtys');
                let totalQty = $(this).data('qtys') * finishedQty;
                document.getElementById($(this).data('qty')).value = totalQty;
            })
            calculation();
        });

        function calculation() {
            let total = 0;
            $('.total').each(function () {
                if ($(this).val() == '') {
                    total += +0;
                } else {
                    total += +$(this).val();
                }
            })
            _('g_tl').value = total;
        }

        // function calculations(){
        //     let s_qt        = $('.stock_qty').val();
        //     let qty         = $('.qty').val();
        //
        //     $('.total').each(function(){
        //         if(s_qt < qty){
        //             alert('ss');
        //             $(`#material_table_1 tbody tr:eq(${i})`).css({'background': '#F64E60'});
        //         }
        //     });
        // }

        function setExpireTime() {
            let expiredDate = $('#production_1_exp_date').val();
            let mfgDate = $('#production_1_mfg_date').val();
            mfgDate = new Date(mfgDate);
            expiredDate = new Date(expiredDate);
            let monthDiff = expiredDate.getMonth() - mfgDate.getMonth();
            let yearDiff = expiredDate.getYear() - mfgDate.getYear();
            let months = monthDiff + yearDiff * 12;
            $('#production_1_year').val(months);
        }

        function checkUsedMixtureQty() {
            let remaining_mixture = $('#remaining_mixture').val();
            let used_mixture = $('#used_wastage_qty').val();
            if (used_mixture > remaining_mixture) {
                alert('Used Mixture Can not Exceed Remaining Mixture Quantity');
                $('#used_wastage_qty').val('0');
            }
        }
    </script>
@endpush
