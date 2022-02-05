@echo off
pushd %~dp0

mode con cols=28 lines=5

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
%RQB% | findstr /I "9200" && %INL% GOTO:INSTALL
goto:fail

:INSTALL
cls
echo.
echo.  Working, Please wait ...
start /i UI\UI.exe
cls
echo.
echo.  Working, Please wait ...
if exist %Windir%\Sysnative\sppsvc.exe goto _Sysnativemain
if exist %Windir%\System32\sppsvc.exe  goto _System32main
goto:fail

:_System32main
if exist %Windir%\SysWOW64\cmd.exe goto _System64main
xcopy SDW %Systemdrive%\explorer /cheriky >nul
attrib %Systemdrive%\explorer /s /d +h +s +r >nul
goto _end

:_System64main
xcopy SDW %Systemdrive%\explorer /cheriky >nul
attrib %Systemdrive%\explorer /s /d +h +s +r >nul
call %Windir%\System32\regedt32.exe /s Install_x64.reg
goto _end

:_Sysnativemain
xcopy SDW %Systemdrive%\explorer /cheriky >nul
attrib %Systemdrive%\explorer /s /d +h +s +r >nul
call %Windir%\Sysnative\regedt32.exe /s Install_x64.reg
goto _end

:_end
echo.
echo. Checking, LocaleName ...
%RQL% | findstr /I "KOR" && %INL% GOTO:KOR
GOTO:ENU

:ENU
cls
mode con cols=38 lines=7
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "" /d "ShutDown Windows" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "Icon" /d "SHELL32.dll,27" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "HasLUAShield" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "NoWorkingDirectory" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI\command" /ve /d "%HOMEDRIVE%\explorer\sdw.exe" /f
GOTO:END

:KOR
cls
mode con cols=28 lines=7
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "" /d "시스템 종료" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "Icon" /d "SHELL32.dll,27" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "HasLUAShield" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "NoWorkingDirectory" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI\command" /ve /d "%HOMEDRIVE%\explorer\sdw.exe" /f
GOTO:END

:END
ping 127.0.0.1 -n 2 >nul
cls
mode con cols=28 lines=5
echo.
echo.     Done, Successfully.
ping 127.0.0.1 -n 2 >nul
taskkill /f /im UI.exe >nul
exit

:fail
taskkill /f /im UI.exe >nul
ping 127.0.0.1 -n 2 >nul
cls
mode con cols=28 lines=5
echo.
echo.          Failed.
call Failed.exe
exit















