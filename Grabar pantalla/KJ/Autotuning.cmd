@echo off
pushd %~dp0
cls

:_main
title K.J
mode con cols=30 lines=10
cls
echo.
echo 1) Highlyrestricted
echo 2) Restricted
echo 3) Normal
echo 4) Disabled
echo X) Exit
echo.

:_set
set _ok=
set /p _ok=.  Enter your choice :
if "%_ok%" == "1" goto _Highlyrestricted
if "%_ok%" == "2" goto _Restricted
if "%_ok%" == "3" goto _Normal
if "%_ok%" == "4" goto _Disabled
if "%_ok%" == "x" goto _end
if "%_ok%" == "X" goto _end
goto _main

:_Highlyrestricted
cls
echo Plese wait ...
if not exist %Windir%\Sysnative\netsh.exe call %Windir%\System32\netsh.exe interface tcp set global autotuninglevel=highlyrestricted
if exist %Windir%\Sysnative\netsh.exe     call %Windir%\Sysnative\netsh.exe interface tcp set global autotuninglevel=highlyrestricted
ping -n 3 localhost >nul
goto _end

:_Restricted
cls
echo Plese wait ...
if not exist %Windir%\Sysnative\netsh.exe call %Windir%\System32\netsh.exe interface tcp set global autotuninglevel=restricted
if exist %Windir%\Sysnative\netsh.exe     call %Windir%\Sysnative\netsh.exe interface tcp set global autotuninglevel=restricted
ping -n 3 localhost >nul
goto _end

:_Normal
cls
echo Plese wait ...
if not exist %Windir%\Sysnative\netsh.exe call %Windir%\System32\netsh.exe interface tcp set global autotuninglevel=normal
if exist %Windir%\Sysnative\netsh.exe     call %Windir%\Sysnative\netsh.exe interface tcp set global autotuninglevel=normal
ping -n 3 localhost >nul
goto _end

:_Disabled
cls
echo Plese wait ...
if not exist %Windir%\Sysnative\netsh.exe call %Windir%\System32\netsh.exe interface tcp set global autotuninglevel=disabled
if exist %Windir%\Sysnative\netsh.exe     call %Windir%\Sysnative\netsh.exe interface tcp set global autotuninglevel=disabled
ping -n 3 localhost >nul
goto _end

:_end
cls
exit