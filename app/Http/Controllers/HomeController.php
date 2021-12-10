<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Models\User;
use App\Models\LikeDislikesModel;
use App\Models\UserInfosModel;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $userModel = new User();
        $data =  $userModel->getNearestLocationUser();
        $userLikeDislikeDataArr = [];
        $userLikeDislikeData = LikeDislikesModel::where('user_from',Auth::user()->id)->get();
        foreach($userLikeDislikeData as $value)
        {
            $userLikeDislikeDataArr[$value->user_to] = $value->status;
        }

        return view('home',['users'=>$data,'likesArr'=>$userLikeDislikeDataArr]);
    }
    public function userLikeDislike(Request $request)
    {
        $loginUserId = Auth::user()->id;
        $dataCheck = LikeDislikesModel::where([['user_from','=',$loginUserId],['user_to','=',$request->user_id]])->first();
        $arrResponse=[];
        if($dataCheck)
        {
            //update
            LikeDislikesModel::where([['id','=',$dataCheck->id]])->update(['status'=>$request->status,'updated_at'=>date("Y-m-d h:i:s")]);
            $arrResponse['msg'] = 'success';
            $arrResponse['user_id'] = $request->user_id;
            $arrResponse['status'] = $request->status;
        }
        else{
            //insert
            $postData['user_from'] = $loginUserId;
            $postData['user_to'] = $request->user_id;
            $postData['status'] = $request->status;
            $postData['created_at'] = date( "Y-m-d h:i:s");
            LikeDislikesModel::insert($postData);

            $arrResponse['msg'] = 'success';
            $arrResponse['user_id'] = $request->user_id;
            $arrResponse['status'] = $request->status;
        }
        $matchCheck = LikeDislikesModel::where([['user_to','=',$loginUserId],['user_from','=',$request->user_id]])->first();
        if(isset($matchCheck->status) && $matchCheck->status == 1 && $request->status == 1)
        {
            $arrResponse['match'] = 1;
        }
        return $arrResponse;
    }
}
