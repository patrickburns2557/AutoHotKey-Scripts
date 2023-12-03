#Requires AutoHotkey v2.0
;Swaps the mousewheel directions for the Lethal Company game
SendMode "Event"

#HotIf WinActive("Lethal Company")

*WheelDown:: Send "{WheelUp}"
*WheelUp:: Send "{WheelDown}"