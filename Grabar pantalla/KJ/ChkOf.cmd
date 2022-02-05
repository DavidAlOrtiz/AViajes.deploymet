@echo off
pushd %~dp0
cls
title K.J-Office 2010 Activator
echo Copyright (C) Microsoft Corporation. All rights reserved.
echo =========================================================
echo.
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
1>nul 2>&1 %RC% QUERY "HKLM\SOFTWARE\Microsoft\Office\14.0" /s
IF ERRORLEVEL 1 exit

cscript //nologo ospp.vbs /dstatus

:anykey
if exist check del check
echo. & echo Press any key to exit...
pause >nul
exit

