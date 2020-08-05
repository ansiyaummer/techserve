<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Student;
use App\Http\Controllers\ApiAuthController;

class StudentController extends Controller
{
    public function __construct()
    {
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      //  $userId = (new ApiAuthController)->getAuthenticatedUser()->id;

        $data = Student::all();
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
        if ($request->ajax()) {
            $this->validate($request, [
                'full_name' => 'required',
                'father_name' => 'required',
                'email' => 'required|email',
                'address' => 'required',
                'dob' => 'required'
            ]);

            Student::create($request->all());

            return response()->json([
                'status'  =>  'success',
                'message' => 'Student successfully created.',
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id)
    {
        //
        if ($request->ajax()) {
            $data = Student::where('id', $id)->first();
            return response()->json($data);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if ($request->ajax()) {
            $this->validate($request, [
                'full_name' => 'required',
                'father_name' => 'required',
                'email' => 'required|email',
                'address' => 'required',
                'dob' => 'required'
            ]);

            Student::where('id', $id)->update($request->all());

            return response()->json([
                'status'  =>  'success',
                'message' => 'Student successfully updated.',
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
        $delete = $student->delete();

        if ($delete) {
            return response()->json([
                'status'  =>  'success',
                'message' => 'Student successfully deleted.',
            ]);
        }
    }
}
