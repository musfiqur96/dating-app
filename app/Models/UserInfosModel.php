<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserInfosModel extends Model
{
    use HasFactory;
    /**
     * @var string
     */
    public $table = 'user_infos';

    /**
     * @var bool
     */
    public $timestamps = false;

}
