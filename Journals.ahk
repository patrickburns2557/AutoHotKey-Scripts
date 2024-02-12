#Requires AutoHotkey v2.0
#HotIf WinActive("ENTER WINDOW TITLE HERE") ;only allow hotkeys to work when inside the Journals window
TraySetIcon("Journals.ico") ;source: https://icon-icons.com/icon/book-bookmark/34486

SendMode "Event"
SetKeyDelay 75 ; program starts missing inputs if it goes much faster than this


User:= "NO USER ENTERED"
PreviousClipboard := ""

journals := ["ENTER", "JOURNAL", "LIST", "HERE"]
journalsRemove := ["ENTER", "JOURNAL", "LIST", "TO", "REMOVE", "HERE"]


;;Win+A for Add
#A::
{
    ;Get mnemonic from user
    User := GetMnemonic("add")

    ;Loop through the user list from each journal and add the specified user to each list
    for index, value in journals
        {
            Send value "{Enter}"
            
            ;Check to see if the "This journal is inactive" window pops up by using the clipboard
            A_Clipboard := ""
            Send "^c" ; If the journal is inactive, the "This journal is inactive" popup will be there, and nothing is copied,
                      ; otherwise, the "Active" entry box will be selected and "Y" will be copied
            if not(A_Clipboard == "Y" or A_Clipboard == "N") ;popup window is present
                {
                    Sleep 1000
                    Send "{Enter}" ; press enter to dismiss popup
                }
            
            Send "{Tab}{Tab}" ;move past Active and Name text boxes
            
            ;test each text box until one longer than a length of 1 is found. This is the start of the user list
            ;this is done because some journals have more text boxes to tab through than others, depending on the settings in them
            A_Clipboard := ""
            Send "^c"
            ClipWait
            while not (StrLen(A_Clipboard) > 1)
                {
                    Send "{Tab}"
                    Send "^c"
                    ClipWait
                }

            ;Send many page downs to make sure bottom of list is reached
            Loop 40
                {
                    Send "{PgDn}"
                }
            Send User "{Enter}"
            KeyWait "F12", "D" ;Pause and allow user to press F12 instead of allowing the program to do it
            Sleep 1500 ;allow time for program to save before starting next loop
        }
    MsgBox("Finished!", "Finished")
    ExitApp
}


;;Win+R for Remove
#R::
{
    User := GetMnemonic("remove")

    ;Loop through user list for each journal, find the specified user, and remove them from each of the lists
    for index, value in journalsRemove
        {
            Send value "{Enter}"
            
            ;Check to see if the "This journal is inactive" window pops up by using the clipboard
            A_Clipboard := ""
            Send "^c" ; If the journal is inactive, the "This journal is inactive" popup will be there, and nothing is copied,
                      ; otherwise, the "Active" entry box will be selected and "Y" will be copied
            if not(A_Clipboard == "Y" or A_Clipboard == "N") ;popup window is present
                {
                    Sleep 1000
                    Send "{Enter}" ; press enter to dismiss popup
                }
            
            Send "{Tab}{Tab}" ;move past Active and Name text boxes
            
            ;test each text box until one longer than a length of 1 is found. This is the start of the user list
            ;this is done because some journals have more text boxes to tab through than others, depending on the settings in them
            A_Clipboard := ""
            Send "^c"
            ClipWait
            while not (StrLen(A_Clipboard) > 1)
                {
                    Send "{Tab}"
                    Send "^c"
                    ClipWait
                }

            ;start reading through list to find specified user
            A_Clipboard := ""  ; Start off empty to allow ClipWait to detect when the text has arrived.
            Send "^c"
            ClipWait
            while not (A_Clipboard == User) 
                {
                    PreviousClipboard := A_Clipboard
                    Send "{Tab}"
                    Send "^c" ;each name in the list is automatically highlighted, so can just do ctrl+C
                    ClipWait  ; Wait for the clipboard to contain text.
                    if (A_Clipboard == PreviousClipboard) ; copy doesn't enter new contents to clipboard if end of list is reached, so if current
                                                          ; contents are equal to previous loop's contents, then end of list has been reached and break from loop
                        {
                            break
                        }
                }
            ;MsgBox "user found: " A_Clipboard
            if (A_Clipboard == User)
                {
                    Sleep 2000 ;sit on user's name for a couple seconds before deleting to allow user to make sure it's the right user
                    Send "{Del}"
                    Send "{Enter}"
                    KeyWait "F12", "D" ;Pause and allow user to press F12 instead of allowing the program to do it
                    Sleep 1500 ;allow time for program to save before starting next loop
                }
            else ;user not found, so escape rather than wait for a save/F12 from user
                {
                    Sleep 2000 ;allow time for user to see that end of list is reached
                    Send "{Esc}"
                }
            
        }
    MsgBox("Finished!", "Finished")
    ExitApp
}


;Get mnemonic of user to add or remove from the list
;whichType=="add" for adding a user
;whichType=="remove" for removing a user
;the only thing whichType will change is the text shown in the popup windows
GetMnemonic(whichType)
{
    ResponseInput := ""
    Mnemonic := ""
    ResponseConfirmation := ""
    while not ResponseConfirmation = "Yes" ;ask user for mnemonic again if they entered the wrong one
        {
            if (whichType == "add")
                {
                    ResponseMnemonic := InputBox("What is the mnemonic of the user you wish to ADD?`n(CASE SENSITIVE)", "Add User to Journals")
                }
            else if (whichType == "remove")
                {
                    ResponseMnemonic := InputBox("What is the mnemonic of the user you wish to REMOVE?`n(CASE SENSITIVE)", "Remove User from Journals")
                }
            else
                {
                    ResponseMnemonic := InputBox("What is the mnemonic of the user?`n(CASE SENSITIVE)", "Modify User in Journals")
                }
            
                
            if (ResponseMnemonic.result == "Cancel") ;exit the program if they click "Cancel"
                {
                    ExitApp
                }
            else
                {
                    Mnemonic := ResponseMnemonic.value
                }
            ;confirm the mnemonic is correct, and ask for it again if they select "No"
            ResponseConfirmation := MsgBox("Is the user `"" Mnemonic "`" correct?", "Confirmation", "YesNo")
        }
    return Mnemonic
}