strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2")
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_BIOS",,48)
For Each objItem in colItems
    If isNull(objItem.BIOSVersion) Then
        Wscript.Echo "BIOSVersion: Sorry. Unable to find that information."
    Else
        Wscript.Echo "BIOSVersion: " & Join(objItem.BIOSVersion, ",")
    End If
Next
WScript.Quit