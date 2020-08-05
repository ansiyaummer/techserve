<?php

use Faker\Generator as Faker;

$factory->define(App\Leave::class, function (Faker $faker) {
    return [
      'user_id' => $faker->numberBetween($min = 1, $max = 30),
      'leave_type'   => $faker->numberBetween($min = 1, $max = 3),
      'description'=> $faker->name,
      'leave_date'=>$faker->dateTimeBetween($startDate = '-30 years', $endDate = 'now'),
      'leave_stage'=>$faker->numberBetween($min = 1, $max = 3),

    ];
});
