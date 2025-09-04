#Requires AutoHotkey v2.0

;Look for the appropriate window and maximize it when it's found
Loop
{
	;Only maximize if the window is found
    If WinExist("WindowName")
    {
        WinMaximize("WindowName")
    }
    else
    {
    }
    Sleep 250	;sleep after each attempt, otherwise it can cause some unrelated windows to get laggy
}


