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
        Schema::table('firsttimes', function (Blueprint $table) {
            $table->integer('indexeditor');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('firsttimes', function (Blueprint $table) {
            $table->dropColumn('indexeditor');
        });
    }
};
