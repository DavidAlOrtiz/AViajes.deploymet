@echo off

echo Windows KMS Activation Installing
echo Please wait...
echo.

:SERIAL
set b=0
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
cscript //nologo "%Windir%\System32\slmgr.vbs" -dlv >check
find /i "VOLUME_KMSCLIENT" >nul check && goto:okkw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Professional N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Bw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Professional" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Aw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Enterprise N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Ew
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Enterprise E" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Dw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7 Enterprise" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Cw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "HPC Edition" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Fw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server 2008 R2 Datacenter" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Gw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server 2008 R2 Enterprise" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Hw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server 2008 R2 Itanium" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Iw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server 2008 R2 Standard" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Jw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Web Server 2008 R2" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Kw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Business N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Mw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Business" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Lw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Enterprise N" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Ow
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista (TM) Enterprise" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Nw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server (R) 2008 Datacenter" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Pw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server (R) 2008 Itanium" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Qw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server (R) 2008 Enterprise" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Rw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Server (R) 2008 Standard" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Sw
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Web Server (R) 2008" >nul
IF NOT ERRORLEVEL 1 echo Installed OS successfully determined. & echo. & echo Installing key... & goto:Tw
GOTO:END

:Aw
set os=Windows 7 Professional
set keyw=FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4 | find /i "FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4" >nul && goto:okkw
GOTO:END
:Bw
set os=Windows 7 Professional N
set keyw=MRPKT-YTG23-K7D7T-X2JMM-QY7MG
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk MRPKT-YTG23-K7D7T-X2JMM-QY7MG | find /i "MRPKT-YTG23-K7D7T-X2JMM-QY7MG" >nul && goto:okkw
GOTO:END
:Cw
set os=Windows 7 Enterprise
set keyw=33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk 33PXH-7Y6KF-2VJC9-XBBR8-HVTHH | find /i "33PXH-7Y6KF-2VJC9-XBBR8-HVTHH" >nul && goto:okkw
GOTO:END
:Dw
set os=Windows 7 Enterprise E
set keyw=YDRBP-3D83W-TY26F-D46B2-XCKRJ
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk YDRBP-3D83W-TY26F-D46B2-XCKRJ | find /i "YDRBP-3D83W-TY26F-D46B2-XCKRJ" >nul && goto:okkw
GOTO:END
:Ew
set os=Windows 7 Enterprise N
set keyw=C29WB-22CC8-VJ326-GHFJW-H9DH4
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk C29WB-22CC8-VJ326-GHFJW-H9DH4 | find /i "C29WB-22CC8-VJ326-GHFJW-H9DH4" >nul && goto:okkw
GOTO:END
:Fw
set os=Windows Server 2008 R2 HPC Edition
set keyw=FKJQ8-TMCVP-FRMR7-4WR42-3JCD7
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk FKJQ8-TMCVP-FRMR7-4WR42-3JCD7 | find /i "FKJQ8-TMCVP-FRMR7-4WR42-3JCD7" >nul && goto:okkw
GOTO:END
:Gw
set os=Windows Server 2008 R2 Datacenter
set keyw=74YFP-3QFB3-KQT8W-PMXWJ-7M648
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk 74YFP-3QFB3-KQT8W-PMXWJ-7M648 | find /i "74YFP-3QFB3-KQT8W-PMXWJ-7M648" >nul && goto:okkw
GOTO:END
:Hw
set os=Windows Server 2008 R2 Enterprise
set keyw=489J6-VHDMP-X63PK-3K798-CPX3Y
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk 489J6-VHDMP-X63PK-3K798-CPX3Y | find /i "489J6-VHDMP-X63PK-3K798-CPX3Y" >nul && goto:okkw
GOTO:END
:Iw
set os=Windows Server 2008 R2 Itanium
set keyw=GT63C-RJFQ3-4GMB6-BRFB9-CB83V
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk GT63C-RJFQ3-4GMB6-BRFB9-CB83V | find /i "GT63C-RJFQ3-4GMB6-BRFB9-CB83V" >nul && goto:okkw
GOTO:END
:Jw
set os=Windows Server 2008 R2 Standard
set keyw=YC6KT-GKW9T-YTKYR-T4X34-R7VHC
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk YC6KT-GKW9T-YTKYR-T4X34-R7VHC | find /i "YC6KT-GKW9T-YTKYR-T4X34-R7VHC" >nul && goto:okkw
GOTO:END
:Kw
set os=Windows Web Server 2008 R2
set keyw=6TPJF-RBVHG-WBW2R-86QPH-6RTM4
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk 6TPJF-RBVHG-WBW2R-86QPH-6RTM4 | find /i "6TPJF-RBVHG-WBW2R-86QPH-6RTM4" >nul && goto:okkw
GOTO:END
:Lw
set os=Windows Vista (TM) Business
set keyw=YFKBB-PQJJV-G996G-VWGXY-2V3X8
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk YFKBB-PQJJV-G996G-VWGXY-2V3X8 | find /i "YFKBB-PQJJV-G996G-VWGXY-2V3X8" >nul && goto:okkw
GOTO:END
:Mw
set os=Windows Vista (TM) Business N
set keyw=HMBQG-8H2RH-C77VX-27R82-VMQBT
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk HMBQG-8H2RH-C77VX-27R82-VMQBT | find /i "HMBQG-8H2RH-C77VX-27R82-VMQBT" >nul && goto:okkw
GOTO:END
:Nw
set os=Windows Vista (TM) Enterprise
set keyw=VKK3X-68KWM-X2YGT-QR4M6-4BWMV
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk VKK3X-68KWM-X2YGT-QR4M6-4BWMV | find /i "VKK3X-68KWM-X2YGT-QR4M6-4BWMV" >nul && goto:okkw
GOTO:END
:Ow
set os=Windows Vista (TM) Enterprise N
set keyw=VTC42-BM838-43QHV-84HX6-XJXKV
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk VTC42-BM838-43QHV-84HX6-XJXKV | find /i "VTC42-BM838-43QHV-84HX6-XJXKV" >nul && goto:okkw
GOTO:END
:Pw
set os=Windows Server 2008 (R) Datacenter
set keyw=7M67G-PC374-GR742-YH8V4-TCBY3
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk 7M67G-PC374-GR742-YH8V4-TCBY3 | find /i "7M67G-PC374-GR742-YH8V4-TCBY3" >nul && goto:okkw
GOTO:END
:Qw
set os=Windows Server 2008 (R) Itanium
set keyw=4DWFP-JF3DJ-B7DTH-78FJB-PDRHK
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk 4DWFP-JF3DJ-B7DTH-78FJB-PDRHK | find /i "4DWFP-JF3DJ-B7DTH-78FJB-PDRHK" >nul && goto:okkw
GOTO:END
:Rw
set os=Windows Server 2008 (R) Enterprise
set keyw=YQGMW-MPWTJ-34KDK-48M3W-X4Q6V
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk YQGMW-MPWTJ-34KDK-48M3W-X4Q6V | find /i "YQGMW-MPWTJ-34KDK-48M3W-X4Q6V" >nul && goto:okkw
GOTO:END
:Sw
set os=Windows Server 2008 (R) Standard
set keyw=TM24T-X9RMF-VWXK6-X8JC9-BFGM2
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk TM24T-X9RMF-VWXK6-X8JC9-BFGM2 | find /i "TM24T-X9RMF-VWXK6-X8JC9-BFGM2" >nul && goto:okkw
GOTO:END
:Tw
set os=Windows Web Server 2008 (R)
set keyw=WYR28-R7TFJ-3X2YQ-YCY4H-M249D
cscript //nologo "%Windir%\System32\slmgr.vbs" -ipk WYR28-R7TFJ-3X2YQ-YCY4H-M249D | find /i "WYR28-R7TFJ-3X2YQ-YCY4H-M249D" >nul && goto:okkw
GOTO:END

:okkw
echo Copying files...
1>nul 2>nul copy /y srvany.exe %Windir%\System32\srvany.exe && 1>nul 2>nul copy /y KMService.exe %Windir%\KMService.exe && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo Installing service...
sc create KMService binpath= %Windir%\System32\srvany.exe >nul && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo Updating registry settings...
1>nul 2>nul rundll32 advpack,LaunchINFSection service.inf,DefaultInstall,0 && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
echo.
echo Running service...
net start KMService >nul && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error

echo.
echo Key Management Service machine name set to Localhost...
if exist %Windir%\System32\sppsvc.exe  call %Windir%\System32\regedt32.exe /s  Server_7.reg >nul && echo       status: OK
if exist %Windir%\Sysnative\sppsvc.exe call %Windir%\Sysnative\regedt32.exe /s Server_7.reg >nul && echo       status: OK
if exist %Windir%\System32\SLsvc.exe   call %Windir%\System32\regedt32.exe /s  Server_v.reg >nul && echo       status: OK
if exist %Windir%\Sysnative\SLsvc.exe  call %Windir%\Sysnative\regedt32.exe /s Server_v.reg >nul && echo       status: OK
cscript //nologo "%Windir%\System32\slmgr.vbs" -ato | find /i "0xC004F074" >nul && echo. && echo       status: Error
echo.
echo Please wait. Executing activation requests...

:repeatw
set /A f=f+1
if /i %f% == 17 goto:fatalw
if /i %f% == 8 goto:Rearm
ping -n 4 localhost >nul
cscript //nologo "%Windir%\System32\slmgr.vbs" -ato >check
1>nul 2>nul findstr "0x8007000D 0xC004C008 0x8007232B Error" check
If %ERRORLEVEL% EQU 1 echo       status: OK && GOTO:END
If %ERRORLEVEL% EQU 0 goto:repeatw

:Rearm
if exist %Windir%\System32\sppsvc.exe  goto:System32Rearm
if exist %Windir%\Sysnative\sppsvc.exe goto:SysnativeRearm
goto:repeatw

:System32Rearm
cscript //nologo %Windir%\System32\slmgr.vbs -rearm >nul
net stop sppsvc /y >nul
takeown /f %Windir%\System32\sppwinob.dll >nul && icacls %Windir%\System32\sppwinob.dll /deny everyone:f >nul
net start sppsvc >nul
takeown /f %Windir%\System32\sppwinob.dll >nul && icacls %Windir%\System32\sppwinob.dll /grant everyone:f>nul
net stop sppsvc /y >nul
ping -n 4 localhost >nul
net start sppsvc >nul
goto:repeatw

:SysnativeRearm
cscript //nologo %Windir%\Sysnative\slmgr.vbs -rearm >nul
net stop sppsvc /y >nul
takeown /f %Windir%\Sysnative\sppwinob.dll >nul && icacls %Windir%\Sysnative\sppwinob.dll /deny everyone:f >nul
net start sppsvc >nul
takeown /f %Windir%\Sysnative\sppwinob.dll >nul && icacls %Windir%\Sysnative\sppwinob.dll /grant everyone:f>nul
net stop sppsvc /y >nul
ping -n 4 localhost >nul
net start sppsvc >nul
goto:repeatw

:END
if exist check echo y | del check
EXIT /B