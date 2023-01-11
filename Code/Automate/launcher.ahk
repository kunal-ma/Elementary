;------------------------------
; Game Launcher v1.0
; By Kunal M.A.
;------------------------------

;------------------------------
; Initialization
;------------------------------

#NoTrayIcon
#SingleInstance Force

;------------------------------
; Selection Menu
;------------------------------

Menu, Tray, Tip, Game Launcher

Gui, Show, w155 h130, Game Launcher
Gui, Add, Text,, Please select a game :
Gui, Add, Radio, vOpt1, GTA : San Andreas
Gui, Add, Radio, vOpt2, Stardew Valley
Gui, Add, Radio, vOpt3, Crysis 3
Gui, Add, Radio, vOpt4, Minecraft
Gui, Add, Button, w135, OK
return

GuiClose:
	ExitApp
ButtonOK:
	Gui, Submit

Goto, Launch

;------------------------------
; Game launch
;------------------------------

Launch:
	if (Opt1 == "1")
		Run, .\Links\GTA SA
	if (Opt2 == "1")
		Run, .\Links\Stardew
	if (Opt3 == "1")
		Run, .\Links\Crysis
	if (Opt4 == "1")
		Run, .\Links\Minecraft
	Goto, Timer

;------------------------------
; Timer for game shutdown
;------------------------------

Timer:
	Ping := 60000 * 25	; Minutes before warning
	Shut := 60000 * 30	; Minutes before shutdown
	
	Cont := A_TickCount
	Tick := Cont + Ping
	Tock := Cont + Shut

	Loop
	{
		if (A_TickCount >= Tick)
		{
			MsgBox, 4096, Game Launcher, You have 5 minutes left, 5
			break
		}
	}

	Loop
	{
		if (A_TickCount >= Tock)
		{
			MsgBox, 4096, Game Launcher, Time up ! Closing the game in 10s, 10
			Sleep, 10000
			if (Opt1 == "1")
				Process, Close, gta_sa.exe
			if (Opt2 == "1")
				Process, Close, StardewModdingAPI.exe
			if (Opt3 == "1")
				Process, Close, Crysis3.exe
			if (Opt4 == "1")
				Process, Close, javaw.exe
			break
		}
	}
	Sleep, 2000
	ExitApp
	
;------------------------------
; Exiting the launcher
;------------------------------
	
#!g::
TrayTip, Custom Function, Exiting Game Launcher !, 1, 18
sleep, 2000
ExitApp
return

;------------------------------


	
	
	

