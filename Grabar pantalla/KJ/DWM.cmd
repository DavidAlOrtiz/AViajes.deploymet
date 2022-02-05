@echo off
cls

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7
title K.J
mode con cols=40 lines=10
cls
echo.
echo 1) Install Windows 7 DWM Aero glass
echo.
echo 2) Remove  Windows 7 DWM Aero glass
echo.
echo X) Exit
echo.

:_set
set _ok=
set /p _ok=.  Enter your choice :
if "%_ok%" == "1" GOTO:INSTALL
if "%_ok%" == "2" GOTO:UNINSTALL
if "%_ok%" == "x" GOTO:END
if "%_ok%" == "X" GOTO:END
GOTO:MAIN

:INSTALL
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "7" >nul
IF ERRORLEVEL 0 GOTO:DWM1
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "R2" >nul
IF ERRORLEVEL 0 GOTO:DWM1
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "Windows Embedded Standard" >nul
IF ERRORLEVEL 0 GOTO:DWM1
GOTO:END

:UNINSTALL
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "7" >nul
IF ERRORLEVEL 0 GOTO:DWM2
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "R2" >nul
IF ERRORLEVEL 0 GOTO:DWM2
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "Windows Embedded Standard" >nul
IF ERRORLEVEL 0 GOTO:DWM2
GOTO:END

:DWM1
cls
if exist %Windir%\Sysnative\cmd.exe GOTO:DWM5 
if exist %Windir%\SysWOW64\cmd.exe GOTO:DWM3 
cls
echo.
echo Please wait...
net stop UxSms>nul
takeown /f %Windir%\System32\LogFiles\WMI\RtBackup /r /d y>nul
takeown /f %Windir%\System32\dwm.exe>nul
takeown /f %Windir%\System32\uDWM.dll>nul

icacls %Windir%\System32\LogFiles\WMI\RtBackup /t /grant *S-1-5-32-544:F>nul
icacls %Windir%\System32\dwm.exe /grant *S-1-5-32-544:F>nul
icacls %Windir%\System32\uDWM.dll /grant *S-1-5-32-544:F>nul
cls
copy DWM\x86\dwm.exe %Windir%\System32\dwm.exe
copy DWM\x86\uDWM.dll %Windir%\System32\uDWM.dll
call %Windir%\System32\regedt32.exe /s dwm\DWM.reg
ping -n 2 localhost >nul
cls
echo.
echo Successfully
ping -n 2 localhost >nul
net start UxSms>nul
GOTO:END

:DWM2
cls
if exist %Windir%\Sysnative\cmd.exe GOTO:DWM6
if exist %Windir%\SysWOW64\cmd.exe GOTO:DWM4
cls
echo.
echo Please wait...
net stop UxSms>nul
takeown /f %Windir%\System32\LogFiles\WMI\RtBackup /r /d y>nul
takeown /f %Windir%\System32\dwm.exe>nul
takeown /f %Windir%\System32\uDWM.dll>nul

icacls %Windir%\System32\LogFiles\WMI\RtBackup /t /grant *S-1-5-32-544:F>nul
icacls %Windir%\System32\dwm.exe /grant *S-1-5-32-544:F>nul
icacls %Windir%\System32\uDWM.dll /grant *S-1-5-32-544:F>nul
cls
copy DWM\x86\original\dwm.exe %Windir%\System32\dwm.exe
copy DWM\x86\original\uDWM.dll %Windir%\System32\uDWM.dll
call %Windir%\System32\regedt32.exe /s dwm\DWMR.reg
ping -n 2 localhost >nul
cls
echo.
echo Successfully
ping -n 2 localhost >nul
net start UxSms>nul
GOTO:END

:DWM3
cls
echo.
echo Please wait...
net stop UxSms>nul
takeown /f %Windir%\System32\LogFiles\WMI\RtBackup /r /d y>nul
takeown /f %Windir%\System32\dwm.exe>nul
takeown /f %Windir%\System32\uDWM.dll>nul

icacls %Windir%\System32\LogFiles\WMI\RtBackup /t /grant *S-1-5-32-544:F>nul
icacls %Windir%\System32\dwm.exe /grant *S-1-5-32-544:F>nul
icacls %Windir%\System32\uDWM.dll /grant *S-1-5-32-544:F>nul
cls
copy DWM\x64\dwm.exe %Windir%\System32\dwm.exe
copy DWM\x64\uDWM.dll %Windir%\System32\uDWM.dll
call %Windir%\System32\regedt32.exe /s dwm\DWM.reg
ping -n 2 localhost >nul
cls
echo.
echo Successfully
ping -n 2 localhost >nul
net start UxSms>nul
GOTO:END

:DWM4
cls
echo.
echo Please wait...
net stop UxSms>nul
takeown /f %Windir%\System32\LogFiles\WMI\RtBackup /r /d y>nul
takeown /f %Windir%\System32\dwm.exe>nul
takeown /f %Windir%\System32\uDWM.dll>nul

icacls %Windir%\System32\LogFiles\WMI\RtBackup /t /grant *S-1-5-32-544:F>nul
icacls %Windir%\System32\dwm.exe /grant *S-1-5-32-544:F>nul
icacls %Windir%\System32\uDWM.dll /grant *S-1-5-32-544:F>nul
cls
copy DWM\x64\original\dwm.exe %Windir%\System32\dwm.exe
copy DWM\x64\original\uDWM.dll %Windir%\System32\uDWM.dll
call %Windir%\System32\regedt32.exe /s dwm\DWMR.reg
ping -n 2 localhost >nul
cls
echo.
echo Successfully
ping -n 2 localhost >nul
net start UxSms>nul
GOTO:END

:DWM5
cls
echo.
echo Please wait...
net stop UxSms>nul
takeown /f %Windir%\Sysnative\LogFiles\WMI\RtBackup /r /d y>nul
takeown /f %Windir%\Sysnative\dwm.exe>nul
takeown /f %Windir%\Sysnative\uDWM.dll>nul

icacls %Windir%\Sysnative\LogFiles\WMI\RtBackup /t /grant *S-1-5-32-544:F>nul
icacls %Windir%\Sysnative\dwm.exe /grant *S-1-5-32-544:F>nul
icacls %Windir%\Sysnative\uDWM.dll /grant *S-1-5-32-544:F>nul
cls
copy DWM\x64\dwm.exe %Windir%\Sysnative\dwm.exe
copy DWM\x64\uDWM.dll %Windir%\Sysnative\uDWM.dll
call %Windir%\Sysnative\regedt32.exe /s dwm\DWM.reg
ping -n 2 localhost >nul
cls
echo.
echo Successfully
ping -n 2 localhost >nul
net start UxSms>nul
GOTO:END

:DWM6
cls
echo.
echo Please wait...
net stop UxSms>nul
takeown /f %Windir%\Sysnative\LogFiles\WMI\RtBackup /r /d y>nul
takeown /f %Windir%\Sysnative\dwm.exe>nul
takeown /f %Windir%\Sysnative\uDWM.dll>nul

icacls %Windir%\Sysnative\LogFiles\WMI\RtBackup /t /grant *S-1-5-32-544:F>nul
icacls %Windir%\Sysnative\dwm.exe /grant *S-1-5-32-544:F>nul
icacls %Windir%\Sysnative\uDWM.dll /grant *S-1-5-32-544:F>nul
cls
copy DWM\x64\original\dwm.exe %Windir%\Sysnative\dwm.exe
copy DWM\x64\original\uDWM.dll %Windir%\Sysnative\uDWM.dll
call %Windir%\Sysnative\regedt32.exe /s dwm\DWMR.reg
ping -n 2 localhost >nul
cls
echo.
echo Successfully
ping -n 2 localhost >nul
net start UxSms>nul
GOTO:END

:END
EXIT







