#Requires AutoHotkey v2.0
#HotIf WinActive("Visual Studio Code") ;only override F5 if in VSCode
F5::
{
    Send "{LControl Down}"
    Send "{F5}"
    Send "{LControl Up}"
}