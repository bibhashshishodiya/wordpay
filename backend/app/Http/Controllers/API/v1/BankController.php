<?php

namespace App\Http\Controllers\API\v1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Models\BankModel;

class BankController extends Controller
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
        $bankId     = BankModel::insertBankId($postedData);

        $this->responseStatusCode = $this->statusCodes->success;
        $response = api_create_response($postedData, $this->successText, 'Bank Added Successfully.');
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
        //
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
    public function update(Request $request, $id)
    {
        $postedData = $request->all();
        $postedData['updated_at'] = date('Y-m-d H:i:s');
        BankModel::where('id', $id)->update($postedData);

        $this->responseStatusCode = $this->statusCodes->success;
        $response = api_create_response(2, $this->successText, 'Bank Updated Successfully.');

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
        BankModel::where('id', $id)->delete();

        $this->responseStatusCode = $this->statusCodes->success;
        $response = api_create_response(2, $this->successText, 'Bank Delete Successfully.');

        return response()->json($response, $this->responseStatusCode);
    }
}
