<?php

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

// Route::get('/home', 'HomeController@index')->name('home');

Route::get('/{any}', 'HomeController@index')->where('any', 'home|users|roles-permissions|chat|settings.*');

Route::get('/{Vendor}', 'HomeController@index')->where('Vendor', 'home|settings.*');
Route::get('/getusers', 'HomeController@getusers')->name('home.getusers');
Route::get('/getTechnicians', 'HomeController@getTechnicians')->name('home.getTechnicians');


Route::get('skill/search', 'SkillController@search')->name('skill.search');

Route::post('/storeuser', 'HomeController@storeuser')->name('skill.storeuser');
Route::put('/updateuser', 'HomeController@updateuser')->name('skill.updateuser');
Route::delete('/deleteuser/{id}', 'HomeController@deleteuser')->name('skill.deleteuser');


//skill
Route::get('/getskills', 'SkillController@getskills')->name('skill.getskill');
Route::delete('/deleteskill/{id}', 'SkillController@deleteskill')->name('skill.deleteskill');
Route::post('/storeskill', 'SkillController@store')->name('skill.storeskill');
Route::put('/updateskill', 'SkillController@updateskill')->name('skill.updateskill');


//category
Route::get('/getCategory', 'CategoryController@getCategory')->name('category.getcategory');
Route::get('/list-category', 'CategoryController@getCategoryList')->name('category.getcategory');
Route::post('/storecategory', 'CategoryController@store')->name('category.updatecategory');
Route::delete('/deleteCategory/{id}', 'CategoryController@deleteCategory')->name('category.delete');
Route::put('/updateCatagory', 'CategoryController@updateCatagory')->name('category.updates');


//ExpenseType
Route::get('/getexpensetype', 'ExpenseTypeController@getExpenseType')->name('ExpenseType.getExpenseType');
Route::post('/storeexpensetype', 'ExpenseTypeController@store')->name('ExpenseType.updateExpenseType');
Route::delete('/deleteexpensetype/{id}', 'ExpenseTypeController@deleteExpenseType')->name('ExpenseType.delete');
Route::put('/updateexpensetype', 'ExpenseTypeController@updateExpenseType')->name('ExpenseType.updates');

//Tools
Route::get('/gettools', 'EquipmentController@getEquipment')->name('Equipment.all');
Route::post('/storetool', 'EquipmentController@store')->name('Equipment.create');
Route::delete('/deletetool/{id}', 'EquipmentController@deleteEquipment')->name('Equipment.delete');
Route::put('/updatetool', 'EquipmentController@update')->name('Equipment.updates');

// Accessories
Route::get('/getaccessories', 'AccessoriesController@getAccessories')->name('accessories.all');
Route::post('/storeaccessories', 'AccessoriesController@store')->name('Accessories.create');
Route::delete('/deleteaccessories/{id}', 'AccessoriesController@destroy')->name('Accessories.delete');
Route::put('/updateaccessories', 'AccessoriesController@update')->name('Accessories.updates');

// Sub Category
Route::post('/storesubcategory', 'SubCategoryController@store')->name('SubCategory.create');


// Route::get('/admin/dashboard', 'AdminController@index')->name('admin.dashboard');

Route::get('/role-permission-list', 'AdminController@listRole')->name('role.list');
Route::post('/role-store', 'AdminController@storeRole')->name('role.store');
Route::put('/role-update', 'AdminController@updateRole')->name('role.update');
Route::delete('/deleterole/{id}', 'AdminController@deleteRole')->name('role.delete');

Route::get('/role-list', 'AdminController@getRoleList')->name('role.all');
Route::get('/permission-list', 'AdminController@listPermission')->name('permission.list');
Route::post('/permission-store', 'AdminController@storePermission')->name('permission.store');

Route::get('/chat/user-list', 'ChatController@userlist');
Route::get('/chat/user-conversations/{id}', 'ChatController@userConversations');
Route::post('/chat-conversation/send', 'ChatController@sendConversation');

Route::post('/settings-upload', 'SettingController@uploadProfilePicture');

Route::post('checkout/', 'AttendanceController@checkout');

Route::get('/city-list', 'CityController@getCityList')->name('city.all');
Route::get('/state-list', 'StateController@getStateList')->name('state.all');

Route::get('/expense', 'ExpenseController@getExpense')->name('Expense.all');
Route::post('/storexpense', 'ExpenseController@store')->name('expense.store');
// Vendor
Route::post('/storevendor', 'VendorController@store')->name('vendor.store');


Route::put('/updatevendor', 'VendorController@updatevendor')->name('vendor.updatevendor');


Route::group(['middleware' => ['auth','role:admin']], function () {
    Route::get('/admin', function() {
        return 'Admin area';
    });
});
