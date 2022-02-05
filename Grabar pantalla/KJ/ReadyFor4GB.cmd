@echo off
pushd %~dp0
set ScriptPath=%~dp0

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7
cls
if exist %Windir%\SysWOW64\cmd.exe goto _end
if exist %Windir%\System32\slsvc.exe goto _main
if exist %Windir%\System32\sppsvc.exe goto _main
goto _end

:_main
title K.J
mode con cols=30 lines=10
cls
echo.
echo 1) ReadyFor4GB Install
echo.
echo 2) ReadyFor4GB Uninstall
echo.
echo X) Exit
echo.

:_set
set _ok=
set /p _ok=.  Enter your choice :
if "%_ok%" == "1" goto _ReadyFor4GB
if "%_ok%" == "2" goto _Uninstall
if "%_ok%" == "x" goto _end
if "%_ok%" == "X" goto _end
goto _main

:_ReadyFor4GB
cls
mode con cols=40 lines=10
echo Plese wait ...
echo.
echo ReadyFor4GB
echo Check
echo Apply
echo Yes
echo Close
echo.
call ReadyFor4GB\ReadyFor4GB.exe
set MY_ENTRY_DESC="Windows [Turbo mode]"
bcdedit /copy {current} /d %MY_ENTRY_DESC% > mybcdguid.txt
set ENTRY_GUID=
for,/f,"tokens=2 delims={",%%i,In (mybcdguid.txt) Do (
set ENTRY_GUID_START=%%i
)
for,/f,"tokens=1 delims=}",%%i,In ("%ENTRY_GUID_START%") Do (
set ENTRY_GUID={%%i}
)
echo.
echo %MY_ENTRY_DESC%
bcdedit /set %ENTRY_GUID% testsigning on
bcdedit /set %ENTRY_GUID% pae forceenable
bcdedit /set %ENTRY_GUID% kernel ntkr128g.exe
bcdedit /displayorder %ENTRY_GUID% -addfirst
bcdedit /default %ENTRY_GUID%
del mybcdguid.txt
echo Please wait...
cd BIOS_Emulator
call WatermarkX86.vbs
cd %ScriptPath%
ping -n 10 localhost >nul
echo Successfully.
echo. & echo Press any key to exit...
pause >nul
goto _end

:_Uninstall
cls
echo Plese wait ...
Start /i VistaBootPro\VistaBootPro.exe
ping -n 5 localhost >nul
if exist %Windir%\System32\ntkr128g.exe del /s /q %Windir%\System32\ntkr128g.exe 
goto _end

:_end
cls
exit
