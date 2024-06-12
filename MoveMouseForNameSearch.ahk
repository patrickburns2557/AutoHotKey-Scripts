#Requires AutoHotkey v2.0
#HotIf WinActive("UNV User Lookup")

SetDefaultMouseSpeed(1)

NumpadAdd::
`::
{
    MouseMove(1100, 290)
    Sleep(75)
    MouseClick()
    MouseMove(700, 40)
    Sleep(250)
    MouseClick()
}

;Different window has slightly different button placement
; this one needs more delay between clicks
#HotIf WinActive("Users Lookup")
NumpadAdd::
`::
{
    MouseMove(1100, 345)
    Sleep(75)
    MouseClick()
    MouseMove(700, 40)
    Sleep(700)
    MouseClick()
}

;Different window has slightly different button placement
#HotIf WinActive("Provider Lookup")
NumpadAdd::
`::
{
    MouseMove(1200, 380)
    Sleep(75)
    MouseClick()
    MouseMove(800, 40)
    Sleep(250)
    MouseClick()
}