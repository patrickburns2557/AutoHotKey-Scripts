#Requires AutoHotkey v2.0
;Will occasionally send the F15 key to prevent the screensaver
;from coming up, or computer from going to sleep, and run indefinitely

;uncomment whichever version you wish to use.


;Press Win+Z to activate
;#z::
;{
;    Loop
;        {
;            Send "{F17}"
;            Sleep 50000
;        }    
;}

;Will start immediately, w/o needing to press a keybind
;Loop
;{
;    Send "{F17}"
;    Sleep 50000
;}