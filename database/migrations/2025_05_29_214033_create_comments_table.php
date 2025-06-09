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
            $table->foreignId('id_commenter')->constrained('users')->onDelete('cascade');
            $table->foreignId('id_creator')->constrained('users')->onDelete('cascade');
            $table->foreignId('id_item')->constrained('items')->onDelete('cascade');
            $table->foreignId('response_to')->constrained('comments')->onDelete('cascade');
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
