<?php

use Faker\Generator as Faker;

$factory->define(App\Vendor::class, function (Faker $faker) {
    return [
      'name' => $faker->name,
      'person'   => $faker->name,
      'street1'=> $faker->address,
      'street2'=> $faker->address,
      'city'=> $faker->city,
      'zip'=> $faker->postcode,


      'email1'=> $faker->unique()->safeEmail,
      'email2'=> $faker->unique()->safeEmail,
      'phone1'=> $faker->phoneNumber,
      'phone2'=> $faker->phoneNumber,
      'description'=> $faker->paragraph,
      'state'=> ''
    ];
});
