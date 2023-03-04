@extends('dealerpanel::layouts.master')
@section('content')
    <div class="d-flex flex-column-fluid">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 mb-5">
                    <div class="bg-white text-center py-3  rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-3">
                        <img style="width : 40px" src="{{asset('images/sale.svg')}}" alt="order" >
                    </span>
                        <h6 id="order" class="m-0">{{$order + $free}} pcs</h6>
                        <a href="javascript::void(0);" class="font-weight-bold font-size-h7 mt-2">Order</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="bg-white text-center py-3  rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-3">
                        <img style="width : 40px" src="{{asset('images/purchase.svg')}}" alt="deliver">
                    </span>
                        <h6 id="deliver" class="m-0">{{ number_format($deliver) }} pcs</h6>
                        <a href="javascript::void(0);" class="font-weight-bold font-size-h7 mt-2">Deliver</a>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="bg-white text-center py-3  rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-3">
                        <img style="width : 40px" src="{{asset('images/income.svg')}}" alt="income">
                    </span>
                        <h6 id="income" class="m-0">{{ $order + $free - $deliver }} pcs</h6>
                        <a href="javascript::void(0);" class="font-weight-bold font-size-h7 mt-2">Delivery Remaining</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
