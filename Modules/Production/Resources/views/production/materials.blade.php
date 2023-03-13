
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
                    <input type="text" class="form-control text-center finishedQty" value="" name="finished_qty_{{ $tab }}" id="finished_qty_{{ $tab }}" >
                </div>

            </div>
        </div>
        <script>
            function _(x){
                return document.getElementById(x);
            }
            $(document).on('input','.finishedQty',function(){
                let finishedQty = $(this).val();
                $('.track').each(function(){
                    document.getElementById($(this).data('total')).value = $(this).data('qty') * $(this).data('cost') * finishedQty;
                })
            });

        </script>
        <thead class="bg-primary">
            <th width="30%">Material</th>
            <th width="5%" class="text-center">QTY</th>
{{--            <th width="10%" class="text-center">Unit Name</th>--}}
            <th width="10%" class="text-right">Rate</th>
            <th width="15%" class="text-center">Stk. Avl. Qty</th>
{{--            <th width="13%" class="text-center">Required Qty</th>--}}
            <th width="17%" class="text-right">Total</th>
        </thead>
        <tbody>
            @if (!$materials->isEmpty())
                @foreach ($materials as $key => $item)

                <tr>
                    <td>
                        {{ $item->material_name .' ('.$item->material_code.')' }}
                        <input type="hidden" class="form-control text-center" value="{{ $item->material_id }}" name="production[{{ $tab }}][materials][{{ $key+1 }}][material_id]" id="production_{{ $tab }}_materials_{{ $key+1 }}_material_id" data-id="{{ $key+1 }}" readonly>
                        <input type="hidden" class="track" data-qty="{{ $item->q_ty }}" data-cost="{{ $item->cost }}" data-total="production_{{ $tab }}_materials_{{ $key+1 }}_total" data-tab="{{$tab}}"/>
                    </td>
                    <td class="text-center">
                        {{ $item->q_ty }} {{$item->unit_name}}
                        <input type="hidden" class="form-control text-right" value="{{ $item->q_ty }}" name="production[{{ $tab }}][materials][{{ $key+1 }}][q_ty]" id="production_{{ $tab }}_materials_{{ $key+1 }}_q_ty" data-id="{{ $key+1 }}" readonly>

                    </td>
                    <td class="text-right">
                        {{ number_format($item->cost,2,'.','') }}
                        <input type="hidden" class="form-control text-right" value="{{ $item->cost }}" name="production[{{ $tab }}][materials][{{ $key+1 }}][cost]" id="production_{{ $tab }}_materials_{{ $key+1 }}_cost" data-id="{{ $key+1 }}" readonly>

                    </td>
                    <td class="text-center">
                        {{ $item->qty ? $item->qty : 0}} {{$item->unit_name}}
                        <input type="hidden" class="form-control text-right stock_qty" value="{{ $item->qty }}" name="production[{{ $tab }}][materials][{{ $key+1 }}][stock_qty]" id="production_{{ $tab }}_materials_{{ $key+1 }}_stock_qty" data-id="{{ $key+1 }}">
                    </td>
{{--                    <td class="text-center">--}}
{{--                        {{ $item->unit_name.' ('.$item->unit_code.')' }}--}}
                        <input type="hidden" class="form-control" value="{{ $item->unit_id }}" name="production[{{ $tab }}][materials][{{ $key+1 }}][unit_id]" id="production_{{ $tab }}_materials_{{ $key+1 }}_unit_id" data-id="{{ $key+1 }}">
{{--                    </td>--}}
{{--                    <td>--}}
{{--                        <input type="text" class="form-control text-center qty" name="production[{{ $tab }}][materials][{{ $key+1 }}][qty]" id="production_{{ $tab }}_materials_{{ $key+1 }}_qty"  onkeyup="calculateRowTotal('{{ $tab }}','{{ $key+1 }}')" data-id="{{ $key+1 }}">--}}
{{--                    </td>--}}
                    <td>
                        <input type="text" class="form-control text-right total" name="production[{{ $tab }}][materials][{{ $key+1 }}][total]" id="production_{{ $tab }}_materials_{{ $key+1 }}_total" data-id="{{ $key+1 }}" readonly>
                    </td>
                </tr>
                @endforeach
            @endif
        </tbody>
    </table>
</div>
