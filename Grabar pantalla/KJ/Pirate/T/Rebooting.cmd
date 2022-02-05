@echo off
pushd %~dp0
taskkill /t /f /im wat.exe
if exist %Windir%\Temp takeown /F %Windir%\Temp /r /d y >nul && icacls %Windir%\Temp /t /grant everyone:f >nul
if exist %Windir%\Prefetch takeown /F %Windir%\Prefetch /r /d y && icacls %Windir%\Prefetch /t /grant everyone:f
rd /s /q %Temp%
echo y | del %Windir%\Prefetch\*.* >nul
if not exist %Temp% md %Temp%
if not exist %Windir%\Prefetch md %Windir%\Prefetch
if exist %Windir%\Sysnative\sppsvc.exe call %Windir%\Sysnative\shutdown.exe /t 0 /r >nul
if exist %Windir%\System32\sppsvc.exe  call %Windir%\System32\shutdown.exe /t 0 /r >nul
rd /s /q %Windir%\Temp && if not exist %Windir%\Temp md %Windir%\Temp  
exit
















