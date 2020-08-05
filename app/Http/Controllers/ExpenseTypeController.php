<?php

namespace App\Http\Controllers;

use App\Expense_type;
use Illuminate\Http\Request;

class ExpenseTypeController extends Controller
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

    public function getExpenseType()
    {
        return Expense_type::latest()->paginate(10);
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

       $user = Expense_type::create([
           'name'      => $request->name,

       ]);
      return response()->json($user, 200);
 }

    /**
     * Display the specified resource.
     *
     * @param  \App\Expense_type  $expense_type
     * @return \Illuminate\Http\Response
     */
    public function show(Expense_type $expense_type)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Expense_type  $expense_type
     * @return \Illuminate\Http\Response
     */
    public function edit(Expense_type $expense_type)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Expense_type  $expense_type
     * @return \Illuminate\Http\Response
     */
     public function updateExpenseType(Request $request)
     {
         $request->validate([
             'name'  => 'required|string|max:255'

         ]);

         $skill = Expense_type::findOrFail($request->id);

         $updated = $skill->update([
             'name'  => $request->name,

         ]);



         return response()->json($updated, 200);
     }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Expense_type  $expense_type
     * @return \Illuminate\Http\Response
     */
     public function deleteExpenseType($id)
     {

      $category   = Expense_type::findOrFail($id);
      $deleted = $category->delete();



      return response()->json($deleted, 200);
    }
}
