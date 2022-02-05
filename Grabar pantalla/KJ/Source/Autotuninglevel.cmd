@echo off

if exist %Windir%\Sysnstive\cmd.exe goto:native

call %Windir%\System32\netsh.exe interface tcp set global autotuninglevel=highlyrestricted >nul
goto:end

:native
call %Windir%\Sysnative\netsh.exe interface tcp set global autotuninglevel=highlyrestricted >nul
goto:end

:end
exit /b










