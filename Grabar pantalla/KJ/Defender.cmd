@echo off
pushd %~dp0

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "%Systemdrive%\explorer" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "%Systemdrive%\Windows Activation Technologies" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "%Systemdrive%\Windows\KJ" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "%Systemdrive%\Windows\KJ.exe" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "%Systemdrive%\Windows\Cleaner.cmd" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths" /v "%Systemdrive%\Windows\System32\SLCHook.dll" /t REG_DWORD /d 0 /f

if exist "%Systemdrive%\Program Files\Microsoft Security Client\msseces.exe"       goto:mse
if exist "%Systemdrive%\Program Files (x86)\Microsoft Security Client\msseces.exe" goto:mse
exit /b

:mse
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\SpyNet" /v "SpyNetReporting" /t REG_DWORD /d 0 /f

REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /v "%Systemdrive%\explorer" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /v "%Systemdrive%\Windows Activation Technologies" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /v "%Systemdrive%\Windows\KJ" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /v "%Systemdrive%\Windows\KJ.exe" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /v "%Systemdrive%\Windows\Cleaner.cmd" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Antimalware\Exclusions\Paths" /v "%Systemdrive%\Windows\System32\SLCHook.dll" /t REG_DWORD /d 0 /f
exit /b

