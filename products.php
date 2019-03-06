<?php

require 'vendor/autoload.php';

$faker = Faker\Factory::create();

$connData = json_decode(file_get_contents('connect.json'));

$db = new MysqliDb(
    $connData->host,
    $connData->username,
    $connData->password,
    'base_products'
);


//for($i=0;$i<20;$i++){
//
//
//    $array = [
//        'name'=>$faker->unique()->city,
//        'created_at'=>date('Y-m-d H:i:s')
//    ];
//
//    $id = $db->insert('categories', $array);
//
//    echo $id;
//
//}
//
//$cCount = count($db->get('categories'));
//
//for($i=0;$i<200;$i++){
//
//    $array = [
//        'category_id'=>$faker->numberBetween(1,$cCount),
//        'name'=>$faker->unique()->city,
//        'description'=>$faker->sentence,
//        'price'=>$faker->randomFloat(2,1,10000),
//        'status'=>$faker->numberBetween(0,1),
//        'created_at'=>date('Y-m-d H:i:s')
//    ];
//
//    $id = $db->insert('products', $array);
//
//    echo $id;
//
//}