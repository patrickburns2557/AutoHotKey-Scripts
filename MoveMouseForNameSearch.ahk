#Requires AutoHotkey v2.0
#HotIf WinActive("UNV User Lookup")

NumpadAdd::
{
    MouseMove(1100, 290)
    Sleep(75)
    MouseClick()
    MouseMove(700, 40)
    Sleep(75)
    MouseClick
}