<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class KelompokModel extends Model
{
    protected $table = 'kelompok';
    protected $primaryKey = 'id_kelompok';
    protected $guarded = [];
}
