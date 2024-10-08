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
                    <div class="card-body">
                        <div class="col-md-12 text-center">
                            <h5>
                                <b>Batch No.:</b> {{ $production->batch_no }} <br>
                                <b>Warehouse:</b> {{ $production->warehouse->name }} <br>
                                <b>Mfg. Date:</b> {{ date('d-M-Y', strtotime($production->start_date)) }}
                                @if ($production->end_date)
                                    <br><b>Expired Date:</b> {{ date('d-M-Y', strtotime($production->end_date)) }}
                                @endif
                            </h5>
                        </div>
                        <div class="col-md-12 pt-5">
                            @if (!$production->products->isEmpty())
                                @foreach ($production->products as $key => $item)
                                    <div class="row pt-5">
                                        <div class="col-md-12 text-center">
                                            <h3 class="py-3 bg-warning text-white" style="margin: 10px auto 10px auto;">
                                                {{ $item->product->name }} - {{ $item->recipe->recipe_name }} ({{ $item->recipe->recipe_code }})</h3>
                                        </div>
                                        <div class="col-md-12">
                                            <table class="table table-bordered pb-5"
                                                id="material_table_{{ $key + 1 }}">
                                                <thead class="bg-primary">
                                                    <th class="text-center">Mfg. Date</th>
                                                    <th class="text-center">Exp. Date</th>
                                                    <th class="text-center">Unit Name</th>
                                                    <th class="text-center">Used Materials</th>
                                                    <th class="text-center">Mixture Used (Previous)</th>
                                                    <th class="text-center">Finish Goods Qty</th>
                                                    <th class="text-center">Recyclable Dust</th>
                                                    <th class="text-center">Permanent Dust</th>
                                                    @if ($item->has_coupon == 1)
                                                        <th class="text-center">Total Coupon</th>
                                                        <th class="text-center">Coupon Price</th>
                                                        <th class="text-center">Coupon Exp. Date</th>
                                                    @endif

                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-center">
                                                            {{ date('d-M-Y', strtotime($item->mfg_date)) }}</td>
                                                        <td class="text-center">
                                                            {{ date('d-M-Y', strtotime($item->exp_date)) }}</td>
                                                        <td class="text-center">
                                                            {{ $item->product->unit->unit_name . ' (' . $item->product->unit->unit_code . ')' }}
                                                        </td>
                                                        <td class="text-center">{{ $item->expected_unit_qty }}</td>
                                                        <td class="text-center">{{ $item->used_wastage_qty }}</td>
                                                        <td class="text-center">{{ $item->base_unit_qty }}</td>
                                                        <td class="text-center">{{ $item->recyclable_wastage_qty }}</td>
                                                        @php
                                                            $permanentDustPercentage = ($item->permanent_wastage_qty * 100)/ $item->base_unit_qty;
                                                        @endphp
                                                        <td class="text-center">{{ $item->permanent_wastage_qty }} &nbsp; &nbsp;({{ number_format($permanentDustPercentage, 2) }}%)</td>
                                                        @if ($item->has_coupon == 1)
                                                            <td class="text-center">{{ $item->total_coupon }}</td>
                                                            <td class="text-center">
                                                                {{ number_format($item->coupon_price, 2, '.', '') }}</td>
                                                            <td class="text-center">
                                                                {{ date('d-M-Y', strtotime($item->coupon_exp_date)) }}</td>
                                                        @endif
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-12 table-responsive">
                                            <table class="table table-bordered pb-5"
                                                id="material_table_{{ $key + 1 }}">
                                                <thead class="bg-primary">
                                                    <th width="30%">Material</th>
                                                    <th width="5%" class="text-center">Type</th>
                                                    <th width="10%" class="text-center">Unit Name</th>
                                                    <th width="10%" class="text-right">Rate</th>
                                                    <th class="text-center">Received Qty</th>
                                                    <th class="text-center">Used Qty</th>
                                                    <th class="text-center">Sub-Total</th>
                                                    {{--                                                <th class="text-center">Damaged Qty</th> --}}
                                                    {{--                                                <th class="text-center">Odd Qty</th> --}}
                                                </thead>
                                                @php
                                                    $netTotal = 0;
                                                @endphp
                                                <tbody>
                                                    @if (!$item->materials->isEmpty())
                                                        @foreach ($item->materials as $index => $value)
                                                            <tr>
                                                                <td> {{ $value->material_name . ' (' . $value->material_code . ')' }}
                                                                </td>
                                                                <td class="text-center">{{ MATERIAL_TYPE[$value->type] }}
                                                                </td>
                                                                <td class="text-center">
                                                                    {{ $value->unit->unit_name . ' (' . $value->unit->unit_code . ')' }}
                                                                </td>
                                                                <td class="text-right">
                                                                    {{ number_format($value->pivot->cost, 2, '.', '') }} </td>
                                                                <td class="text-center">
                                                                    {{ number_format($value->pivot->qty, 2, '.', '') }} </td>
                                                                <td class="text-center">{{ $value->pivot->used_qty }}</td>
                                                                <td class="text-center">
                                                                    {{ number_format($value->pivot->cost * $value->pivot->used_qty, 2, '.', '') }}
                                                                </td>
                                                                {{--                                                            <td class="text-center">{{ $value->pivot->damaged_qty }}</td> --}}
                                                                {{--                                                            <td class="text-center">{{ $value->pivot->odd_qty }}</td> --}}
                                                            </tr>
                                                            @php
                                                                $netTotal += number_format($value->pivot->cost * $value->pivot->used_qty, 2, '.', '');
                                                            @endphp
                                                        @endforeach
                                                        @php
                                                            $labor = $item->labor_cost ?? 0;
                                                            $other = $item->other_cost ?? 0;
                                                        @endphp
                                                        <tr>
                                                            <td colspan="6" class="text-right font-weight-bold">Net Total
                                                            </td>
                                                            <td colspan="1" class="text-right">
                                                                {{ $netTotal }}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6" class="text-right font-weight-bold">Labor
                                                                Cost</td>
                                                            <td colspan="1" class="text-right">
                                                                {{ $item->labor_cost ?? 0 }}</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6" class="text-right font-weight-bold">Other
                                                                Cost</td>
                                                            <td colspan="1" class="text-right">
                                                                {{ $item->other_cost ?? 0 }}</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6" class="text-right font-weight-bold">Total
                                                                Cost</td>
                                                            <td colspan="1" class="text-right">
                                                                @php
                                                                    if (!empty($item->per_unit_cost) && !empty($item->base_unit_qty)) {
                                                                        // $total_cost = $item->per_unit_cost * $item->base_unit_qty;
                                                                        $total_cost = $netTotal + $labor + $other;
                                                                    } else {
                                                                        $total_cost = '';
                                                                    }
                                                                @endphp
                                                                {{ $total_cost }}
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6" class="text-right font-weight-bold">Per Unit
                                                                Cost</td>
                                                            <td colspan="1" class="text-right">
                                                                {{ $item->per_unit_cost ? number_format($item->per_unit_cost, 2, '.', '') : '' }}
                                                            </td>
                                                        </tr>
                                                    @endif
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                @endforeach
                            @endif

                        </div>
                    </div>
                </form>
            </div>
            <!--end::Card-->
        </div>
    </div>
@endsection
