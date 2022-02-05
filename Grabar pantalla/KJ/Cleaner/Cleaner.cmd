@echo off
mode con cols=16 lines=1

takeown /F "%Temp%" /r /d y >nul  && icacls "%Temp%" /t /grant *S-1-1-0:f >nul
cls
takeown /F "%USERPROFILE%\AppData\Local\Temp" /r /d y >nul  && icacls "%USERPROFILE%\AppData\Local\Temp" /t /grant *S-1-1-0:f >nul
cls
takeown /F "%USERPROFILE%\AppData\LocalLow\Temp" /r /d y >nul  && icacls "%USERPROFILE%\AppData\LocalLow\Temp" /t /grant *S-1-1-0:f >nul
cls
takeown /F "%Windir%\Temp" /r /d y >nul && icacls "%Windir%\Temp" /t /grant *S-1-1-0:f >nul
cls
takeown /F "%Windir%\WinSxS\Temp" /r /d y >nul && icacls "%Windir%\WinSxS\Temp" /t /grant *S-1-1-0:f >nul
cls
takeown /F "%Windir%\SoftwareDistribution\Download" /r /d y >nul && icacls "%Windir%\SoftwareDistribution\Download" /t /grant *S-1-1-0:f >nul
cls
takeown /F "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" /r /d y >nul  && icacls "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" /t /grant *S-1-1-0:f >nul

:: Temp_1
cls
rd /s /q "%Temp%" >nul
if not exist %Temp% md %Temp% >nul

:: Temp_2
cls
rd /s /q "%USERPROFILE%\AppData\Local\Temp" >nul
if not exist "%USERPROFILE%\AppData\Local\Temp" md "%USERPROFILE%\AppData\Local\Temp" >nul

:: Temp_3
cls
rd /s /q "%USERPROFILE%\AppData\LocalLow\Temp" >nul
if not exist "%USERPROFILE%\AppData\LocalLow\Temp" md "%USERPROFILE%\AppData\LocalLow\Temp" >nul

:: Temp_4
cls
rd /s /q %Windir%\Temp >nul
if not exist %Windir%\Temp md %Windir%\Temp >nul

:: Temp_5
cls
rd /s /q %Windir%\WinSxS\Temp >nul
if not exist %Windir%\WinSxS\Temp md %Windir%\WinSxS\Temp >nul

:: Temp_6
cls
rd /s /q %Windir%\SoftwareDistribution\Download >nul
if not exist %Windir%\SoftwareDistribution\Download md %Windir%\SoftwareDistribution\Download >nul

:: Temp_7
cls
rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" >nul
if not exist "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" md "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" >nul

:: Temp_8
cls
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f >nul
cls
exit
