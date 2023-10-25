#Requires AutoHotkey v2.0
;read in comma separated list from a file and send their contents, pressing enter after each entry
#z:: ;Activate when Win+Z is pressed
{
    Sleep 500 ;initial sleep so no keys are sent while Win is still held
    SetKeyDelay 50 ;Set delay between keypresses
    Loop read, "\\location\of\file" ;load from file
    {
        Loop parse, A_LoopReadLine, A_Tab ;loop through file line by line
        {
            Line := A_LoopField ;save current line to Line variable
            Loop parse, Line, "," ;split line at the comment and iterate through each piece
            {
                Sleep 40
                Send A_LoopField ;send the split piece after a small delay
                Sleep 40
                Send "{Enter}" ;send enter key after a small delay
            }
        }
    }
}