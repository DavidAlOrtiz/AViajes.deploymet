@echo off
pushd %~dp0
cls
title K.J-Windows Activator
echo Copyright (C) Microsoft Corporation. All rights reserved.
echo =========================================================
echo.

if exist %Windir%\Sysnative\cmd.exe goto _Sysnativemain
if exist %Windir%\System32\cmd.exe  goto _System32main

:_System32main
if not exist "%Windir%\System32\slmgr.vbs" call %Windir%\System32\oobe/msoobe.exe /a
if not exist "%Windir%\System32\slmgr.vbs" exit 
call "%Windir%\System32\slmgr.vbs" -dlv
call "%Windir%\System32\slmgr.vbs" -xpr
call "%Windir%\System32\control.exe" /name Microsoft.System
exit

:_Sysnativemain
if not exist "%Windir%\Sysnative\slmgr.vbs" call %Windir%\Sysnative\oobe/msoobe.exe /a
if not exist "%Windir%\Sysnative\slmgr.vbs" exit 
call "%Windir%\Sysnative\slmgr.vbs" -dlv
call "%Windir%\Sysnative\slmgr.vbs" -xpr
call "%Windir%\Sysnative\control.exe" /name Microsoft.System
exit





