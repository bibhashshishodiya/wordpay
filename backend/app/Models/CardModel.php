<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CardModel extends Model
{
    protected $table    = 'cards';

    //protected $hidden   = ['created_at', 'updated_at'];
    protected $fillable = ['id', 'user_id', 'card_type', 'number', 'expired_on', 'cvc', 'first_name', 'last_name', 
                           'address', 'city', 'state', 'postal_code', 'country', 'phone', 'default'];
    public $timestamps  = true;
    
    static public function insertCardId($postedData)
     {
        $parent = New CardModel($postedData);
        
        if($parent->save())
        {
            $lastInsertedID = $parent->id;
            return $lastInsertedID;
        }
     }

}

