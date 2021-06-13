<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Expense extends Model
{
    use HasFactory;
    protected $appends=['formated_date'];

    public function getFormatedDateAttribute(){
        $date = Carbon::parse($this->date)->format('d M Y');
        return $date;
    }

    public function employee()
    {
        return $this->belongsTo('App\Models\User','employee_id');
    }

    public function admin()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function project()
    {
        return $this->belongsTo('App\Models\Project');
    }
}
