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
if exist %Windir%\System32\slsvc.exe   goto _tokens.dat
if exist %Windir%\System32\sppsvc.exe  goto _tokens.dat
if exist %Windir%\Sysnative\slsvc.exe  goto _tokens.dat
if exist %Windir%\Sysnative\sppsvc.exe goto _tokens.dat 
exit

:_tokens.dat
cls
if exist %userprofile%\desktop\Tokens_Bak\Windows goto _end
md %userprofile%\desktop\Tokens_Bak\Windows
start /i Pleasewait.vbs
cscript //Nologo Pleasewait_v.vbs
ping -n 2 localhost >nul
if exist %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform takeown /f %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform >nul && icacls %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform /t /grant everyone:f >nul
if exist %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareLicensing takeown /f %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareLicensing >nul && icacls %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareLicensing /t /grant everyone:f >nul
if exist %Windir%\System32\slsvc.exe goto _Vistatokens.dat
if exist %Windir%\System32\sppsvc.exe goto _7tokens.dat
if exist %Windir%\Sysnative\slsvc.exe goto _Vistatokens.dat 
if exist %Windir%\Sysnative\sppsvc.exe goto _7tokens.dat 
goto _end

:_Vistatokens.dat
net stop slsvc /y >nul
cls
xcopy /cheriky %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareLicensing "%userprofile%\desktop\Tokens_Bak\Windows" >nul
taskkill /f /im wscript.exe >nul
if exist "%userprofile%\desktop\Tokens_Bak\Windows" start /i Successful.vbs && cscript //Nologo Successful_v.vbs
ping 127.0.0.1 -n 1 >nul
taskkill /f /im wscript.exe >nul
net start slsvc >nul 
cls
goto _end

:_7tokens.dat
net stop sppsvc /y >nul
cls
xcopy /cheriky %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform "%userprofile%\desktop\Tokens_Bak\Windows" >nul
taskkill /f /im wscript.exe >nul
if exist "%userprofile%\desktop\Tokens_Bak\Windows" start /i Successful.vbs && cscript //Nologo Successful_v.vbs
ping 127.0.0.1 -n 1 >nul
taskkill /f /im wscript.exe >nul
net start sppsvc >nul
cls
goto _end

:_end
exit