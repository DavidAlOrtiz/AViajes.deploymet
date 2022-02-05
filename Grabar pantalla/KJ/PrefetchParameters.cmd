@echo off
pushd %~dp0
cls

:_main
title K.J
cls
echo.
echo.             Windows 7  EnableSuperfetch and EnablePrefetcher S + P
echo       
echo       
echo         A) 0 + 0       B) 0 + 1     C) 0 + 2       D) 0 + 3    
echo       
echo       
echo         E) 1 + 0       F) 1 + 1     G) 1 + 2       H) 1 + 3    
echo       
echo       
echo         I) 2 + 0       J) 2 + 1     K) 2 + 2       L) 2 + 3    
echo       
echo       
echo         N) 3 + 0       O) 3 + 1     P) 3 + 2       Q) 3 + 3    
echo       
echo       
echo         X) Exit                   ( SSD N) 3 + 0 DEFAULT Q) 3 + 3 )  
echo       
echo       
echo.

:_set
set _ok=
set /p _ok=.         Enter your choice :
if "%_ok%" == "a" goto _a
if "%_ok%" == "b" goto _b
if "%_ok%" == "c" goto _c
if "%_ok%" == "d" goto _d
if "%_ok%" == "e" goto _e
if "%_ok%" == "f" goto _f
if "%_ok%" == "g" goto _g
if "%_ok%" == "h" goto _h
if "%_ok%" == "i" goto _i
if "%_ok%" == "j" goto _j
if "%_ok%" == "k" goto _k
if "%_ok%" == "l" goto _l
if "%_ok%" == "n" goto _n
if "%_ok%" == "o" goto _o
if "%_ok%" == "p" goto _p
if "%_ok%" == "q" goto _q
if "%_ok%" == "x" goto _end

if "%_ok%" == "A" goto _a
if "%_ok%" == "B" goto _b
if "%_ok%" == "C" goto _c
if "%_ok%" == "D" goto _d
if "%_ok%" == "E" goto _e
if "%_ok%" == "F" goto _f
if "%_ok%" == "G" goto _g
if "%_ok%" == "H" goto _h
if "%_ok%" == "I" goto _i
if "%_ok%" == "J" goto _j
if "%_ok%" == "K" goto _k
if "%_ok%" == "L" goto _l
if "%_ok%" == "N" goto _n
if "%_ok%" == "O" goto _o
if "%_ok%" == "P" goto _p
if "%_ok%" == "Q" goto _q
if "%_ok%" == "X" goto _end

goto _main

:_a
cls
echo.
echo.
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\a.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_b
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\b.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_c
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\c.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_d
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\d.reg

echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_e
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\e.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_f
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\f.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_g
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\g.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_h
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\h.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_i
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\i.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_j
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\j.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_k
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\k.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_l
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\l.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_n
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\n.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_o
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\o.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_p
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\p.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_q
cls
echo Please wait ...
ping -n 2 localhost >nul
call %Windir%\System32\regedt32.exe /s Prefetch\q.reg
echo y | del %Windir%\Prefetch\*.* >nul
cls
goto _main

:_end
cls
exit