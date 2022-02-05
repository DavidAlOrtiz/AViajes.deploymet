@echo off
pushd %~dp0
regedit /s Screen2Exe.reg
Start /w Screen2Exe.exe
regedit /s Screen2Exe_R.reg
exit











