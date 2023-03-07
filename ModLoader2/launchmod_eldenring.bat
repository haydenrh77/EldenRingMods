@echo off
xcopy ".\c.dll" "..\dinput8.dll*"
echo "Don't close this window. It will automatically close a few seconds after Elden Ring closes.
.\modengine2_launcher.exe -t er -c .\config_eldenring.toml

:check_process_running
timeout /t 10 /nobreak >nul 2>&1 
tasklist /NH /FI "IMAGENAME eq eldenring.exe" 2>nul | find /I /N "eldenring.exe">nul 
if not "%ERRORLEVEL%"=="1" goto check_process_running
del "..\dinput8.dll"
del /s /q ..\mods
@RD /S /Q "..\mods"
del .\config_eldenring.toml
exit