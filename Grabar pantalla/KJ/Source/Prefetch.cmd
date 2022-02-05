@echo off

echo Optimization Installing
echo Please wait...
echo.
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Embedded Standard" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "2008 R2" >nul
IF NOT ERRORLEVEL 1 goto:Install_R2
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "HPC Edition" >nul
IF NOT ERRORLEVEL 1 goto:Install_R2
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Vista (TM)" >nul
IF NOT ERRORLEVEL 1 goto:Install_Vista
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Server (R)" >nul
IF NOT ERRORLEVEL 1 goto:Install_R
GOTO:END

:Install_7
if exist %Windir%\Sysnative\cmd.exe goto:Install_7_Sysnative
if exist %Windir%\SysWOW64\cmd.exe call %Windir%\System32\regedt32.exe /s Prefetch\7\Prefetchx64.reg
if not exist %Windir%\SysWOW64\cmd.exe call %Windir%\System32\regedt32.exe /s Prefetch\7\Prefetchx86.reg
if exist %Windir%\Prefetch takeown /f %Windir%\Prefetch /r /d y >nul && icacls %Windir%\Prefetch /t /grant everyone:f >nul
if exist %Windir%\Prefetch echo y | del %Windir%\Prefetch\*.* >nul
GOTO:END

:Install_R2
if exist %Windir%\Sysnative\cmd.exe goto:Install_R2_Sysnative
if exist %Windir%\SysWOW64\cmd.exe call %Windir%\System32\regedt32.exe /s Prefetch\R2\Prefetchx64.reg
if not exist %Windir%\SysWOW64\cmd.exe call %Windir%\System32\regedt32.exe /s Prefetch\R2\Prefetchx86.reg
if exist %Windir%\Prefetch takeown /f %Windir%\Prefetch /r /d y >nul && icacls %Windir%\Prefetch /t /grant everyone:f >nul
if exist %Windir%\Prefetch echo y | del %Windir%\Prefetch\*.* >nul
GOTO:END

:Install_Vista
if exist %Windir%\Sysnative\cmd.exe goto:Install_Vista_Sysnative
if exist %Windir%\SysWOW64\cmd.exe call %Windir%\System32\regedt32.exe /s Prefetch\Vista\Prefetchx64.reg
if not exist %Windir%\SysWOW64\cmd.exe call %Windir%\System32\regedt32.exe /s Prefetch\Vista\Prefetchx86.reg
if exist %Windir%\Prefetch takeown /f %Windir%\Prefetch /r /d y >nul && icacls %Windir%\Prefetch /t /grant everyone:f >nul
if exist %Windir%\Prefetch echo y | del %Windir%\Prefetch\*.* >nul
GOTO:END

:Install_R
if exist %Windir%\Sysnative\cmd.exe goto:Install_R_Sysnative
if exist %Windir%\SysWOW64\cmd.exe call %Windir%\System32\regedt32.exe /s Prefetch\R\Prefetchx64.reg
if not exist %Windir%\SysWOW64\cmd.exe call %Windir%\System32\regedt32.exe /s Prefetch\R\Prefetchx86.reg
if exist %Windir%\Prefetch takeown /f %Windir%\Prefetch /r /d y >nul && icacls %Windir%\Prefetch /t /grant everyone:f >nul
if exist %Windir%\Prefetch echo y | del %Windir%\Prefetch\*.* >nul
GOTO:END

:Install_7_Sysnative
call %Windir%\Sysnative\regedt32.exe /s Prefetch\7\Prefetchx64.reg
if exist %Windir%\Prefetch takeown /f %Windir%\Prefetch /r /d y >nul && icacls %Windir%\Prefetch /t /grant everyone:f >nul
if exist %Windir%\Prefetch echo y | del %Windir%\Prefetch\*.* >nul
GOTO:END

:Install_R2_Sysnative
call %Windir%\Sysnative\regedt32.exe /s Prefetch\R2\Prefetchx64.reg
if exist %Windir%\Prefetch takeown /f %Windir%\Prefetch /r /d y >nul && icacls %Windir%\Prefetch /t /grant everyone:f >nul
if exist %Windir%\Prefetch echo y | del %Windir%\Prefetch\*.* >nul
GOTO:END

:Install_Vista_Sysnative
call %Windir%\Sysnative\regedt32.exe /s Prefetch\Vista\Prefetchx64.reg
if exist %Windir%\Prefetch takeown /f %Windir%\Prefetch /r /d y >nul && icacls %Windir%\Prefetch /t /grant everyone:f >nul
if exist %Windir%\Prefetch echo y | del %Windir%\Prefetch\*.* >nul
GOTO:END

:Install_R_Sysnative
call %Windir%\Sysnative\regedt32.exe /s Prefetch\R\Prefetchx64.reg
if exist %Windir%\Prefetch takeown /f %Windir%\Prefetch /r /d y >nul && icacls %Windir%\Prefetch /t /grant everyone:f >nul
if exist %Windir%\Prefetch echo y | del %Windir%\Prefetch\*.* >nul
GOTO:END

:END
EXIT /B














