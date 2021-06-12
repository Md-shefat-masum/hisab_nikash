<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HelperController extends Controller
{

    public static function auth_full_name()
    {
        return Auth::user()->first_name . ' ' . Auth::user()->last_name;
    }

    public static function convert_to_bangla($data)
    {
        $eng = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 0);
        $bang = array('১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯', '০');
        return str_replace($eng, $bang, $data);
    }

    public static function convert_to_word( float  $amount)
    {

        $amount_after_decimal = round($amount - ($num = floor($amount)), 2) * 100;
        // Check if there is any number after decimal
        $amt_hundred = null;
        $count_length = strlen($num);
        $x = 0;
        $string = array();
        $change_words = array(
            0 => '', 1 => 'এক', 2 => 'দুই',
            3 => 'তিন', 4 => 'চার', 5 => 'পাঁচ', 6 => 'ছয়',
            7 => 'সাত', 8 => 'আট', 9 => 'নয়',
            10 => 'দশ', 11 => 'এগার', 12 => 'বার',
            13 => 'তের', 14 => 'চৌদ্দ', 15 => 'পনের',
            16 => 'ষোল', 17 => 'সতেরো', 18 => 'আঠারো',
            19 => 'উনিশ', 20 => 'বিশ', 30 => 'ত্রিশ',
            40 => 'চল্লিশ', 50 => 'পঞ্চাশ', 60 => 'ষাট',
            70 => 'সত্তর', 80 => 'আশি', 90 => 'নব্বই'
        );
        $here_digits = array('', 'শত', 'হাজার', 'লক্ষ', 'কোটি');
        while ($x < $count_length) {
            $get_divider = ($x == 2) ? 10 : 100;
            $amount = floor($num % $get_divider);
            $num = floor($num / $get_divider);
            $x += $get_divider == 10 ? 1 : 2;
            if ($amount) {
                $add_plural = (($counter = count($string)) && $amount > 9) ? '' : null;
                $amt_hundred = ($counter == 1 && $string[0]) ? '  ' : null;
                $string[] = ($amount < 21) ? $change_words[$amount] . ' ' . $here_digits[$counter] . $add_plural . '
         ' . $amt_hundred : $change_words[floor($amount / 10) * 10] . ' ' . $change_words[$amount % 10] . '
         ' . $here_digits[$counter] . $add_plural . ' ' . $amt_hundred;
            } else $string[] = null;
        }
        $implode_to_Rupees = implode('', array_reverse($string));
        $get_paise = ($amount_after_decimal > 0) ? " " . ($change_words[$amount_after_decimal / 10] . "
   " . $change_words[$amount_after_decimal % 10]) . ' পয়সা' : '';
        return ($implode_to_Rupees ? $implode_to_Rupees . 'টাকা ' : '') . $get_paise;
    }
}
