@echo off
pushd %~dp0

Start /w FSCapture.exe
goto:end

:end
exit