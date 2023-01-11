;------------------------------
; Keybinds Manager v1.0
; By Kunal M.A.
;------------------------------

;------------------------------
; Initialization
;------------------------------

#NoTrayIcon
#SingleInstance Force

;------------------------------
; Quick Hotkeys
;------------------------------

#F1::Send {Media_Play_Pause}	; Play/Pause
#F2::Send {Media_Prev}			; Previous Track
#F3::Send {Media_Next}			; Next Track
#+s::Send {PrintScreen}			; Print Screen
#!s::Shutdown, 1				; Shutdown

;------------------------------
; Customized Hotkeys
;------------------------------

!n::	; Available Networks
Run, explorer.exe ms-availablenetworks:
return

!b::	; Toggle Bluetooth
SendMode Input
Run, ms-settings:bluetooth
WinWaitActive, Settings
Sleep 2000
Send,{Tab}{Space}
WinClose, A
return

!f::	; Quick Connect for Samsung Flow
Run, .\Shortcuts\Flow
WinWaitActive, Samsung Flow
Sleep 3000
WinClose, A
return

#n::	; Sticky Notes
Run, .\Shortcuts\Sticky Notes
WinWait, Sticky Notes
Sleep 1000
WinSet, AlwaysOnTop, On, Sticky Notes
return

#t::	; Terminal
Run, cmd /K "cd C:\Users\kunal"
WinActivate
return

;------------------------------
; Game Mode
;------------------------------

#g::		; Game Mode
Game := !Game
Quip := Game==1 ? "Enabled":"Disabled"
Menu, Tray, Icon
TrayTip, Custom Function, Game Mode is %Quip% !, 1, 17
sleep, 2000
Menu, Tray, NoIcon
If(Game==1)
{
	Process, Close, RBTray.exe
	Process, Close, Rainmeter.exe
}
else if (Game==0)
{
	Run, .\Shortcuts\RBTray
	Run, .\Shortcuts\Rainmeter
}
return

;------------------------------
; Panic Mode
;------------------------------

#Esc:: 		; Panic Mode
Panic := !Panic
Quip := Panic==1 ? "Enabled":"Disabled"
Menu, Tray, Icon
TrayTip, Custom Function, Panic Mode is %Quip% !, 1, 17
sleep, 2000
Menu, Tray, NoIcon
return

#If Panic
`::^#Left
/::^#Right

;------------------------------
; Manager Controls
;------------------------------

#!Enter::	; Exit command
Menu, Tray, Icon
TrayTip, Custom Function, Exiting Keybinds Manager !, 1, 18
sleep, 2000
Menu, Tray, NoIcon
ExitApp
return

;------------------------------