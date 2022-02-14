@extends('layouts.front-end.theme')
@section('content')



<!-- Cart Page Start -->
<div class="page-section section pt-90 pb-50" style="margin-top:15vh">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <form action="#">
                    <!-- Cart Table -->
                    <div class="cart-table table-responsive mb-40">
                        <table class="table">
                            <thead>
                                <tr>
                                   
                                    <th class="pro-title">Product</th>
                                    <th class="pro-price">Price</th>
                                    <th class="pro-quantity">Quantity</th>
                                    <th class="pro-subtotal">Total</th>
                                    <th class="pro-remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>


                                <tr>
                                    <a  href="{{ route('cart.checkout') }}" class="btn btn-success float-right mr-4 pr-4 mt-4 mb-4"><span class="text text-white">Check-Out</span></a>
                                </tr>

                                @forelse(Cart::content() as $row)
                                    <tr>
                                        <td class="pro-title"><a href="#">{{ $row->name }}</a></td>
                                        <td class="pro-price"><span> ৳{{ $row->price - ($row->model->price * ($row->model->discount/100)) }}</span></td>
                                        <td class="pro-quantity"><div class="pro-qty"><span id="{{ $row->rowId }}"  class="dec qtybtn"></span><input  type="text" value="{{ $row->qty }}" disabled><span id="{{ $row->rowId }}" class="inc qtybtn"></span></div></td>

                                        <td class="pro-subtotal"> ৳<input id="item-price-{{ $row->rowId }}"  value="{{ $row->price - ($row->model->price * ($row->model->discount/100)) }} "size="5"  disabled ></td>

                                        <td class="pro-remove"><a href="{{ route('cart.remove', $row->rowId) }}"><i class='bx bx-trash remove-cart'></i></a></td>
                                    </tr>

                                @empty
                                    <h1 class="text text-danger">Empty Cart ....!!</h1>
                                    <br>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                </form>

            </div>
        </div>
    </div>
</div>
<!-- Cart Page End -->

<!-- JS -->


@endsection
