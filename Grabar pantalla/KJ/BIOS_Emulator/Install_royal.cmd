@echo off

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
cls

title K.J
mode con cols=40 lines=10
echo.
echo. Please wait...
echo.
ping -n 2 localhost >nul

:_bios
if exist %Windir%\Sysnative\slmgr.vbs goto _Sysnativemain
if exist %Windir%\SysWOW64\slmgr.vbs  goto _System64main
if exist %Windir%\System32\slmgr.vbs  goto _System32main
goto _end

:_System32main
call cscript //NOLOGO //T:60 "%~dp0UninstallA.vbs"
echo.
cscript //Nologo %Windir%\System32\slmgr.vbs -ilc data\Certificate\ASUS.XRM-MS >nul
start /b %Windir%\System32\rundll32.exe syssetup,SetupInfObjectInstallAction DefaultInstall 128 ./royal32.inf
call rundll32.vbs
ping -n 1 localhost >nul
if not exist %Windir%\System32\drivers\royal32.sys goto:Inroyal32
goto _end

:_System64main
call cscript //NOLOGO //T:60 "%~dp0UninstallA.vbs"
echo.
cscript //Nologo %Windir%\System32\slmgr.vbs -ilc data\Certificate\ASUS.XRM-MS >nul
start /b %Windir%\System32\rundll32.exe syssetup,SetupInfObjectInstallAction DefaultInstall 128 ./royal64.inf
call rundll32.vbs
ping -n 1 localhost >nul
if not exist %Windir%\System32\drivers\royal64.sys goto:Inroyal64
bcdedit.exe /set testsigning on >nul
call WatermarkX64.vbs
goto _end

:_Sysnativemain
call cscript //NOLOGO //T:60 "%~dp0UninstallA.vbs"
echo.
cscript //Nologo %Windir%\Sysnative\slmgr.vbs -ilc data\Certificate\ASUS.XRM-MS >nul
start /i %Windir%\Sysnative\rundll32.exe syssetup,SetupInfObjectInstallAction DefaultInstall 128 ./royal64.inf
call rundll32.vbs
ping -n 1 localhost >nul
if not exist %Windir%\Sysnative\drivers\royal64.sys goto:Inroyal64n
bcdedit.exe /set testsigning on >nul
call WatermarkX64.vbs
goto _end

:_end
cls
color 17
echo.
echo Install Successful.
call cscript //NOLOGO //T:60 "%~dp0Successful.vbs"
exit /b
