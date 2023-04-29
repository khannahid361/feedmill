@extends('layouts.app')
@section('title', $page_title)
@push('styles')
    <link href="{{ asset('plugins/custom/datatables/datatables.bundle.css') }}" rel="stylesheet" type="text/css" />
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
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <form action="{{ route('get.due.report.data') }}" method="POST"
                        class="col-md-12 px-0">
                        @csrf
                        <div class="row">
                            <x-form.selectbox labelName="Participent" name="participent_id" col="col-md-3"
                                class="selectpicker">
                                <option value="0">All</option>
                                <option value="1">Customer</option>
                                <option value="2">Dealer</option>
                                <option value="3">Supplier</option>
                            </x-form.selectbox>
                            <input type="submit" name="submit" id="search" value="Search" class="btn btn-primary">
                            <div class="{{ Auth::user()->warehouse_id ? 'col-md-12' : 'col-md-9' }}"
                                style="padding-top: 28px;">
                                {{-- <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right"
                                    type="button" data-toggle="tooltip" data-theme="dark" title="Reset"><i
                                        class="fas fa-undo-alt"></i></button>
                                <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right"
                                    type="submit" data-toggle="tooltip" data-theme="dark" title="Search"><i
                                        class="fas fa-search"></i></button> --}}
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    <script src="{{ asset('plugins/custom/datatables/datatables.bundle.js') }}" type="text/javascript"></script>
    <script src="{{ asset('js/spartan-multi-image-picker.min.js') }}"></script>

@endpush
