<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserInfoModelsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_infos', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->date('dob');
            $table->char('gender',20);
            $table->char('profile_pic')->nullable();
            $table->char('ip_address',100)->nullable();
            $table->char('latitude')->nullable();
            $table->char('longitude')->nullable();
            $table->tinyInteger('status')->default('1')->comment('0 = inactive,1= active');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_infos');
    }
}
