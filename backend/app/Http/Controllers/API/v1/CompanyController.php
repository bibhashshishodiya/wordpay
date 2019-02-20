<?php

namespace App\Http\Controllers\API\v1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

use App\Models\CompanyModel;

class CompanyController extends Controller
{
    
    private $statusCodes, $responseStatusCode, $successText, $failureText;
    public function __construct() {
        $this->statusCodes = config('api.status_codes');
        $this->tokenName = config('api.TOKEN_NAME');
        $this->successText = config('api.SUCCESS_TEXT');
        $this->failureText = config('api.FAILURE_TEXT');
    }


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
        $postedData = $request->all();
        $postedData['created_at'] = date('Y-m-d H:i:s');
        $companyId = CompanyModel::insertGetId($postedData);
        //dd($companyId);die;

        $userData = Auth::user();
        $userData->company_id = $companyId;
        $userData->save();

        $this->responseStatusCode = $this->statusCodes->success;
        $response = api_create_response($postedData, $this->successText, 'Company Added Successfully.');

        return response()->json($response, $this->responseStatusCode);
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = CompanyModel::find($id);

        if($data) {
            $this->responseStatusCode = $this->statusCodes->success;
            $response = api_create_response($data, $this->successText, 'Company Details.');
        }
        else {
            $this->responseStatusCode = $this->statusCodes->bad_request;
            $response = api_create_response(2, $this->failureText, 'No Company Found.');
        }
        
        return response()->json($response, $this->responseStatusCode);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $postedData = $request->all();
        $postedData['updated_at'] = date('Y-m-d H:i:s');

        CompanyModel::where('id', $id)->update($postedData);

        $this->responseStatusCode = $this->statusCodes->success;
        $response = api_create_response(2, $this->successText, 'Company Updated Successfully.');

        return response()->json($response, $this->responseStatusCode);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
