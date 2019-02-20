<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BankModel extends Model
{
      protected $table    = 'banks';
      protected $fillable = ['id', 'company_id', 'user_id', 'bank_name', 'iban_number', 'swift_code', 'default'];
      public $timestamps  = true;
    
    static public function insertBankId($postedData)
     {
        $response = New BankModel($postedData);
        
        if($response->save())
        {
            $lastInsertedID = $response->id;
            return $lastInsertedID;
        }
     }
}
