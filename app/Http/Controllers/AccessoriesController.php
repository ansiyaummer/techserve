<?php

namespace App\Http\Controllers;

use App\Accessories;
use Illuminate\Http\Request;

class AccessoriesController extends Controller
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
    public function getAccessories()
    {
        return Accessories::latest()->paginate(10);
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
           'price'     => 'required|integer',

       ]);

       $user = Accessories::create([
           'name'      => $request->name,
            'price'    => $request->price,

       ]);
      return response()->json($user, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Accessories  $accessories
     * @return \Illuminate\Http\Response
     */
    public function show(Accessories $accessories)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Accessories  $accessories
     * @return \Illuminate\Http\Response
     */
    public function edit(Accessories $accessories)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Accessories  $accessories
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Accessories $accessories)
    {
      $request->validate([
          'name'  => 'required|string|max:255',
  'price'  => 'required|integer',
      ]);

      $Accessories = Accessories::findOrFail($request->id);

      $updated = $Accessories->update([
          'name'  => $request->name,

      ]);



      return response()->json($updated, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Accessories  $accessories
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
      $category   = Accessories::findOrFail($id);
      $deleted = $category->delete();



      return response()->json($deleted, 200);
    }
}
