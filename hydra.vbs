Dim objShell
Set objShell = WScript.CreateObject( "WScript.Shell" )
Set fso = CreateObject("Scripting.FileSystemObject")

' this makes a function to test if a file exists
' i dont know how it works
Function FileExists(FilePath)
  If fso.FileExists(FilePath) Then
    FileExists=CBool(1)
  Else
    FileExists=CBool(0)
  End If
End Function



Dim phils,tempphils,exists,max,min,homefolder
homefolder = objShell.ExpandEnvironmentStrings("%USERPROFILE%")
phils = 1
min = 1
max = 53

tempphils = 1
While tempphils < 1000
  If FileExists("Phil Swift" + CStr(tempphils) + ".jpg") Then
	fso.DeleteFile "Phil Swift" + CStr(tempphils) + ".jpg"
  End If
  tempphils = tempphils + 1
Wend
fso.CopyFile CStr(homefolder) + "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\phils\Phil27.jpg", "Phil Swift1.jpg"



Do
' these are just variables that need to be set
Wscript.Sleep 100
tempphils = 0
exists = 0

' this sets exists to how many phils exist
While tempphils < phils
  tempphils = tempphils + 1
  If FileExists("Phil Swift" + CStr(tempphils) + ".jpg") Then
    exists = exists + 1
  End If
Wend

' this is what copies more phils
If not exists = phils Then
  phils = phils + (phils - exists)
  tempphils = 1
  While tempphils < phils + 1
	Randomize
    fso.CopyFile CStr(homefolder) + "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\phils\Phil" + CStr(Int((max-min+1)*Rnd+min)) + ".jpg", "Phil Swift" + CStr(tempphils) + ".jpg"
	tempphils = tempphils + 1
  Wend
  objShell.SendKeys "{F5}"
End If
Loop
