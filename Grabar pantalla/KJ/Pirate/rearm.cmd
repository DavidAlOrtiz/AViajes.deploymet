@echo off

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7
if exist %Windir%\Sysnative\sppsvc.exe goto _Sysnativemain
if exist %Windir%\System32\sppsvc.exe  goto _System32main
exit

:_System32main
start /i Pleasewait.vbs
if exist %Windir%\System32\sppsvc.exe cscript //Nologo %Windir%\System32\slmgr.vbs -rearm>nul
net stop sppsvc /y >nul
takeown /f %Windir%\System32\sppwinob.dll>nul
icacls %Windir%\System32\sppwinob.dll /deny *S-1-5-32-544:F >nul
net start sppsvc >nul
icacls %Windir%\System32\sppwinob.dll /grant *S-1-5-32-544:F >nul
net stop sppsvc /y >nul
cscript //Nologo %Windir%\System32\slmgr.vbs -dlv
goto _end

:_Sysnativemain
start /i Pleasewait.vbs
if exist %Windir%\Sysnative\sppsvc.exe cscript //Nologo %Windir%\Sysnative\slmgr.vbs -rearm>nul
net stop sppsvc /y >nul
takeown /f %Windir%\Sysnative\sppwinob.dll>nul
icacls %Windir%\Sysnative\sppwinob.dll /deny *S-1-5-32-544:F >nul
net start sppsvc >nul
icacls %Windir%\Sysnative\sppwinob.dll /grant *S-1-5-32-544:F >nul
net stop sppsvc /y >nul
cscript //Nologo %Windir%\Sysnative\slmgr.vbs -dlv
goto _end

:_end
taskkill /f /im wscript.exe >nul
start /i Successful.vbs
slmgr.vbs -dlv
taskkill /f /im wscript.exe >nul
cls
exit