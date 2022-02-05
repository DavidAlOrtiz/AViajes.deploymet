@echo off
pushd %~dp0

:_Office.dat
cls
echo Please wait ...
1>nul 2>&1 REG QUERY "HKLM\SOFTWARE\Microsoft\Office\14.0" /s
IF ERRORLEVEL 1 goto _end

start /i Pleasewait.vbs
cscript //Nologo Pleasewait_v.vbs

net stop osppsvc >nul
start /i Officetokens.lnk
taskkill /f /im wscript.exe >nul
start /i Successful.vbs
cscript //Nologo Successful_v.vbs
ping 127.0.0.1 -n 1 >nul
taskkill /f /im wscript.exe >nul
goto _end

:_end
exit