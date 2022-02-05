@echo off
pushd %~dp0
if exist %Windir%\System32\SnippingTool.exe goto:SnippingTool
if exist %Windir%\Sysnative\SnippingTool.exe goto:SnippingTool
Start /w FSCapture.exe
goto:end

:SnippingTool
if exist %Windir%\System32\SnippingTool.exe call %Windir%\System32\SnippingTool.exe
if exist %Windir%\Sysnative\SnippingTool.exe call %Windir%\Sysnative\SnippingTool.exe
goto:end

:end
exit