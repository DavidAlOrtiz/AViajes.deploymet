@echo off
pushd %~dp0
cls

:_main
title K.J
mode con cols=30 lines=10
cls
echo.
echo 1) Hibernation ON
echo.
echo 2) Hibernation OFF
echo.
echo X) Exit
echo.

:_set
set _ok=
set /p _ok=.  Enter your choice :
if "%_ok%" == "1" goto _HibernationON
if "%_ok%" == "2" goto _HibernationOFF
if "%_ok%" == "x" goto _end
if "%_ok%" == "X" goto _end
goto _main


:_HibernationON
cls
echo Please wait ...
ping -n 2 localhost >nul
cls
powercfg.exe /hibernate on
ping -n 2 localhost >nul
cls
goto _end

:_HibernationOFF
cls
echo Please wait ...
ping -n 2 localhost >nul
cls
powercfg.exe /hibernate off
ping -n 2 localhost >nul
cls
goto _end

:_end
cls
exit