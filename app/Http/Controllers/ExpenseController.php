<?php

namespace App\Http\Controllers;

use App\Expense;
use App\expense_type;
use Illuminate\Http\Request;
use App\Http\Resources\ExpenseResource;
use App\Http\Requests;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class ExpenseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    $data =  DB::table('expenses')

->select('expenses.id','expenses.name','expense_types.name as expense_type','expenses.photo','users.name as user','expenses.price as price')

->join('expense_types','expense_types.id','=','expenses.expense_type')
->join('users','users.id','=','expenses.user_id')

->where(['expenses.status' => '1'])

->get();
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
      $request->validate([
        'name'=> 'required|string|max:255',

        'email'=> 'required|email|max:255',


      ]);

      $expense = Expense::create([
          'name'=> $request->name,

          'email'=> $request->email,


      ]);

        return response()->json($expense, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Expense  $expense
     * @return \Illuminate\Http\Response
     */

     public function expense()
     {
         return Expense::latest()->get();
     }
     public function getExpense()
     {
         return expense_type::latest()->get();
     }
     public function getexpenses()
     {
         return Expenses::latest()->paginate(10);
     }
    public function show(Expense $expense)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Expense  $expense
     * @return \Illuminate\Http\Response
     */
    public function edit(Expense $expense)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Expense  $expense
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Expense $expense)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Expense  $expense
     * @return \Illuminate\Http\Response
     */
    public function destroy(Expense $expense)
    {
      $expense->delete();
            return response(null, Response::HTTP_OK);
    }
}
