#Requires AutoHotkey v2.0
;Script to make the delete key delete the current page or selected pages in PDFGear.
;By default, the delete key does nothing, and to delete a page, there are 2 confirmation boxes you have to click through.


#HotIf WinActive("ahk_exe pdfeditor.exe")
CoordMode("Mouse", "Screen")
SetDefaultMouseSpeed(1)
Del::
{
    MouseMove(112, 170) ;Move to delete page button
    MouseClick()
    MouseMove(1135, 620) ;Move to confirmation button of selected pages
    MouseClick()
    MouseMove(1000, 550) ;Move to delete confirmation button
    MouseClick()
}