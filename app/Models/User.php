<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Auth;
use DB;
use Tymon\JWTAuth\Contracts\JWTSubject;
use App\Models\LikeDislikesModel;
use App\Models\UserInfosModel;

class User extends Authenticatable implements JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'dob',
        'gender',
        'profile_pic',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public $table = 'users';

    public function getJWTIdentifier() {
        return $this->getKey();
    }

    public function getJWTCustomClaims() {
        return [];
    }  
    public function userLikeGiven()
    {
        return $this->hasMany(LikeDislikesModel::class,'user_from','id');
    }  
    public function userLikeReceive()
    {
        return $this->hasMany(LikeDislikesModel::class,'user_to','id');
    }
    public function userInfo()
    {
        return $this->hasOne(UserInfosModel::class);
    }

    public function getNearestLocationUser()
    {
        $userId = Auth::user()->id;
        $loginUser = $this
            ->leftjoin('user_infos','user_infos.user_id','=','users.id')
            ->where('users.id',$userId)
            ->select(
                'user_infos.*',
                'users.name as name',
                'users.email as email',
            )
            ->first();

        $latitude = $loginUser->latitude;
        $longitude = $loginUser->longitude;

        $allUsers = $this
            ->leftjoin('user_infos','user_infos.user_id','=','users.id')
            ->where([['users.id','<>',$userId]])
            ->select(
                'user_infos.*',
                'users.name as name',
                'users.email as email',
                DB::raw("6371 * acos(cos(radians(" . $latitude . ")) 
                * cos(radians(user_infos.latitude)) 
                * cos(radians(user_infos.longitude) - radians(" . $longitude . ")) 
                + sin(radians(" .$latitude. ")) 
                * sin(radians(user_infos.latitude))) AS distance"),
            )
            ->get();

            $allUsers = collect($allUsers);
            $allUsers = $allUsers->where('distance','<',5)->all();

            return $allUsers;

    }
}
