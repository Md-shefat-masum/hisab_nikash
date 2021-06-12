<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProgramType;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ProgramTypeController extends Controller
{

    public function index()
    {
        $program = ProgramType::get();
        return view('admin.program_type.index',compact('program'));
    }

    public function create()
    {
        return view('admin.program_type.create');
    }

    public function store(Request $request)
    {
        $program_type = new ProgramType();
        $program_type->name = $request->name;
        $program_type->created_at = Carbon::now()->toDayDateTimeString();
        $program_type->save();
        return redirect()->route('program-type.index');
    }

    public function show($id)
    {
        //
    }

    public function edit(ProgramType $program_type)
    {
        return view('admin.program_type.edit',compact('program_type'));
    }

    public function update(Request $request, ProgramType $program_type)
    {
        $program_type->name = $request->name;
        $program_type->save();
        return redirect()->route('program-type.index');
    }

    public function destroy(ProgramType $program_type)
    {
        $program_type->delete();
        // return redirect()->route('program-type.index');
    }
}
