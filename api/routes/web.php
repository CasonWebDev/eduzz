<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/
use App\Models\Employees;
use Illuminate\Http\Request;

$router->get('/', function () use ($router) {
    return $router->app->version();
});

//CREATE
$router->post('/employees/new', function (Request $request) use ($router) {
    $new = new Employees();
    parse_str($request->input('emp'), $searcharray);
    
    $new->firstname_func = $searcharray['firstname'];
    $new->lastname_func = $searcharray['lastname'];
    $new->address_func = $searcharray['address'];
    $new->number_func = $searcharray['number'];
    $new->complement_func = $searcharray['complement'];
    $new->district_func = $searcharray['district'];
    $new->city_func = $searcharray['city'];
    $new->state_func = $searcharray['state'];
    $new->zipcode_func = $searcharray['zipcode'];
    $new->phone_func = $searcharray['phone'];
    $new->cellphone_func = $searcharray['cellphone'];
    $new->mail_func = $searcharray['mail'];
    
    if($new->save()){
        return response()->json($new);
    }else{
        return response()->json("error");
    }
});

//READ
$router->get('/employees', function () use ($router) {
    $emp = Employees::where('deleted_func','=',0)->get();

    return response()->json($emp);
});

//UPDATE
$router->post('/employees/getemp', function (Request $request) use ($router) {
    $emp = Employees::where('id_func','=',$request->input('id'))->first();

    if($emp!=null){
        return response()->json($emp);
    }else{
        return response()->json('error');
    }
});

$router->post('/employees/edit', function (Request $request) use ($router) {
    $emp = Employees::where('id_func','=',$request->input('id'))->first();

    if($emp!=null){
        parse_str($request->input('emp'), $searcharray);

        (!empty($searcharray['firstname'])) ? $emp->firstname_func = $searcharray['firstname'] : '';
        (!empty($searcharray['lastname'])) ? $emp->lastname_func = $searcharray['lastname'] : '';
        (!empty($searcharray['address'])) ? $emp->address_func = $searcharray['address'] : '';
        (!empty($searcharray['number'])) ? $emp->number_func = $searcharray['number'] : '';
        (!empty($searcharray['complement'])) ? $emp->complement_func = $searcharray['complement'] : '';
        (!empty($searcharray['district'])) ? $emp->district_func = $searcharray['district'] : '';
        (!empty($searcharray['city'])) ? $emp->city_func = $searcharray['city'] : '';
        (!empty($searcharray['state'])) ? $emp->state_func = $searcharray['state'] : '';
        (!empty($searcharray['zipcode'])) ? $emp->zipcode_func = $searcharray['zipcode'] : '';
        (!empty($searcharray['phone'])) ? $emp->phone_func = $searcharray['phone'] : '';
        (!empty($searcharray['cellphone'])) ? $emp->cellphone_func = $searcharray['cellphone'] : '';
        (!empty($searcharray['mail'])) ? $emp->mail_func = $searcharray['mail'] : '';
        
        $emp->save();
        return response()->json($emp);
    }else{
        return response()->json('error');
    }
});

//DELETE
$router->post('/employees/delete', function (Request $request) use ($router) {
    $emp = Employees::where('id_func','=',$request->input('id'))->first();

    if($emp!=null){
        $emp->deleted_func = 1;
        $emp->save();
        return response()->json(Employees::where('deleted_func','=',0)->get());
    }else{
        return response()->json('error');
    }
});