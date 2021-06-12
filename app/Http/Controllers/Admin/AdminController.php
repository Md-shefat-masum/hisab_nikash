<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SakhaExpense;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function index()
    {
        return view('admin.index');
    }

    public function earn_list()
    {
        return view('admin.expense.expense_list');
    }

    public function approve_voucher(SakhaExpense $id)
    {
        $id->approved = 1;
        $id->save();
        return redirect()->back()->with('success','voucher approved');
    }

    public function pending_list()
    {
        return view('admin.expense.pending_list');
    }

    public function set_theme(Request $request)
    {
        return User::where("id",Auth::user()->id)->update(['admin_theme'=>$request->theme]);
    }

    // blank page functions
    public function blade_index()
    {
        return view('admin.blank.index');
    }
    public function blade_create()
    {
        return view('admin.blank.create');
    }
    public function blade_view()
    {
        return view('admin.blank.view');
    }
}
