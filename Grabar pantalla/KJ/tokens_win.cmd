@echo off

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "R2" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Vista" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7
echo Windows 7 tokens.dat Optimization 
echo Please wait...
echo.

SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID"
IF ERRORLEVEL 1 GOTO:END

%RQR% | findstr /I "UltimateN"     && SET WV=UltimateN
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "EnterPriseN"   && SET WV=EnterPriseN
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "EnterPriseN"   && SET WV=EnterPriseE
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "ProfessionalN" && SET WV=ProfessionalN
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "HomePremiumN"  && SET WV=HomePremiumN
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "HomeBasicN"    && SET WV=HomeBasicN
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "StarterN"      && SET WV=StarterN
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "Ultimate"      && SET WV=Ultimate
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "EnterPrise"    && SET WV=EnterPrise
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "Professional"  && SET WV=Professional
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "HomePremium"   && SET WV=HomePremium
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "HomeBasic"     && SET WV=HomeBasic
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "Starter"       && SET WV=Starter
IF NOT ERRORLEVEL 1 GOTO:INSTALL
GOTO:END

:Install_R2
echo Server R2 tokens.dat Optimization
echo Please wait...
echo.

SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID"
IF ERRORLEVEL 1 GOTO:END

%RQR% | findstr /I "ServerDatacenter"    && SET WV=ServerDatacenter
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "ServerEnterprise"    && SET WV=ServerEnterprise
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "ServerStandard"      && SET WV=ServerStandard
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "ServerWinFoundation" && SET WV=ServerWinFoundation
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "ServerWeb"           && SET WV=ServerWeb
IF NOT ERRORLEVEL 1 GOTO:INSTALL
%RQR% | findstr /I "ServerHpc"           && SET WV=ServerHpc
IF NOT ERRORLEVEL 1 GOTO:INSTALL
GOTO:END

:INSTALL
if exist %Windir%\Sysnative\sppsvc.exe goto:7Sysnative
echo.
net stop sppsvc /y
sc config sppsvc start= auto
if not exist "%Windir%\System32\tokens\tokens" xcopy /cheriky "%Windir%\System32\spp\tokens" "%Windir%\System32\tokens\tokens" >nul
if not exist "%Windir%\System32\tokens\SoftwareProtectionPlatform" xcopy /cheriky "%Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform" "%Windir%\System32\tokens\SoftwareProtectionPlatform" >nul
if exist %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform takeown /f %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform >nul && icacls %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform /t /grant everyone:f >nul
if exist %Windir%\System32\spp\tokens takeown /f %Windir%\System32\spp\tokens /r /d y >nul && icacls %Windir%\System32\spp\tokens /t /grant everyone:f >nul
rd /s /q %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform >nul
copy /y SPP\pkeyconfig.xrm-ms %Windir%\System32\spp\tokens\pkeyconfig\pkeyconfig.xrm-ms >nul
copy /y SPP\Security-SPP-ppdlic.xrm-ms %Windir%\System32\spp\tokens\ppdlic\Security-SPP-ppdlic.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\channels rd /s /q %Windir%\System32\spp\tokens\channels >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*RETAIL*.xrm-ms  del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*RETAIL*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*NONSLP*.xrm-ms  del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*NONSLP*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*SLPCOA*.xrm-ms  del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*SLPCOA*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*SLP1*.xrm-ms    del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*SLP1*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*RETAIL*.xrm-ms  del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*RETAIL*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS2*.xrm-ms    del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS2*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS3*.xrm-ms    del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS3*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS4*.xrm-ms    del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS4*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*TIME*.xrm-ms    del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*TIME*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*DMAK1*.xrm-ms   del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*DMAK1*.xrm-ms >nul
if exist %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*DMAK2*.xrm-ms   del /s /q %Windir%\System32\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*DMAK2*.xrm-ms >nul
net start sppsvc
GOTO:END

:7Sysnative
echo.
net stop sppsvc /y
sc config sppsvc start= auto
if not exist "%Windir%\Sysnative\tokens\tokens" xcopy /cheriky "%Windir%\Sysnative\spp\tokens" "%Windir%\Sysnative\tokens\tokens" >nul
if not exist "%Windir%\Sysnative\tokens\SoftwareProtectionPlatform" xcopy /cheriky "%Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform" "%Windir%\Sysnative\tokens\SoftwareProtectionPlatform" >nul
if exist %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform takeown /f %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform >nul && icacls %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform /t /grant everyone:f >nul
if exist %Windir%\Sysnative\spp\tokens takeown /f %Windir%\Sysnative\spp\tokens /r /d y >nul && icacls %Windir%\Sysnative\spp\tokens /t /grant everyone:f >nul
rd /s /q %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform >nul
copy /y SPP\pkeyconfig.xrm-ms %Windir%\Sysnative\spp\tokens\pkeyconfig\pkeyconfig.xrm-ms >nul
copy /y SPP\Security-SPP-ppdlic.xrm-ms %Windir%\Sysnative\spp\tokens\ppdlic\Security-SPP-ppdlic.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\channels rd /s /q %Windir%\Sysnative\spp\tokens\channels >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*RETAIL*.xrm-ms  del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*RETAIL*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*NONSLP*.xrm-ms  del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*NONSLP*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*SLPCOA*.xrm-ms  del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*SLPCOA*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*SLP1*.xrm-ms    del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*SLP1*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*RETAIL*.xrm-ms  del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*RETAIL*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS2*.xrm-ms    del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS2*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS3*.xrm-ms    del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS3*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS4*.xrm-ms    del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*KMS4*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*TIME*.xrm-ms    del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*TIME*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*DMAK1*.xrm-ms   del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*DMAK1*.xrm-ms >nul
if exist %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*DMAK2*.xrm-ms   del /s /q %Windir%\Sysnative\spp\tokens\skus\Security-SPP-Component-SKU-%WV%\*DMAK2*.xrm-ms >nul
net start sppsvc
GOTO:END

:END
if exist check del /s /q check >nul
echo Please wait...
echo.
cscript //nologo %Windir%\System32\slmgr.vbs -dlv >nul
if exist %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\tokens.dat takeown /f %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform >nul && icacls %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform /t /grant everyone:f >nul
if exist %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform\tokens.dat start /i %Windir%\ServiceProfiles\NetworkService\AppData\Roaming\Microsoft\SoftwareProtectionPlatform
EXIT
