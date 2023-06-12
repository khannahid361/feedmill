@extends('layouts.app')
@section('title', $page_title)
@section('content')
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title"><h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3></div>
                <div class="card-toolbar">
                    <a href="{{ url('asm-monthly-target') }}" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a>
                </div>
            </div>
        </div>
        <div class="card card-custom">
            <div class="card-body">
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <form action="" id="store_or_update_form" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <input type="hidden" name="type" id="type" value="store">
                            <x-form.selectbox labelName="Month" name="month" required="required" col="col-md-3" class="selectpicker">
                                @php
                                    for ($m=1; $m<=12; $m++) {
                                        $month = date('F', mktime(0,0,0,$m, 1, date('Y')));
                                        echo "<option value='$m' ".($m == date('m') ? 'selected' : '').">$month</option>";
                                    }
                                @endphp
                            </x-form.selectbox>
                            @if(Auth::user()->warehouse_id)
                            <input type="hidden" name="warehouse_id" id="warehouse_id" value="{{ Auth::user()->warehouse_id }}">
                            @else
                            <x-form.selectbox labelName="Depo" name="warehouse_id" required="required" col="col-md-3" class="selectpicker">
                                @if (!$warehouses->isEmpty())
                                    @foreach ($warehouses as $warehouse)
                                        <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                                    @endforeach
                                    @endif
                            </x-form.selectbox>
                            @endif
                            <div class="col-md-12">
                                <table class="table table-bordered" id="asm-table">
                                    <thead class="bg-primary">
                                        <th>ASM <sup class="text-danger">*</sup></th>
                                        <th class=" text-right">Target Value <sup class="text-danger">*</sup></th>
                                        <th></th>
                                    </thead>
                                    <tbody></tbody>
                                    <tfoot>
                                        <tr><td><button type="button" class="btn btn-success btn-block add-salesman"><i class="fas fa-plus"></i></button></td></tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="col-md-4"></div>
                            <div class="form-group col-md-4 pt-5 text-center">
                                <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn1" onclick="store_data(1)"><i class="fas fa-save"></i> Save</button>
                                <button type="button" class="btn btn-success btn-sm mr-3" id="save-btn2" onclick="store_data(2)"><i class="fas fa-save"></i> Save & Add New</button>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('scripts')
<script>
    $(document).ready(function () {
        var count = 1;
        $('.add-salesman').click(function(){
            const warehouse_id = document.getElementById('warehouse_id').value;
            if(warehouse_id) {
                $.ajax({
                    url     :"{{ url('warehouse-wise-asm-list') }}/"+warehouse_id,
                    type    :"GET",
                    dataType:"JSON",
                    success :function(data){
                        var salesman = `<option value="">Select Please</option>`;
                        $.each(data, function(key, value) {
                            salesman += '<option value="'+ key +'">'+ value +'</option>';
                        });
                        var html = `<tr>
                                        <td>
                                        <select name="asm[${count}][id]" id="asm_${count}_id" class="form-control" data-live-search="true" data-row="${count}">
                                        ${salesman}
                                        </select>
                                        </td>
                                        <td>
                                        <input type="text" name="asm[${count}][target_value]" id="asm_${count}_target_value" class="form-control text-right"  />
                                        </td>
                                        <td class="text-center" data-row="${count}"><button type="button" class="btn btn-danger btn-block remove-salesman"><i class="fas fa-trash"></i></button></td>
                                    </tr>`;
                        $('#asm-table tbody').append(html);
                        $('#asm-table .selectpicker').selectpicker();
                        count++;
                    },
                });
            }else{
                notification('error','Please select warehouse');
            }
        });
        $('#asm-table').on('click','.remove-salesman',function(){
            $(this).closest('tr').remove();
        });
    });
    function store_data(type){
        var rownumber = $('table#asm-table tbody tr:last').index();
        if (rownumber < 0) {
            notification("error","Please insert salesman to table!")
        }else{
            let form     = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url      = "{{route('asm.monthly.target.store')}}";
            $.ajax({
                url             : url,
                type            : "POST",
                data            : formData,
                dataType        : "JSON",
                contentType     : false,
                processData     : false,
                cache           : false,
                beforeSend      : function(){
                    $('#save-btn'+type).addClass('spinner spinner-white spinner-right');
                },
                complete        : function(){
                    $('#save-btn'+type).removeClass('spinner spinner-white spinner-right');
                },
                success         : function (data) {
                    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                    $('#store_or_update_form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function (key, value) {
                            var key = key.split('.').join('_');
                            $('#store_or_update_form input#' + key).addClass('is-invalid');
                            $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                            $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                            $('#store_or_update_form #' + key).parent().append('<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        notification(data.status, data.message);
                        if (data.status == 'success') {
                            if(type == 1) {
                                window.location.replace("{{ route('asm.monthly.target') }}");
                            }else{
                                window.location.replace("{{ route('asm.monthly.target.add') }}");
                            }
                        }
                    }
                },
                error           : function (xhr, ajaxOption, thrownError) { console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText); }
            });
        }
    }
</script>
@endpush
