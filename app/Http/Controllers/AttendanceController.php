<?php

namespace App\Http\Controllers;

use App\Attendance;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Resources\AttendanceResource;

use App\Http\Requests;


class AttendanceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $data =  DB::table('attendances')
//->selectRaw('time(sum(TIMEDIFF( attendance_outs.out_time,attendances.in_time  ))) as workhour')

  ->select('attendances.punch_in as in_time','attendances.punch_out as out_time',
 'attendances.photo as photo','users.name as username','attendances.date as date')

  ->join('users','users.id','=','attendances.user_id')



  ->where(['attendances.status' => '1'])

  ->get();
      return response()->json($data);
    }


     public function checkin(Request $request)
     {

       $date =date('Y-m-d H:i:s');
       $time =date('H:i:s');

       $checkin = new Attendance();
       $checkin->punch_in = $time;
        $checkin->punch_out = 0;
       $checkin->punch= 'in';
       $checkin->date = $date;
       $checkin->day = date('d');
       $checkin->month = date('m');
       $checkin->year = date('Y');
       $checkin->user_id = auth()->user()->id;
       $checkin->status=$request->session_id;
       $checkin->save();

       return response()->json($checkin, 200);
     }



/*
     public function checkout()
     {

       session_start();

       if (Auth::guest()){
           return redirect()->route('login');
       }


       if(!isset($_SESSION["whenIn"]))
       {

           $_SESSION["whenIn"] = 0;
       }

    //  $_SESSION["signIn"]=0;

    $abc = 0;
    $id = Auth::id();
       $employess = Attendance::all();

         foreach ($employess as $employeee){


           if (($employeee->user_id == $id && $employeee->day == date('d') && $employeee->month == date('m') && $employeee->year == date('Y'))) {

               if(($employeee->punch_out == 0 || $employeee->punch == 'in') && $_SESSION["signIn"] == 1 ){




               $pinn = $employeee->punch_in;

               //$employeee->punch_out = $pout = 5+date('h').date(':i');

               $tttt = 5+date('h').date(':i');
               $tttt = strtotime($tttt);
               $employeee->punch_out = $pout = gmdate("H:i:s", $tttt);



               $pdur = strtotime($pout) - strtotime($pinn);
               $employeee->duration = gmdate("H:i:s", $pdur);//$_SESSION["total"];
               $employeee->punch = 'out';


               $employeee->save();
                $_SESSION["signIn"]=0;
                  return response()->json($employeee, 200);

          }

        }


         }




    }
    */
    public function checkout()
    {


             session_start();

             if (Auth::guest()){
                 return redirect()->route('login');
             }


             if(!isset($_SESSION["whenIn"]))
             {

                 $_SESSION["whenIn"] = 0;
             }

          //  $_SESSION["signIn"]=0;

          $abc = 0;
          $id = Auth::id();
             $employess = Attendance::all();

               foreach ($employess as $employeee){


                 if (($employeee->user_id == $id && $employeee->day == date('d') && $employeee->month == date('m') && $employeee->year == date('Y'))) {

                     if(($employeee->punch_out == 0 || $employeee->punch == 'in') && $_SESSION["signIn"] == 1 ){



       $date =date('Y-m-d H:i:s');
       $time =date('H:i:s');
       $user_id=auth()->user()->id;
       //$checkin = getcheckin($date);
    //   print_r($checkin);
       $checkout= new Attendance();
       $checkout->punch_out = $time;
       $checkout->date = $date;
       $checkin->day = date('d');
       $checkin->month = date('m');
       $checkin->year = date('Y');
      // $checkout->workout = $checkin;
       $checkout->user_id = auth()->user()->id;
       $checkout->status=1;
       $checkout->save();

       return response()->json($checkout, 200);



     }
   }

 }


  }






    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Attendance  $attendance
     * @return \Illuminate\Http\Response
     */
    public function show(Attendance $attendance)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Attendance  $attendance
     * @return \Illuminate\Http\Response
     */
    public function edit(Attendance $attendance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Attendance  $attendance
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Attendance $attendance)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Attendance  $attendance
     * @return \Illuminate\Http\Response
     */
    public function destroy(Attendance $attendance)
    {
      $attendance->delete();
            return response(null, Response::HTTP_OK);
    }
}
