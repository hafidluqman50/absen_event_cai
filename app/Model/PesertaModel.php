<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class PesertaModel extends Model
{
    protected $table = 'peserta';
    protected $primaryKey = 'id_peserta';
    protected $guarded = [];
}
