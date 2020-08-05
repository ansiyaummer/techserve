<?php

namespace App\Http\Controllers;

use App\Equipment;
use Illuminate\Http\Request;

class EquipmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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

    public function getEquipment()
    {
        return Equipment::latest()->paginate(10);
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

       $user = Equipment::create([
           'name'      => $request->name,

       ]);
      return response()->json($user, 200);
 }

    /**
     * Display the specified resource.
     *
     * @param  \App\Equipment  $equipment
     * @return \Illuminate\Http\Response
     */
    public function show(Equipment $equipment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Equipment  $equipment
     * @return \Illuminate\Http\Response
     */
    public function edit(Equipment $equipment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Equipment  $equipment
     * @return \Illuminate\Http\Response
     */
     public function update(Request $request)
     {
         $request->validate([
             'name'  => 'required|string|max:255'

         ]);

         $equipment = Equipment::findOrFail($request->id);

         $updated = $equipment->update([
             'name'  => $request->name,

         ]);



         return response()->json($updated, 200);
     }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Equipment  $equipment
     * @return \Illuminate\Http\Response
     */
     public function deleteEquipment($id)
     {

      $Equipment   = Equipment::findOrFail($id);
      $deleted = $Equipment->delete();



      return response()->json($deleted, 200);
    }
}
