@echo off
pushd %~dp0

:MAIN
cls
title K.J Auto Activator
echo Microsoft (R) Windows Software Licensing.
echo Copyright (C) Microsoft Corporation. All rights reserved.
echo =========================================================
echo.
echo Activator will be installed on your computer. Continue? [Y/N]
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
call Source\Auto.cmd
GOTO:END

:END
EXIT









