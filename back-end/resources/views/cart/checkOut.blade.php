@extends('layouts.front-end.theme')
@section('content')
<div class="row">
    <div class="container" style="">
        <form action="{{ route('ssl.pay') }}" method="POST">
            @csrf
            <div class="card">
                <div class="card-title">
                    <h2 class="text text-success text-center">Your Cart.. Wanna CheckOut ?? </h2>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Product</th>
                            <th scope="col">Unit Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        @php $total=0;$ids=[];@endphp 
                        @forelse (Cart::content() as $product)
                            <tr>
                                <th scope="row">{{ $product->name }}</th>
                                @php array_push($ids,$product->id);@endphp
                                <input type="hidden" name="ids" value="{{json_encode($ids)}}">
                                <td>{{$product->price - ($product->model->price * ($product->model->discount/100)) }}</td>
                                <td>{{ $product->qty }}</td>
                                <td>{{ ($product->price - ($product->model->price * ($product->model->discount/100)))  * $product->qty }}</td>
                                @php $total+=($product->price - ($product->model->price * ($product->model->discount/100))) * $product->qty;@endphp
                            </tr>
                        @empty
                            <h1 class="text text-danger">Not Item in Cart...!!</h1>
                        @endforelse
                        <tr>
                            <th scope="row"></th>
                            <td></td>
                            <th >Total Amount = </th>
                            <td>{{ $total }}</td>
                            <input type="hidden" value="{{ $total }}" name="total_amount">
                        </tr>
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-md-7"></div>
                        <div class="col-md-5">
                            <div class="d-flex justify-content-around">
                                <button  type="submit" class="btn btn-success" style="color:white;">Pay Now</button>
                                <a href="#" class="btn btn-danger" style="color:white;">Cancel</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection





