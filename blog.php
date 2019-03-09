<?php

require 'vendor/autoload.php';
use Cocur\Slugify\Slugify;

$faker = Faker\Factory::create();
$slugify = new Slugify();

$connData = json_decode(file_get_contents('connect.json'));

$db = new MysqliDb(
    $connData->host,
    $connData->username,
    $connData->password,
    'base_blog'
);


for($i=0;$i<20;$i++){


    $array = [
        'name'=>$faker->unique()->firstName,
        'email'=>$faker->unique()->safeEmail,
        'password'=>md5('1234'),
        'status'=>$faker->numberBetween(0,1),
        'created_at'=>date('Y-m-d H:i:s')
    ];

    $id = $db->insert('users', $array);

    echo $id;

}

$uCount = count($db->get('users'));

for($i=0;$i<300;$i++){

    $title = $faker->unique()->firstName;

    $array = [
        'user_id'=>$faker->numberBetween(1,$uCount),
        'title'=>$title,
        'alias'=>$slugify->slugify($title),
        'intro'=>$faker->sentence(5),
        'content'=>$faker->sentence(30),
        'status'=>$faker->regexify('created|confirmed|updated'),
        'created_at'=>date('Y-m-d H:i:s')
    ];

    $id = $db->insert('posts', $array);

    echo $id;

}



for($i=0;$i<50;$i++){

    $name = $faker->unique()->city;

    $array = [
        'name'=>$name,
        'alias'=>$slugify->slugify($name),
        'created_at'=>date('Y-m-d H:i:s')
    ];

    $id = $db->insert('tags', $array);

    echo $id;

}

foreach ($db->get('posts') as $p){
    foreach ($db->get('tags') as $t){

        if((boolean) $faker->numberBetween(0,1)){
            $db->insert('tags_posts',[
                'tag_id'=>$t['id'],
                'post_id'=>$p['id']
            ]);
            print_r([
                'tag_id'=>$t['id'],
                'post_id'=>$p['id']
            ]);
        }

    }
}
