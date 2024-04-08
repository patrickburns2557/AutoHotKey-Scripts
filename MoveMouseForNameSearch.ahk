#Requires AutoHotkey v2.0
#HotIf WinActive("UNV User Lookup")

SetDefaultMouseSpeed(1)

NumpadAdd::
{
    MouseMove(1100, 290)
    Sleep(75)
    MouseClick()
    MouseMove(700, 40)
    Sleep(200)
    MouseClick()
}