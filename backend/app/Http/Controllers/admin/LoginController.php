<?php
/**
* LoginController Class
*
* @package Fitness Pad
* @author Veerender
* @version 1.0
* @description login controller
* @link https://domain name/login
*/


namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\admin\LoginModel;

use DB;
use Session;
use Cookie;
use Auth;

class LoginController extends Controller
{


    /**
    * @Author:          Veerender
    * @Last modified:   <20-04-2018>
    * @Project:         <Fitness Pad>
    * @Function:        <__construct>
    * @Description:     <this function load models>
    * @Parameters:      <NO>
    * @Method:          <NO>
    * @Returns:         <NO>
    * @Return Type:     <NO>
    */
    public function __construct()
    {
         //$this->middleware('auth');
    }


    /**
    * @Author:          Veerender
    * @Last modified:   <20-04-2018>
    * @Project:         <Fitness Pad>
    * @Function:        <get_login>
    * @Description:     <this function get login to user>
    * @Parameters:      <NO>
    * @Method:          <NO>
    * @Returns:         <NO>
    * @Return Type:     <NO>
    */
    public function get_login(Request $request)
    {


        $username  = $request->input('email');
        $password  = $request->input('password');

        $login = new LoginModel();
        $userdata = $login->check_login($username, $password);
        
        if($userdata)
        {
            $sessionData = (array)$userdata; // user row
            Session::put('user_data',$sessionData);

           

            // password remember
            if ($request->has('remember')) {
                return $this->_manage_cookie($request, 14400); // set for 10 days
            }
            else{
                return $this->_manage_cookie($request, -5); // remove set password
            }
        }
        else{
            return 0;
        }

    }




    /**
    * @Author:          Veerender
    * @Last modified:   <20-04-2018>
    * @Project:         <Fitness Pad>
    * @Function:        <logout>
    * @Description:     <this function load logout page>
    * @Parameters:      <NO>
    * @Method:          <NO>
    * @Returns:         <NO>
    * @Return Type:     <NO>
    */
    public function logout()
    {
        $userId = Session::get('user_data')['id'];
       // $language = !empty(Session::get('locale')) ? Session::get('locale') : 'en';
      //  $updateUserLang = DB::table('hta_users')->where(array('id' => $userId))->update(array('language' => $language));

        Session::flush(); // removes all session data
        Session::forget('user_data'); // Removes a specific variable
       // Auth::logout();
        return redirect('/admin');
    }




  



    // manage cookie (set or destroy)
    protected function _manage_cookie($request, $minutes)
    {   
        $response = new Response('cookie');
        $response->withCookie(cookie('email', $request->input('email'), $minutes));
        $response->withCookie(cookie('password', $request->input('password'), $minutes));
        $response->withCookie(cookie('remember', $request->input('remember'), $minutes));
        return $response;
    }
}

/* End of file LoginController.php */
/* Location: ./app/Http/Controllers/LoginController.php */
