<?php

namespace App\Http\Controllers;

use App\Sub_category;
use Illuminate\Http\Request;

class SubCategoryController extends Controller
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

       $sub_category = Sub_category::create([
           'name'      => $request->name,
           'category_id' => $request->fields.role,

       ]);
       return response()->json($sub_category, 200);
 }

    /**
     * Display the specified resource.
     *
     * @param  \App\Sub_category  $sub_category
     * @return \Illuminate\Http\Response
     */
    public function show(Sub_category $sub_category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Sub_category  $sub_category
     * @return \Illuminate\Http\Response
     */
    public function edit(Sub_category $sub_category)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Sub_category  $sub_category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Sub_category $sub_category)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Sub_category  $sub_category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Sub_category $sub_category)
    {
        //
    }
}
