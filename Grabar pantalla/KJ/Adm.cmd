@echo off
mode con cols=25 lines=3
pushd %~dp0

start /i UI\UI\UI.exe

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe

set par=%~1
set par=%par:/=%
if /i "%par%" == "1" goto _Active
if /i "%par%" == "2" goto _Remove
if /i "%par%" == "3" goto _CMD
if /i "%par%" == "4" goto _CMDR
if /i "%par%" == "5" goto _IE
if /i "%par%" == "6" goto _IER
if /i "%par%" == "7" goto _CMDFILE
if /i "%par%" == "8" goto _CMDFILER
if /i "%par%" == "x" goto _end
if /i "%par%" == "X" goto _end
goto _main

:_Active
cls
echo.
echo.     Please wait.
ping -n 2 localhost >nul
cls
echo.
echo.   Windows Logoff 03sec
ping -n 2 localhost >nul
cls
echo.
echo.   Windows Logoff 02sec
ping -n 2 localhost >nul
cls
echo.
echo.   Windows Logoff 01sec
ping -n 2 localhost >nul
cls
echo.
echo.   Windows Logoff 00sec
ping -n 2 localhost >nul
cls
echo.
echo.     System Logoff
ping -n 2 localhost >nul
cls
echo.
net user Administrator /active:yes
ping -n 2 localhost >nul
shutdown /l
exit

:_Remove
cls
echo.
echo.     Please wait.
ping -n 2 localhost >nul
cls
echo.
echo.   Windows Logoff 03sec
ping -n 2 localhost >nul
cls
echo.
echo.   Windows Logoff 02sec
ping -n 2 localhost >nul
cls
echo.
echo.   Windows Logoff 01sec
ping -n 2 localhost >nul
cls
echo.
echo.   Windows Logoff 00sec
ping -n 2 localhost >nul
cls
echo.
echo.     System Logoff
ping -n 2 localhost >nul
cls
echo.
net user Administrator /active:no 
ping -n 2 localhost >nul
shutdown /l
exit

:_CMD
cls
echo.
echo.     Please wait.
ping -n 2 localhost >nul
%RC% ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /f >nul
%RC% ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Windows\System32\cmd.exe" /d "~ RUNASADMIN" /f >nul
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /f >nul
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Windows\System32\cmd.exe" /d "~ RUNASADMIN" /f >nul
IF NOT EXIST %Windir%\SysWOW64\cmd.exe GOTO:END
%RC% ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Windows\SysWOW64\cmd.exe" /d "~ RUNASADMIN" /f >nul
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Windows\SysWOW64\cmd.exe" /d "~ RUNASADMIN" /f >nul
GOTO:END

:_CMDR
cls
echo.
echo.     Please wait.
ping -n 2 localhost >nul
%RC% DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Windows\System32\cmd.exe" /f >nul
%RC% DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Windows\System32\cmd.exe" /f >nul
IF NOT EXIST %Windir%\SysWOW64\cmd.exe GOTO:END
%RC% DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Windows\SysWOW64\cmd.exe" /f >nul
%RC% DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Windows\SysWOW64\cmd.exe" /f >nul
GOTO:END

:_IE
cls
echo.
echo.     Please wait.
ping -n 2 localhost >nul
%RC% ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /f >nul
%RC% ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Program Files\Internet Explorer\iexplore.exe" /d "~ RUNASADMIN" /f >nul
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /f >nul
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Program Files\Internet Explorer\iexplore.exe" /d "~ RUNASADMIN" /f >nul
IF NOT EXIST "%HOMEDRIVE%\Program Files (x86)\Internet Explorer\iexplore.exe" GOTO:END
%RC% ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Program Files (x86)\Internet Explorer\iexplore.exe" /d "~ RUNASADMIN" /f >nul
%RC% ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Program Files (x86)\Internet Explorer\iexplore.exe" /d "~ RUNASADMIN" /f >nul
GOTO:END

:_IER
cls
echo.
echo.     Please wait.
ping -n 2 localhost >nul
%RC% DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Program Files\Internet Explorer\iexplore.exe" /f >nul
%RC% DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Program Files\Internet Explorer\iexplore.exe" /f >nul
IF NOT EXIST "%HOMEDRIVE%\Program Files (x86)\Internet Explorer\iexplore.exe" GOTO:END
%RC% DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Program Files (x86)\Internet Explorer\iexplore.exe" /f >nul
%RC% DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%HOMEDRIVE%\Program Files (x86)\Internet Explorer\iexplore.exe" /f >nul
GOTO:END

:_CMDFILE
cls
echo.
echo.     Please wait.
ping -n 2 localhost >nul
%RC% ADD "HKLM\SOFTWARE\Classes\cmdfile\shell" /ve /d "runas" /f >nul
GOTO:END

:_CMDFILER
cls
echo.
echo.     Please wait.
ping -n 2 localhost >nul
%RC% ADD "HKLM\SOFTWARE\Classes\cmdfile\shell" /ve /d "" /f >nul
GOTO:END

:END
cls
echo.
echo.   Done, Successfully.
ping 127.0.0.1 -n 2 >nul
taskkill /f /im UI.exe >nul
exit