@extends('layouts.app')
@section('title', $page_title)
@push('styles')
    <link href="{{asset('css/bootstrap-datetimepicker.min.css')}}" rel="stylesheet" type="text/css" />
@endpush
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3></div>
                    <div class="card-toolbar">
                        @if (permission('supplier-payment-access'))
                            <a href="{{ route('dealer.yearly.commission.payment') }}"  class="btn btn-warning btn-sm font-weight-bolder"><i class="fas fa-arrow-circle-left"></i> Back</a>
                        @endif
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <form id="supplier-payment-form" method="post">
                            @csrf
                            <div class="row">
                                <div class="form-group col-md-3 required">
                                    <label for="voucher_no">Voucher No</label>
                                    <input type="text" class="form-control" name="voucher_no" id="voucher_no" value="{{ $voucher_no }}" readonly />
                                </div>
                                <div class="form-group col-md-3 required">
                                    <label for="voucher_date">Date</label>
                                    <input type="text" class="form-control date" name="voucher_date" id="voucher_date" value="{{ date('Y-m-d') }}" readonly />
                                </div>
                                <x-form.selectbox labelName="Dealer" name="dealer_id"  onchange="dueAmount(this.value)" required="required"  col="col-md-3" class="selectpicker">
                                    @if (!$dealers->isEmpty())
                                        @foreach ($dealers as $dealer)
                                            <option value="{{ $dealer->id }}">{{ $dealer->name.' - '.$dealer->mobile }}</option>
                                        @endforeach
                                    @endif
                                </x-form.selectbox>
                                <div class="form-group col-md-3">
                                    <label for="due_amount">Due Amount</label>
                                    <input type="text" class="form-control"  id="due_amount" readonly />
                                </div>
                                <x-form.selectbox labelName="Payment Type" name="payment_type" required="required"  col="col-md-4" class="selectpicker">
                                    @foreach (PAYMENT_METHOD as $key => $value)
                                        <option value="{{ $key }}">{{ $value }}</option>
                                    @endforeach
                                </x-form.selectbox>
                                <x-form.selectbox labelName="Account" name="account_id" required="required"  col="col-md-4" class="selectpicker"/>
                                <x-form.textbox labelName="Amount" name="amount" required="required" col="col-md-4" placeholder="0.00" />
                                <x-form.textarea labelName="Remarks" name="remarks" col="col-md-12"/>
                                <div class="form-group col-md-12 text-center">
                                    <button type="button" class="btn btn-danger btn-sm mr-3"><i class="fas fa-sync-alt"></i> Reset</button>
                                    <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i> Save</button>
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
    <script src="{{asset('js/moment.js')}}"></script>
    <script src="{{asset('js/bootstrap-datetimepicker.min.js')}}"></script>
    <script>
        $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
        $(document).on('change', '#payment_type', function () {
            $.ajax({
                url: "{{route('account.list')}}",
                type: "POST",
                data: { payment_method: $('#payment_type option:selected').val(),_token: _token},
                success: function (data) {
                    $('#supplier-payment-form #account_id').html('');
                    $('#supplier-payment-form #account_id').html(data);
                    $('#supplier-payment-form #account_id.selectpicker').selectpicker('refresh');
                },
                error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
            });
        });
        function dueAmount(dealer_id) {
            $.ajax({
                url: "{{url('dealer-yearly-commission-due')}}/"+dealer_id,
                type: "GET",
                dataType: "JSON",
                success: function (data) {
                    data ? $('#due_amount').val(parseFloat(data).toFixed(2)) : $('#due_amount').val('0.00');
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
        function store_data(){
            let form = document.getElementById('supplier-payment-form');
            let formData = new FormData(form);
            let url = "{{route('dealer.yearly.commission.payment.store')}}";
            $.ajax({
                url        : url,
                type       : "POST",
                data       : formData,
                dataType   : "JSON",
                contentType: false,
                processData: false,
                cache      : false,
                beforeSend : function(){
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete   : function(){
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success    : function (data) {
                    $('#supplier-payment-form').find('.is-invalid').removeClass('is-invalid');
                    $('#supplier-payment-form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function (key, value) {
                            var key = key.split('.').join('_');
                            $('#supplier-payment-form input#' + key).addClass('is-invalid');
                            $('#supplier-payment-form textarea#' + key).addClass('is-invalid');
                            $('#supplier-payment-form select#' + key).parent().addClass('is-invalid');
                            $('#supplier-payment-form #' + key).parent().append(
                                '<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        notification(data.status, data.message);
                        window.location.replace("{{ url('dealer-yearly-commission-payment') }}");
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);}
            });
        }
    </script>
@endpush
