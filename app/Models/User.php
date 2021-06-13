<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name',
        'last_name',
        'phone',
        'username',
        'email',
        'password',
    ];

    protected $appends = [
        'remaining_money',
        'given_money',
        'expense_money',
    ];

    public function getRemainingMoneyAttribute(){
        $total_given = Expense::where('employee_id',$this->id)->where('expense_type','deposit')->where('status',1)->sum('amount');
        $total_expense = Expense::where('employee_id',$this->id)->where('expense_type','expense')->where('status',1)->sum('amount');
        return $total_given - $total_expense;
    }

    public function getGivenMoneyAttribute(){
        $total_given = Expense::where('employee_id',$this->id)->where('expense_type','deposit')->where('status',1)->sum('amount');
        return $total_given;
    }

    public function getExpenseMoneyAttribute(){
        $total_expense = Expense::where('employee_id',$this->id)->where('expense_type','expense')->where('status',1)->sum('amount');
        return $total_expense;
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public static function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public function role_information()
    {
        return $this->belongsTo('App\Models\UserRole','role_id','id');
    }

    public function expenses()
    {
        return $this->hasMany(Expense::class,'employee_id','id')->with('project')->where('status',1)->orderBy('id','DESC');
    }
}
