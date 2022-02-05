@echo off
pushd %~dp0

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Emdedded" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7
echo Windows Emdedded Installing key
echo Please wait...
echo.

::setup parameters::
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 

%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Embedded Standard" >nul
IF ERRORLEVEL 1 GOTO:END
start /i Pleasewait_k.vbs
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
taskkill /f /im wscript.exe >nul
start /i Successful_k.vbs
ping 127.0.0.1 -n 2 >nul
taskkill /f /im wscript.exe >nul
call %Windir%\System32\slmgr.vbs -dlv
GOTO:END

:END
EXIT







