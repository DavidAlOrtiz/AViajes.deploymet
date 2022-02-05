Dim oShell
Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "Screen2Exe.cmd" & Chr(34), 0
Set WshShell = Nothing
WScript.Quit


