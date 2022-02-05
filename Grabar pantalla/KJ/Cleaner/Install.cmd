@echo off
mode con cols=28 lines=3
pushd %~dp0

echo.
echo.  Working, Please wait ...
ping 127.0.0.1 -n 2 >nul
if exist %Windir%\Cleaner.cmd attrib %Windir%\Cleaner.cmd -h -s -r
mode con cols=28 lines=12
echo.
echo.  Copying Cleaner file ...
1>nul 2>nul copy /y Cleaner.cmd %Windir%\Cleaner.cmd && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
ping 127.0.0.1 -n 2 >nul
echo.
echo.  Hidden Cleaner file ...
1>nul 2>nul attrib %Windir%\Cleaner.cmd +h +s +r && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
ping 127.0.0.1 -n 2 >nul
echo.
echo. Installing Cleaner Task ...
1>nul 2>nul schtasks /create /tn "\Microsoft\Windows\Windows Activation Technologies\Cleaner" /xml Cleaner.xml /f && echo       status: OK
IF ERRORLEVEL 1 echo       status: Error
ping 127.0.0.1 -n 2 >nul
cls
mode con cols=28 lines=3
echo.
echo.     Done, Successfully.
ping 127.0.0.1 -n 3 >nul
start /i Cleaner.cmd >nul
exit

















