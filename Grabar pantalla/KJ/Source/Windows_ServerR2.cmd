@echo off

echo Windows Server R2 OEM Activation Installing
echo Please wait...
echo.

::setup parameters::
SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
SET RQR=%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" 
SET INL=IF NOT ERRORLEVEL 1 

::manufacturer brand check/set::
cscript //nologo Bios\Bios.vbs | findstr /I "ACER AcerSystem TravelMate" >nul
%INL% SET MAN=ACER&GOTO:ACER
cscript //nologo Bios\Bios.vbs | findstr /I "DSGLTD ADVENT" >nul
%INL% SET MAN=ADVENT&GOTO:ADVENT
cscript //nologo Bios\Bios.vbs | findstr /I "ALWARE ALIENWARE" >nul
%INL% SET MAN=ALIENWARE&GOTO:ALIENWARE
cscript //nologo Bios\Bios.vbs | findstr /I "_ASUS_ ASUS_FLASH ASUS ASUSTeK" >nul
%INL% SET MAN=ASUS&GOTO:ASUS
cscript //nologo Bios\Bios.vbs | findstr /I "AQUARI AQUARIUS" >nul
%INL% SET MAN=AQUARIUS&GOTO:AQUARIUS
cscript //nologo Bios\Bios.vbs | findstr /I "BenQ BenQHub" >nul
%INL% SET MAN=BENQ&GOTO:BENQ
cscript //nologo Bios\Bios.vbs | findstr /I "CASPER" >nul
%INL% SET MAN=CASPER&GOTO:CASPER
cscript //nologo Bios\Bios.vbs | findstr /I "COMPAQ" >nul
%INL% SET MAN=COMPAQ&GOTO:COMPAQ
cscript //nologo Bios\Bios.vbs | findstr /I "DELL" >nul
%INL% SET MAN=DELL&GOTO:DELL
cscript //nologo Bios\Bios.vbs | findstr /I "XPS" >nul
%INL% SET MAN=DELLXPS&GOTO:DELL
cscript //nologo Bios\Bios.vbs | findstr /I "Dealin" >nul
%INL% SET MAN=DEALIN&GOTO:DEALIN
cscript //nologo Bios\Bios.vbs | findstr /I "Exc ECS ELITEGROUP ELITE" >nul
%INL% SET MAN=ECS&GOTO:ECS
cscript //nologo Bios\Bios.vbs | findstr /I "EMACHINES" >nul
%INL% SET MAN=EMACHINES&GOTO:ACER
cscript //nologo Bios\Bios.vbs | findstr /I "Datate EXPER" >nul
%INL% SET MAN=EXPER&GOTO:EXPER
cscript //nologo Bios\Bios.vbs | findstr /I "FOUNDR FOUNDER" >nul
%INL% SET MAN=FOUNDER&GOTO:FOUNDER
cscript //nologo Bios\Bios.vbs | findstr /I "FSC SIEMENS" >nul
%INL% SET MAN=FSC&GOTO:FSC
cscript //nologo Bios\Bios.vbs | findstr /I "FUJ FUJITSU FUJITSU-PC" >nul
%INL% SET MAN=FUJITSU&GOTO:FUJITSU
cscript //nologo Bios\Bios.vbs | findstr /I "GATEWAY Gatewa" >nul
%INL% SET MAN=GATEWAY&GOTO:ACER
cscript //nologo Bios\Bios.vbs | findstr /I "GBT GIGABYTE" >nul
%INL% SET MAN=GIGABYTE&GOTO:GIGABYTE
cscript //nologo Bios\Bios.vbs | findstr /I "cgwall GREATWALL" >nul
%INL% SET MAN=GWALL&GOTO:GWALL
cscript //nologo Bios\Bios.vbs | findstr /I "haier HaierComputer" >nul
%INL% SET MAN=HAIER&GOTO:HAIER
cscript //nologo Bios\Bios.vbs | findstr /I "HSPW07 HANNSPREE" >nul
%INL% SET MAN=HANNSPREE&GOTO:HANNSPREE
cscript //nologo Bios\Bios.vbs | findstr /I "HASEE HASEECOMPUTER" >nul
%INL% SET MAN=HASEE&GOTO:HASEE
cscript //nologo Bios\Bios.vbs | findstr /I "HCLINF HCL" >nul
%INL% SET MAN=HCL&GOTO:HCL
cscript //nologo Bios\Bios.vbs | findstr /I "HEWLETT Hewlett-P Hewlett-Packard" >nul
%INL% SET MAN=HP&GOTO:HP
cscript //nologo Bios\Bios.vbs | findstr /I "higrad HIGRADE HIGRADED" >nul
%INL% SET MAN=HIGRADE&GOTO:HIGRADE
cscript //nologo Bios\Bios.vbs | findstr /I "HYRSLP HYRICAN HYRICAN_AG" >nul
%INL% SET MAN=HYRICAN&GOTO:HYRICAN
cscript //nologo Bios\Bios.vbs | findstr /I "JOOYON JOOYONTECH" >nul
%INL% SET MAN=JOOYON&GOTO:JOOYON
cscript //nologo Bios\Bios.vbs | findstr /I "KRFTWY KRAFTWAY" >nul
%INL% SET MAN=KRAFTWAY&GOTO:KRAFTWAY
cscript //nologo Bios\Bios.vbs | findstr /I "K-Syst KSYSTEMS K-Systems" >nul
%INL% SET MAN=KSYSTEMS&GOTO:KSYSTEMS
cscript //nologo Bios\Bios.vbs | findstr /I "LANIX1 LANIX" >nul
%INL% SET MAN=LANIX&GOTO:LANIX
cscript //nologo Bios\Bios.vbs | findstr /I "LGE LGELGP LG" >nul
%INL% SET MAN=LG&GOTO:LG
cscript //nologo Bios\Bios.vbs | findstr /I "LENOVO" >nul
%INL% SET MAN=LENOVO&GOTO:LENOVO
cscript //nologo Bios\Bios.vbs | findstr /I "MEDION MEDIONPC MEDIONNB" >nul
%INL% SET MAN=MEDION&GOTO:MEDION
cscript //nologo Bios\Bios.vbs | findstr /I "MSI_NB MSI MSI_PC MSI-2831-MS MSI-PenNote" >nul
%INL% SET MAN=MSI&GOTO:MSI
cscript //nologo Bios\Bios.vbs | findstr /I "NEC NECC1 NECC_S NECCAP NECc_ NEC-PC NEC_Product" >nul
%INL% SET MAN=NEC&GOTO:NEC
cscript //nologo Bios\Bios.vbs | findstr /I "NOKIA" >nul
%INL% SET MAN=NOKIA&GOTO:NOKIA
cscript //nologo Bios\Bios.vbs | findstr /I "OLIPRO OLIDATA" >nul
%INL% SET MAN=OLIDATA&GOTO:OLIDATA
cscript //nologo Bios\Bios.vbs | findstr /I "PACKARD BELL PACKARD-BELL" >nul
%INL% SET MAN=PBELL&GOTO:ACER
cscript //nologo Bios\Bios.vbs | findstr /I "MATBIO Panasonic" >nul
%INL% SET MAN=PANASONIC&GOTO:PANASONIC
cscript //nologo Bios\Bios.vbs | findstr /I "QUANMX QUANMAX" >nul
%INL% SET MAN=QUANMAX&GOTO:QUANMAX
cscript //nologo Bios\Bios.vbs | findstr /I "SECCSD SAMSUNG SAMSUNGPC $SAMSUNGPC" >nul
%INL% SET MAN=SAMSUNG&GOTO:SAMSUNG
cscript //nologo Bios\Bios.vbs | findstr /I "stinfo" >nul
%INL% SET MAN=SEMP&GOTO:SEMP
cscript //nologo Bios\Bios.vbs | findstr /I "Sony" >nul
%INL% SET MAN=SONY&GOTO:SONY
cscript //nologo Bios\Bios.vbs | findstr /I "synnex" >nul
%INL% SET MAN=SYNNEX&GOTO:SYNNEX
cscript //nologo Bios\Bios.vbs | findstr /I "SYSMAX SYSTEMAX" >nul
%INL% SET MAN=SYSTEMAX&GOTO:SYSTEMAX
cscript //nologo Bios\Bios.vbs | findstr /I "TOSASU" >nul
%INL% SET MAN=TOSA&GOTO:TOSHIBA
cscript //nologo Bios\Bios.vbs | findstr /I "TOSCPL" >nul
%INL% SET MAN=TOSC&GOTO:TOSHIBA
cscript //nologo Bios\Bios.vbs | findstr /I "TOSHIB" >nul
%INL% SET MAN=TOSHIBA&GOTO:TOSHIBA
cscript //nologo Bios\Bios.vbs | findstr /I "TOSINV" >nul
%INL% SET MAN=TOSI&GOTO:TOSHIBA
cscript //nologo Bios\Bios.vbs | findstr /I "TOSQCI" >nul
%INL% SET MAN=TOSQ&GOTO:TOSHIBA
cscript //nologo Bios\Bios.vbs | findstr /I "TOSHIBA" >nul
%INL% SET MAN=TOSHIBA&GOTO:TOSHIBA
cscript //nologo Bios\Bios.vbs | findstr /I "THTFPC TONGFANG Tsing TSINGHUA" >nul
%INL% SET MAN=TONGFANG&GOTO:TONGFANG
cscript //nologo Bios\Bios.vbs | findstr /I "TRIGEM" >nul
%INL% SET MAN=TRIGEM&GOTO:TRIGEM
cscript //nologo Bios\Bios.vbs | findstr /I "YUTC VILIV" >nul
%INL% SET MAN=VILIV&GOTO:VILIV
cscript //nologo Bios\Bios.vbs | findstr /I "VSCAIO VIEWSONIC ViewSonic-PC ViewSonic-Notebook ViewSonic-AIOpc ViewSonic-Desktop" >nul
%INL% SET MAN=VSONIC&GOTO:VSONIC
cscript //nologo Bios\Bios.vbs | findstr /I "WORTMA wortmann" >nul
%INL% SET MAN=WORTMANN&GOTO:WORTMANN

::final checks::
cscript //nologo Bios\Bios.vbs | findstr /I "ACRSYS" >nul
%INL% SET MAN=ACER&GOTO:ACER
cscript //nologo Bios\Bios.vbs | findstr /I "HPQOEM" >nul
%INL% SET MAN=HP&GOTO:HP
cscript //nologo Bios\Bios.vbs | findstr /I "HP" >nul
%INL% SET MAN=HPPRO&GOTO:HP
cscript //nologo Bios\Bios.vbs | findstr /I "IBM" >nul
%INL% SET MAN=IBM&GOTO:LENOVO

::vmware::
WMIC BASEBOARD | findstr /I "VMWARE" >nul
%INL% SET MAN=VMWARE&GOTO:DEFAULT
WMIC BIOS | findstr /I "VMWARE" >nul
%INL% SET MAN=VMWARE&GOTO:DEFAULT
WMIC COMPUTERSYSTEM | findstr /I "VMWARE" >nul
%INL% SET MAN=VMWARE&GOTO:DEFAULT
WMIC CSPRODUCT | findstr /I "VMWARE" >nul
%INL% SET MAN=VMWARE&GOTO:DEFAULT

::set default brand/serial; if manufacturer not matched::
SET MAN=DEFAULT&GOTO:DEFAULT

::Manufacturer OEM Serial No's will get called from this list::
:ACER
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:ADVENT
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:ALIENWARE
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:ASUS
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:AQUARIUS
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:BENQ
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:CASPER
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:COMPAQ
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:DEALIN
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:DEFAULT
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:DELL
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:ECS
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:EXPER
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:FOUNDER
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:FSC
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:FUJITSU
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:GIGABYTE
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:GWALL
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:HAIER
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:HANNSPREE
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:HASEE
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:HCL
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:HIGRADE
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:HP
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:HYRICAN
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:JOOYON
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:KRAFTWAY
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:KSYSTEMS
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:LANIX
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:LENOVO
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:LG
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:MEDION
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:MSI
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:NEC
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:NOKIA
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:OLIDATA
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:PANASONIC
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:QUANMAX
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:SAMSUNG
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:SEMP
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:SONY
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:SYNNEX
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:SYSTEMAX
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:TONGFANG
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:TOSHIBA
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:TRIGEM
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:VILIV
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:VSONIC
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH
:WORTMANN
%RQR% | findstr /I "ServerStandard"      && %INL% SET PIDKEY=D7TCH-6P8JP-KRG4P-VJKYY-P9GFF
%RQR% | findstr /I "ServerEnterprise"    && %INL% SET PIDKEY=BKCJJ-J6G9Y-4P7YF-8D4J7-7TCWD
%RQR% | findstr /I "ServerDatacenter"    && %INL% SET PIDKEY=26FXG-KYC7Q-XG29P-T2HFQ-KPF96
%RQR% | findstr /I "ServerWinFoundation" && %INL% SET PIDKEY=VMYRB-8BRVQ-KXWFF-334J3-F2WHJ
GOTO:FINISH

:FINISH
cd /d %ScriptPath%

:key
echo %MAN% OEM Key Installing
echo Please wait...
echo.
cscript //nologo "%Windir%\System32\slmgr.vbs" -dlv >check
find /i "OEM_SLP" >nul check && goto:certs
cscript //nologo %windir%\system32\slmgr.vbs -ipk %PIDKEY% >nul

:certs
if exist Certificates\%MAN%.xrm-ms echo %MAN% OEMCert.xrm-ms Installing && echo Please wait... && echo.
if exist Certificates\%MAN%.xrm-ms cscript //nologo %windir%\system32\slmgr.vbs -ilc Certificates\%MAN%.xrm-ms >nul

::Activation Check::
WMIC /NAMESPACE:\\root\CIMV2 PATH SoftwareLicensingProduct WHERE LicenseStatus=1 GET LicenseStatus | findstr "1" > nul
IF ERRORLEVEL 1 GOTO:FOEM
GOTO:END

:FOEM
echo Pirate Activation
echo Please wait...
echo.
ping 127.0.0.1 -n 3 >nul
cd /d %ScriptPath%
cd /d Pirate 
call Install.vbs
EXIT

:END
EXIT /B