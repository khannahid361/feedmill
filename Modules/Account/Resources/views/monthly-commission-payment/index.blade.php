@extends('layouts.app')
@section('title', $page_title)
@push('styles')
    <link href="{{asset('plugins/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('css/daterangepicker.min.css')}}" rel="stylesheet" type="text/css" />
@endpush
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="card card-custom gutter-b">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title"><h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3></div>
                    <div class="card-toolbar">
                        {{-- @if (permission('supplier-payment-create')) --}}
                            <a href="{{ route('supplier.payment.create') }}"  class="btn btn-primary btn-sm font-weight-bolder"><i class="fas fa-plus-circle"></i> Add New</a>
                        {{-- @endif --}}
                    </div>
                </div>
            </div>
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form method="POST" id="form-filter" class="col-md-12 px-0">
                        <div class="row justify-content-center">
                            <div class="form-group col-md-3">
                                <label for="name">Choose Your Date</label>
                                <div class="input-group">
                                    <input type="text" class="form-control daterangepicker-filed" value="">
                                    <input type="hidden" id="start_date" name="start_date" value="">
                                    <input type="hidden" id="end_date" name="end_date" value="">
                                </div>
                            </div>
                            <x-form.selectbox labelName="Dealer" name="dealer_coa_id"  col="col-md-3" class="selectpicker">
                                @if (!$dealers->isEmpty())
                                    @foreach ($dealers as $dealer)
                                        <option value="{{ $dealer->dealer_coa_id }}">{{ $dealer->name }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <div class="col-md-3">
                                <div style="margin-top:28px;">
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i class="fas fa-undo-alt"></i></button>
                                    <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button" data-toggle="tooltip" data-theme="dark" title="Search"><i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="table-responsive">
                                    <table id="dataTable" class="table table-bordered table-hover">
                                        <thead class="bg-primary">
                                        <tr>
                                            <th>{{'SL'}}</th>
                                            <th>{{'Voucher Date'}}</th>
                                            <th>{{'Voucher No'}}</th>
                                            <th>{{'Dealer'}}</th>
                                            <th>{{'Account Head'}}</th>
                                            <th>{{'Description'}}</th>
                                            <th>{{'Amount'}}</th>
                                            <th>{{'Created By'}}</th>
                                            <th>{{'Action'}}</th>
                                        </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
