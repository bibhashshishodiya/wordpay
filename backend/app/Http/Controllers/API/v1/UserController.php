<?php

namespace App\Http\Controllers\API\v1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Validator;
use DB;
use Hash;

class UserController extends Controller {
    
    private $statusCodes, $responseStatusCode, $successText, $failureText;
    public function __construct() {
        $this->statusCodes = config('api.status_codes');
        $this->tokenName = config('api.TOKEN_NAME');
        $this->successText = config('api.SUCCESS_TEXT');
        $this->failureText = config('api.FAILURE_TEXT');
    }
    

    /**
     * Register api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
                    'first_name' => 'required',
                    'email' => 'required|email|unique:users,email',
                    //'email' => 'required|email',
                    'password' => 'required',
                    'confirm_password' => 'required|same:password',
        ]);
        
        if ($validator->fails()) {
            $response = api_create_response($validator->errors(), $this->failureText, 'Please enter valid input.');
            return response()->json($response, $this->statusCodes->bad_request);
        }
        
        
        $input = $request->all();

        $input['password'] = bcrypt($input['password']);
        $input['account_id'] = substr_replace($this->generateAccountId(9), '-', 3, 0);;
        unset($input['confirm_password']);
        $user = User::create($input);
        
        if (!empty($user)) {

            //dd($user);die;
            
            $res['first_name'] = $user->first_name;
            $res['last_name'] = $user->last_name;
            $res['email'] = $user->email;
            $res['user_id'] = $user->id;
            $res['account_id'] = $user->account_id;
            $res['token'] = $user->createToken($this->tokenName)->accessToken;

            $this->responseStatusCode = $this->statusCodes->success;
            $response = api_create_response($res, $this->successText, 'Registration successfully.');
            
        } else {
            
            $this->responseStatusCode = $this->statusCodes->bad_request;
            $response = api_create_response(2, $this->failureText, 'Something went wrong.');
        }
        //pr($response);die;
        
        return response()->json($response, $this->responseStatusCode);
    }
    
    /**
     * login api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function login(Request $request) {
        
        $validator = Validator::make($request->all(), [
                    'email' => 'required|email',
                    'password' => 'required',
        ]);
        
        if ($validator->fails()) {
            $response = api_create_response($validator->errors(), $this->failureText, 'Please enter valid input.');
            return response()->json($response, $this->statusCodes->bad_request);
        }
        
        
        if (Auth::attempt(['email' => request('email'), 'password' => request('password')])) {
            
            $user = Auth::user();
            $user['user_id'] = $user->id;

            $user['token'] = $user->createToken($this->tokenName)->accessToken;
            $this->responseStatusCode = $this->statusCodes->success;
            
            unset($user->id);
            $response = api_create_response($user, $this->successText, 'Logged in successfully.');
            
        } else {
            
            $this->responseStatusCode = $this->statusCodes->unauthorised;
            $response = api_create_response(2, $this->failureText, 'Please enter valid credentials.');
        }
        //pr($response);die;
        
        return response()->json($response, $this->responseStatusCode);
    }

    /**
     * details api 
     * 
     * @return \Illuminate\Http\Response 
     */
    public function details() {
        
        $user = Auth::user();
        
        if (!empty($user)) {

            $this->responseStatusCode = $this->statusCodes->success;
            $response = api_create_response($user, $this->successText, 'User details.');
            
        } else {
            
            $this->responseStatusCode = $this->statusCodes->bad_request;
            $response = api_create_response(2, $this->failureText, 'Invalid User.');
        }
        //pr($response);die;
        
        return response()->json($response, $this->responseStatusCode);
    }
    

    public function updateUser(Request $input) {
        //dd($input->all());die;
        
        $user = Auth::user();
        
        if (!empty($user)) {

            if(!empty($input->old_password) && !empty($input->new_password) && !empty($input->confirm_password)) {

                if($input->new_password != $input->confirm_password) {
                    $this->responseStatusCode = $this->statusCodes->bad_request;
                    $response = api_create_response(2, $this->failureText, 'New and Confirm password not matched.');
                }
                else if (Hash::check($input->old_password, $user->password)) {
                    $user->password = bcrypt($input->new_password);
                }
                else {
                    $this->responseStatusCode = $this->statusCodes->bad_request;
                    $response = api_create_response(2, $this->failureText, 'Old password not matched.');
                }
            }

            
            if(empty($response)) {

                $user->first_name = $input->first_name;
                $user->last_name = $input->last_name;
                $user->address = $input->address;
                $user->city = $input->city;
                $user->state = $input->state;
                $user->postal_code = $input->postal_code;
                $user->country_id = $input->country_id;
                $user->phone = $input->phone;
                $user->save();

                $this->responseStatusCode = $this->statusCodes->success;
                $response = api_create_response($user, $this->successText, 'User updated successfull.');
            }
            
        } else {

            $this->responseStatusCode = $this->statusCodes->bad_request;
            $response = api_create_response(2, $this->failureText, 'Invalid User.');

        }
        
        return response()->json($response, $this->responseStatusCode);
    }


    private function generateAccountId($length = 10) {
        //$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}