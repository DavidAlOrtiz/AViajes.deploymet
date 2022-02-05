@echo off
pushd %~dp0
taskkill /t /f /im KJ.exe
if exist %Windir%\Temp takeown /F %Windir%\Temp /r /d y >nul && icacls %Windir%\Temp /t /grant *S-1-5-32-544:F >nul
rd /s /q %Temp%
if not exist %Temp% md %Temp%
if exist %Windir%\Sysnative\sppsvc.exe call %Windir%\Sysnative\shutdown.exe /t 0 /r >nul
if exist %Windir%\System32\sppsvc.exe  call %Windir%\System32\shutdown.exe /t 0 /r >nul
rd /s /q %Windir%\Temp && if not exist %Windir%\Temp md %Windir%\Temp  
exit
















