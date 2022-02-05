@echo off
pushd %~dp0

mode con cols=19 lines=2

start /i UI\UI.exe

Set SC=%Windir%\system32\sc.exe
set par=%~1
set par=%par:/=%
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 
SET RQL=%RC% QUERY "HKEY_CURRENT_USER\Control Panel\International" /v "sLanguage"
SET RQB=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "BuildLab"
SET INL=IF NOT ERRORLEVEL 1
cls

:Check1
%RQB% | findstr /I "9200" && %INL% goto _Install
goto:fail

:_Install
if /i "%par%" == "E" GOTO:E
if /i "%par%" == "D" GOTO:D
exit

:E
cls
echo.  Please wait ...
regedit /s LSLAO\Enable_Launcher_SessionLoginAnimation_OnShow.reg
goto _end

:D
cls
echo.  Please wait ...
regedit /s LSLAO\Disable_Launcher_SessionLoginAnimation_OnShow.reg
goto _end

:_end
ping 127.0.0.1 -n 2 >nul
taskkill /f /im UI.exe
start /i LSLAO\ShowStartScreen.exe
exit

:fail
ping 127.0.0.1 -n 2 >nul
taskkill /f /im UI.exe
call Failed.exe
exit
