@echo off
pushd %~dp0

start /i UI\UI.exe

SET ScriptPath=%~dp0
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 
SET RQL=%RC% QUERY "HKEY_CURRENT_USER\Control Panel\International" /v "sLanguage"
SET RQB=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "BuildLab"
SET INL=IF NOT ERRORLEVEL 1

:Check1
%RQB% | findstr /I "9200" && %INL% goto _Install
goto:fail

:_Install
if exist %Windir%\Sysnative\sppsvc.exe goto _Sysnativemain
if exist %Windir%\System32\sppsvc.exe  goto _System32main
exit

:_System32main
if exist %Windir%\SysWOW64\cmd.exe goto _System64main
call %Windir%\System32\regedt32.exe /s 8patch.reg
goto _end

:_System64main
call %Windir%\System32\regedt32.exe /s 8patch.reg
goto _end


:_Sysnativemain
call %Windir%\Sysnative\regedt32.exe /s 8patch.reg
goto _end

:_end
ping 127.0.0.1 -n 3 >nul
taskkill /f /im UI.exe
exit

:fail
ping 127.0.0.1 -n 3 >nul
taskkill /f /im UI.exe
call Failed.exe
exit
