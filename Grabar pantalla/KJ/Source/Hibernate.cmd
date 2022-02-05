@echo off

if exist %Windir%\Sysnstive\cmd.exe goto:native

call %Windir%\System32\powercfg.exe /hibernate off >nul
goto:end

:native
call %Windir%\Sysnstive\powercfg.exe /hibernate off >nul
goto:end

:end
exit /b










