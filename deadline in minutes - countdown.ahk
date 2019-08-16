;Best viewed in Notepad++ with the AHK syntax file installed. Or VSCode with AutoHotkey
;		syntax installed.
;This file runs through AutoHotkey a highly versatile freeware scripting program.
;
; AutoHotkey Version: 1.1.30.1 (compatibility not typically an issue)
; Language:		English
; Platform:		Windows 10
; Author:		Hew Reid
; Version		Date		Author		Comments
; 	0.1			16-AUG-19	Staid03	Initial
;
; Script Function:
; Calculate and project deadline
;
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance , Force
;AutoTrim , off

;set up variables and preliminaries
iconFile = icon.ico
setTrayIcon(iconFile)
DeadlineText = My deadline is: 

deadline = 20190906170000		;using yyyyMMddHHmmss  format

main:
{
	loop ,
	{
		formattime , currenttime ,, yyyyMMddHHmmss
		deadline -= %currenttime%, m
		progressNum := deadline
		progress , x10 y10 CWred w220 h22 B,, %DeadlineText% %progressNum%
		sleep , 59999 ; 1 minute
	}
}
Return

ErrorHandler(input)
{
	FileAppend , %input%`n , %LogFile%
}
Return

setTrayIcon(iconFile)
{
	;if you have an icon file 
	;referenced at the top of the script
	;it will be shown as the tray icon
	;when running this script
	ifexist , %iconFile%
	{
		Menu, Tray, Icon, %iconFile%
	}
}
return 