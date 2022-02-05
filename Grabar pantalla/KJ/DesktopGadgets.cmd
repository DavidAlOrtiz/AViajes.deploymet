@echo off
pushd %~dp0

if exist "%systemdrive%\Program Files\Windows Sidebar\sidebar.exe" goto:appwiz

start /i DesktopGadgets.exe
exit

:appwiz
start /i %Windir%\System32\appwiz.cpl
exit

