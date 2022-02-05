Dim oShell
Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "WatermarkX86.cmd" & Chr(34), 0
Set WshShell = Nothing
WScript.Quit


