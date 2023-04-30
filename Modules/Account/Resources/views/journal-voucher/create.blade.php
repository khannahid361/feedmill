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
                <div class="card-title">
                    <h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3>
                </div>
            </div>
        </div>
        <form id="journal-voucher-form" method="post">
            @csrf
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="form-group col-md-4 required">
                                <label for="voucher_no">Voucher No</label>
                                <input type="text" class="form-control" name="voucher_no" id="voucher_no" value="{{ $voucher_no }}" readonly />
                            </div>
                            <div class="form-group col-md-4 required">
                                <label for="voucher_date">Date</label>
                                <input type="text" class="form-control date" name="voucher_date" id="voucher_date" value="{{ date('Y-m-d') }}" readonly />
                            </div>
                            <x-form.selectbox labelName="Warehouse" name="warehouse_id" required="required"  col="col-md-4" class="selectpicker">
                                @if (!$warehouses->isEmpty())
                                @foreach ($warehouses as $id => $name)
                                    <option value="{{ $id }}">{{ $name }}</option>
                                @endforeach
                                @endif
                            </x-form.selectbox>
                            <div class="form-group col-md-4">
                                <button type="button" class="btn btn-success btn-block" style="margin-top: 25px">{{'Journal Voucher'}}</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-md-6">
                                <table class="table table-bordered" id="contra-voucher-debit-table">
                                    <thead  class="bg-primary">
                                    <tr class="text-right">
                                        <th width="10%"></th>
                                        <th width="55%">{{'Account Nam'}}</th>
                                        <th width="35%">{{'Debit'}}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="text-center">
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm add-more" id="add_more_debit_account" data-type="debit" data-toggle="tooltip" data-placement="top" data-original-title="Add More"><i class="fas fa-plus-square"></i></button>
                                        </td>
                                        <td>
                                            <select name="journal_account[1][debitId]" id="journal_account_1_debitId" class="form-control selectpicker">
                                                <option value="">Select Please</option>
                                                @if (!$transactional_accounts->isEmpty())
                                                    @foreach ($transactional_accounts as $coa)
                                                        <option value="{{ $coa->id }}">{{ $coa->name }}</option>
                                                    @endforeach
                                                @endif
                                            </select>
                                            <input type="hidden" name="journal_account[1][creditId]" value="0"/>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control debit-amount onInput" name="journal_account[1][debitAmount]" id="journal_account_1_debitAmount"/>
                                            <input type="hidden" name="journal_account[1][creditAmount]" value="0"/>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td class="text-right" colspan="2">Total</td>
                                        <td><input type="text" class="form-control text-right bg-primary text-white" name="debit_grand_total" id="debit_grand_total" placeholder="0.00" readonly></td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <table class="table table-bordered" id="contra-voucher-credit-table">
                                    <thead  class="bg-primary">
                                    <tr>
                                        <th width="35%">{{'Credit'}}</th>
                                        <th width="55%">{{'Account Name'}}</th>
                                        <th width="10%"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="text-center">
                                        <td>
                                            <input type="hidden" name="journal_account[2][debitAmount]" value="0"/>
                                            <input type="text" class="form-control credit-amount onInput" name="journal_account[2][creditAmount]" id="journal_account_2_creditAmount"/>
                                        </td>
                                        <td>
                                            <input type="hidden" name="journal_account[2][debitId]" value="0"/>
                                            <select name="journal_account[2][creditId]" id="journal_account_2_creditId" class="form-control selectpicker">
                                                <option value="">Select Please</option>
                                                @if (!$transactional_accounts->isEmpty())
                                                    @foreach ($transactional_accounts as $coa)
                                                        <option value="{{ $coa->id }}">{{ $coa->name }}</option>
                                                    @endforeach
                                                @endif
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm add-more" id="add_more_credit_account" data-type="credit" data-toggle="tooltip" data-placement="top" data-original-title="Add More"><i class="fas fa-plus-square"></i></button>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td><input type="text" class="form-control text-right bg-primary text-white" name="credit_grand_total" id="credit_grand_total" placeholder="0.00" readonly></td>
                                        <td class="text-left" colspan="2">Total</td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <div class="card card-custom">
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <x-form.textarea labelName="Remarks" name="remarks" col="col-md-12"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group col-md-12 pt-5 text-center">
                <button type="button" class="btn btn-danger btn-sm mr-3"><i class="fas fa-sync-alt"></i> Reset</button>
                <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i> Save</button>
            </div>
        </form>
    </div>
</div>
@endsection
@push('scripts')
<script src="{{asset('js/moment.js')}}"></script>
<script src="{{asset('js/bootstrap-datetimepicker.min.js')}}"></script>
<script>
        $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
        let contraDebitAccount  = 100;
        let contraCreditAccount = 10000;
        function _(x){
            return document.getElementById(x);
        }
        $(document).on('click','.add-more',function(){
           let type = $(this).data('type');
           if(type == 'debit'){
               if($('.credit-amount').length == 1) {
                   html = `<tr class="text-center">
                          <td>
                            <button type="button" class="btn btn-danger btn-sm remove" data-type="debit-remove" data-toggle="tooltip" data-placement="top" data-original-title="Remove"> <i class="fas fa-minus-square"></i></button>
                          </td>
                          <td>
                            <select name="journal_account[` + contraDebitAccount + `][debitId]" id="journal_account_` + contraDebitAccount + `_debitId" class="form-control selectpicker">
                            <option value="">Select Please</option>
                            @if (!$transactional_accounts->isEmpty())
                            @foreach ($transactional_accounts as $coa)
                            <option value="{{ $coa->id }}">{{ $coa->name }}</option>
                            @endforeach
                            @endif
                            </select>
                            <input type="hidden" name="journal_account[` + contraDebitAccount + `][creditId]" value="0"/>
                          </td>
                          <td>
                          <input type="text" class="form-control debit-amount onInput" name="journal_account[` + contraDebitAccount + `][debitAmount]" id="journal_account_` + contraDebitAccount + `_debitAmount"/>
                          <input type="hidden" name="journal_account[` + contraDebitAccount + `][creditAmount]" value="0"/>
                          </td>
                        </tr>`
                   $('#contra-voucher-debit-table tbody').append(html);
                   $('.selectpicker').selectpicker('refresh');
                   contraDebitAccount++;
               }else{
                   notification('error','You Can\'t Create Multiple Debit Field & Multiple Credit Field');
               }
           }else{
               if($('.debit-amount').length == 1) {
                   html = `
                        <tr class="text-center">
                           <td>
                             <input type="hidden" name="journal_account[` + contraCreditAccount + `][debitAmount]" value="0"/>
                             <input type="text" class="form-control credit-amount onInput" name="journal_account[` + contraCreditAccount + `][creditAmount]" id="journal_account_` + contraCreditAccount + `_creditAmount"/>
                           </td>
                           <td>
                             <input type="hidden" name="journal_account[` + contraCreditAccount + `][debitId]" value="0"/>
                             <select name="journal_account[` + contraCreditAccount + `][creditId]" id="journal_account_` + contraCreditAccount + `_creditId" class="form-control selectpicker">
                             <option value="">Select Please</option>
                             @if (!$transactional_accounts->isEmpty())
                             @foreach ($transactional_accounts as $coa)
                             <option value="{{ $coa->id }}">{{ $coa->name }}</option>
                             @endforeach
                             @endif
                             </select>
                           </td>
                           <td><button type="button" class="btn btn-danger btn-sm remove" data-type="credit-remove" data-toggle="tooltip" data-placement="top" data-original-title="Remove"> <i class="fas fa-minus-square"></i></button></td>
                        </tr>`
                   $('#contra-voucher-credit-table tbody').append(html);
                   $('.selectpicker').selectpicker('refresh');
                   contraCreditAccount++;
               }else{
                   notification('error','You Can\'t Create Multiple Debit Field & Multiple Credit Field');
               }
           }
        });
        $(document).on('click','.remove',function(){ $(this).parent().parent().remove(); calculation(); });
        $(document).on('input','.onInput',function(){  calculation(); });
        function calculation(){
            let debitAmount = 0;
            let creditAmount = 0;
          $('.debit-amount').each(function(){
              if($(this).val() == ''){
                  debitAmount += + 0;
              }else{
                  debitAmount += + $(this).val();
              }
          });
          $('.credit-amount').each(function(){
              if($(this).val() == ''){
                  creditAmount += + 0;
              }else{
                  creditAmount += + $(this).val();
              }
          });
          _('debit_grand_total').value = debitAmount;
          _('credit_grand_total').value = creditAmount;
        }
        function store_data(){
    let form = document.getElementById('journal-voucher-form');
    let formData = new FormData(form);
    let url = "{{url('journal-voucher/store')}}";
    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "JSON",
        contentType: false,
        processData: false,
        cache: false,
        beforeSend: function(){
            $('#save-btn').addClass('spinner spinner-white spinner-right');
        },
        complete: function(){
            $('#save-btn').removeClass('spinner spinner-white spinner-right');
        },
        success: function (data) {
            $('#journal-voucher-form').find('.is-invalid').removeClass('is-invalid');
            $('#journal-voucher-form').find('.error').remove();
            if (data.status == false) {
                $.each(data.errors, function (key, value) {
                    var key = key.split('.').join('_');
                    $('#journal-voucher-form input#' + key).addClass('is-invalid');
                    $('#journal-voucher-form textarea#' + key).addClass('is-invalid');
                    $('#journal-voucher-form select#' + key).parent().addClass('is-invalid');
                    $('#journal-voucher-form #' + key).parent().append(
                        '<small class="error text-danger">' + value + '</small>');
                });
            } else {
                notification(data.status, data.message);
                if (data.status == 'success') {
                    window.location.replace("{{ url('journal-voucher') }}");

                }
            }

        },
        error: function (xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}
</script>
@endpush
