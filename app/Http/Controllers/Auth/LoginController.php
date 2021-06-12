<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    protected function attemptLogin(Request $request)
    {
        $this->guard()->attempt(
            $this->credentials($request), $request->filled('remember')
        );

        if(User::where('username',$request->email)->exists()){
            $user = User::where('username',$request->email)->first();
            if(Hash::check($request->password, $user->password)){
                Auth::login($user);
                return redirect('/');
            }
        }

        if(User::where('email',$request->email)->exists()){
            $user = User::where('email',$request->email)->first();
            if(Hash::check($request->password, $user->password) && $user->status == 1){
                Auth::login($user);
                return redirect('/');
            }
        }

        if(!User::where('email',$request->email)->exists()){
            Auth::logout();
            return redirect()->back()->with('error','your account is blocked');;
        }

        if(Auth::check() && Auth::user()->status == 0){
            Auth::logout();
            return redirect()->back()->with('error','your account is blocked');;
        }

        return redirect('/');
    }


}
