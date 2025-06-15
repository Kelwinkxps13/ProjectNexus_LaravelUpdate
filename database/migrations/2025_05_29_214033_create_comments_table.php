<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('text')->nullable();
            $table->integer('id_commenter');
            $table->integer('id_creator');
            $table->integer('id_item');
            $table->text('response_to')->nullable();
            $table->integer('comment_level')->nullable();
            $table->json('likes')->nullable();
            $table->json('dislikes')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('comments');
    }
};
