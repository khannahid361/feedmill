<div class="col-md-12 py-5 table-responsive">
    <div class="col-md-12 text-center">
        <h5 class="bg-warning text-white p-3" style="width:250px;margin: 20px auto 10px auto;">Materials</h5>
    </div>

    <table class="table table-bordered pb-5 material_table" id="material_table_{{ $tab }}">
        <div class="col-md-12 text-center">
            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-2">
                    <label style="padding-top: 10px;">Total Finished Quantity</label>
                </div>
                <div class="col-md-4 mb-4">
                    <input type="text" class="form-control text-center finishedQty finished-qty" value=""
                        name="production[{{ $tab }}][expected_unit_qty]" id="finished_qty">
                </div>

            </div>
        </div>

        <thead class="bg-primary">
            <th width="30%">Material</th>
            <th width="5%" class="text-center">Material QTY</th>
            <th width="10%" class="text-right">Rate</th>
            <th width="15%" class="text-center">Stk. Avl. Qty</th>
            <th width="15%" class="text-center">Received Qty</th>
            {{--            <th width="15%" class="text-center">Damaged Qty</th> --}}
            <th width="17%" class="text-right">Total</th>
        </thead>
        <tbody>
            @if (!$materials->isEmpty())
                @foreach ($materials as $key => $item)
                    <tr>
                        <td class="active-bg">
                            {{ $item->material_name . ' (' . $item->material_code . ')' }}
                            <input type="hidden" class="form-control text-center" value="{{ $item->material_id }}"
                                name="production[{{ $tab }}][materials][{{ $key + 1 }}][material_id]"
                                id="production_{{ $tab }}_materials_{{ $key + 1 }}_material_id"
                                data-id="{{ $key + 1 }}" readonly>
                            <input type="hidden" class="form-control" value="{{ $item->unit_id }}"
                                name="production[{{ $tab }}][materials][{{ $key + 1 }}][unit_id]"
                                id="production_{{ $tab }}_materials_{{ $key + 1 }}_unit_id"
                                data-id="{{ $key + 1 }}">
                            <input type="hidden" class="form-control text-right" value="{{ round($item->cost,2) }}"
                                name="production[{{ $tab }}][materials][{{ $key + 1 }}][cost]"
                                id="production_{{ $tab }}_materials_{{ $key + 1 }}_cost"
                                data-id="{{ $key + 1 }}" readonly>
                            <input type="hidden" class="form-control text-right stock_qty" value="{{ $item->qty }}"
                                name="production[{{ $tab }}][materials][{{ $key + 1 }}][stock_qty]"
                                id="production_{{ $tab }}_materials_{{ $key + 1 }}_stock_qty"
                                data-id="{{ $key + 1 }}">
                            <input type="hidden" class="form-control text-right q_ty" value="{{ $item->q_ty }}"
                                id="production_{{ $tab }}_materials_{{ $key + 1 }}_q_ty"
                                data-id="{{ $key + 1 }}" readonly>
                            <input type="hidden" class="track" data-qtys="{{ $item->q_ty }}"
                                data-cost="{{ round($item->cost,2) }}" data-stock_qty="{{ $item->qty }}"
                                data-total="production_{{ $tab }}_materials_{{ $key + 1 }}_total"
                                data-tab="{{ $tab }}" />
                            <input type="hidden" class="track_qty" data-qtys="{{ $item->q_ty }}"
                                data-cost="{{ round($item->cost,2) }}" data-stock_qty="{{ $item->qty }}"
                                data-qty="production_{{ $tab }}_materials_{{ $key + 1 }}_qty"
                                data-tab="{{ $tab }}" />
                        </td>
                        <td class="text-center">
                            {{ $item->q_ty }} {{ $item->unit_code }}
                        </td>
                        <td class="text-right ">
                            {{ number_format($item->cost, 2, '.', '') }}
                        </td>
                        <td class="text-center ">
                            {{ $item->qty ? $item->qty : 0 }} {{ $item->unit_name }}
                        </td>
                        <td>
                            <input type="text" class="form-control text-right qty material-qty" value=""
                                name="production[{{ $tab }}][materials][{{ $key + 1 }}][qty]"
                                id="production_{{ $tab }}_materials_{{ $key + 1 }}_qty"
                                data-id="{{ $key + 1 }}" readonly>

                        </td>

                        {{--                    <td class=""> --}}
                        {{--                        <input type="text" class="form-control text-right damaged_qty " name="production[{{ $tab }}][materials][{{ $key+1 }}][damaged_qty]" id="production_{{ $tab }}_materials_{{ $key+1 }}_damaged_qty" data-id="{{ $key+1 }}"> --}}
                        {{--                    </td> --}}
                        <td class="">
                            <input type="text" class="form-control text-right total material-amount"
                                name="production[{{ $tab }}][materials][{{ $key + 1 }}][total]"
                                id="production_{{ $tab }}_materials_{{ $key + 1 }}_total"
                                data-id="{{ $key + 1 }}" readonly>
                        </td>
                    </tr>
                @endforeach
                <tr>
                    <td colspan="4">Total</td>
                    <td class="text-right"><span id="materialQty">0</span></td>
                    <td class="text-right"><span id="materialAmnt">0</span></td>
                </tr>
            @endif
        </tbody>
    </table>
</div>
<div class="col-md-6"></div>
<div class="form-group col-md-3 required">
    <label for="">Remaining Mixture</label>
    <input type="text" class="form-control" name="" id="remaining_mixture" value="{{ $wastage->recyclable_wastage??'0' }}" readonly />
</div>
<div class="form-group col-md-3 required">
    <label for="">Used Mixture</label>
    <input type="text" class="form-control" name="used_wastage_qty" id="used_wastage_qty" onkeyup="checkUsedMixtureQty();" value="0" required />
</div>
{{-- <div class="col-md-7"></div> --}}
{{-- <div class="col-md-5"> --}}
{{--    <table class="table"> --}}
{{--        <tr> --}}
{{--            <td><button type="button" class="btn btn-primary btn-block">{{__('Other Cost')}}</button></td> --}}
{{--            <td><input type="text" class="form-control bg-primary text-white text-center other_cost" id="other_cost" name="production[{{ $tab }}][other_cost]" /></td> --}}
{{--        </tr> --}}
{{--        <tr> --}}
{{--            <td><button type="button" class="btn btn-primary btn-block">{{__('Grand Total')}}</button></td> --}}
{{--            <td><input type="text" class="form-control bg-primary text-white text-center grand_total" id="grand_total" name="production[{{ $tab }}][sub_total]" readonly/></td> --}}
{{--            <td><input type="hidden" class="form-control bg-primary text-white text-center g_tl" id="g_tl"  readonly/></td> --}}
{{--        </tr> --}}
{{--        <tr> --}}
{{--            <td><button type="button" class="btn btn-primary btn-block">{{__('Cost Per Unit')}}</button></td> --}}
{{--            <td><input type="text" class="form-control bg-primary text-white text-center cost_per_unit" id="cost_per_unit" name="production[{{ $tab }}][per_unit_cost]" readonly/></td> --}}
{{--        </tr> --}}
{{--    </table> --}}
{{-- </div> --}}
