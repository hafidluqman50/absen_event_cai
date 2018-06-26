<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class isAuth
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
        if (Auth::check() && Auth::user()->status_delete == 0) {
            if (Auth::user()->level == 2) {
                $user = 'admin';
            }
            elseif(Auth::user()->level == 1) {
                $user = 'petugas';
            }
            elseif(Auth::user()->level == 0) {
                $user = 'guest';
            }
            return redirect('/'.$user.'/dashboard');
        }
        return $next($request);
    }
}
