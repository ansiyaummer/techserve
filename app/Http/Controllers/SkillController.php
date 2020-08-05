<?php

namespace App\Http\Controllers;

use App\Skill;
use Illuminate\Http\Request;

class SkillController extends Controller
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
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      return UserResource::collection(Skill::latest()->paginate(10));
    }


    public function getskills()
    {
        return Skill::latest()->paginate(10);
    }



    public function search(Request $request)
    {
        //
        $company =  Skill::where('name','LIKE',"%$request->q%")->get();
        return response()->json($company, 200); 
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
      $request->validate([
          'name'      => 'required|string|max:255',

      ]);

      $user = Skill::create([
          'name'      => $request->name,

      ]);



      return response()->json($user, 200);
    }



    /**
     * Display the specified resource.
     *
     * @param  \App\Skill  $skill
     * @return \Illuminate\Http\Response
     */
    public function show(Skill $skill)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Skill  $skill
     * @return \Illuminate\Http\Response
     */

         public function updateskill(Request $request)
         {
             $request->validate([
                 'name'  => 'required|string|max:255'

             ]);

             $skill = Skill::findOrFail($request->id);

             $updated = $skill->update([
                 'name'  => $request->name,

             ]);



             return response()->json($updated, 200);
         }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Skill  $skill
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Skill $skill)
    {
      $request->validate([
          'name'  => 'required|string|max:255',
          'email' => 'required|string|email|max:255|unique:users,email,'.$request->id
      ]);

      $user = User::findOrFail($request->id);

      $updated = $user->update([
          'name'  => $request->name,
          'email' => $request->email
      ]);

      $user->syncRoles($request->selectedroles);

      return response()->json($updated, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Skill  $skill
     * @return \Illuminate\Http\Response
     */
     public function deleteskill($id)
     {

      $skill    = Skill::findOrFail($id);
      $deleted = $skill->delete();



      return response()->json($deleted, 200);
    }
}
