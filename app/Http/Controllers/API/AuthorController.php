<?php

namespace App\Http\Controllers\API;

use App\Author;
use Illuminate\Http\Request;

class AuthorController extends ResponseBaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $Data = Author::all();
        //$SupportOnline = Author::onlyTrashed()->get();
        return $this->sendSuccess($Data, 'SUCCESS GET DATA AUTHOR', 200);
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
        $this->validate(
            $request,
            [
                'name' => 'required|string',
            ],
            [
                'name.required' => 'Isian Nama wajib diisi',
            ]
        );

        try {

            $add = new Author();
            $add->name = $request->name;
            $add->bio = $request->bio;
            $addSave = $add->save();
            
            if(!$addSave){
                return $this->sendError('SUCCESS CREATED AUTHOR',  $add, 204);    
            }
            
            return $this->sendSuccess($add, 'SUCCESS CREATED AUTHOR', 201);

        } catch (\Exception $e) {
            return $this->sendError('SOMETHING WRONG.',  $e->getMessage(), 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\FoodSupportOnline  $foodSupportOnline
     * @return \Illuminate\Http\Response
     */
    public function show(FoodSupportOnline $foodSupportOnline)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\FoodSupportOnline  $foodSupportOnline
     * @return \Illuminate\Http\Response
     */
    public function edit(FoodSupportOnline $foodSupportOnline)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\FoodSupportOnline  $foodSupportOnline
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $this->validate(
            $request,
            [
                'id' => 'required',
                'name' => 'required|string',
            ],
            [
                'id.required' => 'ID NULL',
                'name.required' => 'Isian Nama wajib diisi',
            ]
        );

        try {

            $update = Author::find($request->id);

            if(is_null($update)){
                return $this->sendSuccess(NULL, 'NO DATA', 204);
            }

            $update->name = $request->name;
            $update->bio = $request->bio;
            $updateSave = $update->save();

            if(!$updateSave){
                return $this->sendError('FAILED UPDATE AUTHOR',  $update, 204);    
            } else {
                return $this->sendSuccess($update, 'SUCCESS UPDATE AUTHOR', 200);
            }          

        } catch (\Exception $e) {
            return $this->sendError('SOMETHING WRONG.',  $e->getMessage(), 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\FoodSupportOnline  $foodSupportOnline
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $this->validate(
            $request,
            [
                'id' => 'required',
            ],
            [
                'id.required' => 'ID NULL',
            ]
        );

        try {

            $delete = Author::find($request->id);
            if(is_null($delete)){
                return $this->sendSuccess(NULL, 'NO DATA', 204);
            }
            $deleteSave = $delete->delete();

            if(!$deleteSave){
                return $this->sendError('FAILED DELETE',  $delete, 204);    
            }
                
            return $this->sendSuccess($delete, 'SUCCESS DELETED', 200);
            

        } catch (\Exception $e) {
            return $this->sendError('SOMETHING WRONG.',  $e->getMessage(), 500);
        }
    }
}
