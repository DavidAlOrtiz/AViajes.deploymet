@echo off
pushd %~dp0

net stop sppsvc >nul
cls

SET ScriptPath=%~dp0
IF EXIST %Windir%\Sysnative\sppsvc.exe set SysPath=%Windir%\Sysnative
IF EXIST %Windir%\System32\sppsvc.exe  set SysPath=%Windir%\System32
SET RC=%SysPath%\reg.exe
SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 
SET RQL=%RC% QUERY "HKEY_CURRENT_USER\Control Panel\International" /v "sLanguage"
SET RQN=%RC% QUERY "HKEY_CURRENT_USER\Control Panel\International" /v "LocaleName"
SET RQB=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "BuildLab"
SET INL=IF NOT ERRORLEVEL 1
SET INH=IF ERRORLEVEL 1

:Check1
%RQB% | findstr /I "9200" && %INL% GOTO:VOLUME
exit

:VOLUME
cls
echo.
echo. Working, Please wait ...
if exist "%Systemdrive%\Program Files\VMware\VMware Tools" GOTO:VM
cscript //nologo P\x64\slmgr.vbs -dlv >check
find /i "VOLUME" >nul check && GOTO:INSTALL

%RQR% | findstr /I "Enterprise" >nul       && %INL% SET PIDKEY=32JNW-9KQ84-P47T8-D8GGY-CWCK7 && GOTO:KEY
%RQR% | findstr /I "ProfessionalWMC" >nul  && %INL% SET PIDKEY=GNBB8-YVD74-QJHX6-27H4K-8QHDG && GOTO:KEY
%RQR% | findstr /I "Professional" >nul     && %INL% SET PIDKEY=NG4HW-VH26C-733KW-K6F98-J8CK4 && GOTO:KEY
%RQR% | findstr /I "Core" >nul             && %INL% SET PIDKEY=BN3D2-R7TKB-3YPBD-8DRP2-27GG4 && GOTO:KEY
%RQR% | findstr /I "ServerDatacenter" >nul && %INL% SET PIDKEY=48HP8-DN98B-MYWDG-T2DCC-8W83P && GOTO:KEY
%RQR% | findstr /I "ServerStandard" >nul   && %INL% SET PIDKEY=XC9B7-NBPP2-83J2H-RHMBY-92BT4 && GOTO:KEY
GOTO:KEY

:KEY
echo.
echo. Installing Product key ...
cscript //nologo P\x64\slmgr.vbs -ipk %PIDKEY%
GOTO:INSTALL

:VM
%RQR% | findstr /I "Enterprise" >nul       && %INL% GOTO:Enterprise
%RQR% | findstr /I "ProfessionalWMC" >nul  && %INL% GOTO:ProfessionalWMC
%RQR% | findstr /I "Professional" >nul     && %INL% GOTO:Professional
%RQR% | findstr /I "Core" >nul             && %INL% GOTO:Core
%RQR% | findstr /I "ServerDatacenter" >nul && %INL% GOTO:ServerDatacenter
%RQR% | findstr /I "ServerStandard" >nul   && %INL% GOTO:ServerStandard
GOTO:INSTALL

:Enterprise
echo.
echo. Installing Product key ...
if exist %SysPath%\spp\store   takeown /f %SysPath%\spp\store /r /d y >nul  && icacls %SysPath%\spp\store /t  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  takeown /f %SysPath%\sppsvc.exe >nul  && icacls %SysPath%\sppsvc.exe  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  xcopy tokens\Enterprise\store %SysPath%\spp\store /cheriky >nul
cscript //nologo P\x64\slmgr.vbs -ipk BYXV8-9YN72-VTF7H-8G7PT-WW8X2
GOTO:INSTALL

:ProfessionalWMC
echo.
echo. Installing Product key ...
if exist %SysPath%\spp\store   takeown /f %SysPath%\spp\store /r /d y >nul  && icacls %SysPath%\spp\store /t  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  takeown /f %SysPath%\sppsvc.exe >nul  && icacls %SysPath%\sppsvc.exe  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  xcopy tokens\ProfessionalWMC\store %SysPath%\spp\store /cheriky >nul
cscript //nologo P\x64\slmgr.vbs -ipk GGKFW-TBH8R-H8R6B-NDT88-K2BRQ
GOTO:INSTALL

:Professional
echo.
echo. Installing Product key ...
if exist %SysPath%\spp\store   takeown /f %SysPath%\spp\store /r /d y >nul  && icacls %SysPath%\spp\store /t  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  takeown /f %SysPath%\sppsvc.exe >nul  && icacls %SysPath%\sppsvc.exe  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  xcopy tokens\Professional\store %SysPath%\spp\store  /cheriky
cscript //nologo P\x64\slmgr.vbs -ipk BYXV8-9YN72-VTF7H-8G7PT-WW8X2
GOTO:INSTALL

:Core
echo.
echo. Installing Product key ...
if exist %SysPath%\spp\store   takeown /f %SysPath%\spp\store /r /d y >nul  && icacls %SysPath%\spp\store /t  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  takeown /f %SysPath%\sppsvc.exe >nul  && icacls %SysPath%\sppsvc.exe  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  xcopy tokens\core\store %SysPath%\spp\store /cheriky >nul
cscript //nologo P\x64\slmgr.vbs -ipk NY87D-VCK7D-WM77C-K77V8-RX49Q
GOTO:INSTALL

:ServerDatacenter
echo.
echo. Installing Product key ...
if exist %SysPath%\spp\store   takeown /f %SysPath%\spp\store /r /d y >nul  && icacls %SysPath%\spp\store /t  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  takeown /f %SysPath%\sppsvc.exe >nul  && icacls %SysPath%\sppsvc.exe  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  xcopy tokens\ServerDatacenter\store %SysPath%\spp\store /cheriky >nul
cscript //nologo P\x64\slmgr.vbs -ipk YM4RP-NCTMJ-3C27D-XMT9Y-7MFG9
dism /online /enable-feature /all /featurename:DesktopExperience >nul
GOTO:INSTALL

:ServerStandard
echo.
echo. Installing Product key ...
if exist %SysPath%\spp\store   takeown /f %SysPath%\spp\store /r /d y >nul  && icacls %SysPath%\spp\store /t  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  takeown /f %SysPath%\sppsvc.exe >nul  && icacls %SysPath%\sppsvc.exe  /grant *S-1-5-32-544:F >nul
if exist %SysPath%\sppsvc.exe  xcopy tokens\ServerStandard\store %SysPath%\spp\store /cheriky >nul
cscript //nologo P\x64\slmgr.vbs -ipk 3VRVH-WN6MX-7H4BH-T8GJC-D669J
dism /online /enable-feature /all /featurename:DesktopExperience >nul
GOTO:INSTALL

:INSTALL
if exist %Windir%\SysWOW64\cmd.exe goto _System64main

:_System32main
set i=0
set mui=ar-SA
:mui32
if not exist %SysPath%\%mui%\sppsvc.exe.mui goto:muiset32
takeown /f %Temp% /r /d y >nul && icacls %Temp% /t /grant *S-1-5-32-544:F >nul
if exist %Windir%\ImmersiveControlPanel takeown /f %Windir%\ImmersiveControlPanel /r /d y >nul 
if exist %Windir%\ImmersiveControlPanel icacls %Windir%\ImmersiveControlPanel /t /grant *S-1-5-32-544:F >nul
if exist %SysPath%\%mui%\ActionCenter.dll.mui  takeown /f %SysPath%\%mui%\ActionCenter.dll.mui >nul
if exist %SysPath%\%mui%\GenuineCenter.dll.mui takeown /f %SysPath%\%mui%\GenuineCenter.dll.mui >nul
if exist %SysPath%\%mui%\systemcpl.dll.mui     takeown /f %SysPath%\%mui%\systemcpl.dll.mui >nul
if exist %Windir%\ImmersiveControlPanel\%mui% takeown /f %Windir%\ImmersiveControlPanel\%mui% /r /d y >nul
if exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui takeown /f %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui >nul

if exist %SysPath%\%mui%\ActionCenter.dll.mui  icacls %SysPath%\%mui%\ActionCenter.dll.mui /grant *S-1-5-32-544:F >nul
if exist %SysPath%\%mui%\GenuineCenter.dll.mui icacls %SysPath%\%mui%\GenuineCenter.dll.mui /grant *S-1-5-32-544:F >nul
if exist %SysPath%\%mui%\systemcpl.dll.mui     icacls %SysPath%\%mui%\systemcpl.dll.mui /grant *S-1-5-32-544:F >nul
if exist %Windir%\ImmersiveControlPanel\%mui% icacls %Windir%\ImmersiveControlPanel\%mui% /t /grant *S-1-5-32-544:F >nul
if exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui icacls %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui /grant *S-1-5-32-544:F >nul

if exist %SysPath%\%mui%\ActionCenter.dll.mui  ren %SysPath%\%mui%\ActionCenter.dll.mui ActionCenter.vvv >nul
if exist %SysPath%\%mui%\GenuineCenter.dll.mui ren %SysPath%\%mui%\GenuineCenter.dll.mui GenuineCenter.vvv >nul
if exist %SysPath%\%mui%\systemcpl.dll.mui     ren %SysPath%\%mui%\systemcpl.dll.mui systemcpl.vvv >nul
if exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui ren %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui SystemSettings.vvv >nul

echo.
echo. Copying %mui% ActionCenter.dll.mui files ...
1>nul 2>nul copy /y T\mui\%mui%\ActionCenter.dll.mui %SysPath%\%mui%\ActionCenter.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% GenuineCenter.dll.mui files ...
1>nul 2>nul copy /y T\mui\%mui%\GenuineCenter.dll.mui %SysPath%\%mui%\GenuineCenter.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% systemcpl.dll.mui files ...
1>nul 2>nul copy /y T\mui\%mui%\systemcpl.dll.mui %SysPath%\%mui%\systemcpl.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% SystemSettings.exe.mui files ...
1>nul 2>nul copy /y T\mui\%mui%\SystemSettings.exe.mui %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error

if not exist %SysPath%\%mui%\ActionCenter.dll.mui  ren %SysPath%\%mui%\ActionCenter.vvv ActionCenter.dll.mui >nul
if not exist %SysPath%\%mui%\GenuineCenter.dll.mui ren %SysPath%\%mui%\GenuineCenter.vvv GenuineCenter.dll.mui >nul
if not exist %SysPath%\%mui%\systemcpl.dll.mui     ren %SysPath%\%mui%\systemcpl.vvv systemcpl.dll.mui >nul
if not exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui ren %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.vvv SystemSettings.exe.mui >nul

if exist %SysPath%\%mui%\ActionCenter.vvv  move %SysPath%\%mui%\ActionCenter.vvv %Temp%\%Random%.tmp >nul
if exist %SysPath%\%mui%\GenuineCenter.vvv move %SysPath%\%mui%\GenuineCenter.vvv %Temp%\%Random%.tmp >nul
if exist %SysPath%\%mui%\systemcpl.vvv     move %SysPath%\%mui%\systemcpl.vvv %Temp%\%Random%.tmp >nul
if exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.vvv move %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.vvv %Temp%\%Random%.tmp >nul

:muiset32
set /A i=i+1
if /i %i% == 1 SET mui=bg-BG&& goto:mui32
if /i %i% == 2 SET mui=cs-CZ&& goto:mui32
if /i %i% == 3 SET mui=da-DK&& goto:mui32
if /i %i% == 4 SET mui=de-DE&& goto:mui32
if /i %i% == 5 SET mui=el-GR&& goto:mui32
if /i %i% == 6 SET mui=en-GB&& goto:mui32
if /i %i% == 7 SET mui=en-US&& goto:mui32
if /i %i% == 8 SET mui=es-ES&& goto:mui32
if /i %i% == 9 SET mui=et-EE&& goto:mui32
if /i %i% == 10 SET mui=fi-FI&& goto:mui32
if /i %i% == 11 SET mui=fr-FR&& goto:mui32
if /i %i% == 12 SET mui=he-IL&& goto:mui32
if /i %i% == 13 SET mui=hr-HR&& goto:mui32
if /i %i% == 14 SET mui=hu-HU&& goto:mui32
if /i %i% == 15 SET mui=it-IT&& goto:mui32
if /i %i% == 16 SET mui=ja-JP&& goto:mui32
if /i %i% == 17 SET mui=ko-KR&& goto:mui32
if /i %i% == 18 SET mui=lv-LV&& goto:mui32
if /i %i% == 19 SET mui=nb-NO&& goto:mui32
if /i %i% == 20 SET mui=nl-NL&& goto:mui32
if /i %i% == 21 SET mui=pl-PL&& goto:mui32
if /i %i% == 22 SET mui=pt-BR&& goto:mui32
if /i %i% == 23 SET mui=pt-PT&& goto:mui32
if /i %i% == 24 SET mui=ro-RO&& goto:mui32
if /i %i% == 25 SET mui=ru-RU&& goto:mui32
if /i %i% == 26 SET mui=sk-SK&& goto:mui32
if /i %i% == 27 SET mui=sl-SI&& goto:mui32
if /i %i% == 28 SET mui=sv-SE&& goto:mui32
if /i %i% == 29 SET mui=th-TH&& goto:mui32
if /i %i% == 30 SET mui=tr-TR&& goto:mui32
if /i %i% == 31 SET mui=uk-UA&& goto:mui32
if /i %i% == 32 SET mui=zh-CN&& goto:mui32
if /i %i% == 33 SET mui=zh-HK&& goto:mui32
if /i %i% == 34 SET mui=zh-TW&& goto:mui32

set i=0
set FileName=ActionCenterCPL.dll
:fn32
echo.
echo. Copying %FileName% files ...
echo. %SysPath%\%FileName%
if exist %SysPath%\%FileName% takeown /f %SysPath%\%FileName% >nul && icacls %SysPath%\%FileName% /grant *S-1-5-32-544:F >nul
if exist %SysPath%\%FileName% ren %SysPath%\%FileName% %FileName%.vvv >nul
if exist %SysPath%\%FileName% >nul move %SysPath%\%FileName% %Temp%\%Random%.tmp >nul

1>nul 2>nul copy /y T\x86\%FileName% %SysPath%\%FileName% && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
if exist %SysPath%\%FileName%.vvv move %SysPath%\%FileName%.vvv %Temp%\%Random%.tmp >nul
set /A i=i+1
if /i %i% == 1 set FileName=GenuineCenter.dll&& goto:fn32
if /i %i% == 2 set FileName=SLCHook.dll&& goto:fn32
if /i %i% == 3 set FileName=slmgr.vbs&& goto:fn32
if /i %i% == 4 set FileName=slwga.dll&& goto:fn32
if /i %i% == 5 set FileName=Windows.UI.Immersive.dll&& goto:fn32
goto _end

:_System64main
set i=0
set mui=ar-SA
:mui64
if not exist %SysPath%\%mui%\sppsvc.exe.mui goto:muiset64
takeown /f %Temp% /r /d y >nul && icacls %Temp% /t /grant *S-1-5-32-544:F >nul
if exist %Windir%\ImmersiveControlPanel takeown /f %Windir%\ImmersiveControlPanel /r /d y >nul 
if exist %Windir%\ImmersiveControlPanel icacls %Windir%\ImmersiveControlPanel /t /grant *S-1-5-32-544:F >nul
if exist %SysPath%\%mui%\ActionCenter.dll.mui  takeown /f %SysPath%\%mui%\ActionCenter.dll.mui >nul
if exist %SysPath%\%mui%\GenuineCenter.dll.mui takeown /f %SysPath%\%mui%\GenuineCenter.dll.mui >nul
if exist %SysPath%\%mui%\systemcpl.dll.mui     takeown /f %SysPath%\%mui%\systemcpl.dll.mui >nul
if exist %Windir%\ImmersiveControlPanel\%mui% takeown /f %Windir%\ImmersiveControlPanel\%mui% /r /d y >nul
if exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui takeown /f %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui >nul

if exist %SysPath%\%mui%\ActionCenter.dll.mui  icacls %SysPath%\%mui%\ActionCenter.dll.mui /grant *S-1-5-32-544:F >nul
if exist %SysPath%\%mui%\GenuineCenter.dll.mui icacls %SysPath%\%mui%\GenuineCenter.dll.mui /grant *S-1-5-32-544:F >nul
if exist %SysPath%\%mui%\systemcpl.dll.mui     icacls %SysPath%\%mui%\systemcpl.dll.mui /grant *S-1-5-32-544:F >nul
if exist %Windir%\ImmersiveControlPanel\%mui% icacls %Windir%\ImmersiveControlPanel\%mui% /t /grant *S-1-5-32-544:F >nul
if exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui icacls %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui /grant *S-1-5-32-544:F >nul

if exist %SysPath%\%mui%\ActionCenter.dll.mui  ren %SysPath%\%mui%\ActionCenter.dll.mui ActionCenter.vvv >nul
if exist %SysPath%\%mui%\GenuineCenter.dll.mui ren %SysPath%\%mui%\GenuineCenter.dll.mui GenuineCenter.vvv >nul
if exist %SysPath%\%mui%\systemcpl.dll.mui     ren %SysPath%\%mui%\systemcpl.dll.mui systemcpl.vvv >nul
if exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui ren %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui SystemSettings.vvv >nul

echo.
echo. Copying %mui% ActionCenter.dll.mui files ...
1>nul 2>nul copy /y T\mui\%mui%\ActionCenter.dll.mui %SysPath%\%mui%\ActionCenter.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% GenuineCenter.dll.mui files ...
1>nul 2>nul copy /y T\mui\%mui%\GenuineCenter.dll.mui %SysPath%\%mui%\GenuineCenter.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% systemcpl.dll.mui files ...
1>nul 2>nul copy /y T\mui\%mui%\systemcpl.dll.mui %SysPath%\%mui%\systemcpl.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% SystemSettings.exe.mui files ...
1>nul 2>nul copy /y T\mui\%mui%\SystemSettings.exe.mui %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error

if not exist %SysPath%\%mui%\ActionCenter.dll.mui  ren %SysPath%\%mui%\ActionCenter.vvv ActionCenter.dll.mui >nul
if not exist %SysPath%\%mui%\GenuineCenter.dll.mui ren %SysPath%\%mui%\GenuineCenter.vvv GenuineCenter.dll.mui >nul
if not exist %SysPath%\%mui%\systemcpl.dll.mui     ren %SysPath%\%mui%\systemcpl.vvv systemcpl.dll.mui >nul
if not exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui ren %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.vvv SystemSettings.exe.mui >nul

if exist %SysPath%\%mui%\ActionCenter.vvv  move %SysPath%\%mui%\ActionCenter.vvv %Temp%\%Random%.tmp >nul
if exist %SysPath%\%mui%\GenuineCenter.vvv move %SysPath%\%mui%\GenuineCenter.vvv %Temp%\%Random%.tmp >nul
if exist %SysPath%\%mui%\systemcpl.vvv     move %SysPath%\%mui%\systemcpl.vvv %Temp%\%Random%.tmp >nul
if exist %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.vvv move %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.vvv %Temp%\%Random%.tmp >nul

:muiset64
set /A i=i+1
if /i %i% == 1 SET mui=bg-BG&& goto:mui64
if /i %i% == 2 SET mui=cs-CZ&& goto:mui64
if /i %i% == 3 SET mui=da-DK&& goto:mui64
if /i %i% == 4 SET mui=de-DE&& goto:mui64
if /i %i% == 5 SET mui=el-GR&& goto:mui64
if /i %i% == 6 SET mui=en-GB&& goto:mui64
if /i %i% == 7 SET mui=en-US&& goto:mui64
if /i %i% == 8 SET mui=es-ES&& goto:mui64
if /i %i% == 9 SET mui=et-EE&& goto:mui64
if /i %i% == 10 SET mui=fi-FI&& goto:mui64
if /i %i% == 11 SET mui=fr-FR&& goto:mui64
if /i %i% == 12 SET mui=he-IL&& goto:mui64
if /i %i% == 13 SET mui=hr-HR&& goto:mui64
if /i %i% == 14 SET mui=hu-HU&& goto:mui64
if /i %i% == 15 SET mui=it-IT&& goto:mui64
if /i %i% == 16 SET mui=ja-JP&& goto:mui64
if /i %i% == 17 SET mui=ko-KR&& goto:mui64
if /i %i% == 18 SET mui=lv-LV&& goto:mui64
if /i %i% == 19 SET mui=nb-NO&& goto:mui64
if /i %i% == 20 SET mui=nl-NL&& goto:mui64
if /i %i% == 21 SET mui=pl-PL&& goto:mui64
if /i %i% == 22 SET mui=pt-BR&& goto:mui64
if /i %i% == 23 SET mui=pt-PT&& goto:mui64
if /i %i% == 24 SET mui=ro-RO&& goto:mui64
if /i %i% == 25 SET mui=ru-RU&& goto:mui64
if /i %i% == 26 SET mui=sk-SK&& goto:mui64
if /i %i% == 27 SET mui=sl-SI&& goto:mui64
if /i %i% == 28 SET mui=sv-SE&& goto:mui64
if /i %i% == 29 SET mui=th-TH&& goto:mui64
if /i %i% == 30 SET mui=tr-TR&& goto:mui64
if /i %i% == 31 SET mui=uk-UA&& goto:mui64
if /i %i% == 32 SET mui=zh-CN&& goto:mui64
if /i %i% == 33 SET mui=zh-HK&& goto:mui64
if /i %i% == 34 SET mui=zh-TW&& goto:mui64

set i=0
set FileName=ActionCenterCPL.dll
:fn64
echo.
echo. Copying %FileName% files ...
echo. %SysPath%\%FileName%
if exist %SysPath%\%FileName% takeown /f %SysPath%\%FileName% >nul && icacls %SysPath%\%FileName% /grant *S-1-5-32-544:F >nul
if exist %SysPath%\%FileName% ren %SysPath%\%FileName% %FileName%.vvv >nul
if exist %SysPath%\%FileName% >nul move %SysPath%\%FileName% %Temp%\%Random%.tmp >nul

1>nul 2>nul copy /y T\x64\%FileName% %SysPath%\%FileName% && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
if exist %SysPath%\%FileName%.vvv move %SysPath%\%FileName%.vvv %Temp%\%Random%.tmp >nul
set /A i=i+1
if /i %i% == 1 set FileName=GenuineCenter.dll&& goto:fn64
if /i %i% == 2 set FileName=SLCHook.dll&& goto:fn64
if /i %i% == 3 set FileName=slmgr.vbs&& goto:fn64
if /i %i% == 4 set FileName=slwga.dll&& goto:fn64
if /i %i% == 5 set FileName=Windows.UI.Immersive.dll&& goto:fn64
goto _end

:_end
echo.
echo. Installing, Windows Activation Technologies ...
echo. Working, Please wait ...
echo.
if exist check del /q/ f check >nul
if exist "%SysPath%\Tasks\Microsoft\Windows\Windows Activation Technologies\WatTask" schtasks /delete /tn "\Microsoft\Windows\Windows Activation Technologies\WatTask" /f >nul
if exist "%Systemdrive%\Windows Activation Technologies" takeown /f "%Systemdrive%\Windows Activation Technologies" /r /d y >nul 
if exist "%Systemdrive%\Windows Activation Technologies" icacls "%Systemdrive%\Windows Activation Technologies" /t /grant *S-1-5-32-544:F >nul
if exist "%Systemdrive%\Windows Activation Technologies" attrib "%Systemdrive%\Windows Activation Technologies" /s /d -h -s -r
if exist "%Systemdrive%\Windows Activation Technologies" move "%Systemdrive%\Windows Activation Technologies" %Temp%\%Random%.tmp >nul
ping 127.0.0.1 -n 3 >nul
echo. Copying wat files ...
1>nul 2>nul xcopy wat  "%Systemdrive%\Windows Activation Technologies" /cheriky && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error

echo.
echo. Copying data files ...
1>nul 2>nul xcopy T "%Systemdrive%\Windows Activation Technologies\data" /cheriky && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error

echo.
echo. Hidden Windows Activation Technologies ...
1>nul 2>nul attrib "%Systemdrive%\Windows Activation Technologies" /s /d +h +s +r >nul && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error

echo.
echo. Installing wat Task ...
1>nul 2>nul schtasks /create /tn "\Microsoft\Windows\Windows Activation Technologies\WatTask" /xml WatTask.xml /f && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
cls
echo.
echo.
echo.
echo.
echo.
echo.                                Done, Successfully.
ping 127.0.0.1 -n 2 >nul
call %SysPath%\regedt32.exe /s T\Activation.reg
copy /y ac.cmd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\ac.cmd" >nul
takeown /f "%Systemdrive%\Windows Activation Technologies\data" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies\data" /t /deny *S-1-5-32-544:F >nul
takeown /f "%SysPath%\sppsvc.exe" >nul && icacls "%SysPath%\sppsvc.exe" /deny *S-1-5-19:F >nul
cls
set i=5
:Rebooting
cls
echo.
echo.
echo.
echo.                                         %i%
echo.
echo.                              Windows System Logoff ...
set /A i=i-1
if /i %i% == 0 call %SysPath%\shutdown.exe /l & exit
ping 127.0.0.1 -n 2 >nul
goto:Rebooting
exit

















