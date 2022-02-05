@echo off
pushd %~dp0
cls

if exist %Windir%\SysWOW64\cmd.exe call RegWorkshopX64.exe
if not exist %Windir%\SysWOW64\cmd.exe call RegWorkshop.exe
exit
