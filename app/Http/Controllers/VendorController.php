<?php

namespace App\Http\Controllers;

use App\Vendor;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Resources\VendorResource;

use App\Http\Requests;

class VendorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      $data = Vendor::all();
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


    public function getvendors()
    {
        return Vendors::latest()->paginate(10);
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
        'company'=> 'required|string|max:255',
        'person'=> 'required|string|max:255',
        'email1'=> 'required|email|max:255',
        'email2'=> 'required|email|max:255',
        'phone1'=> 'required|numeric',
        'phone2'=> 'required|numeric',
        'street1' => 'required|max:255',
        'street2'=> 'required|max:255',
        'city' => 'required',
        'zip' => 'required',
        'state' => 'required',
        'about' => 'required',


      ]);

      $vendor = Vendor::create([
          'name'=> $request->company,
          'person'=> $request->person,
          'email1'=> $request->email1,
          'email2'=> $request->email2,
          'phone1'=> $request->phone1,
          'phone2'=> $request->phone2,
          'street1'=> $request->street1,
          'street2'=> $request->street2,
          'city'  => $request->city,
          'zip'  => $request->zip,
          'state'  => $request->state,
          'about'  => $request->about,

      ]);

        return response()->json($vendor, 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Vendor  $vendor
     * @return \Illuminate\Http\Response
     */
    public function show(Vendor $vendor)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Vendor  $vendor
     * @return \Illuminate\Http\Response
     */
    public function edit(Vendor $vendor)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Vendor  $vendor
     * @return \Illuminate\Http\Response
     */

    public function updatevendor(Request $request)
    {
        $request->validate([
            'company'  => 'required|string|max:255'

        ]);

        $vendor = Vendor::findOrFail($request->id);

        $updated = $vendor->update([
          'name'=> $request->company,
          'person'=> $request->person,
          'email1'=> $request->email1,
          'email2'=> $request->email2,
          'phone1'=> $request->phone1,
          'phone2'=> $request->phone2,
          'street1'=> $request->street1,
          'street2'=> $request->street2,
          'city'  => $request->city,
          'zip'  => $request->zip,
          'state'  => $request->state,
          'about'  => $request->about,

        ]);



        return response()->json($updated, 200);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Vendor  $vendor
     * @return \Illuminate\Http\Response
     */
    public function destroy(Vendor $vendor)
    {
      $vendor->delete();
            return response(null, Response::HTTP_OK);
    }
}
