<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // return view('home');

        if(Auth::user()->role_id == 4){
            return redirect('/employee/');
        }

        else if(Auth::user()->role_id == 2){
            return redirect('/admin/');
        }

        else{
            Auth::logout();
            return view('/login');
        }
    }
}
