<?php

namespace Modules\DealerPanel\Http\Controllers;

use Illuminate\Contracts\Support\Renderable;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller{
    use ThrottlesLogins;
    public function showLoginForm(){
        return view('dealer-auth.login');
    }
    public function loginHandle(Request $request){
        if(Auth::guard('dealer')->attempt($request->only(['username','password']))){
            return redirect()->route('dealer.panel.dashboard');
        }
        return redirect()->back()->with('error','Invalid Credentials');
    }
    public function  profile(){

    }
    public function logOut(Request $request){
        Auth::guard()->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('dealer.panel.login');
    }
}
