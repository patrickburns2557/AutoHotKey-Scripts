#Requires AutoHotkey v2.0
;Script to open a program and then bring it to the front and focus it, because the program this script
; was made for always opens either behind every program, or in front of every program, but unfocused

;Program 1
#+1:: ;Win+Shift+1
{
    Run("PATH\TO\PROGRAM\1")
    WinWait("WINDOW TITLE OF PROGRAM") ;wait for program to open since it takes about a half second or so
    WinActivate("WINDOW TITLE OF PROGRAM") ;focus the program
}

;Program 2
#+2:: ;Win+Shift+2
{
    Run("PATH\TO\PROGRAM\2")
    WinWait("WINDOW TITLE OF PROGRAM") ;wait for program to open since it takes about a half second or so
    WinActivate("WINDOW TITLE OF PROGRAM") ;focus the program
}