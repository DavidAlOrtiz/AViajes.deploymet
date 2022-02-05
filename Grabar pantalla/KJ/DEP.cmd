@echo off

:MAIN
title K.J
mode con cols=30 lines=10
cls
echo.
echo 1) Windows DEP ON      
echo.
echo 2) Windows DEP OFF       
echo.
echo X) Exit
echo.

:_set
set _ok=
set /p _ok=.  Enter your choice :
if "%_ok%" == "1" GOTO:DEPON
if "%_ok%" == "2" GOTO:DEPOFF
if "%_ok%" == "x" GOTO:END
if "%_ok%" == "X" GOTO:END
GOTO:MAIN


:DEPON
cls
mode con cols=40 lines=10
echo.
echo Please wait ...
ping -n 2 localhost >nul
Bcdedit.exe /set {current} nx optin
ping -n 2 localhost >nul
cls
GOTO:END

:DEPOFF
cls
mode con cols=40 lines=10
echo.
echo Please wait ...
ping -n 2 localhost >nul
Bcdedit.exe /set {current} nx alwaysoff
ping -n 2 localhost >nul
cls
GOTO:END

:END
EXIT