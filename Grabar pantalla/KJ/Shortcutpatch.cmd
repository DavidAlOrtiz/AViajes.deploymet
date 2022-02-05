@echo off
pushd %~dp0

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "R2" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7

:_main
title K.J
mode con cols=27 lines=10
cls
echo.
echo 1) 단축키 패치 설치
echo.
echo 2) 단축키 패치 삭제
echo.
echo X) 종료
echo.

:_set
set _ok=
set /p _ok=.  Enter your choice :
if "%_ok%" == "1" goto _ShortcutpatchInstall
if "%_ok%" == "2" goto _ShortcutpatchUninstall
if "%_ok%" == "x" GOTO:END
if "%_ok%" == "X" GOTO:END
goto _main

:_ShortcutpatchInstall
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "7" >nul
IF ERRORLEVEL 0 GOTO:INSTALL
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "R2" >nul
IF ERRORLEVEL 0 GOTO:INSTALL
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "Windows Embedded Standard" >nul
IF ERRORLEVEL 0 GOTO:INSTALL
GOTO:END

:_ShortcutpatchUninstall
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "7" >nul
IF ERRORLEVEL 0 GOTO:UNINSTALL
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "R2" >nul
IF ERRORLEVEL 0 GOTO:UNINSTALL
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | findstr /i "Windows Embedded Standard" >nul
IF ERRORLEVEL 0 GOTO:UNINSTALL
GOTO:END

:INSTALL
call ShortcutpatchInstall.vbs
GOTO:END

:UNINSTALL
call ShortcutpatchUninstall.vbs
GOTO:END

:END
EXIT