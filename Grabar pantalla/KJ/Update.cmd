@echo off
pushd %~dp0
cls

:_main
title K.J
mode con cols=30 lines=11
cls
echo.
echo 1) Backup  Windows Update Log
echo 2) Remove  Windows Update Log
echo 3) Restore Windows Update Log
echo.
echo 4) WMI Patch 
echo.
echo X) Exit
echo.

:_set
set _ok=
set /p _ok=.  Enter your choice :
if "%_ok%" == "1" goto _Backup
if "%_ok%" == "2" goto _Remove
if "%_ok%" == "3" goto _Restore
if "%_ok%" == "4" goto _WMI
if "%_ok%" == "x" goto _end
if "%_ok%" == "X" goto _end
goto _main

:_Backup
cls
echo Please wait ...
sc stop wuauserv >nul
ping -n 2 localhost >nul
copy %Windir%\SoftwareDistribution\DataStore\DataStore.edb %Windir%\SoftwareDistribution\DataStore\DataStore.edb.bak >nul
echo Backup  Windows Update Log
ping -n 3 localhost >nul
sc start wuauserv >nul
goto _main

:_Remove
cls
echo Please wait ...
sc stop wuauserv >nul
ping -n 2 localhost >nul
echo y | del %Windir%\SoftwareDistribution\DataStore\DataStore.edb >nul
echo Remove  Windows Update Log
ping -n 3 localhost >nul
sc start wuauserv >nul
call %Windir%\system32\Wuauclt.exe /showwindowsupdate
goto _main

:_Restore
cls
echo Please wait ...
sc stop wuauserv >nul
ping -n 2 localhost >nul
copy %Windir%\SoftwareDistribution\DataStore\DataStore.edb.bak %Windir%\SoftwareDistribution\DataStore\DataStore.edb >nul
echo Restore Windows Update Log
ping -n 3 localhost >nul
sc start wuauserv >nul
goto _main

:_WMI
cls
echo.
echo WMI Patch
echo Please wait...
echo.
ping -n 2 localhost >nul

cd /d WMIPatch
call Patch.vbs
cd /d %ScriptPath%
echo.
echo Successfully
ping -n 2 localhost >nul
goto _main

:_end
cls
exit