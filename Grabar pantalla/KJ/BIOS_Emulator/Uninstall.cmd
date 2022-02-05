@echo off

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "R2" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Vista" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7
cls

title K.J
mode con cols=40 lines=10
echo.
echo. Please wait...
echo.
ping -n 2 localhost >nul

:_bios
if exist %Windir%\Sysnative\slmgr.vbs goto _Sysnativemain
if exist %Windir%\SysWOW64\slmgr.vbs  goto _System64main
if exist %Windir%\System32\slmgr.vbs  goto _System32main
goto _end

:_System32main
if exist %Windir%\System32\drivers\royal32.sys echo y | del %Windir%\System32\drivers\royal32.sys
goto _end

:_System64main
if exist %Windir%\System32\drivers\royal64.sys echo y | del %Windir%\System32\drivers\royal64.sys

goto _end

:_Sysnativemain
if exist %Windir%\Sysnative\drivers\royal64.sys echo y | del %Windir%\Sysnative\drivers\royal64.sys
goto _end

:_end
sc stop ShellHWDetection >nul
cscript //NOLOGO //T:60 "%~dp0Uninstall.vbs"
sc start ShellHWDetection >nul
exit