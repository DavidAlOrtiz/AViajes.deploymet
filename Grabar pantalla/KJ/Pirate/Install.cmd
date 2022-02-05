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

%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "R2" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
goto:fail

:Install_7
start /i Pleasewait.exe
if exist %Windir%\Sysnative\sppsvc.exe goto _Sysnativemain
if exist %Windir%\System32\sppsvc.exe  goto _System32main
goto:fail

:_System32main
if exist %Windir%\SysWOW64\cmd.exe goto _System64main
taskkill /f /im explorer.exe >nul
takeown /f %Temp% /r /d y >nul                   && icacls %Temp% /t                         /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\slwga.dll >nul      && icacls %Windir%\System32\slwga.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\sppwmi.dll >nul     && icacls %Windir%\System32\sppwmi.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\systemcpl.dll >nul  && icacls %Windir%\System32\systemcpl.dll   /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\user32.dll >nul     && icacls %Windir%\System32\user32.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\winlogon.exe >nul   && icacls %Windir%\System32\winlogon.exe    /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\winver.exe >nul     && icacls %Windir%\System32\winver.exe      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\sppcomapi.dll>nul   && icacls %Windir%\System32\sppcomapi.dll   /deny *S-1-2-0:(X)>nul
takeown /f %Windir%\System32\sppsvc.exe>nul      && icacls %Windir%\System32\sppsvc.exe      /deny *S-1-5-19:F>nul

ping 127.0.0.1 -n 2 >nul

ren %Windir%\System32\slwga.dll     slwga.vvv >nul
ren %Windir%\System32\sppwmi.dll    sppwmi.vvv >nul
ren %Windir%\System32\systemcpl.dll systemcpl.vvv >nul
ren %Windir%\System32\user32.dll    user32.vvv >nul
ren %Windir%\System32\winlogon.exe  winlogon.vvv >nul
ren %Windir%\System32\winver.exe    winver.vvv >nul

ping 127.0.0.1 -n 2 >nul

copy T\x86T\slwga.dll     %Windir%\System32\slwga.dll >nul
copy T\x86T\sppwmi.dll    %Windir%\System32\sppwmi.dll >nul
copy T\x86T\systemcpl.dll %Windir%\System32\systemcpl.dll >nul
copy T\x86T\user32.dll    %Windir%\System32\user32.dll >nul
copy T\x86T\winlogon.dll  %Windir%\System32\winlogon.exe >nul
copy T\x86T\winver.dll    %Windir%\System32\winver.exe >nul

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
call %Windir%\System32\regedt32.exe /s MuiCache.reg
call %Windir%\System32\mcbuilder.exe
goto _end

:_System64main
taskkill /f /im explorer.exe >nul
takeown /f %Temp% /r /d y >nul                   && icacls %Temp% /t                         /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\slwga.dll >nul      && icacls %Windir%\System32\slwga.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\sppwmi.dll >nul     && icacls %Windir%\System32\sppwmi.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\systemcpl.dll >nul  && icacls %Windir%\System32\systemcpl.dll   /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\user32.dll >nul     && icacls %Windir%\System32\user32.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\winlogon.exe >nul   && icacls %Windir%\System32\winlogon.exe    /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\winver.exe >nul     && icacls %Windir%\System32\winver.exe      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\System32\sppcomapi.dll>nul   && icacls %Windir%\System32\sppcomapi.dll   /deny *S-1-2-0:(X)>nul
takeown /f %Windir%\System32\sppsvc.exe>nul      && icacls %Windir%\System32\sppsvc.exe      /deny *S-1-5-19:F>nul

takeown /f %Windir%\SysWOW64\slwga.dll >nul      && icacls %Windir%\SysWOW64\slwga.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\sppwmi.dll >nul     && icacls %Windir%\SysWOW64\sppwmi.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\systemcpl.dll >nul  && icacls %Windir%\SysWOW64\systemcpl.dll   /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\user32.dll >nul     && icacls %Windir%\SysWOW64\user32.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\winver.exe >nul     && icacls %Windir%\SysWOW64\winver.exe      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\sppcomapi.dll>nul   && icacls %Windir%\SysWOW64\sppcomapi.dll   /deny *S-1-2-0:(X)>nul

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

copy T\x64T\slwga.dll     %Windir%\System32\slwga.dll >nul
copy T\x64T\sppwmi.dll    %Windir%\System32\sppwmi.dll >nul
copy T\x64T\systemcpl.dll %Windir%\System32\systemcpl.dll >nul
copy T\x64T\user32.dll    %Windir%\System32\user32.dll >nul
copy T\x64T\winlogon.dll  %Windir%\System32\winlogon.exe >nul
copy T\x64T\winver.dll    %Windir%\System32\winver.exe >nul

copy T\SysWOW64T\slwga.dll     %Windir%\SysWOW64\slwga.dll >nul
copy T\SysWOW64T\sppwmi.dll    %Windir%\SysWOW64\sppwmi.dll >nul
copy T\SysWOW64T\systemcpl.dll %Windir%\SysWOW64\systemcpl.dll >nul
copy T\SysWOW64T\user32.dll    %Windir%\SysWOW64\user32.dll >nul
copy T\SysWOW64T\winver.dll    %Windir%\SysWOW64\winver.exe >nul

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
call %Windir%\System32\regedt32.exe /s MuiCache.reg
call %Windir%\System32\mcbuilder.exe
goto _end

:_Sysnativemain
taskkill /f /im explorer.exe >nul
takeown /f %Temp% /r /d y >nul                    && icacls %Temp% /t                          /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\slwga.dll >nul      && icacls %Windir%\Sysnative\slwga.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\sppwmi.dll >nul     && icacls %Windir%\Sysnative\sppwmi.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\systemcpl.dll >nul  && icacls %Windir%\Sysnative\systemcpl.dll   /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\user32.dll >nul     && icacls %Windir%\Sysnative\user32.dll      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\winlogon.exe >nul   && icacls %Windir%\Sysnative\winlogon.exe    /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\winver.exe >nul     && icacls %Windir%\Sysnative\winver.exe      /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\Sysnative\sppcomapi.dll>nul   && icacls %Windir%\Sysnative\sppcomapi.dll   /deny *S-1-2-0:(X)>nul
takeown /f %Windir%\Sysnative\sppsvc.exe>nul      && icacls %Windir%\Sysnative\sppsvc.exe      /deny *S-1-5-19:F>nul

takeown /f %Windir%\SysWOW64\slwga.dll >nul       && icacls %Windir%\SysWOW64\slwga.dll        /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\sppwmi.dll >nul      && icacls %Windir%\SysWOW64\sppwmi.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\systemcpl.dll >nul   && icacls %Windir%\SysWOW64\systemcpl.dll    /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\user32.dll >nul      && icacls %Windir%\SysWOW64\user32.dll       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\winver.exe >nul      && icacls %Windir%\SysWOW64\winver.exe       /grant *S-1-5-32-544:F >nul
takeown /f %Windir%\SysWOW64\sppcomapi.dll>nul    && icacls %Windir%\SysWOW64\sppcomapi.dll    /deny *S-1-2-0:(X)>nul

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

copy T\x64T\slwga.dll     %Windir%\Sysnative\slwga.dll >nul
copy T\x64T\sppwmi.dll    %Windir%\Sysnative\sppwmi.dll >nul
copy T\x64T\systemcpl.dll %Windir%\Sysnative\systemcpl.dll >nul
copy T\x64T\user32.dll    %Windir%\Sysnative\user32.dll >nul
copy T\x64T\winlogon.dll  %Windir%\Sysnative\winlogon.exe >nul
copy T\x64T\winver.dll    %Windir%\Sysnative\winver.exe >nul

copy T\SysWOW64T\slwga.dll     %Windir%\SysWOW64\slwga.dll >nul
copy T\SysWOW64T\sppwmi.dll    %Windir%\SysWOW64\sppwmi.dll >nul
copy T\SysWOW64T\systemcpl.dll %Windir%\SysWOW64\systemcpl.dll >nul
copy T\SysWOW64T\user32.dll    %Windir%\SysWOW64\user32.dll >nul
copy T\SysWOW64T\winver.dll    %Windir%\SysWOW64\winver.exe >nul

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
call %Windir%\Sysnative\regedt32.exe /s MuiCache.reg
call %Windir%\Sysnative\mcbuilder.exe
goto _end

:_end
if exist check del /q/ f check >nul
if exist   "%Systemdrive%\Windows Activation Technologies" takeown /f "%Systemdrive%\Windows Activation Technologies" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies" /t /grant *S-1-5-32-544:F >nul
if exist   "%Systemdrive%\Windows Activation Technologies" attrib "%Systemdrive%\Windows Activation Technologies" /s /d -h -s -r   && move "%Systemdrive%\Windows Activation Technologies" %Temp%\%Random%.tmp >nul
xcopy wat  "%Systemdrive%\Windows Activation Technologies" /cheriky >nul
xcopy T    "%Systemdrive%\Windows Activation Technologies\data" /cheriky >nul
takeown /f "%Systemdrive%\Windows Activation Technologies\data" /r /d y >nul && icacls "%Systemdrive%\Windows Activation Technologies\data" /t /deny *S-1-5-32-544:F >nul
attrib "%Systemdrive%\Windows Activation Technologies" /s /d +h +s +r >nul
schtasks /create /tn "\Microsoft\Windows\Windows Activation Technologies\WatTask" /xml WatTask.xml /f >nul
if not exist %Windir%\Temp md %Windir%\Temp
copy /y Rebooting.vbs %Windir%\Temp\Rebooting.vbs
copy /y Rebooting.cmd %Windir%\Temp\Rebooting.cmd
ping 127.0.0.1 -n 2 >nul
cd /d %Windir%\Temp 
call Rebooting.vbs
exit

:fail
if exist check del /q/ f check >nul
taskkill /f /im Pleasewait.exe >nul
call Failed.exe
exit









