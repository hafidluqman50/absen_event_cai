<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use Log;

class AuthController extends Controller
{
    public function index() {
    	return view('login');
    }

    public function login(Request $request) {
    	$username = $request->username;
    	$password = $request->password;
    	if (Auth::attempt(['username'=>$username,'password'=>$password],false)) {
    		if (Auth::user()->level == 1 && Auth::user()->status_akun == 1) {
    			return redirect('/admin/dashboard');
    		}
    		elseif (Auth::user()->level == 0 && Auth::user()->status_akun == 1) {
    			return redirect('/petugas/dashboard');
    		}
    		elseif(Auth::user()->status_akun == 0) {
    			Auth::logout();
    			return redirect('/login')->with('log','Maaf Akun Anda Non Aktif');
    		}
    	}
    	else {
    		$error = array_except($request->all(),['password']);
    		Log::critical('Login gagal',$error);
    		return redirect('/login')->with('log','User Dan Pass Salah');
    	}
    }

    public function logout() {
    	Auth::check() ? Auth::logout() : '';
    	return redirect('/login');
    }

    // public function user() {
    // 	$array = [
    // 		'username' => 'admin',
    // 		'password' => bcrypt('admin'),
    // 		'name' => 'Administrator',
    // 		'level' => 1
    // 	];

    // 	User::create($array);
    // }
}
