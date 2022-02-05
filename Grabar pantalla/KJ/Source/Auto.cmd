@echo off

echo.
echo K.J_Auto
echo Please wait...
echo.
echo Initializing installed OS...
echo.

:SET
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "BuildLab" | findstr /i "9200"
IF NOT ERRORLEVEL 1 goto:9200
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Ultimate N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:PIRATE
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Ultimate" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Enterprise N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Enterprise E" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Enterprise" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Professional N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Professional" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Home Premium N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:PIRATE
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Home Premium" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Home Basic N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:PIRATE
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Home Basic" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Starter N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:PIRATE
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Starter" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Embedded Standard" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:EMBEDDED
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server 2008 R2 Datacenter" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:SERVERR2
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server 2008 R2 Enterprise" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:SERVERR2
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server 2008 R2 Standard" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:SERVERR2
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server 2008 R2 Foundation" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:SERVERR2
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "HPC Edition" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server 2008 R2 Itanium" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Web Server 2008 R2" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Ultimate" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:VISTA
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Enterprise N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Enterprise" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Business N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:VISTA
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Business" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:VISTA
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Home Premium" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:VISTA
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Home Basic N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:VISTA
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Home Basic" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:VISTA
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Starter" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:VISTA
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server (R) 2008 Enterprise" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:SERVERR
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server (R) 2008 Standard" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:SERVERR
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server (R) 2008 Foundation" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:SERVERR
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Small Business Server 2008" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:SERVERR
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server (R) 2008 Datacenter" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server (R) 2008 Itanium" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:KMS
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Web Server (R) 2008" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:PIRATE
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:PIRATE
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "R2" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:PIRATE
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "XP" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & GOTO:XP
GOTO:END

:7
if exist Source\Hibernate.cmd        call Source\Hibernate.cmd
if exist Source\Autotuninglevel.cmd  call Source\Autotuninglevel.cmd
if exist Source\Shortcut.cmd         call Source\Shortcut.cmd
if exist Source\WMIPatch.cmd         call Source\WMIPatch.cmd
if exist Source\Windows_7.cmd        call Source\Windows_7.cmd
GOTO:END

:PIRATE
if exist Source\Hibernate.cmd        call Source\Hibernate.cmd
if exist Source\Autotuninglevel.cmd  call Source\Autotuninglevel.cmd
if exist Source\Shortcut.cmd         call Source\Shortcut.cmd
if exist Source\WMIPatch.cmd         call Source\WMIPatch.cmd
echo Pirate Activation
echo Please wait...
echo.
ping 127.0.0.1 -n 3 >nul
cd /d %ScriptPath%
cd /d Pirate 
call Install.vbs
EXIT

:EMBEDDED
if exist Source\Windows_Embedded.cmd call Source\Windows_Embedded.cmd
GOTO:END

:SERVERR
if exist Source\Hibernate.cmd        call Source\Hibernate.cmd
if exist Source\Autotuninglevel.cmd  call Source\Autotuninglevel.cmd
if exist Source\Shortcut.cmd         call Source\Shortcut.cmd
if exist Source\WMIPatch.cmd         call Source\WMIPatch.cmd
if exist Source\Windows_ServerR.cmd  call Source\Windows_ServerR.cmd
GOTO:END

:SERVERR2
if exist Source\Hibernate.cmd        call Source\Hibernate.cmd
if exist Source\Autotuninglevel.cmd  call Source\Autotuninglevel.cmd
if exist Source\Shortcut.cmd         call Source\Shortcut.cmd
if exist Source\WMIPatch.cmd         call Source\WMIPatch.cmd
if exist Source\Windows_ServerR2.cmd call Source\Windows_ServerR2.cmd
GOTO:END

:VISTA
if exist Source\Hibernate.cmd        call Source\Hibernate.cmd
if exist Source\Autotuninglevel.cmd  call Source\Autotuninglevel.cmd
if exist Source\Shortcut.cmd         call Source\Shortcut.cmd
if exist Source\WMIPatch.cmd         call Source\WMIPatch.cmd
if exist Source\Windows_Vista.cmd    call Source\Windows_Vista.cmd
GOTO:END

:KMS
if exist Source\Hibernate.cmd        call Source\Hibernate.cmd
if exist Source\Autotuninglevel.cmd  call Source\Autotuninglevel.cmd
if exist Source\Shortcut.cmd         call Source\Shortcut.cmd
if exist Source\WMIPatch.cmd         call Source\WMIPatch.cmd
if exist Source\Windows_KMS.cmd      call Source\Windows_KMS.cmd
GOTO:END

:XP
if exist Source\Windows_xp.cmd call Source\Windows_Xp.cmd
EXIT /B

:9200
cd /d Pirate8
echo.
echo. Working, Please wait ...
echo.
ping 127.0.0.1 -n 4 >nul
start /b Install.cmd
EXIT /B

:END
if exist check del /s /q check >nul
cls
echo.
echo.
echo.
echo.                             System Rebooting 07sec
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo.
echo.
echo.                             System Rebooting 06sec
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo.
echo.
echo.                             System Rebooting 05sec
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo.
echo.
echo.                             System Rebooting 04sec
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo.
echo.
echo.                             System Rebooting 03sec
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo.
echo.
echo.                             System Rebooting 02sec
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo.
echo.
echo.                             System Rebooting 01sec
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo.
echo.
echo.                             System Rebooting 00sec
ping 127.0.0.1 -n 2 >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                 System Rebooting
ping 127.0.0.1 -n 2 >nul
cls
if exist %Windir%\Sysnative\sppsvc.exe call %Windir%\Sysnative\shutdown.exe /t 0 /r >nul
if exist %Windir%\System32\sppsvc.exe  call %Windir%\System32\shutdown.exe /t 0 /r >nul
exit














