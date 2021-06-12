<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SakhaExpense extends Model
{
    use HasFactory;
    protected $appends=['formated_date'];

    public function getFormatedDateAttribute(){
        $date = Carbon::parse($this->date)->format('d M Y');
        return $date;
    }

    public function programs(){
        return $this->belongsToMany('App\Models\ProgramType')->withTimestamps();
    }

    public function guest()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function sakha()
    {
        return $this->belongsTo('App\Models\User');
    }
}
