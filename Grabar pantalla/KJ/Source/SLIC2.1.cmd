@echo off

cscript //nologo Bios.vbs | findstr /I "INTEL" >nul
IF NOT ERRORLEVEL 1 GOTO:INTEL

:APPLE
cd /d %ScriptPath%
cd /d BIOS_Emulator
call Install_w7A.cmd
cd /d %ScriptPath%
GOTO:END

:INTEL
cd /d %ScriptPath%
cd /d BIOS_Emulator
call Install_w7A.cmd
cd /d %ScriptPath%
GOTO:END

:END
EXIT /B










