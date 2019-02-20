<?php
/**
* DashboardController Class
*
* @package adsd
* @author Veerender
* @version 1.0
* @description dashboard controller
* @link https://domain name/dashboard
*/


namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\admin\DashboardModel;

use DB;
use Session;
use Crypt;

class DashboardController extends Controller
{


    /**
    * @Author:          Veerender
    * @Last modified:   <11-06-2018>
    * @Project:         <adsd>
    * @Function:        <__construct>
    * @Description:     <this function load models>
    * @Parameters:      <NO>
    * @Method:          <NO>
    * @Returns:         <NO>
    * @Return Type:     <NO>
    */
    public function __construct()
    {
       // $this->middleware('CheckAdminLogin');
    }





    /**
    * @Author:          Veerender
    * @Last modified:   <11-06-2018>
    * @Project:         <adsd>
    * @Function:        <index>
    * @Description:     <this function load login page>
    * @Parameters:      <NO>
    * @Method:          <NO>
    * @Returns:         <NO>
    * @Return Type:     <NO>
    */
    public function index()
    {
        //$pdf = \PDF::loadView('admin.pdf.test');
        //return $pdf->download('report.pdf');

      
        //pr($data);die();
        $sessionData = session('user_data');
        //print_r($sessionData);die;
        if(empty($sessionData)){
            
            return redirect('/admin');
        }
        return view('admin.Dashboard',compact('sessionData'));
    }


     public function get_random_string($length = 16)
    {
        $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

        return substr(str_shuffle(str_repeat($pool, $length)), 0, $length);
    }

    /**
    * @Author:          Veerender
    * @Last modified:   <11-06-2018>
    * @Project:         <adsd>
    * @Function:        <my_profile>
    * @Description:     <this function load my profile>
    * @Parameters:      <NO>
    * @Method:          <NO>
    * @Returns:         <NO>
    * @Return Type:     <NO>
    */
    public function my_profile()
    {
        $dashboard = new DashboardModel();
        $data = $dashboard->get_profile();
        return view('admin.dashboard.profile_edit', $data);
    }


      /**
    * @Author:          Rishikesh
    * @Last modified:   <11-08-2018>
    * @Project:         <hta>
    * @Function:        <save_my_profile>
    * @Description:     <this function save my profile>
    * @Parameters:      <NO>
    * @Method:          <NO>
    * @Returns:         <NO>
    * @Return Type:     <NO>
    */
    public function save_my_profile(Request $request)
    {
        $dashboard = new DashboardModel();
        $success = $dashboard->save_record($request);

        if($success){
            return redirect('admin/my-profile')->with('status', 'success');
        }

    }


    /**
    * @Author:          Veerender
    * @Last modified:   <11-06-2018>
    * @Project:         <adsd>
    * @Function:        <change_password>
    * @Description:     <this function load change password>
    * @Parameters:      <NO>
    * @Method:          <NO>
    * @Returns:         <NO>
    * @Return Type:     <NO>
    */
    public function change_password()
    {
        $data = array();
        return view('admin.dashboard.change_password', $data);
    }


     /**
    * @Author:          Rishikesh
    * @Last modified:   <11-08-2018>
    * @Project:         <hta>
    * @Function:        <save_change_password>
    * @Description:     <this function save changed password>
    * @Parameters:      <NO>
    * @Method:          <NO>
    * @Returns:         <NO>
    * @Return Type:     <NO>
    */
    public function save_change_password(Request $request)
    {
        $dashboard = new DashboardModel();
        $opassword = $request->input('opassword');
        $password = $request->input('password');
        $cpassword = $request->input('cpassword');

        $user_data = Session::get('user_data');
        $id = $user_data['id'];

        // check old password exist or not
        $pexist = $dashboard->check_password($opassword, $id);
        if($pexist == 0){
            return redirect('admin/change-password')
                                            ->with('status', 'danger')
                                            ->with('icon', 'warning')
                                            ->with('msg', 'Oh snap! Old password Invalid.');
        }

        // check password and confirm passwor match
        if($password != $cpassword){
            return redirect('admin/change-password')
                                            ->with('status', 'danger')
                                            ->with('icon', 'warning')
                                            ->with('msg', 'Oh snap! Password and Confirm Password not match.');
        }

        $success = $dashboard->save_change_password($cpassword, $id);

        if($success){
            return redirect('admin/change-password')
                                            ->with('status', 'success')
                                            ->with('icon', 'check')
                                            ->with('msg', 'Password changed successfully.');
        }
    }
}

/* End of file DashboardController.php */
/* Location: ./app/Http/Controllers/DashboardController.php */