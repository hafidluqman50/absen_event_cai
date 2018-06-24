<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class KegiatanModel extends Model
{
    protected $table = 'kegiatan';
    protected $primaryKey = 'id_kegiatan';
    protected $guarded = [];
}
