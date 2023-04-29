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
                <div class="card-body">
                    <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                        <div class="row">
                            <div class="col-sm-12">
                                <table id="" class="table table-bordered table-hover">
                                    <thead class="bg-primary">
                                        <tr>
                                            <th>Sl</th>
                                            <th>Participent Name</th>
                                            <th>Participent Group</th>
                                            <th>Participent Contact Number</th>
                                            <th>Participent Address</th>
                                            <th style="float:right">Balance</th>
                                        </tr>
                                    </thead>
                                    @php
                                        $total = 0;
                                    @endphp
                                    @forelse ($data as $item)
                                        @php
                                            $total += $item['balance'];
                                        @endphp
                                        <tr>
                                            <th><span style="color:black;">{{ $item['sl'] }}</span></th>
                                            <th><span style="color:black;">{{ $item['name'] }}</span></th>
                                            <th><span style="color:black;">{{ $item['group'] }}</span></th>
                                            <th><span style="color:black;">{{ $item['mobile'] }}</span></th>
                                            <th><span style="color:black;">{{ $item['address'] }}</span></th>
                                            <th><span style="color:black;float:right">{{ $item['balance'] }}</span></th>
                                        </tr>

                                    @empty
                                        <tr>!!! Sorry No Data Available !!!</tr>
                                    @endforelse
                                    <tfoot class="bg-primary">
                                        <tr>
                                            <th colspan="5">Total</th>
                                            <th><span style="float:right">{{ $total }}</span></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
