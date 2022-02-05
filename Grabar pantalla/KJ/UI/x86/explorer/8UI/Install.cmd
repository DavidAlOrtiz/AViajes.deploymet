@echo off
pushd %~dp0

:8
start /i %Systemdrive%\explorer\UI.exe
call 8AUI\8AUI.exe
taskkill /f /im explorer.exe
REG DELETE "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /f
start /i %Windir%\explorer.exe
ping 127.0.0.1 -n 4 >nul
taskkill /f /im UI.exe
exit
