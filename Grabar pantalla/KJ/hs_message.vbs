On Error Resume Next

Dim Args, WshShell, BtnCode, strText, strTitle, nSecondsToWait, nType

Set Args=WScript.Arguments
Set WshShell=WScript.CreateObject("WScript.Shell")

If Args.Count<4 Or Args.Count>5 Then WScript.Quit(255)
strText=Args(0)
strTitle=Args(1)
If Args.Count=5 Then nSecondsToWait=Args(4) Else nSecondsToWait=0

nType=0
Select Case UCase( Left(Args(2), 1) )
	case "W" nType=16
	case "Q" nType=32
	case "E" nType=48
	case "I" nType=64
End Select

Select Case UCase( Args(3) )
	case "OK" nType=nType+0
	case "OKCANCEL" nType=nType+1
	case "ABORTRETRYIGNORE" nType=nType+2
	case "YESNOCANCEL" nType=nType+3
	case "YESNO" nType=nType+4
	case "RETRYCANCEL" nType=nType+5
End Select

WScript.Quit( WshShell.Popup(strText, nSecondsToWait, strTitle, nType) )
