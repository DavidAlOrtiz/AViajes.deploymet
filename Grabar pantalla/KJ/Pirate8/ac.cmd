@echo off

mode con cols=19 lines=2

cls
echo.  Please wait ...
start /i slmgr.vbs -dlv
cls
echo.  Please wait ...
start /i slmgr.vbs -dli
cls
echo.  Please wait ...
start /i slmgr.vbs -xpr
cls
echo.  Please wait ...
start /i slui.exe
cls
echo.  Please wait ...
start /i %Windir%\System32\control.exe /name Microsoft.System
DEL /F /Q %0% >nul
exit













