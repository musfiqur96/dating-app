<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\User;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Models\UserInfosModel;
use DB;
use Stevebauman\Location\Facades\Location;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'dob' => ['required'],
            'gender' => ['required'],
            'profile_pic' => ['required'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        DB::beginTransaction();
        try{

            // save data into user table
            $user =  User::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'password' => Hash::make($data['password']),
            ]);
            //fetch location based on the ip address
            $ip = $_SERVER['REMOTE_ADDR'];
            //$ip = '103.83.235.135';
            $ipData = \Location::get($ip);

            // move profile picture with rename
            if (isset($data['profile_pic']) && !empty($data['profile_pic'])) {
                $profilePhoto = time() . Str::random(7) . '.' . $data['profile_pic']->getClientOriginalExtension();
                $data['profile_pic']->move(public_path('images/profile-pic'), $profilePhoto);
            }

            //save user information in user_infos
            $postData['user_id'] = $user->id;
            $postData['dob'] = $data['dob'];
            $postData['gender'] = $data['gender'];
            $postData['profile_pic'] = 'images/profile-pic/'.$profilePhoto;
            $postData['ip_address'] = $ipData->ip;
            $postData['latitude'] = $ipData->latitude;
            $postData['longitude'] = $ipData->longitude;
            $postData['created_at'] = date( "Y-m-d h:i:s");

            $userInfo = UserInfosModel::insert($postData);
            DB::commit();
        }
        catch (\Exception $e) {
            DB::rollback();
        }

        if($user)
        {
            return $user;
        }
        else{
            return redirect('register');
        }

    }
}
