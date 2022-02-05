@echo off
pushd %~dp0

mode con cols=28 lines=5

schtasks /delete /tn "\Microsoft\Windows\UI\SvcRestartTask" /f >nul
cls
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Shell" /f >nul
cls
SET ScriptPath=%~dp0
IF EXIST %Windir%\Sysnative\sppsvc.exe set SysPath=%Windir%\Sysnative
IF EXIST %Windir%\System32\sppsvc.exe  set SysPath=%Windir%\System32
SET RC=%SysPath%\reg.exe
SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 
SET RQL=%RC% QUERY "HKEY_CURRENT_USER\Control Panel\International" /v "sLanguage"
SET RQN=%RC% QUERY "HKEY_CURRENT_USER\Control Panel\International" /v "LocaleName"
SET RQB=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "BuildLab"
SET INL=IF NOT ERRORLEVEL 1
SET INH=IF ERRORLEVEL 1

:Check1
%RQB% | findstr /I "9200" && %INL% GOTO:INSTALL
goto:fail

:INSTALL
cls
echo.
echo.  Working, Please wait ...
start /i UI\UI.exe
taskkill /f /im explorer.exe >nul
cls
echo.
echo.  Working, Please wait ...
if exist %Windir%\Sysnative\sppsvc.exe goto _Sysnativemain
if exist %Windir%\System32\sppsvc.exe  goto _System32main
goto:fail

:_System32main
if exist %Windir%\SysWOW64\cmd.exe goto _System64main
if exist %Temp% takeown /f %Temp% /r /d y >nul && icacls %Temp% /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer takeown /f %Systemdrive%\explorer /r /d y >nul & icacls %Systemdrive%\explorer /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer attrib %Systemdrive%\explorer /s /d -h -s -r   & move %Systemdrive%\explorer %Temp%\%Random%.tmp >nul
ping 127.0.0.1 -n 3 >nul
xcopy x86\explorer %Systemdrive%\explorer /cheriky >nul
xcopy UI %Systemdrive%\explorer /cheriky >nul
xcopy UIS1 %Systemdrive%\explorer /cheriky >nul
xcopy mui %Systemdrive%\explorer /cheriky >nul
xcopy SDW %Systemdrive%\explorer /cheriky >nul
attrib %Systemdrive%\explorer /s /d +h +s +r >nul
call %Windir%\System32\regedt32.exe /s Install_x86.reg
goto _end

:_System64main
if exist %Temp% takeown /f %Temp% /r /d y >nul && icacls %Temp% /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer takeown /f %Systemdrive%\explorer /r /d y >nul && icacls %Systemdrive%\explorer /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer attrib %Systemdrive%\explorer /s /d -h -s -r   && move %Systemdrive%\explorer %Temp%\%Random%.tmp >nul
ping 127.0.0.1 -n 3 >nul
xcopy x64\explorer %Systemdrive%\explorer /cheriky >nul
xcopy UI %Systemdrive%\explorer /cheriky >nul
xcopy UIS1 %Systemdrive%\explorer /cheriky >nul
xcopy mui %Systemdrive%\explorer /cheriky >nul
xcopy SDW %Systemdrive%\explorer /cheriky >nul
attrib %Systemdrive%\explorer /s /d +h +s +r >nul
call %Windir%\System32\regedt32.exe /s Install_x64.reg
goto _end

:_Sysnativemain
if exist %Temp% takeown /f %Temp% /r /d y >nul && icacls %Temp% /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer takeown /f %Systemdrive%\explorer /r /d y >nul && icacls %Systemdrive%\explorer /t /grant:r *S-1-5-32-544:F >nul
if exist %Systemdrive%\explorer attrib %Systemdrive%\explorer /s /d -h -s -r   && move %Systemdrive%\explorer %Temp%\%Random%.tmp >nul
ping 127.0.0.1 -n 3 >nul
xcopy x64\explorer %Systemdrive%\explorer /cheriky >nul
xcopy UI %Systemdrive%\explorer /cheriky >nul
xcopy UIS1 %Systemdrive%\explorer /cheriky >nul
xcopy mui %Systemdrive%\explorer /cheriky >nul
xcopy SDW %Systemdrive%\explorer /cheriky >nul
attrib %Systemdrive%\explorer /s /d +h +s +r >nul
call %Windir%\Sysnative\regedt32.exe /s Install_x64.reg
goto _end

:_end
echo.
echo. Checking, LocaleName ...
FOR %%i IN (ConsentPromptBehaviorAdmin PromptOnSecureDesktop) DO %RC% ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "%%i" /t REG_DWORD /d 0 /f >nul
%RQL% | findstr /I "KOR" && %INL% GOTO:KOR
GOTO:ENU

:ENU
cls
mode con cols=38 lines=27
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "" /d "7 Style UI" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "Icon" /d "imageres.dll,240" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "HasLUAShield" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "NoWorkingDirectory" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI\command" /ve /d "%HOMEDRIVE%\explorer\7UI\7UI.exe" /f

%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "" /d "ShutDown Windows" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "Icon" /d "SHELL32.dll,27" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "HasLUAShield" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "NoWorkingDirectory" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI\command" /ve /d "%HOMEDRIVE%\explorer\sdw.exe" /f

%RC% ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{871C5380-42A0-1069-A2EA-08002B30301D}" /t REG_DWORD /d 0 /f
%RC% ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{871C5380-42A0-1069-A2EA-08002B30301D}" /t REG_DWORD /d 0 /f
%RC% COPY HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309D} HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D} /s /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D} /ve /d "Internet Explorer" /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\OpenHomePage /ve /d "OpenHomePage(&H)" /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Properties /ve /d "Roperties(&R)" /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Properties /v "Position" /d "bottom" /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Properties\command /ve /d "control.exe inetcpl.cpl" /f
%RC% ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30301D} /f
GOTO:END

:KOR
cls
mode con cols=28 lines=27
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "" /d "7 클래식 UI" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "Icon" /d "imageres.dll,240" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "HasLUAShield" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "NoWorkingDirectory" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI\command" /ve /d "%HOMEDRIVE%\explorer\7UI\7UI.exe" /f

%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "" /d "시스템 종료" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "Icon" /d "SHELL32.dll,27" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "HasLUAShield" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "NoWorkingDirectory" /d "" /f
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI\command" /ve /d "%HOMEDRIVE%\explorer\sdw.exe" /f

%RC% ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu /v "{871C5380-42A0-1069-A2EA-08002B30301D}" /t REG_DWORD /d 0 /f
%RC% ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel /v "{871C5380-42A0-1069-A2EA-08002B30301D}" /t REG_DWORD /d 0 /f
%RC% COPY HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30309D} HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D} /s /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D} /ve /d "Internet Explorer" /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\OpenHomePage /ve /d "홈 페이지 열기(&H)" /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Properties /ve /d "속성(&R)" /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Properties /v "Position" /d "bottom" /f
%RC% ADD HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\Properties\command /ve /d "control.exe inetcpl.cpl" /f
%RC% ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{871C5380-42A0-1069-A2EA-08002B30301D} /f
GOTO:END

:END
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v FilterAdministratorToken /t REG_DWORD /d "0" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\explorer\7UI\7AUI\7AUI.exe" /d "~ RUNASADMIN" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\explorer\8UI\8AUI\8AUI.exe" /d "~ RUNASADMIN" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\explorer\7UI\7AUI\7AUI.exe" /d "~ RUNASADMIN" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\explorer\8UI\8AUI\8AUI.exe" /d "~ RUNASADMIN" /f
copy /y "Classic Style UI.lnk" "%Systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Classic Style UI.lnk" >nul
ping 127.0.0.1 -n 4 >nul
%RC% DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\8UI" /f >nul
cls
%RC% DELETE HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D} /v "LocalizedString" /f >nul
cls
%RC% DELETE HKEY_CLASSES_ROOT\CLSID\{871C5380-42A0-1069-A2EA-08002B30301D}\shell\OpenHomePage /v LegacyDisable /f >nul
cls
mode con cols=28 lines=5
echo.
echo.     Done, Successfully.
ping 127.0.0.1 -n 2 >nul
call %SysPath%\shutdown.exe /l
exit

:fail
taskkill /f /im UI.exe >nul
cls
mode con cols=28 lines=5
echo.
echo.          Failed.
call Failed.exe
exit















