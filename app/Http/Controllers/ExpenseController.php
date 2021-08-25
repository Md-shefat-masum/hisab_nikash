<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use App\Models\Notification;
use App\Models\ProgramType;
use App\Models\Project;
use App\Models\SakhaExpense;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ExpenseController extends Controller
{
    public function employee_list()
    {
        $employee_list = User::where('role_id', 4)->select('id', 'first_name','last_name','username','status')
                            ->orderBy('first_name', 'asc')->get();
        return $employee_list;
    }

    public function sakha_list()
    {
        $employee_list = User::where('role_id', 6)->select('id', 'first_name', 'telegram_name')->orderBy('first_name', 'asc')->get();
        return $employee_list;
    }

    public function admin_expenses(Request $request)
    {

        $expense = Expense::with('employee')->where('status', 1)
                            ->orderBy('id', 'DESC')
                            ->paginate(9);
        return $expense;
    }

    public function admin_deposit_expenses(Request $request)
    {

        $expense = Expense::with('employee')->where('status', 1)
                            ->where("expense_type",'deposit')
                            ->orderBy('id', 'DESC')
                            ->paginate(9);
        return $expense;
    }

    public function admin_expense_expenses(Request $request)
    {

        $expense = Expense::with('employee')->where('status', 1)
                            ->where("expense_type",'expense')
                            ->orderBy('id', 'DESC')
                            ->paginate(9);
        return $expense;
    }

    public function user_expensess(Request $request)
    {

        $expense = Expense::with('employee')->where('status', 1)
                            ->where('employee_id',Auth::user()->id)
                            ->orderBy('id', 'DESC')
                            ->paginate(9);
        return $expense;
    }

    public function user_deposit_expenses(Request $request)
    {

        $expense = Expense::with('employee')->where('status', 1)
                            ->where('employee_id',Auth::user()->id)
                            ->where("expense_type",'deposit')
                            ->orderBy('id', 'DESC')
                            ->paginate(9);
        return $expense;
    }

    public function user_expense_expenses(Request $request)
    {

        $expense = Expense::with('employee')->where('status', 1)
                            ->where('employee_id',Auth::user()->id)
                            ->where("expense_type",'expense')
                            ->orderBy('id', 'DESC')
                            ->paginate(9);
        return $expense;
    }

    public function expenses_filter(Request $request)
    {
        $to = Carbon::parse($request->to);
        $from = Carbon::parse($request->from);
        if (strlen($request->approved) <= 2 && (int)$request->approved === 0 || (int)$request->approved === 1) {
            $expense = Expense::where('sakha_id', Auth::user()->id)->whereBetween('date',[$from,$to])->where('approved', $request->approved)->with('programs', 'guest', 'sakha')->where('status', 1)->orderBy('id', 'DESC')->paginate(9);
        } else {
            $expense = Expense::where('sakha_id', Auth::user()->id)->whereBetween('date',[$from,$to])->orderBy('id', 'DESC')->with('programs', 'guest', 'sakha')->where('status', 1)->paginate(9);
        }

        return $expense;
    }

    public function guest_expenses(Request $request)
    {
        if (strlen($request->approved) <= 2 && (int)$request->approved === 0 || (int)$request->approved === 1) {
            $expense = Expense::where('guest_id', Auth::user()->id)->where('approved', $request->approved)->with('programs', 'guest', 'sakha')->where('status', 1)->orderBy('id', 'DESC')->paginate(9);
        } else {
            $expense = Expense::where('guest_id', Auth::user()->id)->orderBy('id', 'DESC')->with('programs', 'guest', 'sakha')->where('status', 1)->paginate(9);
        }
        return $expense;
    }

    public function guest_expenses_filter(Request $request)
    {
        $to = Carbon::parse($request->to);
        $from = Carbon::parse($request->from);

        if (strlen($request->approved) <= 2 && (int)$request->approved === 0 || (int)$request->approved === 1) {
            $expense = Expense::where('guest_id', Auth::user()->id)->whereBetween('date',[$from,$to])->where('approved', $request->approved)->with('programs', 'guest', 'sakha')->where('status', 1)->orderBy('id', 'DESC')->paginate(9);
        } else {
            $expense = Expense::where('guest_id', Auth::user()->id)->whereBetween('date',[$from,$to])->orderBy('id', 'DESC')->with('programs', 'guest', 'sakha')->where('status', 1)->paginate(9);
        }
        return $expense;
    }

    public function expense_details($id)
    {
        $expense = Expense::where('id', $id)->with('employee')->first();
        $expense->formated_date = Carbon::parse($expense->date)->format('d-M-Y');
        return $expense;
        //function_body
    }

    public function user_expenses()
    {
        $total_expense = Expense::where('employee_id',Auth::user()->id)->where('status',1)->count();
        $total_deposit_expense = Expense::where('employee_id',Auth::user()->id)->where('status',1)->where('expense_type','deposit')->count();
        $total_expense_expense = Expense::where('employee_id',Auth::user()->id)->where('status',1)->where('expense_type','expense')->count();

        $total_received = Expense::where('employee_id',Auth::user()->id)->where('expense_type','deposit')->where('status',1)->sum('amount');
        // $total_give_amount = Expense::where('employee_id',Auth::user()->id)->where('status',1)->where('expense_type','expense')->sum('amount');
        $total_expense_amount = Expense::where('employee_id',Auth::user()->id)->where('expense_type','expense')->where('status',1)->sum('amount');
        $total_remaining_amount = $total_received - $total_expense_amount;


        return response()->json([
            'total_expense' => $total_expense,
            'total_deposit_expense' => $total_deposit_expense,
            'total_expense_expense' => $total_expense_expense,

            'total_expense_amount' => $total_expense_amount,
            'total_remaining_amount' => $total_remaining_amount,
            'total_received' => $total_received,
        ]);
    }

    public function admin_expense_info()
    {
        $total_expense = Expense::where('status',1)->count();
        $total_deposit_expense = Expense::where('status',1)->where('expense_type','deposit')->count();
        $total_expense_expense = Expense::where('status',1)->where('expense_type','expense')->count();
        $total_user_expense = Expense::where('status',1)->where('expense_type','expense')
                                        ->select('employee_id')->distinct('employee_id')->count();
        $total_project_expense = Expense::where('status',1)->where('expense_type','expense')
                                        ->select('project_id')->distinct('project_id')->count();

        $total_give_amount = Expense::where('status',1)->where('expense_type','deposit')->sum('amount');
        $total_expense_amount = Expense::where('status',1)->where('expense_type','expense')->sum('amount');
        $total_remaining_amount = $total_give_amount - $total_expense_amount;


        return response()->json([
            'total_expense' => $total_expense,
            'total_deposit_expense' => $total_deposit_expense,
            'total_expense_expense' => $total_expense_expense,
            'total_project_expense' => $total_project_expense,
            'total_user_expense' => $total_user_expense,
            'total_give_amount' => $total_give_amount,
            'total_expense_amount' => $total_expense_amount,
            'total_remaining_amount' => $total_remaining_amount,
        ]);
    }

    public function admin_expense_save(Request $request)
    {
        $this->validate($request,[
            'amount' => ['required'],
            'employee_id' => ['required'],
            'project_id' => ['required'],
            // 'file' => ['required'],
        ]);

        $expense = new Expense();
        $expense->employee_id = $request->employee_id;
        $expense->project_id = $request->project_id;
        $expense->amount = $request->amount;
        $expense->date = $request->date;
        $expense->amount = $request->amount;
        $expense->expense_type = 'deposit';
        $expense->description = $request->description;
        $expense->creator = Auth::user()->id;
        $expense->created_at = Carbon::now()->toDateTimeString();
        // if($request->hasFile('file')){
        //     $expense->file = Storage::put('uploads/voucher',$request->file('file'));
        // }
        $expense->save();
        $expense->slug = $expense->id . uniqid(5);
        $expense->save();
        // return dd($request->all(), $request->file('file'));

        return 'success';
    }

    public function user_expense_save(Request $request)
    {
        $this->validate($request,[
            'amount' => ['required'],
            'project_id' => ['required'],
            'file' => ['required'],
        ]);
        // ok

        $expense = new Expense();
        $expense->employee_id = Auth::user()->id;
        $expense->project_id = $request->project_id;
        $expense->amount = $request->amount;
        $expense->date = $request->date;
        $expense->amount = $request->amount;
        $expense->expense_type = 'expense';
        $expense->description = $request->description;
        $expense->creator = Auth::user()->id;
        $expense->created_at = Carbon::now()->toDateTimeString();
        if($request->hasFile('file')){
            $expense->file = Storage::put('uploads/voucher',$request->file('file'));
        }
        $expense->save();
        $expense->slug = $expense->id . uniqid(5);
        $expense->save();

        $employee = Auth::user();
        $notification = new Notification();
        $notification->user_id = $request->guest_id;
        $notification->description = "new expense voucher added by
            {$employee->first_name} {$employee->last_name}
            amount: {$expense->amount} \n
            description: {$expense->description} \n
        ";
        $notification->created_at = Carbon::now()->toDateTimeString();
        $notification->save();

        return 'success';
    }

    public function expense_update(Request $request)
    {
        $this->validate($request, [
            'amount' => ['required'],
        ]);
        $expense = Expense::find($request->id);
        $expense->employee_id = $request->employee_id;
        $expense->amount = $request->amount;
        $expense->date = $request->date;
        $expense->amount = $request->amount;
        $expense->expense_type = $request->expense_type;
        $expense->description = $request->description;
        $expense->creator = Auth::user()->id;
        $expense->updated_at = Carbon::now()->toDateTimeString();
        if($request->hasFile('file')){
            $expense->file = Storage::put('uploads/voucher',$request->file('file'));
        }
        $expense->save();
        $expense->slug = $expense->id . uniqid(5);
        $expense->save();

        return 'sucess';
    }

    public function expense_delete(Request $request)
    {
        $expense = Expense::find($request->id);
        if(file_exists(public_path().'/'.$expense->file)){
            unlink(public_path().'/'.$expense->file);
        }
        $expense->delete();

        return response()->json(['message' => 'successfully deleted.']);
    }

    public function user_delete(Request $request)
    {
        $user = User::find($request->id);
        if($user->status == 1){
            $user->status = 0;
        }else{
            $user->status = 1;
        }
        $user->save();
        return 'success';
    }

    public function notification()
    {
        return Notification::orderBy('id','DESC')->get();
    }

    public function user_info()
    {
        return Auth::user();
    }

    public function admin_create_project(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
        ]);

        $project = new Project();
        $project->date = $request->date;
        $project->name = $request->name;
        $project->project_area = $request->project_area;
        $project->description = $request->description;
        $project->creator = Auth::user()->id;
        $project->save();
        $project->slug = $project->id.uniqid(10);
        $project->save();

        return 'success';
    }

    public function project_list()
    {
        return Project::orderBy('name','ASC')->where('status',1)->get();
    }

    public function project_expense()
    {
        $expense = Project::where('status',1)->with('expenses')->paginate(8);
        return $expense;
    }

    public function user_expense()
    {
        $expense = User::where('status',1)->where('role_id',4)->with('expenses')->paginate(8);
        return $expense;
    }

    public function admin_delete_project(Request $request)
    {
        Project::where('id',$request->id)->delete();
        return 'success';
    }

    public function admin_create_manpower(Request $request)
    {
        $this->validate($request, [
            'project_id' => ['required'],
            'name' => ['required'],
            'phone' => ['required'],
            'password' => ['required','confirmed','min:8'],
        ]);

        $user = new User();
        $user->first_name = $request->name;
        if(strlen($request->email)>0){
            $this->validate($request,['email' => ['email']]);
            $this->email = $request->email;
        }
        else{
            $user->email = User::first()->id.str_replace(' ','_',$request->name).'@hsblco.com';
        }
        $user->username = $request->username;
        $user->phone = $request->phone;
        $user->per_day_amount = $request->per_day_amount;
        $user->password = Hash::make($request->password);
        $user->save();
        $user->role_id = 4;
        $user->slug = Str::slug($user->id).'_'.$user->id.rand(111,999);
        $user->save();
        return 'success';
    }

    public function user_info_update(Request $request)
    {
        // dd($request->all());
        User::where('id',Auth::user()->id)->update([
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'username' => $request->username,
            'phone' => $request->phone,
        ]);

        if($request->has('password') && strlen($request->password)>0){
            User::where('id',Auth::user()->id)->update([
                'password' => Hash::make($request->password),
            ]);
        }
    }

    public function print_invoice($id)
    {
        $expense = Expense::find($id);
        return view('invoice',compact('expense'));
    }
}
