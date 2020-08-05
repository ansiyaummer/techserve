<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
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

        public function getCategory()
        {
            return Category::latest()->paginate(10);

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

      $user = Category::create([
          'name'      => $request->name,

      ]);
      return response()->json($user, 200);
}

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
    }

    public function getCategoryList()
    {
    	return Category::latest()->get();
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
     public function updateCatagory(Request $request)
     {
         $request->validate([
             'name'  => 'required|string|max:255'

         ]);

         $skill = Category::findOrFail($request->id);

         $updated = $skill->update([
             'name'  => $request->name,

         ]);



         return response()->json($updated, 200);
     }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
     public function deleteCategory($id)
     {

      $category   = Category::findOrFail($id);
      $deleted = $category->delete();



      return response()->json($deleted, 200);
    }
}
