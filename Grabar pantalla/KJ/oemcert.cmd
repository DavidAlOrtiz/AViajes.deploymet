@echo off
pushd %~dp0
cls

:_main
cls
title OEM Cert 2.1 LICENSE INSTALL
echo.
echo.   OEMCert 2.1 LICENSE INSTALL
echo.
echo.  :01_ACER                      :21_MEDION
echo.  :02_ACRSYSACRPRDCT            :22_MSI
echo.  :03_ADVENT                    :23_NEC  
echo.  :04_ALIENWARE                 :24_NECCAP    
echo.  :05_ASUS                      :25_PACKARDBELL      
echo.  :06_BENQ                      :26_PANASONIC            
echo.  :07_Casper                    :27_SAMSUNG
echo.  :08_Compaq-HP                 :28_SHARP    
echo.  :09_DELL                      :29_SONY   
echo.  :10_Founder                   :30_SYSTEMAX    
echo.  :11_FSCPC                     :31_TARGA    
echo.  :12_FUJITSU                   :32_TCL    
echo.  :13_FUJITSU-SIEMENS           :33_TOSA
echo.  :14_GATEWAY                   :34_TOSC
echo.  :15_GIGABYTE                  :35_TOSI
echo.  :16_HAIER                     :36_TOSQ    
echo.  :17_HASEE                     :37_TRIGEM
echo.  :18_IBM-LENOVO                :38_VELOCITYMICRO    
echo.  :19_JOOYON                         
echo.  :20_LG-X-NOTE                 :X _Exit
echo.                                                     

:_set
set _ok=
set /p _ok=. Enter your choice : 
if "%_ok%" == "1" goto _01
if "%_ok%" == "2" goto _02
if "%_ok%" == "3" goto _03
if "%_ok%" == "4" goto _04
if "%_ok%" == "5" goto _05
if "%_ok%" == "6" goto _06
if "%_ok%" == "7" goto _07
if "%_ok%" == "8" goto _08
if "%_ok%" == "9" goto _09
if "%_ok%" == "01" goto _01
if "%_ok%" == "02" goto _02
if "%_ok%" == "03" goto _03
if "%_ok%" == "04" goto _04
if "%_ok%" == "05" goto _05
if "%_ok%" == "06" goto _06
if "%_ok%" == "07" goto _07
if "%_ok%" == "08" goto _08
if "%_ok%" == "09" goto _09
if "%_ok%" == "10" goto _10
if "%_ok%" == "11" goto _11
if "%_ok%" == "12" goto _12
if "%_ok%" == "13" goto _13
if "%_ok%" == "14" goto _14
if "%_ok%" == "15" goto _15
if "%_ok%" == "16" goto _16
if "%_ok%" == "17" goto _17
if "%_ok%" == "18" goto _18
if "%_ok%" == "19" goto _19
if "%_ok%" == "20" goto _20
if "%_ok%" == "21" goto _21
if "%_ok%" == "22" goto _22
if "%_ok%" == "23" goto _23
if "%_ok%" == "24" goto _24
if "%_ok%" == "25" goto _25
if "%_ok%" == "26" goto _26
if "%_ok%" == "27" goto _27
if "%_ok%" == "28" goto _28
if "%_ok%" == "29" goto _29
if "%_ok%" == "30" goto _30
if "%_ok%" == "31" goto _31
if "%_ok%" == "32" goto _32
if "%_ok%" == "33" goto _33
if "%_ok%" == "34" goto _34
if "%_ok%" == "35" goto _35
if "%_ok%" == "36" goto _36
if "%_ok%" == "37" goto _37
if "%_ok%" == "38" goto _38
if "%_ok%" == "x" goto _end
if "%_ok%" == "X" goto _end

goto _main 

:_01
cls
echo.
echo.               License ACER
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\ACER.xrm-ms
copy Certificates\ACER.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_02
cls
echo.
echo.               License ACRSYSACRPRDCT
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\ACRSYSACRPRDCT.xrm-ms
copy Certificates\ACRSYSACRPRDCT.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_03
cls
echo.
echo.               License ADVENT-DSGLTD
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\ADVENT-DSGLTD.xrm-ms
copy Certificates\ADVENT-DSGLTD.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_04
cls
echo.
echo.               License ALIENWARE
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\ALIENWARE.xrm-ms
copy Certificates\ALIENWARE.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_05
cls
echo.
echo.               License ASUS 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\ASUS.xrm-ms
copy Certificates\ASUS.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_06
cls
echo.
echo.               License BENQ 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\BENQ.xrm-ms
copy Certificates\BENQ.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_07
cls
echo.
echo.               License Casper
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\Casper.xrm-ms
copy Certificates\Trigem.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_08
cls
echo.
echo.               License Compaq 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\Compaq.xrm-ms
copy Certificates\COMPAQ-HP.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_09
cls
echo.
echo.               License DELL
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\DELL.xrm-ms
copy Certificates\DELL.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_10
cls
echo.
echo.               License Founder
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\Founder.xrm-ms
copy Certificates\FOUNDRFOUNDRPC.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_11
cls
echo.
echo.               License FSC
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\FSC.xrm-ms
copy Certificates\FSCPC.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_12
cls
echo.
echo.               License FUJITSU
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\FUJITSU.xrm-ms
copy Certificates\FUJITSU.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_13
cls
echo.
echo.               License FUJITSU-SIEMENS 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\FUJITSU-SIEMENS.xrm-ms
copy Certificates\FUJITSU-SIEMENS.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_14
cls
echo.
echo.               License GATEWAY 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\GATEWAY.xrm-ms
copy Certificates\GATEWAY.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_15
cls
echo.
echo.               License GIGABYTE 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\GIGABYTE.xrm-ms
copy Certificates\GIGABYTE.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_16
cls
echo.
echo.               License HAIER 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\HAIER.xrm-ms
copy Certificates\HAIER.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_17
cls
echo.
echo.               License HASEE
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\HASEE.xrm-ms
copy Certificates\HASEE.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_18
cls
echo.
echo.               License LENOVO 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\Lenovo.xrm-ms
copy Certificates\IBM-LENOVO.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_19
cls
echo.
echo.               License JOOYON 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\JOOYON.xrm-ms
copy Certificates\JOOYON.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_20
cls
echo.
echo.               License LG
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\LG.xrm-ms
copy Certificates\LG-X-NOTE.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_21
cls
echo.
echo.               License MEDION
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\MEDION.xrm-ms
copy Certificates\MEDION.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_22
cls
echo.
echo.               License MSI
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\MSI.xrm-ms
copy Certificates\MSI.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_23
cls
echo.
echo.               License NEC
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\NEC.xrm-ms
copy Certificates\NEC.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_24
cls
echo.
echo.               License NEC 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\NEC.xrm-ms
copy Certificates\NECCAP.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_25
cls
echo.
echo.               License PBell
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\PBell.xrm-ms
copy Certificates\PACKARDBELL.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_26
cls
echo.
echo.               License PANASONIC
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\PANASONIC.xrm-ms
copy Certificates\PANASONIC.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_27
cls
echo.
echo.               License SAMSUNG 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\SAMSUNG.xrm-ms
copy Certificates\SAMSUNG.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_28
cls
echo.
echo.               License SHARP
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\SHARP.xrm-ms
copy Certificates\SHARP.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_29
cls
echo.
echo.               License SONY
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\SONY.xrm-ms
copy Certificates\SONY.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_30
cls
echo.
echo.               License SYSTEMAX
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\SYSTEMAX.xrm-ms
copy Certificates\SYSTEMAX.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_31
cls
echo.
echo.               License TARGA
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\TARGA.xrm-ms
copy Certificates\TARGA.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_32
cls
echo.
echo.               License TCL 
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\TCL.xrm-ms
copy Certificates\TCL.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_33
cls
echo.
echo.               License TOSA
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\TOSA.xrm-ms
copy Certificates\TOSASU00-TOSASU.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_34
cls
echo.
echo.               License TOSC
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\TOSC.xrm-ms
copy Certificates\TOSCPL00-TOSCPL.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_35
cls
echo.
echo.               License TOSI
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\TOSI.xrm-ms
copy Certificates\TOSINV00-TOSINV.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_36
cls
echo.
echo.               License TOSQ
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\TOSQ.xrm-ms
copy Certificates\TOSQCI00-TOSQCI.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_37
cls
echo.
echo.               License Trigem
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\Trigem.xrm-ms
copy Certificates\TRIGEM-TRIGEM-2.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_38
cls
echo.
echo.               License VELOCITYMICRO
echo        xxxxxxx Please Wait 30sec.............. InstallingLicense xxxxxxx
call %Windir%\System32\slmgr.vbs -ilc Certificates\VELOCITYMICRO.xrm-ms
copy Certificates\VELOCITYMICRO.xrm-ms %Windir%\oemCert.xrm-ms>nul
goto _end

:_end
cls
exit

