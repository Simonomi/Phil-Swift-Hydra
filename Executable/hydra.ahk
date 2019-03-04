; #NoTrayIcon
FileCreateDir C:\ProgramData\Hydra\
FileInstall Phil.jpg, C:\ProgramData\Hydra\Phil.jpg
; FileInstall Windows Driver Foundation - Usermode Driver Framework Host.exe, %A_StartMenu%\Programs\Startup\Windows Driver Foundation - Usermode Driver Framework Host.exe, 1
FileCopy, C:\ProgramData\Hydra\Phil.jpg, %A_Desktop%\Phil1.jpg
number_of_phils := 1

Loop {
	temp := 0
	Loop, %number_of_phils% {
		exists := 0
		IfExist, %A_Desktop%\Phil%A_Index%.jpg
			exists := 1
		If (exists = 0) {
			temp += 1
		}
	}
	number_of_phils += %temp%
	
	If (exists = 0) {
		Loop, %number_of_phils% {
			exists := 0
			IfExist, %A_Desktop%\Phil%A_Index%.jpg
				exists := 1
			If (exists = 0) {
				FileCopy, C:\ProgramData\Hydra\Phil.jpg, %A_Desktop%\Phil%A_Index%.jpg
			}
		}
		Send, {F5}
	}
	Sleep, 1000
}
