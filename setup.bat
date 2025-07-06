@echo off
setlocal enabledelayedexpansion

echo ================================
echo Executando composer self-update
echo ================================
call composer self-update
echo.

echo ================================
echo Executando composer clear-cache
echo ================================
call composer clear-cache
echo.

echo ==========================
echo Executando composer update
echo ==========================
call composer update
echo.

echo ===========================
echo Executando composer install
echo ===========================
call composer install
echo.

echo ===================
echo Executando npm install
echo ===================
call npm install
echo.

echo ====================
echo Executando npm build
echo ====================
call npm run build
echo.

echo ================================
echo Copiando .env.example para .env
echo ================================
copy /Y .env.example .env
echo.

echo ====================
echo Gerando API Key
echo ====================
call php artisan key:generate
echo.

echo ==============================
echo Executando artisan migrate
echo ==============================
call php artisan migrate
echo.

echo =============================
echo Executando artisan db:seed
echo =============================
call php artisan db:seed
echo.

echo ===============================
echo Limpando o cache do Laravel
echo ===============================
call php artisan config:clear
call php artisan cache:clear
call php artisan view:clear
echo.

echo =====================
echo Processo concluído.
echo =====================
pause
