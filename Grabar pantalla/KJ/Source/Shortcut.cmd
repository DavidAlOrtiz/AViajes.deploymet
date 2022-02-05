@echo off

SET RC=%Windir%\System32\reg.exe
IF EXIST %Windir%\Sysnative\reg.exe SET RC=%Windir%\Sysnative\reg.exe
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
%RC% QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "R2" >nul
IF NOT ERRORLEVEL 1 goto:Install_7
exit

:Install_7
SET RQR=%RC% QUERY "HKEY_CURRENT_USER\Control Panel\International" /v "sLanguage"  
%RQR% | findstr /I "KOR" && IF ERRORLEVEL 0 GOTO:KOR
GOTO:END

:KOR
sc stop AppMgmt>nul
echo Shortcut patch Installing
echo Please wait...
echo.
if exist %Windir%\Sysnative\sppsvc.exe GOTO:SYSNATIVE64
if exist %Windir%\System32\sppsvc.exe  GOTO:SHORTCUT32
GOTO:END

:SHORTCUT32
sc stop AppMgmt>nul
if exist %Windir%\SysWOW64\cmd.exe GOTO:SHORTCUT64 
takeown /f "%Windir%\System32\ko-kr\shell32.dll.mui">nul  && icacls "%Windir%\System32\ko-kr\shell32.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\themecpl.dll.mui">nul && icacls "%Windir%\System32\ko-kr\themecpl.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\Display.dll.mui">nul  && icacls "%Windir%\System32\ko-kr\Display.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\taskmgr.exe.mui">nul  && icacls "%Windir%\System32\ko-kr\taskmgr.exe.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\twext.dll.mui">nul    && icacls "%Windir%\System32\ko-kr\twext.dll.mui" /grant:r *S-1-5-32-544:F >nul
move "%Windir%\System32\ko-KR\shell32.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\themecpl.dll.mui"  "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\Display.dll.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\taskmgr.exe.mui"   "%Windir%\Temp\%Random%.tmp">nul
move "%Windir%\System32\ko-KR\twext.dll.mui"     "%Windir%\Temp\%Random%.tmp">nul
copy Shortcut\x86\System32\ko-KR\shell32.dll.mui  %Windir%\System32\ko-KR\shell32.dll.mui >nul
copy Shortcut\x86\System32\ko-KR\themecpl.dll.mui %Windir%\System32\ko-KR\themecpl.dll.mui >nul
copy Shortcut\x86\System32\ko-KR\Display.dll.mui  %Windir%\System32\ko-KR\Display.dll.mui >nul
copy Shortcut\x86\System32\ko-KR\taskmgr.exe.mui  %Windir%\System32\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\x86\System32\ko-KR\twext.dll.mui    %Windir%\System32\ko-KR\twext.dll.mui >nul
call %Windir%\System32\regedt32.exe /s Shortcut\MuiCache.reg
copy /y Shortcut\Shortcut.cmd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Shortcut.cmd" >nul
call %Windir%\System32\mcbuilder.exe
GOTO:END

:SHORTCUT64
takeown /f "%Windir%\System32\ko-kr\shell32.dll.mui">nul  && icacls "%Windir%\System32\ko-kr\shell32.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\shell32.dll.mui">nul  && icacls "%Windir%\SysWOW64\ko-kr\shell32.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\themecpl.dll.mui">nul && icacls "%Windir%\System32\ko-kr\themecpl.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\themecpl.dll.mui">nul && icacls "%Windir%\SysWOW64\ko-kr\themecpl.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\Display.dll.mui">nul  && icacls "%Windir%\System32\ko-kr\Display.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\Display.dll.mui">nul  && icacls "%Windir%\SysWOW64\ko-kr\Display.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\taskmgr.exe.mui">nul  && icacls "%Windir%\System32\ko-kr\taskmgr.exe.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\taskmgr.exe.mui">nul  && icacls "%Windir%\SysWOW64\ko-kr\taskmgr.exe.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\System32\ko-kr\twext.dll.mui">nul    && icacls "%Windir%\System32\ko-kr\twext.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\twext.dll.mui">nul    && icacls "%Windir%\SysWOW64\ko-kr\twext.dll.mui" /grant:r *S-1-5-32-544:F >nul
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
copy Shortcut\x64\System32\ko-KR\shell32.dll.mui  %Windir%\System32\ko-KR\shell32.dll.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\shell32.dll.mui  %Windir%\SysWOW64\ko-KR\shell32.dll.mui >nul
copy Shortcut\x64\System32\ko-KR\themecpl.dll.mui %Windir%\System32\ko-KR\themecpl.dll.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\themecpl.dll.mui %Windir%\SysWOW64\ko-KR\themecpl.dll.mui >nul
copy Shortcut\x64\System32\ko-KR\Display.dll.mui  %Windir%\System32\ko-KR\Display.dll.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\Display.dll.mui  %Windir%\SysWOW64\ko-KR\Display.dll.mui >nul
copy Shortcut\x64\System32\ko-KR\taskmgr.exe.mui  %Windir%\System32\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\taskmgr.exe.mui  %Windir%\SysWOW64\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\x64\System32\ko-KR\twext.dll.mui    %Windir%\System32\ko-KR\twext.dll.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\twext.dll.mui    %Windir%\SysWOW64\ko-KR\twext.dll.mui >nul
call %Windir%\System32\regedt32.exe /s Shortcut\MuiCache.reg
copy /y Shortcut\Shortcut.cmd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Shortcut.cmd" >nul
call %Windir%\System32\mcbuilder.exe
GOTO:END

:SYSNATIVE64
sc stop AppMgmt>nul
takeown /f "%Windir%\Sysnative\ko-kr\shell32.dll.mui">nul  && icacls "%Windir%\Sysnative\ko-kr\shell32.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\shell32.dll.mui">nul   && icacls "%Windir%\SysWOW64\ko-kr\shell32.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\Sysnative\ko-kr\themecpl.dll.mui">nul && icacls "%Windir%\Sysnative\ko-kr\themecpl.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\themecpl.dll.mui">nul  && icacls "%Windir%\SysWOW64\ko-kr\themecpl.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\Sysnative\ko-kr\Display.dll.mui">nul  && icacls "%Windir%\Sysnative\ko-kr\Display.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\Display.dll.mui">nul   && icacls "%Windir%\SysWOW64\ko-kr\Display.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\Sysnative\ko-kr\taskmgr.exe.mui">nul  && icacls "%Windir%\Sysnative\ko-kr\taskmgr.exe.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\taskmgr.exe.mui">nul   && icacls "%Windir%\SysWOW64\ko-kr\taskmgr.exe.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\Sysnative\ko-kr\twext.dll.mui">nul    && icacls "%Windir%\Sysnative\ko-kr\twext.dll.mui" /grant:r *S-1-5-32-544:F >nul
takeown /f "%Windir%\SysWOW64\ko-kr\twext.dll.mui">nul     && icacls "%Windir%\SysWOW64\ko-kr\twext.dll.mui" /grant:r *S-1-5-32-544:F >nul
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
copy Shortcut\x64\System32\ko-KR\shell32.dll.mui  %Windir%\Sysnative\ko-KR\shell32.dll.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\shell32.dll.mui  %Windir%\SysWOW64\ko-KR\shell32.dll.mui >nul
copy Shortcut\x64\System32\ko-KR\themecpl.dll.mui %Windir%\Sysnative\ko-KR\themecpl.dll.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\themecpl.dll.mui %Windir%\SysWOW64\ko-KR\themecpl.dll.mui >nul
copy Shortcut\x64\System32\ko-KR\Display.dll.mui  %Windir%\Sysnative\ko-KR\Display.dll.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\Display.dll.mui  %Windir%\SysWOW64\ko-KR\Display.dll.mui >nul
copy Shortcut\x64\System32\ko-KR\taskmgr.exe.mui  %Windir%\Sysnative\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\taskmgr.exe.mui  %Windir%\SysWOW64\ko-KR\taskmgr.exe.mui >nul
copy Shortcut\x64\System32\ko-KR\twext.dll.mui    %Windir%\Sysnative\ko-KR\twext.dll.mui >nul
copy Shortcut\x64\SysWOW64\ko-KR\twext.dll.mui    %Windir%\SysWOW64\ko-KR\twext.dll.mui >nul
call %Windir%\Sysnative\regedt32.exe /s Shortcut\MuiCache.reg
copy /y Shortcut\Shortcut.cmd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Shortcut.cmd" >nul
call %Windir%\Sysnative\mcbuilder.exe
GOTO:END

:END
EXIT /B
