@echo off

mode con cols=14 lines=1

REG DELETE "HKEY_CLASSES_ROOT\Local Settings\MuiCache" /f >nul
REG DELETE "HKEY_CURRENT_USER\Control Panel\Desktop\MuiCached" /f >nul
cls
DEL /F /Q %0% >nul
exit













