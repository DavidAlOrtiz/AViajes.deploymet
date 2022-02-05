'script by NononSence


strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set objFileSystem = CreateObject("Scripting.FileSystemObject")
Set objDictionary = CreateObject("Scripting.Dictionary")
Set Shell = WScript.CreateObject("WScript.Shell")
Set WinDir = objFileSystem.GetSpecialFolder(WindowsFolder)
Set colDisks = objWMIService.ExecQuery ("Select * From Win32_LogicalDisk")
Set colVols = objWMIService.ExecQuery ("Select * From Win32_Volume")
dir = Shell.CurrentDirectory
isMounted = 0

For Each objDisk in colDisks
    objDictionary.Add objDisk.DeviceID, objDisk.DeviceID
Next

'Check to see if SystemVolume is already mounted

For Each objVol in colVols
 If objVol.SystemVolume = True then
   If objDictionary.Exists(objVol.DriveLetter) Then
	TargetDrive = objVol.DriveLetter
	isMounted = 1
	Wscript.Echo(" System Volume is: " & TargetDrive)
	Exit For
   End If
 End If
Next

'find a free drive letter

If isMounted = 0 Then
 For a = 67 to 90
   TargetDrive = Chr(a) & ":"
  If objDictionary.Exists(TargetDrive) Then
Else
   Wscript.Echo(" Found free drive letter " & TargetDrive)
   Exit For
  End If
 Next
End If

'mount SystemVolume

If isMounted = 0 Then
 For Each objVol in colVols
	If objVol.SystemVolume = True then
	Wscript.Echo(" Assigning letter " & TargetDrive & " to System Volume")
	objvol.DriveLetter = TargetDrive
	objVol.Put_
        End If
	Exit For
 Next
End If

'Install bootloader

Wscript.Echo(" Installing bootloader to " & TargetDrive)
Shell.Run "attrib " & TargetDrive & "\grldr -h -s -r", 2, 1
Shell.Run "attrib " & TargetDrive & "\win7.ld -h -s -r", 2, 1
objFileSystem.CopyFile dir & "\data\Install_files_w7open\*", TargetDrive & "\", 1
Shell.Run"attrib " & TargetDrive & "\grldr +h +s +r", 2, 1
Shell.Run"attrib " & TargetDrive & "\win7.ld +h +s +r", 2, 1
Shell.Run chr(34) & dir & "\data\boot\bootinst.exe" & chr(34) & " /nt60 " & TargetDrive, 2, 1

'Install certificate

Wscript.Echo(" Installing Certificate")
Shell.Run "cscript //NOLOGO " & WinDir & "\System32\slmgr.vbs -ilc " & chr(34) & dir & "\data\Certificate\ASUS.XRM-MS" & chr(34), 2, 1

'make sure we dont unmount C: and then unmount drive

If isMounted=0 Then
   If Not TargetDrive = "C:" Then
	Wscript.Echo(" Unmounting " & TargetDrive)
	Shell.Run "mountvol " & TargetDrive & " /D " , 2, 1
   End If
End If

'Successful

rbt = msgbox("Successful.",6,"Done")
if rbt = ("6") then
end if 
wscript.quit
