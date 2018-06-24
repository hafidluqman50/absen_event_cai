<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class AbsenModel extends Model
{
    protected $table = 'absen';
    protected $primaryKey = 'id_absen';
    protected $guarded = [];
}
