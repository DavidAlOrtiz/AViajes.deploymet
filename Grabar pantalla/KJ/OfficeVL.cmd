@echo off

set ScriptPath=%~dp0
cls
set Visio=N
set Project=N
Set SharePointDesigner=N

:RunTool
REM Check Office Architecture Type
if '%processor_architecture%'=='x86' Set OfficeArchType=32 && Goto:EndArchCheck
goto:WOWCheck

:WOWCheck
if exist "%SystemDrive%\Program Files (x86)\Common Files\Microsoft Shared\OfficeSoftwareProtectionPlatform" Set OfficeArchType=WOW && Goto:EndArchCheck
Set OfficeArchType=64

:EndArchCheck

REM Find License Management Script
if exist "%SystemDrive%\Program Files (x86)\Microsoft Office\Office14\OSPP.VBS" (
set osppvbs="%SystemDrive%\Program Files (x86)\Microsoft Office\Office14\OSPP.VBS"
) ELSE (
set osppvbs="%SystemDrive%\Program Files\Microsoft Office\Office14\OSPP.VBS"
)

REM Visio Check
if exist "%SystemDrive%\Program Files\Microsoft Office\Office14\VISIO.EXE" Set Visio=Y
if exist "%SystemDrive%\Program Files (x86)\Microsoft Office\Office14\VISIO.EXE" Set Visio=Y

REM Project Check
if exist "%SystemDrive%\Program Files\Microsoft Office\Office14\WINPROJ.EXE" Set Project=Y
if exist "%SystemDrive%\Program Files (x86)\Microsoft Office\Office14\WINPROJ.EXE" Set Project=Y

REM SharePointDesigner Check
if exist "%SystemDrive%\Program Files\Microsoft Office\Office14\SPDESIGN.EXE" Set SharePointDesigner=Y
if exist "%SystemDrive%\Program Files (x86)\Microsoft Office\Office14\SPDESIGN.EXE" Set SharePointDesigner=Y

REM Delete Tokens Cache
net stop osppsvc >nul
if exist "%systemdrive%\Documents and Settings\All Users\Microsoft\OfficeSoftwareProtectionPlatform\cache" del "%systemdrive%\Documents and Settings\All Users\Microsoft\OfficeSoftwareProtectionPlatform\cache" /f /q
if exist "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform\cache" del "%ALLUSERSPROFILE%\Microsoft\OfficeSoftwareProtectionPlatform\cache" /f /q

REM Copy Tokens
if exist %Windir%\System32\slmgr.vbs     XCOPY /Y /S /I "%ScriptPath%OfficeVL\Tokens" "%systemdrive%\ProgramData\Microsoft\OfficeSoftwareProtectionPlatform\" >nul
if not exist %Windir%\System32\slmgr.vbs XCOPY /Y /S /I "%ScriptPath%OfficeVL\Tokens" "%systemdrive%\Documents and Settings\All Users\Microsoft\OfficeSoftwareProtectionPlatform\" >nul

REM Add VL Licenses
net start osppsvc >nul
:ProPlusVL
cd "%ScriptPath%OfficeVL\Licenses\VL\ProPlus"
REM cscript //nologo %osppvbs% //B /inslic:ProPlus_KMS_Client.OOB.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlus_KMS_Client.PL.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlus_KMS_Client.PPDLIC.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlus_KMS_Client.RAC_Priv.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlus_KMS_Client.RAC_Pub.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlus_MAK.OOB.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlus_MAK.PHN.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlus_MAK.PL.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlus_MAK.PPDLIC.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlusAcad_MAK.OOB.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlusAcad_MAK.PHN.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlusAcad_MAK.PL.xrm-ms
REM cscript //nologo %osppvbs% //B /inslic:ProPlusAcad_MAK.PPDLIC.xrm-ms
if %OfficeArchType%==32 regedit /s Registration32.reg
if %OfficeArchType%==64 regedit /s Registration64.reg
if %OfficeArchType%==WOW regedit /s RegistrationWOW.reg
cscript //nologo %osppvbs% /inpkey:VYBBJ-TRJPB-QFQRF-QFT4D-H3GVB

:ProjectProVL
if '%Project%'=='Y' (
cd "%ScriptPath%OfficeVL\Licenses\VL\ProjectPro"
cscript //nologo %osppvbs% //B /inslic:ProjectPro_KMS_Client.OOB.xrm-ms
cscript //nologo %osppvbs% //B /inslic:ProjectPro_KMS_Client.PL.xrm-ms
cscript //nologo %osppvbs% //B /inslic:ProjectPro_KMS_Client.PPDLIC.xrm-ms
cscript //nologo %osppvbs% //B /inslic:ProjectPro_KMS_Client.RAC_Priv.xrm-ms
cscript //nologo %osppvbs% //B /inslic:ProjectPro_KMS_Client.RAC_Pub.xrm-ms
cscript //nologo %osppvbs% //B /inslic:ProjectPro_MAK.OOB.xrm-ms
cscript //nologo %osppvbs% //B /inslic:ProjectPro_MAK.PHN.xrm-ms
cscript //nologo %osppvbs% //B /inslic:ProjectPro_MAK.PL.xrm-ms
cscript //nologo %osppvbs% //B /inslic:ProjectPro_MAK.PPDLIC.xrm-ms
if %OfficeArchType%==32 regedit /s Registration32.reg
if %OfficeArchType%==64 regedit /s Registration64.reg
if %OfficeArchType%==WOW regedit /s RegistrationWOW.reg
cscript //nologo %osppvbs% /inpkey:YGX6F-PGV49-PGW3J-9BTGG-VHKC6
)

:SharePointDesigner
if '%SharePointDesigner%'=='Y' (
cd "%ScriptPath%OfficeVL\Licenses\Other\SharePointDesigner"
cscript //nologo %osppvbs% //B /inslic:SPD_ByPass.OOB.xrm-ms
cscript //nologo %osppvbs% //B /inslic:SPD_ByPass.PHN.xrm-ms
cscript //nologo %osppvbs% //B /inslic:SPD_ByPass.PL.xrm-ms
cscript //nologo %osppvbs% //B /inslic:SPD_ByPass.PPDLIC.xrm-ms
if %OfficeArchType%==32 regedit /s Registration32.reg
if %OfficeArchType%==64 regedit /s Registration64.reg
if %OfficeArchType%==WOW regedit /s RegistrationWOW.reg
cscript //nologo %osppvbs% /inpkey:H48K6-FB4Y6-P83GH-9J7XG-HDKKX
)

:VisioVL
if '%Visio%'=='Y' (
cd "%ScriptPath%OfficeVL\Licenses\VL\Visio"
cscript //nologo %osppvbs% //B /inslic:VisioPrem_KMS_Client.OOB.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPrem_KMS_Client.PL.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPrem_KMS_Client.PPDLIC.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPrem_KMS_Client.RAC_Priv.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPrem_KMS_Client.RAC_Pub.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPrem_MAK.OOB.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPrem_MAK.PHN.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPrem_MAK.PL.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPrem_MAK.PPDLIC.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPro_KMS_Client.OOB.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPro_KMS_Client.PL.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPro_KMS_Client.PPDLIC.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPro_KMS_Client.RAC_Priv.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPro_KMS_Client.RAC_Pub.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPro_MAK.OOB.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPro_MAK.PHN.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPro_MAK.PL.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioPro_MAK.PPDLIC.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioStd_KMS_Client.OOB.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioStd_KMS_Client.PL.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioStd_KMS_Client.PPDLIC.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioStd_KMS_Client.RAC_Priv.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioStd_KMS_Client.RAC_Pub.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioStd_MAK.OOB.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioStd_MAK.PHN.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioStd_MAK.PL.xrm-ms
cscript //nologo %osppvbs% //B /inslic:VisioStd_MAK.PPDLIC.xrm-ms
if %OfficeArchType%==32 regedit /s Registration32.reg
if %OfficeArchType%==64 regedit /s Registration64.reg
if %OfficeArchType%==WOW regedit /s RegistrationWOW.reg
cscript //nologo %osppvbs% /inpkey:D9DWC-HPYVV-JGF4P-BTWQB-WX8BJ
)

:EndTool
ping -n 3 localhost >nul
cd %ScriptPath%
exit /b