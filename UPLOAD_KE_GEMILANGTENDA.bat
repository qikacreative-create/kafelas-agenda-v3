@echo off
title Upload Instan ke gemilangtenda.web.app
color 0A
echo ============================================================================
echo   UPLOAD INSTAN KE GEMILANGTENDA.WEB.APP
echo   1. Web Profil Klien    : https://gemilangtenda.web.app
echo   2. Dashboard Kasir/App : https://gemilangtenda.web.app/app
echo   3. Link Booking Online : https://gemilangtenda.web.app/b/gemilangtenda
echo ============================================================================
echo.

echo [1/3] Menyiapkan paket website terbaru (npm run build)...
call npm run build
echo.
echo [2/3] Meng-upload langsung ke hosting gemilangtenda.web.app ...
call npx firebase-tools deploy --only hosting:gemilangtenda --project kafilasuci3
if %errorlevel% neq 0 (
    echo.
    echo [INFO] Mencoba upload ke target project aktif...
    call npx firebase-tools deploy --only hosting:gemilangtenda
    if %errorlevel% neq 0 (
        echo.
        echo [INFO] Jika belum login Firebase di PC ini, silakan login terlebih dahulu:
        call npx firebase-tools login
        call npx firebase-tools deploy --only hosting:gemilangtenda --project kafilasuci3
    )
)

echo.
echo ============================================================================
echo   SELESAI! APLIKASI SUDAH AKTIF DI:
echo   - Web Profil Klien    : https://gemilangtenda.web.app
echo   - Akses Kasir & Agenda: https://gemilangtenda.web.app/app
echo ============================================================================
pause
