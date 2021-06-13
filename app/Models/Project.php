<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;
    protected $appends = ['formated_date', 'amount'];

    public function getFormatedDateAttribute(){
        $date = Carbon::parse($this->date)->format('d M Y');
        return $date;
    }

    public function getAmountAttribute(){
        $amount = Expense::where('status',1)->where('project_id',$this->id)->sum('amount');
        return $amount;
    }

    public function expenses()
    {
        return $this->hasMany(Expense::class,'project_id','id')->where('status',1)->orderBy('id','DESC')->with("employee");
    }
}
