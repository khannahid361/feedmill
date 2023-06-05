@extends('layouts.app')

@section('title', $page_title)

@push('styles')
    <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
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
                <form id="store_or_update_form" method="post">
                    @csrf
                    <input type="hidden" name="update_id" value="{{ $production->id }}">
                    <div class="card-body">
                        <div class="col-md-12">
                            <div class="row">
                                <x-form.textbox labelName="Batch No." name="batch_no" value="{{ $production->batch_no }}"
                                    property="readonly" required="required" col="col-md-4" />
                                <x-form.textbox labelName="Date" name="start_date" required="required" col="col-md-4"
                                    property="readonly" class="date" value="{{ $production->start_date }}" />
                                <x-form.selectbox labelName="Warehouse" name="warehouse_id" required="required"
                                    col="col-md-4" class="selectpicker">
                                    @if (!$warehouses->isEmpty())
                                        @foreach ($warehouses as $warehouse)
                                            <option value="{{ $warehouse->id }}"
                                                {{ $production->warehouse_id == $warehouse->id ? 'selected' : '' }}>
                                                {{ $warehouse->name }}</option>
                                        @endforeach
                                    @endif
                                </x-form.selectbox>
                            </div>
                        </div>
                        <div class="col-md-12 pt-5">
                            <ul class="nav nav-tabs nav-tabs-2" id="form-tab" role="tablist"
                                style="border-bottom: 0px !important;justify-content: space-between;">
                                {{-- <li class="nav-item mx-0 mb-3" id="tab1">
                                <a class="nav-link active text-center step  step-1" data-toggle="tab" href="#tab-1" role="tab">Product-1</a>
                            </li> --}}
                                @if (!$production->products->isEmpty())
                                    @foreach ($production->products as $key => $item)
                                        <li class="nav-item mx-0 mb-3" id="tab{{ $key + 1 }}">
                                            <a class="nav-link {{ $key == 0 ? 'active' : '' }} text-center step  step-{{ $key + 1 }}"
                                                data-toggle="tab" href="#tab-{{ $key + 1 }}"
                                                role="tab">Product-{{ $key + 1 }}</a>
                                        </li>
                                    @endforeach
                                @endif

                            </ul>

                            <input type="hidden" name="tab" id="check_tab">
                            <div class="tab-content">
                                @if (!$production->products->isEmpty())
                                    @foreach ($production->products as $key => $item)
                                        <div class="tab-pane {{ $key == 0 ? 'active' : '' }}  step step-{{ $key + 1 }}  p-3"
                                            id="tab-{{ $key + 1 }}" role="tabpanel">
                                            <div class="row" id="production_{{ $key + 1 }}">
                                                <div class="col-md-12 px-0" style="border-top: 5px solid #024c96;">
                                                    <div class="card card-custom card-fit card-border"
                                                        style="border-radius: 0 !important;">
                                                        <div class="card-body py-5">
                                                            <div class="row">
                                                                <div class="form-group col-md-12 required">
                                                                    <label>Product</label>
                                                                    <input type="text" class="form-control"
                                                                        value="{{ $item->product->name }}">
                                                                    <input type="hidden" class="form-control"
                                                                        value="{{ $item->id }}"
                                                                        name="production[{{ $key + 1 }}][production_product_id]"
                                                                        id="production_{{ $key + 1 }}_production_product_id">
                                                                    <input type="hidden" class="form-control"
                                                                        value="{{ $item->product_id }}"
                                                                        name="production[{{ $key + 1 }}][product_id]"
                                                                        id="production_{{ $key + 1 }}_product_id">
                                                                </div>
                                                                <div class="form-group col-md-3 required">
                                                                    <label for="mfg_date">Mfg. Date</label>
                                                                    <input type="text"
                                                                        class="form-control date total-time"
                                                                        name="production[1][mfg_date]"
                                                                        id="production_1_mfg_date"
                                                                        value="{{ $item->mfg_date }}" readonly
                                                                        onblur="setExpireTime();" />
                                                                </div>
                                                                <div class="form-group col-md-3 required">
                                                                    <label for="exp_date">Exp. Date</label>
                                                                    <input type="text"
                                                                        class="form-control date total-time"
                                                                        name="production[1][exp_date]"
                                                                        id="production_1_exp_date"
                                                                        value="{{ $item->exp_date }}"
                                                                        onblur="setExpireTime();" readonly />
                                                                </div>
                                                                <div class="form-group col-md-3 required">
                                                                    <label for="production_1_year">Total Months </label>
                                                                    <input type="text" name="production[1][year]"
                                                                        id="production_1_year" class="form-control "
                                                                        value="{{ $item->year }}" placeholder=""
                                                                        readonly>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 py-5">
                                                    <div class="row" id="production_materials_{{ $key + 1 }}">
                                                        @if (!$item->materials->isEmpty())
                                                            <div class="col-md-12 py-5 table-responsive">
                                                                <div class="col-md-12 text-center">
                                                                    <h5 class="bg-warning text-white p-3"
                                                                        style="width:250px;margin: 20px auto 10px auto;">
                                                                        Materials</h5>
                                                                </div>
                                                                <table class="table table-bordered pb-5"
                                                                    id="material_table_{{ $key + 1 }}">
                                                                    <div class="col-md-12 text-center">
                                                                        <div class="row">
                                                                            <div class="col-md-6"></div>
                                                                            <div class="col-md-2">
                                                                                <label style="padding-top: 10px;">Total
                                                                                    Finished Quantity</label>
                                                                            </div>
                                                                            <div class="col-md-4 mb-4">
                                                                                <input type="text"
                                                                                    class="form-control text-center finishedQty finished-qty"
                                                                                    value="{{ $item->base_unit_qty }}"
                                                                                    name="production[{{ $key + 1 }}][base_unit_qty]"
                                                                                    id="finished_qty">
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                    <thead class="bg-primary">
                                                                        <th width="30%">Material</th>
                                                                        {{--                                                                    <th width="5%" class="text-center">Type</th> --}}
                                                                        <th width="15%" class="text-center">Received
                                                                            QTY</th>
                                                                        <th width="10%" class="text-center">Unit Name
                                                                        </th>
                                                                        <th width="10%" class="text-right">Rate</th>
                                                                        <th width="15%" class="text-center">Stk. Avl.
                                                                            Qty</th>
                                                                        <th width="17%" class="text-right">Total</th>
                                                                    </thead>
                                                                    @php
                                                                        $totalMaterial = 0;
                                                                        $totalAmnt = 0;
                                                                    @endphp
                                                                    <tbody>
                                                                        @foreach ($item->materials as $index => $value)
                                                                            <tr>
                                                                                @php
                                                                                    $totalMaterial += $value->pivot->qty;

                                                                                    $totalAmnt += $value->pivot->cost * $value->pivot->qty;
                                                                                @endphp
                                                                                <td>
                                                                                    {{ $value->material_name . ' (' . $value->material_code . ')' }}
                                                                                    <input type="hidden"
                                                                                        class="form-control text-center"
                                                                                        value="{{ $value->pivot->id }}"
                                                                                        name="production[{{ $key + 1 }}][materials][{{ $index + 1 }}][production_material_id]"
                                                                                        id="production_{{ $key + 1 }}_materials_{{ $index + 1 }}_production_material_id"
                                                                                        data-id="{{ $index + 1 }}"
                                                                                        readonly>
                                                                                    <input type="hidden"
                                                                                        class="form-control text-center"
                                                                                        value="{{ $value->id }}"
                                                                                        name="production[{{ $key + 1 }}][materials][{{ $index + 1 }}][material_id]"
                                                                                        id="production_{{ $key + 1 }}_materials_{{ $index + 1 }}_material_id"
                                                                                        data-id="{{ $index + 1 }}"
                                                                                        readonly>
                                                                                    <input type="hidden"
                                                                                        class="form-control"
                                                                                        value="{{ $value->unit_id }}"
                                                                                        name="production[{{ $key + 1 }}][materials][{{ $index + 1 }}][unit_id]"
                                                                                        id="production_{{ $key + 1 }}_materials_{{ $index + 1 }}_unit_id"
                                                                                        data-id="{{ $index + 1 }}">
                                                                                    <input type="hidden"
                                                                                        class="form-control text-right"
                                                                                        value="{{ $value->pivot->cost }}"
                                                                                        name="production[{{ $key + 1 }}][materials][{{ $index + 1 }}][cost]"
                                                                                        id="production_{{ $key + 1 }}_materials_{{ $index + 1 }}_cost"
                                                                                        data-id="{{ $index + 1 }}"
                                                                                        readonly>
                                                                                    <input type="hidden"
                                                                                        class="form-control text-right stock_qty"
                                                                                        value="{{ $value->qty }}"
                                                                                        name="production[{{ $key + 1 }}][materials][{{ $index + 1 }}][stock_qty]"
                                                                                        id="production_{{ $key + 1 }}_materials_{{ $index + 1 }}_stock_qty"
                                                                                        data-id="{{ $index + 1 }}">
                                                                                    <input type="hidden"
                                                                                        class="form-control text-right"
                                                                                        value="{{ $value->qty }}"
                                                                                        name="production[{{ $key + 1 }}][materials][{{ $index + 1 }}][qty]"
                                                                                        id="production_{{ $key + 1 }}_materials_{{ $index + 1 }}_q_ty"
                                                                                        data-id="{{ $index + 1 }}">

                                                                                    <input type="hidden" class="track"
                                                                                        data-qty="{{ $value->pivot->qty }}"
                                                                                        data-cost="{{ $value->pivot->cost }}"
                                                                                        data-stock_qty="{{ $value->qty }}"
                                                                                        data-total="production_{{ $key + 1 }}_materials_{{ $index + 1 }}_total"
                                                                                        data-tab="{{ $index + 1 }}" />

                                                                                    <input type="hidden" name=""
                                                                                        value="{{ $value->pivot->qty }}"
                                                                                        class="material-qty"
                                                                                        id="">
                                                                                </td>
                                                                                <td class="text-center">
                                                                                    {{--                                                                                {{ MATERIAL_TYPE[$value->type] }} --}}
                                                                                    {{ $value->pivot->qty }}
                                                                                </td>
                                                                                <td class="text-center">
                                                                                    {{ $value->unit->unit_name . ' (' . $value->unit->unit_code . ')' }}
                                                                                </td>
                                                                                <td class="text-right">
                                                                                    {{ number_format($value->pivot->cost, 2, '.', '') }}

                                                                                </td>
                                                                                <td class="text-center">
                                                                                    {{ $value->qty }}
                                                                                    ({{ $value->unit->unit_name }})
                                                                                </td>
                                                                                <td>
                                                                                    <input type="text"
                                                                                        class="form-control text-right total material-amount"
                                                                                        value="{{ number_format($value->pivot->cost * $value->pivot->qty, 2, '.', '') }}"
                                                                                        name="production[{{ $key + 1 }}][materials][{{ $index + 1 }}][total]"
                                                                                        id="production_{{ $key + 1 }}_materials_{{ $index + 1 }}_total"
                                                                                        data-id="{{ $index + 1 }}"
                                                                                        readonly>
                                                                                </td>
                                                                            </tr>
                                                                        @endforeach
                                                                        <tr>
                                                                            <td colspan="1">Total</td>
                                                                            <td class="text-right"><span
                                                                                    id="materialQty">{{ $totalMaterial }}</span>
                                                                            </td>
                                                                            <td colspan="4" class="text-right"><span
                                                                                    id="materialAmnt">{{ $totalAmnt }}</span>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        @endif
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-3 required">
                                                    <label for="">Remaining Mixture</label>
                                                    <input type="text" class="form-control" name=""
                                                        id="remaining_mixture"
                                                        value="{{ $wastage->recyclable_wastage ?? '0' }}" readonly />
                                                </div>
                                                <div class="form-group col-md-3 required">
                                                    <label for="">Used Mixture</label>
                                                    <input type="text" class="form-control" name="used_wastage_qty"
                                                        id="used_wastage_qty" onkeyup="checkUsedMixtureQty();"
                                                        value="{{ $item->used_wastage_qty }}" required />
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary btn-sm mr-5 float-right"
                            onclick="check_material_stock()" id="save-btn"><i class="fas fa-sync-alt"></i>
                            Update</button>
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
        $(document).on('keyup', '.finished-qty', function() {
            // console.log('lol');
            let totalMaterial = 0;
            let totalMoney = 0;
            $('.material-qty').each(function() {
                let materialQty = $(this).val();
                totalMaterial = totalMaterial + parseFloat(materialQty);
            });
            $('.material-amount').each(function() {
                let materialAmnt = $(this).val();
                totalMoney = totalMoney + parseFloat(materialAmnt);
            });
            $('#materialQty').text(totalMaterial);
            $('#materialAmnt').text(totalMoney);

        });

        $(document).ready(function() {
            $('.date').datetimepicker({
                format: 'YYYY-MM-DD',
                ignoreReadonly: true
            });

        });


        // function calculateRowTotal(tab,row)
        // {
        //     var cost = parseFloat($('#production_'+tab+'_materials_'+row+'_cost').val());
        //     var qty = parseFloat($('#production_'+tab+'_materials_'+row+'_qty').val());
        //     var stock_qty = parseFloat($('#production_'+tab+'_materials_'+row+'_stock_qty').val());
        //     var total  = 0;
        //     if(cost > 0 && qty > 0)
        //     {
        //         if(qty > stock_qty){
        //             $('#production_'+tab+'_materials_'+row+'_qty').val(1);
        //             $('#production_'+tab+'_materials_'+row+'_total').val(parseFloat(cost).toFixed(2));
        //             notification('error','Quantity must be less than or equal to stock quantity!');
        //         }else{
        //             total = parseFloat(cost * qty).toFixed(2);
        //             $('#production_'+tab+'_materials_'+row+'_total').val(total);
        //         }
        //     }else{
        //         $('#production_'+tab+'_materials_'+row+'_total').val('');
        //     }
        // }

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
                beforeSend: function() {
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete: function() {
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success: function(data) {
                    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                    $('#store_or_update_form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function(key, value) {
                            var key = key.split('.').join('_');
                            $('#store_or_update_form input#' + key).addClass('is-invalid');
                            $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                            $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                            $('#store_or_update_form #' + key).parent().append(
                                '<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        console.log(data);
                        if (data.status == 'success') {
                            update_data();
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
                error: function(xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }

        function update_data() {
            let form = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url = "{{ url('production/update') }}";
            $.ajax({
                url: url,
                type: "POST",
                data: formData,
                dataType: "JSON",
                contentType: false,
                processData: false,
                cache: false,
                beforeSend: function() {
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete: function() {
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success: function(data) {
                    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                    $('#store_or_update_form').find('.error').remove();
                    // if (data.status == false) {
                    //     $.each(data.errors, function (key, value){
                    //         var key = key.split('.').join('_');
                    //         $('#store_or_update_form input#' + key).addClass('is-invalid');
                    //         $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                    //         $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                    //         $('#store_or_update_form #' + key).parent().append(
                    //         '<small class="error text-danger">' + value + '</small>');
                    //     });
                    // } else {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        window.location.replace("{{ url('production') }}");
                    }
                    // }
                },
                error: function(xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
    </script>

    <script>
        function _(x) {
            return document.getElementById(x);
        }

        $(document).on('input', '.other_cost', function() {
            let other_cost = $(this).val();
            let grand_t = $('#grand_total').val();
            let finishedqty = $('#finished_qty').val();

            _('grand_total').value = +_('g_tl').value + +other_cost;
            let a = $('#grand_total').val();

            _('cost_per_unit').value = a / finishedqty;
        });

        $(document).on('input', '.finishedQty', function() {
            let finishedQty = $(this).val();
            $('.track').each(function(i, k) {
                let s_qt = $(this).data('stock_qty') ? $(this).data('stock_qty') : 0;
                let qty = $(this).data('qty');
                if (s_qt > qty) {
                    document.getElementById($(this).data('total')).value = $(this).data('qty') * $(this)
                        .data('cost') * finishedQty;
                } else if (s_qt < qty) {
                    $(`#material_table_1 tbody tr:eq(${i})`).css({
                        'background': '#F64E60'
                    });
                }
            })
            calculation();
        });

        function calculation() {
            let total = 0;
            $('.total').each(function() {
                if ($(this).val() == '') {
                    total += +0;
                } else {
                    total += +$(this).val();
                }
            })
            _('g_tl').value = total;
        }
    </script>
@endpush
