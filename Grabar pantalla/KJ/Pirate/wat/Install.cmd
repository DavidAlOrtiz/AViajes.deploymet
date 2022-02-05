@echo off
pushd %~dp0

SET ScriptPath=%~dp0
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 
SET RQL=%RC% QUERY "HKEY_CURRENT_USER\Control Panel\International" /v "sLanguage"
SET RQB=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "BuildLab"
SET INL=IF NOT ERRORLEVEL 1
SET INH=IF ERRORLEVEL 1

:INSTALL
net stop sppsvc >nul
if exist %Windir%\Sysnative\sppsvc.exe goto _Sysnativemain
if exist %Windir%\System32\sppsvc.exe  goto _System32main
exit

:_System32main
if exist %Windir%\SysWOW64\cmd.exe goto _System64main

findstr /I "kjvvv" %Windir%\System32\slwga.dll      & %INH% goto:System32Install
findstr /I "kjvvv" %Windir%\System32\sppwmi.dll     & %INH% goto:System32Install
findstr /I "kjvvv" %Windir%\System32\systemcpl.dll  & %INH% goto:System32Install
findstr /I "kjvvv" %Windir%\System32\user32.dll     & %INH% goto:System32Install
findstr /I "kjvvv" %Windir%\System32\winlogon.exe   & %INH% goto:System32Install
findstr /I "kjvvv" %Windir%\System32\winver.exe     & %INH% goto:System32Install
exit

:System32Install
start /i Pleasewait.exe
ping 127.0.0.1 -n 2 >nul
taskkill /f /im explorer.exe >nul
takeown /f "%Systemdrive%\Windows Activation Technologies\data" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies\data" /t /grant *S-1-5-32-544:F >nul
ping 127.0.0.1 -n 1 >nul
cd /d "%Systemdrive%\Windows Activation Technologies\data"

takeown /f %Temp% /r /d y >nul                   && icacls %Temp% /t                         /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\slwga.dll >nul      && icacls %Windir%\System32\slwga.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\sppwmi.dll >nul     && icacls %Windir%\System32\sppwmi.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\systemcpl.dll >nul  && icacls %Windir%\System32\systemcpl.dll   /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\user32.dll >nul     && icacls %Windir%\System32\user32.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\winlogon.exe >nul   && icacls %Windir%\System32\winlogon.exe    /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\winver.exe >nul     && icacls %Windir%\System32\winver.exe      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\sppcomapi.dll>nul   && icacls %Windir%\System32\sppcomapi.dll   /deny *S-1-5-32-544:(X) >nul

ping 127.0.0.1 -n 2 >nul

ren %Windir%\System32\slwga.dll     slwga.vvv >nul
ren %Windir%\System32\sppwmi.dll    sppwmi.vvv >nul
ren %Windir%\System32\systemcpl.dll systemcpl.vvv >nul
ren %Windir%\System32\user32.dll    user32.vvv >nul
ren %Windir%\System32\winlogon.exe  winlogon.vvv >nul
ren %Windir%\System32\winver.exe    winver.vvv >nul

ping 127.0.0.1 -n 2 >nul

copy x86T\slwga.dll     %Windir%\System32\slwga.dll >nul
copy x86T\sppwmi.dll    %Windir%\System32\sppwmi.dll >nul
copy x86T\systemcpl.dll %Windir%\System32\systemcpl.dll >nul
copy x86T\user32.dll    %Windir%\System32\user32.dll >nul
copy x86T\winlogon.dll  %Windir%\System32\winlogon.exe >nul
copy x86T\winver.dll    %Windir%\System32\winver.exe >nul

ping 127.0.0.1 -n 2 >nul

if not exist %Windir%\System32\slwga.dll >nul     ren %Windir%\System32\slwga.vvv     slwga.dll
if not exist %Windir%\System32\sppwmi.dll >nul    ren %Windir%\System32\sppwmi.vvv    sppwmi.dll
if not exist %Windir%\System32\systemcpl.dll >nul ren %Windir%\System32\systemcpl.vvv systemcpl.dll
if not exist %Windir%\System32\user32.dll >nul    ren %Windir%\System32\user32.vvv    user32.dll
if not exist %Windir%\System32\winlogon.exe >nul  ren %Windir%\System32\winlogon.vvv  winlogon.exe
if not exist %Windir%\System32\winver.exe >nul    ren %Windir%\System32\winver.vvv    winver.exe

ping 127.0.0.1 -n 2 >nul

if exist %Windir%\System32\slwga.vvv     move %Windir%\System32\slwga.vvv     %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\sppwmi.vvv    move %Windir%\System32\sppwmi.vvv    %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\systemcpl.vvv move %Windir%\System32\systemcpl.vvv %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\user32.vvv    move %Windir%\System32\user32.vvv    %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\winlogon.vvv  move %Windir%\System32\winlogon.vvv  %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\winver.vvv    move %Windir%\System32\winver.vvv    %Temp%\%Random%.tmp >nul

if exist %Windir%\System32\wlms\wlms.exe takeown /f %Windir%\System32\wlms\wlms.exe >nul 
if exist %Windir%\System32\wlms\wlms.exe icacls %Windir%\System32\wlms\wlms.exe /deny *S-1-5-32-544:F >nul
goto _end

:_System64main
findstr /I "kjvvv" %Windir%\System32\slwga.dll      & %INH% goto:System64Install
findstr /I "kjvvv" %Windir%\System32\sppwmi.dll     & %INH% goto:System64Install
findstr /I "kjvvv" %Windir%\System32\systemcpl.dll  & %INH% goto:System64Install
findstr /I "kjvvv" %Windir%\System32\user32.dll     & %INH% goto:System64Install
findstr /I "kjvvv" %Windir%\System32\winlogon.exe   & %INH% goto:System64Install
findstr /I "kjvvv" %Windir%\System32\winver.exe     & %INH% goto:System64Install
exit

:System64Install
start /i Pleasewait.exe
ping 127.0.0.1 -n 2 >nul
taskkill /f /im explorer.exe >nul
takeown /f "%Systemdrive%\Windows Activation Technologies\data" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies\data" /t /grant *S-1-5-32-544:F >nul
ping 127.0.0.1 -n 1 >nul
cd /d "%Systemdrive%\Windows Activation Technologies\data"

takeown /f %Temp% /r /d y >nul                   && icacls %Temp% /t                         /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\slwga.dll >nul      && icacls %Windir%\System32\slwga.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\sppwmi.dll >nul     && icacls %Windir%\System32\sppwmi.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\systemcpl.dll >nul  && icacls %Windir%\System32\systemcpl.dll   /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\user32.dll >nul     && icacls %Windir%\System32\user32.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\winlogon.exe >nul   && icacls %Windir%\System32\winlogon.exe    /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\winver.exe >nul     && icacls %Windir%\System32\winver.exe      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\sppcomapi.dll>nul   && icacls %Windir%\System32\sppcomapi.dll   /deny *S-1-5-32-544:(X) >nul

takeown /f %Windir%\SysWOW64\slwga.dll >nul      && icacls %Windir%\SysWOW64\slwga.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\sppwmi.dll >nul     && icacls %Windir%\SysWOW64\sppwmi.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\systemcpl.dll >nul  && icacls %Windir%\SysWOW64\systemcpl.dll   /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\user32.dll >nul     && icacls %Windir%\SysWOW64\user32.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\winver.exe >nul     && icacls %Windir%\SysWOW64\winver.exe      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\sppcomapi.dll>nul   && icacls %Windir%\SysWOW64\sppcomapi.dll   /deny *S-1-5-32-544:(X) >nul

ping 127.0.0.1 -n 2 >nul

ren %Windir%\System32\slwga.dll     slwga.vvv >nul
ren %Windir%\System32\sppwmi.dll    sppwmi.vvv >nul
ren %Windir%\System32\systemcpl.dll systemcpl.vvv >nul
ren %Windir%\System32\user32.dll    user32.vvv >nul
ren %Windir%\System32\winlogon.exe  winlogon.vvv >nul
ren %Windir%\System32\winver.exe    winver.vvv >nul

ren %Windir%\SysWOW64\slwga.dll     slwga.vvv >nul
ren %Windir%\SysWOW64\sppwmi.dll    sppwmi.vvv >nul
ren %Windir%\SysWOW64\systemcpl.dll systemcpl.vvv >nul
ren %Windir%\SysWOW64\user32.dll    user32.vvv >nul
ren %Windir%\SysWOW64\winver.exe    winver.vvv >nul

ping 127.0.0.1 -n 2 >nul

copy x64T\slwga.dll     %Windir%\System32\slwga.dll >nul
copy x64T\sppwmi.dll    %Windir%\System32\sppwmi.dll >nul
copy x64T\systemcpl.dll %Windir%\System32\systemcpl.dll >nul
copy x64T\user32.dll    %Windir%\System32\user32.dll >nul
copy x64T\winlogon.dll  %Windir%\System32\winlogon.exe >nul
copy x64T\winver.dll    %Windir%\System32\winver.exe >nul

copy SysWOW64T\slwga.dll     %Windir%\SysWOW64\slwga.dll >nul
copy SysWOW64T\sppwmi.dll    %Windir%\SysWOW64\sppwmi.dll >nul
copy SysWOW64T\systemcpl.dll %Windir%\SysWOW64\systemcpl.dll >nul
copy SysWOW64T\user32.dll    %Windir%\SysWOW64\user32.dll >nul
copy SysWOW64T\winver.dll    %Windir%\SysWOW64\winver.exe >nul

ping 127.0.0.1 -n 2 >nul

if not exist %Windir%\System32\slwga.dll >nul     ren %Windir%\System32\slwga.vvv     slwga.dll
if not exist %Windir%\System32\sppwmi.dll >nul    ren %Windir%\System32\sppwmi.vvv    sppwmi.dll
if not exist %Windir%\System32\systemcpl.dll >nul ren %Windir%\System32\systemcpl.vvv systemcpl.dll
if not exist %Windir%\System32\user32.dll >nul    ren %Windir%\System32\user32.vvv    user32.dll
if not exist %Windir%\System32\winlogon.exe >nul  ren %Windir%\System32\winlogon.vvv  winlogon.exe
if not exist %Windir%\System32\winver.exe >nul    ren %Windir%\System32\winver.vvv    winver.exe

if not exist %Windir%\SysWOW64\slwga.dll >nul     ren %Windir%\SysWOW64\slwga.vvv     slwga.dll
if not exist %Windir%\SysWOW64\sppwmi.dll >nul    ren %Windir%\SysWOW64\sppwmi.vvv    sppwmi.dll
if not exist %Windir%\SysWOW64\systemcpl.dll >nul ren %Windir%\SysWOW64\systemcpl.vvv systemcpl.dll
if not exist %Windir%\SysWOW64\user32.dll >nul    ren %Windir%\SysWOW64\user32.vvv    user32.dll
if not exist %Windir%\SysWOW64\winver.exe >nul    ren %Windir%\SysWOW64\winver.vvv    winver.exe

ping 127.0.0.1 -n 2 >nul

if exist %Windir%\System32\slwga.vvv     move %Windir%\System32\slwga.vvv     %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\sppwmi.vvv    move %Windir%\System32\sppwmi.vvv    %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\systemcpl.vvv move %Windir%\System32\systemcpl.vvv %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\user32.vvv    move %Windir%\System32\user32.vvv    %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\winlogon.vvv  move %Windir%\System32\winlogon.vvv  %Temp%\%Random%.tmp >nul
if exist %Windir%\System32\winver.vvv    move %Windir%\System32\winver.vvv    %Temp%\%Random%.tmp >nul

if exist %Windir%\SysWOW64\slwga.vvv     move %Windir%\SysWOW64\slwga.vvv     %Temp%\%Random%.tmp >nul
if exist %Windir%\SysWOW64\sppwmi.vvv    move %Windir%\SysWOW64\sppwmi.vvv    %Temp%\%Random%.tmp >nul
if exist %Windir%\SysWOW64\systemcpl.vvv move %Windir%\SysWOW64\systemcpl.vvv %Temp%\%Random%.tmp >nul
if exist %Windir%\SysWOW64\user32.vvv    move %Windir%\SysWOW64\user32.vvv    %Temp%\%Random%.tmp >nul
if exist %Windir%\SysWOW64\winver.vvv    move %Windir%\SysWOW64\winver.vvv    %Temp%\%Random%.tmp >nul

if exist %Windir%\System32\wlms\wlms.exe takeown /f %Windir%\System32\wlms\wlms.exe >nul 
if exist %Windir%\System32\wlms\wlms.exe icacls %Windir%\System32\wlms\wlms.exe /deny *S-1-5-32-544:F >nul
goto _end

:_Sysnativemain
findstr /I "kjvvv" %Windir%\Sysnative\slwga.dll      & %INH% goto:SysnativeInstall
findstr /I "kjvvv" %Windir%\Sysnative\sppwmi.dll     & %INH% goto:SysnativeInstall
findstr /I "kjvvv" %Windir%\Sysnative\systemcpl.dll  & %INH% goto:SysnativeInstall
findstr /I "kjvvv" %Windir%\Sysnative\user32.dll     & %INH% goto:SysnativeInstall
findstr /I "kjvvv" %Windir%\Sysnative\winlogon.exe   & %INH% goto:SysnativeInstall
findstr /I "kjvvv" %Windir%\Sysnative\winver.exe     & %INH% goto:SysnativeInstall
exit

:SysnativeInstall
start /i Pleasewait.exe
ping 127.0.0.1 -n 2 >nul
taskkill /f /im explorer.exe >nul
takeown /f "%Systemdrive%\Windows Activation Technologies\data" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies\data" /t /grant *S-1-5-32-544:F >nul
ping 127.0.0.1 -n 1 >nul
cd /d "%Systemdrive%\Windows Activation Technologies\data"

takeown /f %Temp% /r /d y >nul                    && icacls %Temp% /t                          /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\slwga.dll >nul      && icacls %Windir%\Sysnative\slwga.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\sppwmi.dll >nul     && icacls %Windir%\Sysnative\sppwmi.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\systemcpl.dll >nul  && icacls %Windir%\Sysnative\systemcpl.dll   /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\user32.dll >nul     && icacls %Windir%\Sysnative\user32.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\winlogon.exe >nul   && icacls %Windir%\Sysnative\winlogon.exe    /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\winver.exe >nul     && icacls %Windir%\Sysnative\winver.exe      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\sppcomapi.dll>nul   && icacls %Windir%\Sysnative\sppcomapi.dll   /deny *S-1-5-32-544:(X) >nul

takeown /f %Windir%\SysWOW64\slwga.dll >nul       && icacls %Windir%\SysWOW64\slwga.dll        /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\sppwmi.dll >nul      && icacls %Windir%\SysWOW64\sppwmi.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\systemcpl.dll >nul   && icacls %Windir%\SysWOW64\systemcpl.dll    /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\user32.dll >nul      && icacls %Windir%\SysWOW64\user32.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\winver.exe >nul      && icacls %Windir%\SysWOW64\winver.exe       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\sppcomapi.dll>nul    && icacls %Windir%\SysWOW64\sppcomapi.dll    /deny *S-1-5-32-544:(X) >nul

ping 127.0.0.1 -n 2 >nul

ren %Windir%\Sysnative\slwga.dll     slwga.vvv >nul
ren %Windir%\Sysnative\sppwmi.dll    sppwmi.vvv >nul
ren %Windir%\Sysnative\systemcpl.dll systemcpl.vvv >nul
ren %Windir%\Sysnative\user32.dll    user32.vvv >nul
ren %Windir%\Sysnative\winlogon.exe  winlogon.vvv >nul
ren %Windir%\Sysnative\winver.exe    winver.vvv >nul

ren %Windir%\SysWOW64\slwga.dll      slwga.vvv >nul
ren %Windir%\SysWOW64\sppwmi.dll     sppwmi.vvv >nul
ren %Windir%\SysWOW64\systemcpl.dll  systemcpl.vvv >nul
ren %Windir%\SysWOW64\user32.dll     user32.vvv >nul
ren %Windir%\SysWOW64\winver.exe     winver.vvv >nul

ping 127.0.0.1 -n 2 >nul

copy x64T\slwga.dll     %Windir%\Sysnative\slwga.dll >nul
copy x64T\sppwmi.dll    %Windir%\Sysnative\sppwmi.dll >nul
copy x64T\systemcpl.dll %Windir%\Sysnative\systemcpl.dll >nul
copy x64T\user32.dll    %Windir%\Sysnative\user32.dll >nul
copy x64T\winlogon.dll  %Windir%\Sysnative\winlogon.exe >nul
copy x64T\winver.dll    %Windir%\Sysnative\winver.exe >nul

copy SysWOW64T\slwga.dll     %Windir%\SysWOW64\slwga.dll >nul
copy SysWOW64T\sppwmi.dll    %Windir%\SysWOW64\sppwmi.dll >nul
copy SysWOW64T\systemcpl.dll %Windir%\SysWOW64\systemcpl.dll >nul
copy SysWOW64T\user32.dll    %Windir%\SysWOW64\user32.dll >nul
copy SysWOW64T\winver.dll    %Windir%\SysWOW64\winver.exe >nul

ping 127.0.0.1 -n 2 >nul

if not exist %Windir%\Sysnative\slwga.dll >nul     ren %Windir%\Sysnative\slwga.vvv     slwga.dll
if not exist %Windir%\Sysnative\sppwmi.dll >nul    ren %Windir%\Sysnative\sppwmi.vvv    sppwmi.dll
if not exist %Windir%\Sysnative\systemcpl.dll >nul ren %Windir%\Sysnative\systemcpl.vvv systemcpl.dll
if not exist %Windir%\Sysnative\user32.dll >nul    ren %Windir%\Sysnative\user32.vvv    user32.dll
if not exist %Windir%\Sysnative\winlogon.exe >nul  ren %Windir%\Sysnative\winlogon.vvv  winlogon.exe
if not exist %Windir%\Sysnative\winver.exe >nul    ren %Windir%\Sysnative\winver.vvv    winver.exe

if not exist %Windir%\SysWOW64\slwga.dll >nul      ren %Windir%\SysWOW64\slwga.vvv      slwga.dll
if not exist %Windir%\SysWOW64\sppwmi.dll >nul     ren %Windir%\SysWOW64\sppwmi.vvv     sppwmi.dll
if not exist %Windir%\SysWOW64\systemcpl.dll >nul  ren %Windir%\SysWOW64\systemcpl.vvv  systemcpl.dll
if not exist %Windir%\SysWOW64\user32.dll >nul     ren %Windir%\SysWOW64\user32.vvv     user32.dll
if not exist %Windir%\SysWOW64\winver.exe >nul     ren %Windir%\SysWOW64\winver.vvv     winver.exe

ping 127.0.0.1 -n 2 >nul

if exist %Windir%\Sysnative\slwga.vvv     move %Windir%\Sysnative\slwga.vvv     %Temp%\%Random%.tmp >nul
if exist %Windir%\Sysnative\sppwmi.vvv    move %Windir%\Sysnative\sppwmi.vvv    %Temp%\%Random%.tmp >nul
if exist %Windir%\Sysnative\systemcpl.vvv move %Windir%\Sysnative\systemcpl.vvv %Temp%\%Random%.tmp >nul
if exist %Windir%\Sysnative\user32.vvv    move %Windir%\Sysnative\user32.vvv    %Temp%\%Random%.tmp >nul
if exist %Windir%\Sysnative\winlogon.vvv  move %Windir%\Sysnative\winlogon.vvv  %Temp%\%Random%.tmp >nul
if exist %Windir%\Sysnative\winver.vvv    move %Windir%\Sysnative\winver.vvv    %Temp%\%Random%.tmp >nul

if exist %Windir%\SysWOW64\slwga.vvv      move %Windir%\SysWOW64\slwga.vvv      %Temp%\%Random%.tmp >nul
if exist %Windir%\SysWOW64\sppwmi.vvv     move %Windir%\SysWOW64\sppwmi.vvv     %Temp%\%Random%.tmp >nul
if exist %Windir%\SysWOW64\systemcpl.vvv  move %Windir%\SysWOW64\systemcpl.vvv  %Temp%\%Random%.tmp >nul
if exist %Windir%\SysWOW64\user32.vvv     move %Windir%\SysWOW64\user32.vvv     %Temp%\%Random%.tmp >nul
if exist %Windir%\SysWOW64\winver.vvv     move %Windir%\SysWOW64\winver.vvv     %Temp%\%Random%.tmp >nul

if exist %Windir%\Sysnative\wlms\wlms.exe takeown /f %Windir%\Sysnative\wlms\wlms.exe >nul 
if exist %Windir%\Sysnative\wlms\wlms.exe icacls %Windir%\Sysnative\wlms\wlms.exe /deny *S-1-5-32-544:F >nul
goto _end

:_end
if not exist %Windir%\Temp md %Windir%\Temp
copy /y Rebooting.vbs %Windir%\Temp\Rebooting.vbs
copy /y Rebooting.cmd %Windir%\Temp\Rebooting.cmd
ping 127.0.0.1 -n 2 >nul
cd /d %Windir%\Temp 
call Rebooting.vbs
takeown /f "%Systemdrive%\Windows Activation Technologies\data" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies\data" /t /deny *S-1-5-32-544:F >nul
exit









