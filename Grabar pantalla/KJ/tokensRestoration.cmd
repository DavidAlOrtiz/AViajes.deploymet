@echo off
pushd %~dp0

if exist "%Windir%\System32\tokens\tokens"  goto:Install
if exist "%Windir%\Sysnative\tokens\tokens" goto:Install
exit

:Install

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "R2" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Vista" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7
if exist %Windir%\Sysnative\sppsvc.exe goto:Install_7Sysnative
echo Windows 7 tokens.dat Optimization Restore 
echo Please wait...
echo.
sc start sppsvc /y >nul
net stop sppsvc /y
if exist "%Windir%\System32\tokens\tokens" xcopy /cheriky "%Windir%\System32\tokens\tokens" "%Windir%\System32\spp\tokens"  >nul
if exist "%Windir%\System32\tokens\SoftwareProtectionPlatform" xcopy /cheriky "%Windir%\System32\tokens\SoftwareProtectionPlatform" "%Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform"
echo.
echo Please wait...
cscript //nologo %Windir%\System32\slmgr.vbs -dlv >nul
start /i %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform
GOTO:END

:Install_R2
if exist %Windir%\Sysnative\sppsvc.exe goto:Install_R2Sysnative
echo Server R2 tokens.dat Optimization Restore 
echo Please wait...
echo.
sc start sppsvc /y >nul
net stop sppsvc /y
if exist "%Windir%\System32\tokens\tokens" xcopy /cheriky "%Windir%\System32\tokens\tokens" "%Windir%\System32\spp\tokens"  >nul
if exist "%Windir%\System32\tokens\SoftwareProtectionPlatform" xcopy /cheriky "%Windir%\System32\tokens\SoftwareProtectionPlatform" "%Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform"
echo Please wait...
cscript //nologo %Windir%\System32\slmgr.vbs -dlv >nul
start /i %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform
GOTO:END

:Install_7Sysnative
echo Windows 7 tokens.dat Optimization Restore 
echo Please wait...
echo.
sc start sppsvc /y >nul
net stop sppsvc /y
if exist "%Windir%\Sysnative\tokens\tokens" xcopy /cheriky "%Windir%\Sysnative\tokens\tokens" "%Windir%\Sysnative\spp\tokens"  >nul
if exist "%Windir%\Sysnative\tokens\SoftwareProtectionPlatform" xcopy /cheriky "%Windir%\Sysnative\tokens\SoftwareProtectionPlatform" "%Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform"
echo.
echo Please wait...
cscript //nologo %Windir%\Sysnative\slmgr.vbs -dlv >nul
start /i %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform
GOTO:END

:Install_R2Sysnative
echo Server R2 tokens.dat Optimization Restore 
echo Please wait...
echo.
sc start sppsvc /y >nul
net stop sppsvc /y
if exist "%Windir%\Sysnative\tokens\tokens" xcopy /cheriky "%Windir%\Sysnative\tokens\tokens" "%Windir%\Sysnative\spp\tokens"  >nul
if exist "%Windir%\Sysnative\tokens\SoftwareProtectionPlatform" xcopy /cheriky "%Windir%\Sysnative\tokens\SoftwareProtectionPlatform" "%Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform"
echo Please wait...
cscript //nologo %Windir%\Sysnative\slmgr.vbs -dlv >nul
start /i %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform
GOTO:END

:END
EXIT
