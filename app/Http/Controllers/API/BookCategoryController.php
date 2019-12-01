<?php

namespace App\Http\Controllers\API;

use App\BookCategory;
use Illuminate\Http\Request;

class BookCategoryController extends ResponseBaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $menuCategory = BookCategory::all();
        return $this->sendSuccess($menuCategory, "SUCCESS GET BOOK CATEGORIES", 200);
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
                'name.required' => 'Isian Name wajib diisi',
            ]
        );

        try {

            $add = new BookCategory();
            $add->name = $request->name;
            $add->save();
            
            if(!$add){
                return $this->sendError('SUCCESS CREATED CATEGORY',  $add, 204);    
            }
            
            return $this->sendSuccess($add, 'SUCCESS CREATED CATEGORY', 201);

        } catch (\Exception $e) {
            return $this->sendError('SOMETHING WRONG.',  $e->getMessage(), 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\MenuCategory  $menuCategory
     * @return \Illuminate\Http\Response
     */
    public function show(MenuCategory $menuCategory)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\MenuCategory  $menuCategory
     * @return \Illuminate\Http\Response
     */
    public function edit(MenuCategory $menuCategory)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\MenuCategory  $menuCategory
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
                'name.required' => 'Isian Name wajib diisi',
            ]
        );

        try {

            $update = BookCategory::find($request->id);    
            
            if(is_null($update)){
                return $this->sendSuccess(NULL, 'NO DATA CATEGORY', 204);
            }

            $update->name = $request->name;
            $update->save();

            if(!$update){
                return $this->sendError('FAILED UPDATE CATEGORY',  $update, 204);    
            } else {
                return $this->sendSuccess($update, 'SUCCESS UPDATE CATEGORY', 200);
            }            

        } catch (\Exception $e) {
            return $this->sendError('SOMETHING WRONG.',  $e->getMessage(), 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\MenuCategory  $menuCategory
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        try {  

            $delete = BookCategory::find($request->id);
            if(is_null($delete)){
                return $this->sendSuccess(NULL, 'NO DATA CATEGORY', 204);
            }
            $delete->delete();

            if(!$delete){
                return $this->sendError('FAILED DELETE CATEGORY',  $delete, 204);    
            } else {
                return $this->sendSuccess($delete, 'SUCCESS DELETED CATEGORY', 200);
            }
            
        } catch(\Exception $e) {
            return $this->sendError('SOMETHING WRONG.',  $e->getMessage(), 500);
        }
    }
}
