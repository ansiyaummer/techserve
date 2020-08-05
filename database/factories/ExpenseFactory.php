<?php

use Faker\Generator as Faker;

$factory->define(App\Expense::class, function (Faker $faker) {
    return [
      'expense_type' =>  $faker->numberBetween($min = 1, $max = 3),
      'user_id' =>  $faker->numberBetween($min = 1, $max = 30),
      'name'   => $faker->name,
      'price'   => $faker->numberBetween($min = 100, $max = 300),
      'status'=> '1',
      'photo'=>  $faker->imageUrl($width = 200, $height = 200),

    ];
});
