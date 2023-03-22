<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product;
use Faker\Factory as Faker;

class ProductsTableSeeder extends Seeder
{
    public function run()
    {
        Product::create([
            'title' => 'Produto 1',
            'price' => 10,
        ]);

        Product::create([
            'title' => 'Produto 2',
            'price' => 20,
        ]);

        Product::create([
            'title' => 'Produto 3',
            'price' => 30,
        ]);

        Product::create([
            'title' => 'Produto 4',
            'price' => 40,
        ]);
    }
}

