@echo off
pushd %~dp0

mode con cols=28 lines=5

schtasks /delete /tn "\Microsoft\Windows\UI\SvcRestartTask" /f >nul
cls
%RC% DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Shell" /f >nul
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
%RQB% | findstr /I "9200" && %INL% GOTO:INSTALL
goto:fail_2

:INSTALL
cls
echo.
echo.  Working, Please wait ...
start /i UI\UI.exe
taskkill /f /im explorer.exe >nul
cls
echo.
echo.  Working, Please wait ...
if exist %Windir%\Sysnative\sppsvc.exe goto _Sysnativemain
if exist %Windir%\System32\sppsvc.exe  goto _System32main
goto:fail

:_System32main
if not exist %Temp% md %Temp% 
takeown /f %Temp% /r /d y >nul && icacls %Temp% /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer takeown /f %Systemdrive%\explorer /r /d y >nul && icacls %Systemdrive%\explorer /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer attrib %Systemdrive%\explorer /s /d -h -s -r   && move %Systemdrive%\explorer %Temp%\%Random%.tmp >nul
ping 127.0.0.1 -n 3 >nul
call %Windir%\System32\regedt32.exe /s Uninstall.reg
goto _end

:_Sysnativemain
if not exist %Temp% md %Temp% 
takeown /f %Temp% /r /d y >nul && icacls %Temp% /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer takeown /f %Systemdrive%\explorer /r /d y >nul && icacls %Systemdrive%\explorer /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer attrib %Systemdrive%\explorer /s /d -h -s -r   && move %Systemdrive%\explorer %Temp%\%Random%.tmp >nul
ping 127.0.0.1 -n 3 >nul
call %Windir%\Sysnative\regedt32.exe /s Uninstall.reg
goto _end

:_end
if exist %Systemdrive%\explorer attrib %Systemdrive%\explorer /s /d +h +s +r  && goto:fail
if exist "%Systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Classic Style UI.lnk" del /s /q "%Systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Classic Style UI.lnk" >nul
%RC% DELETE HKEY_CLASSES_ROOT\Directory\Background\shell\7UI /f >nul
cls
%RC% DELETE HKEY_CLASSES_ROOT\Directory\Background\shell\8UI /f >nul
cls
%RC% DELETE HKEY_CLASSES_ROOT\Directory\Background\shell\9UI /f >nul
cls
%RC% DELETE HKEY_CLASSES_ROOT\Directory\Background\shell\SDUI /f >nul
cls
%RC% DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI /f >nul
cls
%RC% DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\8UI /f >nul
cls
%RC% DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI /f >nul
cls
%RC% DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\SDUI /f >nul
cls
%RC% DELETE HKLM\Software\Classes\batfile\shell /ve /f >nul
cls
%RC% DELETE HKLM\Software\Classes\cmdfile\shell /ve /f >nul
cls
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\explorer\7UI\7AUI\7AUI.exe" /f >nul
cls
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\explorer\8UI\8AUI\8AUI.exe" /f >nul
cls
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\explorer\7UI\7AUI\7AUI.exe" /f >nul
cls
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\explorer\8UI\8AUI\8AUI.exe" /f >nul
cls
mode con cols=28 lines=5
echo.
echo.     Done, Successfully.
ping 127.0.0.1 -n 2 >nul
call %SysPath%\shutdown.exe /l
exit

:fail
taskkill /f /im UI.exe >nul
cls
mode con cols=28 lines=5
echo.
echo.          Failed.
call Failed.exe
cls
call %SysPath%\shutdown.exe /l
exit

:fail_2
taskkill /f /im UI.exe >nul
cls
mode con cols=28 lines=5
echo.
echo.          Failed.
call Failed.exe
exit
















