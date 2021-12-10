@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Nearest User (5KM)') }}</div>

                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>Name</th>
                            <th>Profile Pic</th>
                            <th>Distance</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                            @foreach($users as $user)
                          <tr>
                            <td>{{$user->name}}</td>
                            <td><img src="{{asset('/'.$user->profile_pic)}}" alt="pp" width="80" height="80"></td>
                            <td>{{number_format($user->distance,2)}} Km</td>
                            <td>
                                @if($user->gender == 'male')
                                Male
                                @elseif($user->gender == 'female')
                                Female
                                @else
                                other
                                @endif
                            </td>
                            <td>{{\Carbon\Carbon::parse($user->dob)->age}}  years</td>
                            <td>
                                 @if(isset($likesArr[$user->user_id]) && $likesArr[$user->user_id] == 1)
                                 <span id="{{$user->user_id.'-1'}}">
                                 </span>
                                 <span id="{{$user->user_id.'-2'}}">
                                    <a class="btn btn-sm btn-danger like-dislike" data-status="2" data-id="{{$user->user_id}}">
                                        <i class="fa fa-thumbs-down"></i>
                                    </a>
                                 </span>
                                 @elseif(isset($likesArr[$user->user_id]) && $likesArr[$user->user_id] == 2)
                                 <span id="{{$user->user_id.'-1'}}">
                                    <a class="btn btn-sm btn-success like-dislike" data-status="1" data-id="{{$user->user_id}}">
                                        <i class="fa fa-thumbs-up"></i>
                                    </a>
                                </span>
                                <span id="{{$user->user_id.'-2'}}">
                                 </span>
                                 @else
                                 <span id="{{$user->user_id.'-1'}}">
                                    <a class="btn btn-sm btn-success like-dislike" data-status="1" data-id="{{$user->user_id}}" >
                                        <i class="fa fa-thumbs-up"></i>
                                    </a>
                                </span>
                                <span id="{{$user->user_id.'-2'}}">
                                    <a class="btn btn-sm btn-danger like-dislike" data-status="2" data-id="{{$user->user_id}}" >
                                        <i class="fa fa-thumbs-down"></i>
                                    </a>
                                </span>
                                 @endif
                            </td>
                          </tr>
                          @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('custom_js')
    <!-- Page specific script -->
    <script type="text/javascript">
        $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
        //Load Serial no based on date Order no
         $(document).on('click','.like-dislike',function () {
            var userId = $(this).data('id');
            var status = $(this).data('status');
            console.log(userId);
            console.log(status);
            //var orderID = $(this).val();
            var url = '{{ url('/') }}';
            if(userId)
            {
                $.ajax({
                    url: url + '/user-like-dislike/?user_id='+userId+'&status='+status,
                    method: 'GET',
                    success: function (data) {
                        var serialsData = data;
                        console.log(data);
                        console.log(data['msg']);
                        if(data['msg'] == 'success' && data['status'] == 1){
                            console.log(data['user_id']+"_2");
                            $("#"+data['user_id']+"-2").html('');
                            $("#"+data['user_id']+"-1").html('');
                            $("#"+data['user_id']+"-2").html('<a class="btn btn-sm btn-danger like-dislike" data-status="2" data-id="'+data['user_id']+'" ><i class="fa fa-thumbs-down"></i></a>');
                        }
                        else if(data['msg'] == 'success' && data['status'] == 2){
                             console.log(data['user_id']+"_1");
                            $("#"+data['user_id']+"-1").html('');
                            $("#"+data['user_id']+"-2").html('');
                            $("#"+data['user_id']+"-1").html('<a class="btn btn-sm btn-success like-dislike" data-status="1" data-id="'+data['user_id']+'" ><i class="fa fa-thumbs-up"></i></a>');
                        }
                        
                        if(data['match']){
                        swal("Congratulations!", "This is a match!", "success");
                        }
                    }
                });
            }
        });
    </script>
@endpush

