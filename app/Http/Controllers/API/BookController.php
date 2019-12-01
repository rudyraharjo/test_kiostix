<?php

namespace App\Http\Controllers\API;

use App\Book;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class BookController extends ResponseBaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $Data = Book::get();
        //$dataMenu = [];
        $Data = DB::table('books')
            ->leftJoin('book_categories', 'books.id_categorybook', '=', 'book_categories.id')
            ->leftJoin('author', 'books.author', '=', 'author.id')
            ->select('books.*', 'book_categories.name as category_book', 'author.name as author_name')
            ->whereNull('books.deleted_at')
            ->latest()
            ->get();
            //->paginate(10);
            //return response()->json(['data' => $Data]);
            
        if(!$Data){
            return $this->sendError('FAILED GET DATA BOOK',  $Data, 204);    
        }
        return $this->sendSuccess($Data, 'SUCCESS GET DATA BOOK', 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
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

        //'id_category', 'name', 'price', 'pic', 'disc', 'markup_gofood', 'markup_grabfood', 'description'

        $this->validate(
            $request,
            [
                'id_author' => 'required|numeric',
                'id_categorybook' => 'required|numeric',
                'name' => 'required|string',
            ],
            [
                'id_author.required' => 'Isian Penulis wajib diisi',
                'id_categorybook.required' => 'Isian Kategori wajib diisi',
                'name.required' => 'Isian Name wajib diisi',
            ]
        );

        $file_name = "";
        $fileUpload = 'uploads/book';

        try {  
            
            $add = new Book();
            $add->name = $request->name;
            $add->id_categorybook = !empty($request->id_categorybook) ? (int)$request->id_categorybook : 0;
            $add->author = !empty($request->id_author) ? (int)$request->id_author : 0;
            $add->description = $request->description;

            if ($request->hasFile('pic')) {  
                $image = $request->file('pic');        
                $file_name = str_replace(" ","", strtolower(trim($request->name))) ."-". time() . '-' . mt_rand() .".". $image->getClientOriginalExtension();
                $image->move($fileUpload,$file_name);
                $add->pic = env('APP_URL').'/public/uploads/book/'.$file_name;
            }           
            
            $saveAdd = $add->save();
            
            if(!$saveAdd){
                return $this->sendError('SUCCESS CREATED BOOK',  $add, 204);    
            }

            $Response = $this->show($add->id);
            
            return $this->sendSuccess($Response, 'SUCCESS CREATED BOOK', 201);

        } catch(\Exception $e) {
            
            return $this->sendError('SERVER ERROR.',  $e->getMessage(), 500);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($ID = NULL)
    {

        $param = !empty($ID) ? (int)$ID : 0;

        $Data = DB::table('books')
            ->leftJoin('book_categories', 'books.id_categorybook', '=', 'book_categories.id')
            ->leftJoin('author', 'books.author', '=', 'author.id')
            ->select('books.*', 'book_categories.name as category_book', 'author.name as author_name')
            ->whereNull('books.deleted_at')
            ->where('books.id', '=', $param)
            ->get();

        $data = [
            "id"=> $Data[0]->id,
            "id_categorybook"=> $Data[0]->id_categorybook,
            "author"=> $Data[0]->author,
            "name"=> $Data[0]->name,
            "pic"=> $Data[0]->pic,
            "description" => $Data[0]->description,
            "created_at"=> $Data[0]->created_at,
            "updated_at"=> $Data[0]->updated_at,
            "deleted_at" => $Data[0]->deleted_at,
            "category_book" => $Data[0]->category_book,
            "author_name"=> $Data[0]->author_name
        ];
        return $data;
        // if(!$Data){
        //     return $this->sendError('SUCCESS SHOW MENU',  $Data, 204);    
        // }
        // return $this->sendSuccess($Data, 'SUCCESS SHOW MENU', 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {

        $this->validate(
            $request,
            [
                'id_author' => 'required|numeric',
                'id_categorybook' => 'required|numeric',
                'name' => 'required|string',
            ],
            [
                'id_author.required' => 'Isian Author wajib diisi',
                'id_categorybook.required' => 'Isian Kategory wajib diisi',
                'name.required' => 'Isian Nama wajib diisi',
            ]
        );

        $file_name = "";
        $fileUpload = 'uploads/book';        

        try {  

            $update = Book::find($request->id);    
            
            if(is_null($update)){
                return $this->sendSuccess(NULL, 'NO DATA MENU', 204);
            }

            $update->name = $request->name;
            $update->id_categorybook = !empty($request->id_categorybook) ? (int)$request->id_categorybook : 0;
            $update->author = !empty($request->id_author) ? (int)$request->id_author : 0;
            $update->description = $request->description;

            if ($request->hasFile('pic')) {  
                $image = $request->file('pic');        
                $file_name = str_replace(" ","", strtolower(trim($request->name))) ."-". time() . '-' . mt_rand() .".". $image->getClientOriginalExtension();
                $image->move($fileUpload,$file_name);
                $update->pic = env('APP_URL').'/public/uploads/book/'.$file_name;
            }           

            $saveUpdate = $update->save();

            if(!$saveUpdate){
                return $this->sendError('FAILED UPDATE BOOK',  $update, 204);    
            } 
            
            $Response = $this->show($update->id);
            
            return $this->sendSuccess($Response, 'SUCCESS UPDATE BOOK', 200);
            
            
        } catch(\Exception $e) {
            return $this->sendError('SERVER ERROR.',  $e->getMessage(), 500);
        }
        
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        try {  

            $delete = Book::find($request->id);
            if(is_null($delete)){
                return $this->sendSuccess(NULL, 'NO DATA BOOK', 204);
            }
            $delete->delete();

            if(!$delete){
                return $this->sendError('FAILED DELETE BOOK',  $delete, 204);    
            } else {
                return $this->sendSuccess($delete, 'SUCCESS DELETED BOOK', 200);
            }
            
        } catch(\Exception $e) {
            return $this->sendError('SERVER ERROR.',  $e->getMessage(), 500);
        }
        

    }

    public function searchByAuthor(Request $request) {
        try {  

            $paramAuthor = !empty($request->id) ? (int)$request->id : 0;

            $Data = DB::table('books')
                ->leftJoin('book_categories', 'books.id_categorybook', '=', 'book_categories.id')
                ->leftJoin('author', 'books.author', '=', 'author.id')
                ->select('books.*', 'book_categories.name as category_book', 'author.name as author_name')
                ->whereNull('books.deleted_at')
                ->where('books.author', '=', $paramAuthor)
                ->get();

            if(!$Data){
                return $this->sendError('FAILED GET DATA',  $Data, 204);    
            } else {
                return $this->sendSuccess($Data, 'SUCCESS GET DATA', 200);
            }
            
        } catch(\Exception $e) {
            return $this->sendError('SERVER ERROR.',  $e->getMessage(), 500);
        }
    }

    public function getbyauthorbook(Request $request){

        try {  

            $paramAuthorName = !empty($request->nama_penulis) ? $request->nama_penulis : '';

            $Data = DB::table('books')
                ->leftJoin('book_categories', 'books.id_categorybook', '=', 'book_categories.id')
                ->leftJoin('author', 'books.author', '=', 'author.id')
                ->select('books.*', 'book_categories.name as category_book', 'author.name as author_name')
                ->whereNull('books.deleted_at')
                ->where('author.name', '=', $paramAuthorName)
                ->get();

            if(!$Data){
                return $this->sendError('FAILED GET DATA',  $Data, 204);    
            } else {
                return $this->sendSuccess($Data, 'SUCCESS GET DATA', 200);
            }
            
        } catch(\Exception $e) {
            return $this->sendError('SERVER ERROR.',  $e->getMessage(), 500);
        }

    }

    public function getbycategoryname(Request $request){

        try {  

            $paramCategoryName = !empty($request->nama_kategori) ? $request->nama_kategori : '';

            $Data = DB::table('books')
                ->leftJoin('book_categories', 'books.id_categorybook', '=', 'book_categories.id')
                ->leftJoin('author', 'books.author', '=', 'author.id')
                ->select('books.*', 'book_categories.name as category_book', 'author.name as author_name')
                ->whereNull('books.deleted_at')
                ->where('book_categories.name', '=', $paramCategoryName)
                ->get();

            if(!$Data){
                return $this->sendError('FAILED GET DATA',  $Data, 204);    
            } else {
                return $this->sendSuccess($Data, 'SUCCESS GET DATA', 200);
            }
            
        } catch(\Exception $e) {
            return $this->sendError('SERVER ERROR.',  $e->getMessage(), 500);
        }

    }

    public function getByTitleBook(Request $request) {
        
        try {  

            $paramTitleBook = !empty($request->judul_buku) ? $request->judul_buku : '';

            $Data = DB::table('books')
                ->leftJoin('book_categories', 'books.id_categorybook', '=', 'book_categories.id')
                ->leftJoin('author', 'books.author', '=', 'author.id')
                ->select('books.*', 'book_categories.name as category_book', 'author.name as author_name')
                ->whereNull('books.deleted_at')
                ->where('books.name', '=', $paramTitleBook)
                ->get();

            if(!$Data){
                return $this->sendError('FAILED GET DATA',  $Data, 204);    
            } else {
                return $this->sendSuccess($Data, 'SUCCESS GET DATA', 200);
            }
            
        } catch(\Exception $e) {
            return $this->sendError('SERVER ERROR.',  $e->getMessage(), 500);
        }
    }
    
}
