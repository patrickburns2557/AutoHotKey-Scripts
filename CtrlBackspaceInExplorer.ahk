#Requires AutoHotkey v2.0
;Allow Ctrl + Backspace in windows explorer
#HotIf WinActive("ahk_exe explorer.exe")
;Highlight the previous word and delete it immediately after
^BS::Send("^+{Left}{Del}")