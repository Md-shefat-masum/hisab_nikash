@extends('admin.layouts.admin')

@section('content')

    <div class="content-wrapper">
        <div class="container-fluid">
            @include('admin.layouts.includes.bread_cumb',['title'=>'All'])
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <h5 class="card-title">Program Types</h5>
                            <a href="{{ route('program-type.create') }}" class="btn btn-success">Create</a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach (App\Models\ProgramType::orderBy('id','DESC')->get() as $key=>$item)
                                            <tr>
                                                <th scope="row">{{ $key+1 }}</th>
                                                <td>{{ $item->name }}</td>
                                                <td>
                                                    <div>
                                                        <a type="button" href="{{ route('program-type.edit',$item->id) }}" class="btn btn-light waves-effect waves-light m-1">
                                                            <i class="fa fa-pencil"></i> <span>Edit</span>
                                                        </a>
                                                        <a type="button" href="{{ route('program-type.destroy',$item->id) }}" class="btn delete_btn btn-danger waves-effect waves-light m-1">
                                                            <i class="fa fa-trash"></i> <span>delete</span>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--start overlay-->
            <div class="overlay"></div>
            <!--end overlay-->
        </div>
        <!-- End container-fluid-->
    </div>
    <!--End content-wrapper-->

@endsection



