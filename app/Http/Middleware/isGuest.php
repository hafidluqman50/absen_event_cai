<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class isGuest
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (Auth::check() && Auth::user()->status_akun == 1) {
            if (Auth::user()->level != 0) {
                return redirect('/login');
            }
        }
        else {
            Auth::check() ? Auth::logout() : '';
            return redirect('/login')->with('message','Login Terlebih Dahulu');
        }
        return $next($request);
    }
}
