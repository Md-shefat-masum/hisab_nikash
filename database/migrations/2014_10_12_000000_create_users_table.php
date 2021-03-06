<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->integer('role_id')->default(4);
            $table->string('telegram_id',100)->nullable();
            $table->text('telegram_name')->nullable();
            $table->string('first_name',150)->nullable();
            $table->string('last_name',100)->nullable();
            $table->string('username',100)->nullable();
            $table->string('sakha_name',150)->nullable();
            $table->string('photo',100)->nullable();
            $table->string('phone',100)->nullable();
            $table->string('email',100)->unique();
            $table->string('per_day_amount',100)->unique();
            $table->text('description')->nullable();
            $table->text('address')->nullable();
            $table->string('admin_theme',100)->nullable();
            $table->string('website_theme',100)->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->string('creator',100)->nullable();
            $table->string('slug',100)->nullable();
            $table->integer('status')->default(1);
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
