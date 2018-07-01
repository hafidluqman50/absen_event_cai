<?php

namespace App\Http\Middleware;

use Closure;

class CorsApi
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
        $response = $next($request);
        $response->header('Access-Control-Allow-Methods', 'HEAD, GET, POST, PUT, PATCH, DELETE');
        $response->header('Access-Control-Allow-Headers', $request->header('Access-Control-Request-Headers'));
        // ->header('Access-Control-Allow-Headers', 'Content-Type, text/html');
        $response->header('Access-Control-Allow-Origin', 'http://ppg-samarinda.web.id');
        return $response;
    }
}
