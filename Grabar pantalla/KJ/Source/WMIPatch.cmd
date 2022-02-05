@echo off

echo WMI Patch
echo Please wait...
echo.

cd /d %ScriptPath%
cd /d WMIPatch
call Patch.vbs
cd /d %ScriptPath%
GOTO:END

:END
EXIT /B

