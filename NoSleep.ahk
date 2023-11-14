#Requires AutoHotkey v2.0
;After pressing Win+Z, will occaisionally send the F15 key to prevent the
;screensaver from coming up, or computer from going to sleep
#z::
{
    Loop
        {
            Send "{F15}"
            Sleep 50000
        }
    
}