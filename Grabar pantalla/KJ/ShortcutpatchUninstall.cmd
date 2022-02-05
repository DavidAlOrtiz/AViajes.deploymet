@echo off
pushd %~dp0
echo.
echo Please wait ...
start /i Pleasewait_k.vbs
ping 127.0.0.1 -n 3 >nul

if exist %Windir%\System32\sppsvc.exe  goto _Shortcut32
if exist %Windir%\Sysnative\sppsvc.exe goto _Sysnative64
exit

:_Shortcut32
sc stop AppMgmt>nul
if exist %Windir%\SysWOW64\cmd.exe goto _Shortcut64
takeown /f "%Windir%\System32\ko-kr\shell32.dll.mui">nul  && icacls "%Windir%\System32\ko-kr\shell32.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\themecpl.dll.mui">nul && icacls "%Windir%\System32\ko-kr\themecpl.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\Display.dll.mui">nul  && icacls "%Windir%\System32\ko-kr\Display.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\taskmgr.exe.mui">nul  && icacls "%Windir%\System32\ko-kr\taskmgr.exe.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\twext.dll.mui">nul    && icacls "%Windir%\System32\ko-kr\twext.dll.mui" /grant *S-1-5-32-544:F >nul
move "%Windir%\System32\ko-KR\shell32.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\themecpl.dll.mui"  "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\Display.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\taskmgr.exe.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\twext.dll.mui"     "%Windir%\Temp\%Random%.tmp">nul
copy Shortcut\R\x86\System32\ko-KR\shell32.dll.mui  %Windir%\System32\ko-KR\shell32.dll.mui >nul
copy Shortcut\R\x86\System32\ko-KR\themecpl.dll.mui %Windir%\System32\ko-KR\themecpl.dll.mui >nul
copy Shortcut\R\x86\System32\ko-KR\Display.dll.mui  %Windir%\System32\ko-KR\Display.dll.mui >nul
copy Shortcut\R\x86\System32\ko-KR\taskmgr.exe.mui  %Windir%\System32\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\R\x86\System32\ko-KR\twext.dll.mui    %Windir%\System32\ko-KR\twext.dll.mui >nul
call %Windir%\System32\regedt32.exe /s Shortcut\MuiCache.reg
copy /y Shortcut\Shortcut.cmd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Shortcut.cmd" >nul
call %Windir%\System32\mcbuilder.exe
goto _end

:_Shortcut64
takeown /f "%Windir%\System32\ko-kr\shell32.dll.mui">nul  && icacls "%Windir%\System32\ko-kr\shell32.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\shell32.dll.mui">nul  && icacls "%Windir%\SysWOW64\ko-kr\shell32.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\themecpl.dll.mui">nul && icacls "%Windir%\System32\ko-kr\themecpl.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\themecpl.dll.mui">nul && icacls "%Windir%\SysWOW64\ko-kr\themecpl.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\Display.dll.mui">nul  && icacls "%Windir%\System32\ko-kr\Display.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\Display.dll.mui">nul  && icacls "%Windir%\SysWOW64\ko-kr\Display.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\taskmgr.exe.mui">nul  && icacls "%Windir%\System32\ko-kr\taskmgr.exe.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\taskmgr.exe.mui">nul  && icacls "%Windir%\SysWOW64\ko-kr\taskmgr.exe.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\twext.dll.mui">nul    && icacls "%Windir%\System32\ko-kr\twext.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\twext.dll.mui">nul    && icacls "%Windir%\SysWOW64\ko-kr\twext.dll.mui" /grant *S-1-5-32-544:F >nul
move "%Windir%\System32\ko-KR\shell32.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\shell32.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\themecpl.dll.mui"  "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\themecpl.dll.mui"  "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\Display.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\Display.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\taskmgr.exe.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\taskmgr.exe.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\twext.dll.mui"     "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\twext.dll.mui"     "%Windir%\Temp\%Random%.tmp">nul
copy Shortcut\R\x64\System32\ko-KR\shell32.dll.mui  %Windir%\System32\ko-KR\shell32.dll.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\shell32.dll.mui  %Windir%\SysWOW64\ko-KR\shell32.dll.mui >nul
copy Shortcut\R\x64\System32\ko-KR\themecpl.dll.mui %Windir%\System32\ko-KR\themecpl.dll.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\themecpl.dll.mui %Windir%\SysWOW64\ko-KR\themecpl.dll.mui >nul
copy Shortcut\R\x64\System32\ko-KR\Display.dll.mui  %Windir%\System32\ko-KR\Display.dll.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\Display.dll.mui  %Windir%\SysWOW64\ko-KR\Display.dll.mui >nul
copy Shortcut\R\x64\System32\ko-KR\taskmgr.exe.mui  %Windir%\System32\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\taskmgr.exe.mui  %Windir%\SysWOW64\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\R\x64\System32\ko-KR\twext.dll.mui    %Windir%\System32\ko-KR\twext.dll.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\twext.dll.mui    %Windir%\SysWOW64\ko-KR\twext.dll.mui >nul
call %Windir%\System32\regedt32.exe /s Shortcut\MuiCache.reg
copy /y Shortcut\Shortcut.cmd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Shortcut.cmd" >nul
call %Windir%\System32\mcbuilder.exe
goto _end

:_Sysnative64
sc stop AppMgmt>nul
takeown /f "%Windir%\Sysnative\ko-kr\shell32.dll.mui">nul  && icacls "%Windir%\Sysnative\ko-kr\shell32.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\shell32.dll.mui">nul   && icacls "%Windir%\SysWOW64\ko-kr\shell32.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\Sysnative\ko-kr\themecpl.dll.mui">nul && icacls "%Windir%\Sysnative\ko-kr\themecpl.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\themecpl.dll.mui">nul  && icacls "%Windir%\SysWOW64\ko-kr\themecpl.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\Sysnative\ko-kr\Display.dll.mui">nul  && icacls "%Windir%\Sysnative\ko-kr\Display.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\Display.dll.mui">nul   && icacls "%Windir%\SysWOW64\ko-kr\Display.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\Sysnative\ko-kr\taskmgr.exe.mui">nul  && icacls "%Windir%\Sysnative\ko-kr\taskmgr.exe.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\taskmgr.exe.mui">nul   && icacls "%Windir%\SysWOW64\ko-kr\taskmgr.exe.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\Sysnative\ko-kr\twext.dll.mui">nul    && icacls "%Windir%\Sysnative\ko-kr\twext.dll.mui" /grant *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\twext.dll.mui">nul     && icacls "%Windir%\SysWOW64\ko-kr\twext.dll.mui" /grant *S-1-5-32-544:F >nul
move "%Windir%\Sysnative\ko-KR\shell32.dll.mui"  "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\shell32.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\Sysnative\ko-KR\themecpl.dll.mui" "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\themecpl.dll.mui"  "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\Sysnative\ko-KR\Display.dll.mui"  "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\Display.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\Sysnative\ko-KR\taskmgr.exe.mui"  "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\taskmgr.exe.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\Sysnative\ko-KR\twext.dll.mui"    "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\SysWOW64\ko-KR\twext.dll.mui"     "%Windir%\Temp\%Random%.tmp">nul
copy Shortcut\R\x64\System32\ko-KR\shell32.dll.mui  %Windir%\Sysnative\ko-KR\shell32.dll.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\shell32.dll.mui  %Windir%\SysWOW64\ko-KR\shell32.dll.mui >nul
copy Shortcut\R\x64\System32\ko-KR\themecpl.dll.mui %Windir%\Sysnative\ko-KR\themecpl.dll.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\themecpl.dll.mui %Windir%\SysWOW64\ko-KR\themecpl.dll.mui >nul
copy Shortcut\R\x64\System32\ko-KR\Display.dll.mui  %Windir%\Sysnative\ko-KR\Display.dll.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\Display.dll.mui  %Windir%\SysWOW64\ko-KR\Display.dll.mui >nul
copy Shortcut\R\x64\System32\ko-KR\taskmgr.exe.mui  %Windir%\Sysnative\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\taskmgr.exe.mui  %Windir%\SysWOW64\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\R\x64\System32\ko-KR\twext.dll.mui    %Windir%\Sysnative\ko-KR\twext.dll.mui >nul
copy Shortcut\R\x64\SysWOW64\ko-KR\twext.dll.mui    %Windir%\SysWOW64\ko-KR\twext.dll.mui >nul
call %Windir%\Sysnative\regedt32.exe /s Shortcut\MuiCache.reg
copy /y Shortcut\Shortcut.cmd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Shortcut.cmd" >nul
call %Windir%\Sysnative\mcbuilder.exe
goto _end

:_end
taskkill /f /im wscript.exe >nul
start /i Successful_k.vbs
ping 127.0.0.1 -n 3 >nul
taskkill /f /im wscript.exe >nul
start /i Rebooting.vbs
ping 127.0.0.1 -n 3 >nul
taskkill /f /im wscript.exe >nul
exit














