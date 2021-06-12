<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Invoice</title>
    <link rel="stylesheet" href="/css/app.css">
    <style>
        @font-face{
            src: url('/bangla.ttf');
            font-family: bangla;
        }
        body{
            font-family: 'bangla',sans-serif;
            padding: 30px;
        }
        p{
            font-size: 19px;
        }
        table tr td:nth-child(2){
            text-align: right;
        }
        .bg_sill{
            position: relative;
        }
        .bg_sill::before{
            position: absolute;
            content: 'approved';
            left: 0;
            top: 50%;
            font-weight: 600;
            transform: translateY(-50%) rotate(-30deg);
            text-transform: uppercase;
            color: red;
            font-size: 23px;
            border: 1px solid red;
            padding: 5px;
            line-height: 23px;
            z-index: 99;
        }
        .not_bg_sill{
            position: relative;
        }
        .not_bg_sill::before{
            position: absolute;
            content: 'not approved';
            left: 0;
            top: 50%;
            font-weight: 600;
            transform: translateY(-50%) rotate(-30deg );
            text-transform: uppercase;
            color: red;
            font-size: 18px;
            border: 1px solid red;
            padding: 5px;
            line-height: 23px;
            z-index: 99;
        }
        @media print {
            @page {
                size: A4;
            }
            .not_bg_sill::before{
                -webkit-print-color-adjust: exact;
            }
            .bg_sill::before{
                -webkit-print-color-adjust: exact;
            }
        }
    </style>
</head>
<body>
    <div class="row">
        <div class="col-12 text-center">
            <h1>ভাউচার</h1>
        </div>
        <div class="col-6">
            <h4><b>খাতঃ</b> সফর ব্যয়</h4>
        </div>
        <div class="col-6 text-right">
            <h4><b>তারিখঃ</b> {{ Helper::convert_to_bangla($expense->updated_at->format('d-m-y')) }}</h4>
        </div>
    </div>
    <section style="min-height: 300px;" class="{{$expense->approved == 1 ? 'bg_sill' : 'not_bg_sill'}}">
        <div class="row">
            <div class="col-12">
                <table class="table my-3">
                    <thead>
                        <tr>
                            <th><h4>বিবরণ</h4></th>
                            <th><h4 class="text-right">পরিমাণ</h4></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="width: 77%">
                                <p style="height: 200px;">
                                    গেস্ট ( {{ $expense->guest->first_name }} )
                                    এর জন্য সফর (
                                        @foreach ($expense->programs()->get() as $key => $program)
                                            <span class="btn btn-sm btn-outline-dark pl-0 pr-2 py-0 border-0" style="font-size: 19px;">{{ $program->name }} {{ $key<$expense->programs()->count()?',':'' }} </span>
                                        @endforeach
                                    ) বাবদ খরচ
                                </p>
                            </td>
                            <td>
                                <h5>{{ Helper::convert_to_bangla(number_format($expense->amount)) }} /-</h5>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td>
                                <h4>মোটঃ</h4>
                            </td>
                            <td>
                                <h5>{{ Helper::convert_to_bangla(number_format($expense->amount)) }} /-</h5>
                            </td>
                        </tr>
                        <tr>
                            {{-- <td colspan="2"><h4>কথায়ঃ ( {{ Helper::convert_to_word($expense->amount) }} মাত্র)</h4></td> --}}
                            <td colspan="2"><h4>কথায়ঃ ({{$expense->amount_bangla }})</h4></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </section>
    <section>
        <div class="row">
            <div class="col-12 text-right">
                <u style="font-size: 20px;">স্বাক্ষর</u>
            </div>
        </div>
    </section>

</body>
</html>

