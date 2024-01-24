#IfWinActive, Pal
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"


; Toggle variable
Toggle := 0

; Create a GUI for indicating script status
Gui +AlwaysOnTop  +ToolWindow -Caption
Gui, Add, Text, vStatus, Inactive
Gui, Show, x0 y1055, Status ; Change X, Y cords to suit monitor res, currently set to bottem left 1920x1080

; Make the GUI slightly transparent
WinGet, hWnd, ID, Status
WinSet, Transparent, 100, ahk_id %hWnd% ; Adjust the "100" value to set the level of transparency of the UI (0 to 255, where 0 is completely transparent and 255 is opaque).

; Define hotkey for Mouse5 (XButton2) to toggle the script
XButton2::
    SetTimer, ToggleScript, -100 ; Add a delay of 100 milliseconds
return

ToggleScript:
    Toggle := !Toggle ; Toggle the variable
    if (Toggle) {
         Send, {f down}
         GuiControl,, Status,  Active
    }
    else {
        Send, {f up}
        GuiControl,, Status, Inactive
    }
return

; Release the F key when the script is exited
OnExit:
    Send, {f up}
    ExitApp
return
