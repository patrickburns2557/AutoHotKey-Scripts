#Requires AutoHotkey v2.0

;Look for the appropriate window and maximize it when it's found
Loop
{
	;Only maximize if the window is found
    If WinExist("WindowName")
    ;If WinExist("WindowName ahk_exe ProgramName.exe")  ;Search for window by program name as well if needed
    {
        WinMaximize("WindowName")
        ;WinMaximize("WindowName ahk_exe ProgramName.exe")  ;Search for window by program name as well if needed
    }
    else
    {
    }
    Sleep 250	;sleep after each attempt, otherwise it can cause some unrelated windows to get laggy
}


