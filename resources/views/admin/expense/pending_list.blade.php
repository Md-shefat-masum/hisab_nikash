@extends('admin.layouts.admin')

@section('content')

    <div class="content-wrapper">
        <div class="container-fluid">
            @include('admin.layouts.includes.bread_cumb',['title'=>'All'])
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Earning List</h5>
                            <div class="table-responsive">
                                <table class="table" id="example">
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Guest</th>
                                            <th scope="col">Sakha</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">created at</th>
                                            <th scope="col">Approve</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach (App\Models\SakhaExpense::where('approved',0)->orderBy('id','DESC')->get() as $item)
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>{{ $item->guest->username }}</td>
                                                <td>{{ $item->sakha->username }}</td>
                                                <td>{{ $item->amount }}</td>
                                                <td>{{ $item->created_at->format('d-M-Y j:i:s a') }}</td>
                                                <td>
                                                    <div>
                                                        <a onclick="return confirm('sure want to approve')" type="button" href="{{ route('admin_approve_voucher',$item->id) }}"
                                                            class="btn btnPrint btn-light waves-effect waves-light m-1">
                                                            <i class="fa fa-plus-square"></i> <span>Accept</span>
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

    @push('jsplugin')
        <!--Data Tables js-->
        <script src="/contents/admin/plugins/bootstrap-datatable/js/jquery.dataTables.min.js"></script>
        <script src="/contents/admin/plugins/bootstrap-datatable/js/dataTables.bootstrap4.min.js"></script>
        <script src="/contents/admin/plugins/bootstrap-datatable/js/dataTables.buttons.min.js"></script>
        <script src="/contents/admin/plugins/bootstrap-datatable/js/buttons.bootstrap4.min.js"></script>
        <script src="/contents/admin/plugins/bootstrap-datatable/js/jszip.min.js"></script>
        <script src="/contents/admin/plugins/bootstrap-datatable/js/pdfmake.min.js"></script>
        <script src="/contents/admin/plugins/bootstrap-datatable/js/vfs_fonts.js"></script>
        <script src="/contents/admin/plugins/bootstrap-datatable/js/buttons.html5.min.js"></script>
        <script src="/contents/admin/plugins/bootstrap-datatable/js/buttons.print.min.js"></script>
        <script src="/contents/admin/plugins/bootstrap-datatable/js/buttons.colVis.min.js"></script>
    @endpush

    @push('cjs')
        <script>
            $(document).ready(function() {

                var table = $('#example').DataTable( {
                    lengthChange: false,
                    buttons: [ 'copy', 'excel', 'pdf', 'print', 'colvis' ]
                } );

                table.buttons().container()
                    .appendTo( '#example_wrapper .col-md-6:eq(0)' );
                } );

       </script>
       <style>
            #example_filter{
                text-align: right;
            }
            .card .table {
                margin-bottom: 63px;
            }
            .pagination{
                display: inline-flex;
            }
            .dataTables_paginate{
                text-align: right;
            }
       </style>
    @endpush

@endsection



