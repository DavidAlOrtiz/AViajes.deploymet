@echo off
cls
IF EXIST %Windir%\Sysnative\sppsvc.exe set SysPath=%Windir%\Sysnative
IF EXIST %Windir%\System32\sppsvc.exe  set SysPath=%Windir%\System32

:MAIN
title K.J
mode con cols=30 lines=8
cls
echo.
echo 1) System File Restore
echo.
echo X) Exit
echo.

:_set
set _ok=
set /p _ok=.  Enter your choice :
if "%_ok%" == "1" GOTO:RES
if "%_ok%" == "x" GOTO:END
if "%_ok%" == "X" GOTO:END
GOTO:MAIN

:RES
title  K.J  System File Restore
mode con cols=70 lines=12
cls
echo.
echo Please wait...
echo.

call %SysPath%\sfc.exe /scannow
pause
cls
echo.
echo Successfully
ping -n 2 localhost >nul
GOTO:END

:END
EXIT
