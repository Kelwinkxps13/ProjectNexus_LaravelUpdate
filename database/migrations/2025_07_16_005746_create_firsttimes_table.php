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
        Schema::create('firsttimes', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->integer('editor');
            $table->integer('generic');
            $table->integer('index');
            $table->integer('indexcreator');
            $table->integer('main');
            $table->integer('veja');
            $table->integer('vejaeditor');
            $table->integer('base_create');
            $table->integer('base_edit');
            $table->integer('block_create');
            $table->integer('block_edit');
            $table->integer('generic_create');
            $table->integer('generic_edit');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('firsttimes');
    }
};
