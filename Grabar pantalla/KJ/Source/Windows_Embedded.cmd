@echo off
pushd %~dp0

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Embedded" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7
echo Windows Embedded Installing key
echo Please wait...
echo.

if exist %Windir%\System32\wlms\wlms.exe tasklist /fi "imagename eq wlms.exe" 2>nul | find /i /n "wlms.exe" >nul && taskkill /t /f /im wlms.exe 1>nul 2>nul && echo       status: OK
if exist %Windir%\System32\wlms\wlms.exe takeown /F %Windir%\System32\wlms\wlms.exe >nul 
if exist %Windir%\System32\wlms\wlms.exe icacls %Windir%\System32\wlms\wlms.exe /deny *S-1-5-32-544:F
if exist %Windir%\Sysnative\wlms\wlms.exe tasklist /fi "imagename eq wlms.exe" 2>nul | find /i /n "wlms.exe" >nul && taskkill /t /f /im wlms.exe 1>nul 2>nul && echo       status: OK
if exist %Windir%\Sysnative\wlms\wlms.exe takeown /F %Windir%\Sysnative\wlms\wlms.exe >nul 
if exist %Windir%\Sysnative\wlms\wlms.exe icacls %Windir%\Sysnative\wlms\wlms.exe /deny *S-1-5-32-544:F
cscript //nologo %Windir%\System32\slmgr.vbs -ilc SPP\pkeyconfig-embedded.xrm-ms >nul
cscript //nologo %Windir%\System32\slmgr.vbs -ilc SPP\Security-SPP-Component-SKU-Embedded-VLBA-ul.xrm-ms >nul
cscript //nologo %Windir%\System32\slmgr.vbs -ilc SPP\Security-SPP-Component-SKU-Embedded-VLBA-ul-oob.xrm-ms >nul
cscript //nologo %Windir%\System32\slmgr.vbs -ipk XGY72-BRBBT-FF8MH-2GG8H-W7KCW >nul
GOTO:END

:END
EXIT /B







