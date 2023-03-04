@extends('layouts.app')
@section('title', $page_title)
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <!--begin::Notice-->
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3></div>
                    <div class="card-toolbar"><a href="{{ route('sr.product.target') }}" class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-left"></i> Back</a></div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <form action="" id="store_or_update_form" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <table class="table table-bordered" id="add-target-table">
                                    <thead class="bg-primary">
                                    <tr class="text-center">
                                        <th>{{'Sales Men'}}</th>
                                        <th>{{'Commission Name'}}</th>
                                        <th>{{'Start Date'}}</th>
                                        <th>{{'End Date'}}</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="text-center">
                                        <td>
                                            <select class="form-control selectpicker" id="target_1_salesmen_id" name="target[1][salesmen_id]" data-live-search="true">
                                                <option value="">{{'Select Please'}}</option>
                                                @foreach($salesmen as $value)
                                                    <option value="{{$value->id}}">{{$value->name}}</option>
                                                @endforeach
                                            </select>
                                        </td>
                                        <td>
                                            <select class="form-control selectpicker" id="target_1_product_commission_id" name="target[1][product_commission_id]" data-live-search="true">
                                                <option value="">{{'Select Please'}}</option>
                                                @foreach($commissions as $value)
                                                    <option value="{{$value->id}}">{{$value->name}}</option>
                                                @endforeach
                                            </select>
                                        </td>
                                        <td><input type = "date" class="form-control" id="target_1_start_date" name="target[1][start_date]" value="{{ date('Y-m-d') }}" /></td>
                                        <td><input type = "date" class="form-control" id="target_1_end_date" name="target[1][end_date]" /></td>
                                        <td><button type="button" class="btn btn-success btn-md add-target"><i class="fas fa-plus"></i></button></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row pt-5">
                                <div class="form-group col-md-12 text-center px-0">
                                    <a type="button" class="btn btn-danger btn-sm mr-3" href="{{route('sr.product.target')}}"><i class="fas fa-sync-alt"></i>{{'Reset'}}</a>
                                    <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="storeData()"><i class="fas fa-save"></i>{{'Submit'}}</button>
                                </div>
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
        let count = 2;
        $(document).on('click','.add-target',function(){
            html = `<tr class="text-center">
                        <td>
                        <select class="form-control selectpicker" id="target_`+count+`_salesmen_id" name="target[`+count+`][salesmen_id]" data-live-search="true">
                        <option value="">{{'Select Please'}}</option>
                        @foreach($salesmen as $value)
                        <option value="{{$value->id}}">{{$value->name}}</option>
                        @endforeach
                        </select>
                        </td>
                        <td>
                        <select class="form-control selectpicker" id="target_`+count+`_product_commission_id" name="target[`+count+`][product_commission_id]" data-live-search="true">
                        <option value="">{{'Select Please'}}</option>
                        @foreach($commissions as $value)
                        <option value="{{$value->id}}">{{$value->name}}</option>
                        @endforeach
                        </select>
                        </td>
                        <td><input type = "date" class="form-control" id="target_`+count+`_start_date" name="target[`+count+`][start_date]" value="{{ date('Y-m-d') }}"/></td>
                        <td><input type = "date" class="form-control" id="target_`+count+`_end_date" name="target[`+count+`][end_date]" /></td>
                        <td class="text-center">
                        <button type="button" class="btn btn-danger btn-sm removeTarget"><i class="fas fa-minus-square text-white"></i></button>
                        </td>
                        </tr>`
            $('#add-target-table').append(html);
            $('.selectpicker').selectpicker('refresh');
            count ++;
        });
        $(document).on('click','.removeTarget',function(){
            count --;
            $(this).closest('tr').remove();
            calculation();
        });
        function storeData(){
            let form = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url = "{{route('sr.product.target.store')}}";
            $.ajax({
                url             : url,
                type            : "POST",
                data            : formData,
                dataType        : "JSON",
                contentType     : false,
                processData     : false,
                cache           : false,
                beforeSend      : function(){
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete        : function(){
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success         : function (data) {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        window.location.replace("{{ route('sr.product.target') }}");
                    }
                },
                error           : function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
            });
        }
    </script>
@endpush
