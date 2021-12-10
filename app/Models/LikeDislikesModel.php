<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LikeDislikesModel extends Model
{
    use HasFactory;
    /**
     * @var string
     */
    public $table = 'like_dislike';

    /**
     * @var bool
     */
    public $timestamps = false;
}
