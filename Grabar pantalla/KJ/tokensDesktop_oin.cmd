@echo off
pushd %~dp0

1>nul 2>&1 REG QUERY "HKLM\SOFTWARE\Microsoft\Office\14.0" /s
IF ERRORLEVEL 1 goto _end

if exist "%userprofile%\desktop\Tokens_Bak\Office"   goto _end
if exist "%userprofile%\¹ÙÅÁ È­¸é\Tokens_Bak\Office" goto _end

:_tokens.dat
cls
echo Please wait ...
ping -n 2 localhost >nul
if exist %Windir%\System32\slmgr.vbs      goto _7
if not exist %Windir%\System32\slmgr.vbs  goto _xp
goto _end

:_7
start /i Pleasewait.vbs && cscript //Nologo Pleasewait_v.vbs
net stop osppsvc >nul
cls
xcopy /cheriky "%systemdrive%\ProgramData\Microsoft\OfficeSoftwareProtectionPlatform" "%userprofile%\desktop\Tokens_Bak\Office" >nul
if exist "%userprofile%\desktop\Tokens_Bak\Office" start /i "%userprofile%\desktop\Tokens_Bak\Office"
taskkill /f /im wscript.exe >nul
if exist "%userprofile%\desktop\Tokens_Bak\Office" start /i Successful.vbs && cscript //Nologo Successful_v.vbs
ping 127.0.0.1 -n 1 >nul
taskkill /f /im wscript.exe >nul
net start osppsvc >nul 
cls
goto _end

:_xp
start /i Pleasewait.vbs && cscript //Nologo Pleasewait_v.vbs
net stop osppsvc >nul
cls
if exist "%userprofile%\desktop"   xcopy /cheriky "%systemdrive%\Documents and Settings\All Users\Microsoft\OfficeSoftwareProtectionPlatform" "%userprofile%\desktop\Tokens_Bak\Office" >nul
if exist "%userprofile%\¹ÙÅÁ È­¸é" xcopy /cheriky "%systemdrive%\Documents and Settings\All Users\Microsoft\OfficeSoftwareProtectionPlatform" "%userprofile%\¹ÙÅÁ È­¸é\Tokens_Bak\Office" >nul
taskkill /f /im wscript.exe >nul
if exist "%userprofile%\desktop\Tokens_Bak\Office"   start /i Successful.vbs && cscript //Nologo Successful_v.vbs
if exist "%userprofile%\¹ÙÅÁ È­¸é\Tokens_Bak\Office" start /i Successful.vbs && cscript //Nologo Successful_v.vbs
ping 127.0.0.1 -n 1 >nul
taskkill /f /im wscript.exe >nul
net start osppsvc >nul
cls
goto _end

:_end
exit


