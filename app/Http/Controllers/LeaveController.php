<?php

namespace App\Http\Controllers;

use App\Leave;
use App\Http\Resources\LeaveResource;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class LeaveController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $data =  DB::table('leaves')
               ->select('leaves.id as id','leaves.leave_date as leave_date','leave_types.name as leave_type',
               'leave_stages.name  as leave_stage','users.name as username',
               'leaves.description as des')
               ->join('users','users.id','=','leaves.user_id')
               ->join('leave_types','leave_types.id','=','leaves.leave_type')
               ->join('leave_stages','leave_stages.id','=','leaves.leave_stage')
               ->where(['leaves.status' => '1'])->get();

               return response()->json($data);
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
     * @param  \App\Leave  $leave
     * @return \Illuminate\Http\Response
     */
    public function show(Leave $leave)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Leave  $leave
     * @return \Illuminate\Http\Response
     */
    public function edit(Leave $leave)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Leave  $leave
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Leave $leave)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Leave  $leave
     * @return \Illuminate\Http\Response
     */
    public function destroy(Leave $leave)
    {
      $leave->delete();
            return response(null, Response::HTTP_OK);
    }
}
