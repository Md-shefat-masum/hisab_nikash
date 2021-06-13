<?php

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Route::get('/about', [WebsiteController::class, 'about']);


Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index']);

Route::get('/', 'WebsiteController@index')->name('website_index');

Route::group([
    'prefix' => '/json',
    'middleware' => ['auth'],
], function () {
    Route::get('/project-list', 'ExpenseController@project_list')->name('project_list_json');
    Route::get('/project-expense', 'ExpenseController@project_expense')->name('project_expense_json');

    Route::get('/employee-list', 'ExpenseController@employee_list')->name('employee_list_json');

    Route::get('/admin-expenses', 'ExpenseController@admin_expenses')->name('admin_expenses_json');
    Route::get('/admin-deposit-expenses', 'ExpenseController@admin_deposit_expenses')->name('admin_deposit_expenses_json');
    Route::get('/admin-expense-expenses', 'ExpenseController@admin_expense_expenses')->name('admin_expense_expenses_json');

    Route::get('/user-expensess', 'ExpenseController@user_expensess')->name('user_expenses_json');
    Route::get('/user-deposit-expenses', 'ExpenseController@user_deposit_expenses')->name('user_deposit_expenses_json');
    Route::get('/user-expense-expenses', 'ExpenseController@user_expense_expenses')->name('user_expense_expenses_json');

    Route::get('/expenses', 'ExpenseController@expenses')->name('expenses_json');
    Route::post('/expenses-filter', 'ExpenseController@expenses_filter')->name('expenses_json_filter');

    Route::get('/user-expenses', 'ExpenseController@user_expenses')->name('user_expenses');
    Route::post('/guest-expenses-filter', 'ExpenseController@guest_expenses_filter')->name('guest_expenses_filter');

    Route::get('/user-expenses-info', 'ExpenseController@user_expenses')->name('user_expenses_json');
    Route::get('/admin-expenses-info', 'ExpenseController@admin_expense_info')->name('admin_expense_info_json');

    Route::get('/notification', 'ExpenseController@notification')->name('notification_json');

    Route::get('/expense-details/{id}', 'ExpenseController@expense_details')->name('expense_details_json');

    Route::get('/user-info', 'ExpenseController@user_info')->name('user_info_json');
    Route::post('/user-info-update', 'ExpenseController@user_info_update')->name('user_info_update_json');
});

Route::post('/admin-create-manpower', 'ExpenseController@admin_create_manpower')->name('admin_create_manpower');
Route::post('/admin-delete-project', 'ExpenseController@admin_delete_project')->name('admin_delete_project');
Route::post('/admin-create-project', 'ExpenseController@admin_create_project')->name('admin_create_project');
Route::post('/admin-save-expense', 'ExpenseController@admin_expense_save')->name('admin_expense_save');
Route::post('/user-save-expense', 'ExpenseController@user_expense_save')->name('user_expense_save');
Route::post('/update-expense', 'ExpenseController@expense_update')->name('expense_update');
Route::post('/delete-expense', 'ExpenseController@expense_delete')->name('expense_delete');
Route::post('/delete-user', 'ExpenseController@user_delete')->name('user_delete');
Route::post('/approve-expense', 'ExpenseController@expense_approve')->name('expense_approve');
Route::get('/print-invoice/{id}', 'ExpenseController@print_invoice')->name('print_invoice');

// Route::group([
//     'prefix' => 'admin',
//     'middleware' => ['auth', 'check_user_is_active','super_admin'],
//     'namespace' => 'Admin'
// ], function () {
//     Route::get('/', 'AdminController@index')->name('admin_index');
//     Route::post('/set-theme', 'AdminController@set_theme')->name('admin_set_theme');

//     Route::get('/earn-list', 'AdminController@earn_list')->name('admin_earn_list');
//     Route::get('/pending-list', 'AdminController@pending_list')->name('admin_pending_list');

//     Route::get('/approve-voucher/{id}', 'AdminController@approve_voucher')->name('admin_approve_voucher');

// });


// user management
Route::group([
    'prefix' => 'user',
    'middleware' => ['auth', 'check_user_is_active', 'super_admin'],
    'namespace' => 'Admin'
], function () {
    Route::get('/index', 'UserController@index')->name('admin_user_index');

    Route::get('/view/{id}', 'UserController@view')->name('admin_user_view');
    Route::get('/create', 'UserController@create')->name('admin_user_create');
    Route::post('/store', 'UserController@store')->name('admin_user_store');
    Route::get('/edit/{id}', 'UserController@edit')->name('admin_user_edit');
    Route::post('/update', 'UserController@update')->name('admin_user_update');
    Route::post('/delete', 'UserController@delete')->name('admin_user_delete');

    Route::post('/test', 'UserController@test')->name('admin_user_test');
});

// user role
Route::group([
    'prefix' => 'user-role',
    'middleware' => ['auth', 'check_user_is_active', 'super_admin'],
    'namespace' => 'Admin'
], function () {
    Route::get('/index', 'UserRoleController@index')->name('admin_user_role_index');
    Route::get('/view/{id}', 'UserRoleController@view')->name('admin_user_role_view');
    Route::get('/create', 'UserRoleController@create')->name('admin_user_role_create');
    Route::post('/store', 'UserRoleController@store')->name('admin_user_role_store');
    Route::get('/edit', 'UserRoleController@edit')->name('admin_user_role_edit');
    Route::post('/update', 'UserRoleController@update')->name('admin_user_role_update');
    Route::post('/delete', 'UserRoleController@delete')->name('admin_user_role_delete');
});

Route::group([
    'prefix' => 'file-manager',
    'middleware' => ['auth'],
    'namespace' => 'Admin'
], function () {

    Route::post('/store-file', 'FileManagerController@store_file')->name('admin_fm_store_file');
    Route::get('/get-files', 'FileManagerController@get_files')->name('admin_fm_get_files');
    Route::delete('/delete-file/{image}', 'FileManagerController@delete_file')->name('admin_fm_delete_file');
});

Route::group([
    'prefix' => 'blank',
    'middleware' => ['auth'],
    'namespace' => 'Admin'
], function () {

    // basic_page
    Route::get('/index', 'AdminController@blade_index')->name('admin_blade_index');
    Route::get('/create', 'AdminController@blade_create')->name('admin_blade_create');
    Route::get('/view', 'AdminController@blade_view')->name('admin_blade_view');
});

Route::post('/test', function (Request $request) {

    dd($request->all());
})->name('route name');

Route::get('/{vue?}', 'WebsiteController@index')->where('vue', '[\/\w\.-]*')->name('website_vue_index');
