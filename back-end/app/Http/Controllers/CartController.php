<?php

namespace App\Http\Controllers;
use App\Course;
use DB;
use Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cart=Cart::content();
        // $cart=Cart::instance(auth()->user()->id);
        // dd($cart);
        
        return view('cart.cart_view',compact('cart'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    public function restore(){

        Cart::destroy();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function add_to_cart(Course $course){

        $course=[
            'id' => $course->id,
            'name' => $course->course_title,
            'qty' => 1,
            'price' => $course->amount,
            'weight' => 550,
        ];
    $cartItem=Cart::add($course);
    $cartItem->associate('App\Course');

    // $cart=Cart::content();
    $indentity=auth()->user()->name.auth()->user()->id;
    $exist=DB::table('shoppingcart')
        ->where('identifier',$indentity)->get();
        if($exist->count()>0){
            DB::table('shoppingcart')
                ->where('identifier',$indentity)->delete();
            Cart::store( $indentity);

    }else{
        Cart::store( $indentity);
    }
    $cart=Cart::content();

    return view('cart.cart_view',compact('cart'));

    // return response(['message' => "Course added to the cart"]);
    }

    public function checkout(){
        // dd($address);
        return view('cart.checkOut');
    }

    public function remove_item($id){
        // dd($id);
        
        $indentity=auth()->user()->name.auth()->user()->id;
        Cart::restore($indentity);
        Cart::store( $indentity);
        Cart::remove($id);
        return view('cart.cart_view',['message' => "Course removed from the cart"]);

        // return response(['message' => "Course removed from the cart"]);
    }
}
