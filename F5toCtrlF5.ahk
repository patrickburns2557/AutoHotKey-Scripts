#Requires AutoHotkey v2.0
#HotIf WinActive("Visual Studio Code") ;only override F5 if in VSCode
TraySetIcon("F5toCtrlF5.ico") ;source: https://icon-icons.com/icon/keyboard-f5/138445
F5::
{
    Send "{LControl Down}"
    Send "{F5}"
    Send "{LControl Up}"
}