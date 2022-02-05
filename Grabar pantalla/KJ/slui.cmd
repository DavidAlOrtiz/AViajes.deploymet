@echo off

if exist %Windir%\Sysnative\slmgr.vbs goto:Sysnativemain
if exist %Windir%\System32\slmgr.vbs  goto:System32main
exit /b
:Sysnativemain
start /b %Windir%\Sysnative\slui.exe 3
exit /b
:System32main
start /b %Windir%\System32\slui.exe 3
exit /b