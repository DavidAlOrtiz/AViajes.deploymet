@echo off
pushd %~dp0

:MAIN
cls
title K.J Remover
echo Microsoft (R) Windows Software Licensing.
echo Copyright (C) Microsoft Corporation. All rights reserved.
echo =========================================================
echo.
echo Activator will be Uninstalled on your computer. Continue? [Y/N]
echo.

:_set
set _ok=
set /p _ok=Enter your choice :
if "%_ok%" == "y" GOTO:INSTALL
if "%_ok%" == "Y" GOTO:INSTALL
if "%_ok%" == "n" GOTO:END
if "%_ok%" == "N" GOTO:END
if "%_ok%" == "e" GOTO:END
if "%_ok%" == "E" GOTO:END
GOTO:MAIN

:INSTALL
echo.
echo. Please wait ...
copy /y "KJ_Remover\KJ_Remover.exe" "%Temp%\KJ_Remover.exe" >nul
copy /y "Uninstall.vbs" "%Temp%\Uninstall.vbs" >nul
ping 127.0.0.1 -n 2 >nul
cd /d %Temp% 
call Uninstall.vbs 
GOTO:END

:END
EXIT

