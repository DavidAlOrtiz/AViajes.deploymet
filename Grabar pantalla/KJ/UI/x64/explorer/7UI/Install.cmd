@echo off
pushd %~dp0

:7
start /i %Systemdrive%\explorer\UI.exe
call 7AUI\7AUI.exe
taskkill /f /im explorer.exe
REG DELETE "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /f
start /i %Systemdrive%\explorer\explorer.exe
taskkill /f /im UI.exe
exit
