<?php

namespace App\Http\Controllers;
date_default_timezone_set('Asia/Singapore');

use Illuminate\Http\Request;
use Auth;
use App\User;
use Log;
use Telegram\Bot\Laravel\Facades\Telegram;

class AuthController extends Controller
{
    public function index() {
    	return view('login');
    }

    public function login(Request $request) {
    	$username = $request->username;
    	$password = $request->password;
    	if (Auth::attempt(['username'=>$username,'password'=>$password,'status_delete'=>0],false)) {
    		if (Auth::user()->level == 2 && Auth::user()->status_akun == 1) {
            $message = "<b>ABSEN CAI</b> \n"
                       ."User Telah LOG IN \n"
                       ."<b>Tanggal    : </b>".explodeDate(date('Y-m-d'))." ".date('H:i:s')."\n"
                       ."<b>Name       : </b>".Auth::user()->name."\n"
                       ."<b>Username   : </b>".Auth::user()->username."\n"
                       ."<b>IP Address : </b>".$_SERVER['REMOTE_ADDR']."\n"
                       ."<b>Login as   : </b> Admin";
            Telegram::sendMessage([
                'chat_id' => -295113257,
                'parse_mode' => 'html',
                'text' => $message
            ]);
    			return redirect('/admin/dashboard');
    		}
    		elseif (Auth::user()->level == 1 && Auth::user()->status_akun == 1) {
            $message = "<b>ABSEN CAI</b> \n"
                       ."User Telah LOG IN \n"
                       ."<b>Tanggal  : </b>".explodeDate(date('Y-m-d'))." ".date('H:i:s')."\n"
                       ."<b>Name     : </b>".Auth::user()->name."\n"
                       ."<b>Username : </b>".Auth::user()->username."\n"
                       ."<b>IP Address : </b>".$_SERVER['REMOTE_ADDR']."\n"
                       ."<b>Login as : </b> Petugas";
            Telegram::sendMessage([
                'chat_id'    => -295113257,
                'parse_mode' => 'html',
                'text'       => $message
            ]);
    			return redirect('/petugas/dashboard');
    		}
        elseif (Auth::user()->level == 0 && Auth::user()->status_akun == 1) {
            $message = "<b>ABSEN CAI</b> \n"
                       ."User Telah LOG IN \n"
                       ."<b>Tanggal  : </b>".explodeDate(date('Y-m-d'))." ".date('H:i:s')."\n"
                       ."<b>Name     : </b>".Auth::user()->name."\n"
                       ."<b>Username : </b>".Auth::user()->username."\n"
                       ."<b>IP Address : </b>".$_SERVER['REMOTE_ADDR']."\n"
                       ."<b>Login as : </b> Guest";
            Telegram::sendMessage([
                'chat_id'    => -295113257,
                'parse_mode' => 'html',
                'text'       => $message
            ]);
            return redirect('/guest/dashboard');
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
        $level = Auth::user()->level == 2 ? 'Admin' : (Auth::user()->level == 1 ? 'Petugas' : 'Guest');
        $message = "<b>ABSEN CAI</b> \n"
                   ."User Telah LOG OUT \n"
                   ."<b>Tanggal    : </b>".explodeDate(date('Y-m-d'))." ".date('H:i:s')."\n"
                   ."<b>Name       : </b>".Auth::user()->name."\n"
                   ."<b>Username   : </b>".Auth::user()->username."\n"
                   ."<b>IP Address : </b>".$_SERVER['REMOTE_ADDR']."\n"
                   ."<b>Level User : </b>".$level;
        Telegram::sendMessage([
            'chat_id'    => -295113257,
            'parse_mode' => 'html',
            'text'       => $message
        ]);
    	Auth::check() ? Auth::logout() : '';
    	return redirect('/login');
    }

    // public function user() {
    // 	$array = [
    // 		'username' => 'petugas',
    // 		'password' => bcrypt('petugas'),
    // 		'name' => 'Petugas',
    //         'status_akun' => 1,
    // 		'level' => 1
    // 	];

    // 	User::create($array);
    // }
}
