@echo off
pushd %~dp0

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID"
SET RQL=%RC% QUERY "HKEY_CURRENT_USER\Control Panel\International" /v "sLanguage"
SET RQB=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "BuildLab"
SET INL=IF NOT ERRORLEVEL 1

FOR %%i IN (ConsentPromptBehaviorAdmin PromptOnSecureDesktop) DO reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "%%i" /t REG_DWORD /d 0 /f >nul

%RQL% | findstr /I "KOR" && %INL% GOTO:KOR
GOTO:ENU

:ENU
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "" /d "7 Style UI" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "Icon" /d "imageres.dll,240" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "HasLUAShield" /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "NoWorkingDirectory" /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI\command" /ve /d "%HOMEDRIVE%\explorer\7UI\7UI.exe" /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Shell" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\8UI" /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "" /d "ShutDown Windows" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "Icon" /d "SHELL32.dll,27" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "HasLUAShield" /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "NoWorkingDirectory" /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI\command" /ve /d "%HOMEDRIVE%\explorer\sdw.exe" /f
GOTO:END

:KOR
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "" /d "7 클래식 UI" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "Icon" /d "imageres.dll,240" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "HasLUAShield" /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI" /v "NoWorkingDirectory" /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\7UI\command" /ve /d "%HOMEDRIVE%\explorer\7UI\7UI.exe" /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Shell" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\8UI" /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "" /d "시스템 종료" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "Icon" /d "SHELL32.dll,27" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "HasLUAShield" /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI" /v "NoWorkingDirectory" /d "" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\DesktopBackground\Shell\9UI\command" /ve /d "%HOMEDRIVE%\explorer\sdw.exe" /f
GOTO:END

:END
EXIT
