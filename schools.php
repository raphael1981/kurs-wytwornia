<?php

require 'vendor/autoload.php';


$faker = Faker\Factory::create();

$connData = json_decode(file_get_contents('connect.json'));

$db = new MysqliDb(
    $connData->host,
    $connData->username,
    $connData->password,
    'base_schools'
);


for($i=0;$i<20;$i++){

    $array = [
        'name'=>$faker->unique()->company,
        'registration_number'=>$faker->unique()->ean8,
        'created_at'=>date('Y-m-d H:i:s')
    ];

    $id = $db->insert('schools', $array);

    echo $id;

}



$schoolsCount = count($db->get('schools'));



for($i=0;$i<200;$i++){

    $id = $faker->numberBetween(1,$schoolsCount);

    $arrayC = [
            'school_id'=>$id,
            'class_number'=>$faker->unique()->iban('PL',''),
            'created_at'=>date('Y-m-d H:i:s')
            ];

    $idC = $db->insert('classes', $arrayC);

    echo $idC;

}


$classCount = count($db->get('classes'));

for($i=0;$i<200;$i++){

    $id = $faker->numberBetween(1,$classCount);

    $arrayS = [
        'class_id'=>$id,
        'name'=>$faker->name,
        'surname'=>$faker->lastName,
        'email'=>$faker->unique()->safeEmail,
        'created_at'=>date('Y-m-d H:i:s')
    ];

//    $db->join("schools s", "s.id=c.school_id", "LEFT");
//    $data = $db->get("classes c", null, "c.class_number, c.id as class_id, c.school_id, s.name as sname, s.id");
//
//    foreach ($data as $j){
//        echo '<pre>'.print_r($j,1).'</pre>';
//    }

    $idS = $db->insert('students', $arrayS);
    echo $idS;

}


$sCount = count($db->get('students'));


for($i=1;$i<=3000;$i++){

    $id = $faker->numberBetween(1,$sCount);


    $arrayG = [
        'student_id'=>$id,
        'number'=>$faker->randomFloat(2,1,6),
        'created_at'=>date('Y-m-d H:i:s')
    ];

    $idG = $db->insert('grades', $arrayG);

    echo $idG;

}

