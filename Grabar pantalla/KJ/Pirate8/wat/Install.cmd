@echo off
pushd %~dp0

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

:INSTALL
if exist %Windir%\SysWOW64\cmd.exe goto _System64main

:_System32main
findstr /I "kjvvv" %SysPath%\ActionCenterCPL.dll      & %INH% goto:System32Install
findstr /I "kjvvv" %SysPath%\GenuineCenter.dll        & %INH% goto:System32Install
findstr /I "kjvvv" %SysPath%\SLCHook.dll              & %INH% goto:System32Install
findstr /I "kjvvv" %SysPath%\slmgr.vbs                & %INH% goto:System32Install
findstr /I "kjvvv" %SysPath%\slwga.dll                & %INH% goto:System32Install
findstr /I "kjvvv" %SysPath%\Windows.UI.Immersive.dll & %INH% goto:System32Install
exit

:System32Install
takeown /f "%Systemdrive%\Windows Activation Technologies\data" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies\data" /t /grant *S-1-5-32-544:F >nul
cd /d "%Systemdrive%\Windows Activation Technologies\data"

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
1>nul 2>nul copy /y mui\%mui%\ActionCenter.dll.mui %SysPath%\%mui%\ActionCenter.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% GenuineCenter.dll.mui files ...
1>nul 2>nul copy /y mui\%mui%\GenuineCenter.dll.mui %SysPath%\%mui%\GenuineCenter.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% systemcpl.dll.mui files ...
1>nul 2>nul copy /y mui\%mui%\systemcpl.dll.mui %SysPath%\%mui%\systemcpl.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% SystemSettings.exe.mui files ...
1>nul 2>nul copy /y mui\%mui%\SystemSettings.exe.mui %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui && echo       status: OK
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

1>nul 2>nul copy /y x86\%FileName% %SysPath%\%FileName% && echo       status: OK
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
findstr /I "kjvvv" %SysPath%\ActionCenterCPL.dll      & %INH% goto:System64Install
findstr /I "kjvvv" %SysPath%\GenuineCenter.dll        & %INH% goto:System64Install
findstr /I "kjvvv" %SysPath%\SLCHook.dll              & %INH% goto:System64Install
findstr /I "kjvvv" %SysPath%\slmgr.vbs                & %INH% goto:System64Install
findstr /I "kjvvv" %SysPath%\slwga.dll                & %INH% goto:System64Install
findstr /I "kjvvv" %SysPath%\Windows.UI.Immersive.dll & %INH% goto:System64Install
exit

:System64Install
takeown /f "%Systemdrive%\Windows Activation Technologies\data" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies\data" /t /grant *S-1-5-32-544:F >nul
cd /d "%Systemdrive%\Windows Activation Technologies\data"

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
1>nul 2>nul copy /y mui\%mui%\ActionCenter.dll.mui %SysPath%\%mui%\ActionCenter.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% GenuineCenter.dll.mui files ...
1>nul 2>nul copy /y mui\%mui%\GenuineCenter.dll.mui %SysPath%\%mui%\GenuineCenter.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% systemcpl.dll.mui files ...
1>nul 2>nul copy /y mui\%mui%\systemcpl.dll.mui %SysPath%\%mui%\systemcpl.dll.mui && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo. Copying %mui% SystemSettings.exe.mui files ...
1>nul 2>nul copy /y mui\%mui%\SystemSettings.exe.mui %Windir%\ImmersiveControlPanel\%mui%\SystemSettings.exe.mui && echo       status: OK
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

1>nul 2>nul copy /y x64\%FileName% %SysPath%\%FileName% && echo       status: OK
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
call %SysPath%\regedt32.exe /s Activation.reg
takeown /f "%Systemdrive%\Windows Activation Technologies\data" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies\data" /t /deny *S-1-5-32-544:F >nul
call %SysPath%\shutdown.exe /l & exit

















