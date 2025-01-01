#Requires AutoHotkey v2
#Include %A_ScriptDir%\Lib\guidegui.ahk
#Include %A_ScriptDir%\Lib\mainsettingsui.ahk

; Initialize variables for tracking data
GemsEarned := 0
ShibuyaFood := 0
TraitRerolls := 0
StatChips := 0
SuperStatChips := 0
GreenEssence := 0
ColoredEssence := 0
CurrentChallenge := "None"

; Image paths
MinimizeImage := "Lib\Images\minimize.png"
CloseImage := "Lib\Images\close.png"
LogoImage := "Lib\Images\my_logo.png"  ; Replace this with your logo path
HackerImage := "C:\Users\liamf\OneDrive\Desktop\test\KH AA Macro V1\Lib\Images\OIP (3).jpg" ; Hacker image path
BackgroundImage := "C:\Users\liamf\OneDrive\Desktop\test\KH AA Macro V1\Lib\Images\devil-girl-edgy-anime-pfp-1m6byuh8nz7f3rec.jpg" ; Background image path
lastlog := ""

; Create Main GUI
MainGUI := Gui("-Caption +Border +AlwaysOnTop", "KAMI Macros - Hacker Theme")
MainGUI.BackColor := "0c000a"  ; Dark background color for hacker theme
MainGUI.SetFont("s10", "Impact")  ; Set font to a less bold style

; Add Hacker Image as a button (opens Discord server)
HackerButton := MainGUI.Add("Picture", "x910 y8 w60 h34 +BackgroundTrans cffffff", HackerImage)  ; White text
HackerButton.OnEvent("Click", (*) => OpenHackerSite())

; Minimize and Close buttons
MinimizeButton := MainGUI.Add("Picture", "x1000 y22 w37 h9 +BackgroundTrans cffffff", MinimizeImage)  ; White text
MinimizeButton.OnEvent("Click", (*) => MinimizeGUI())

CloseAppButton := MainGUI.Add("Picture", "x1052 y10 w30 h32 +BackgroundTrans cffffff", CloseImage)  ; White text
CloseAppButton.OnEvent("Click", (*) => ExitApp())

; Add "How to Use?" button
GuideBttn := MainGUI.Add("Button", "x830 y632 w238 cffffff +BackgroundTrans +Center", "How to Use?")  ; White text
GuideBttn.OnEvent("Click", (*) => OpenGuide())

; Progress bar (used for the background box)
MainGUI.AddProgress("c0x7e4141 x8 y27 h602 w800", 100)
WinSetTransColor("0x7e4141 255", MainGUI)

; Add image as background for the 'Unit Setup' group box
MainGUI.Add("Picture", "x830 y60 w238 h250", BackgroundImage)  ; Background image behind Unit Setup

; Group Box for Unit Setup
MainGUI.Add("GroupBox", "x830 y60 w238 h250 cfffd90", "Unit Setup")
enabled1 := MainGUI.Add("Checkbox", "x840 y80 cffffff", "Slot 1")  ; White text
enabled2 := MainGUI.Add("Checkbox", "x840 y110 cffffff", "Slot 2")  ; White text
enabled3 := MainGUI.Add("Checkbox", "x840 y140 cffffff", "Slot 3")  ; White text
enabled4 := MainGUI.Add("Checkbox", "x840 y170 cffffff", "Slot 4")  ; White text
enabled5 := MainGUI.Add("Checkbox", "x840 y200 cffffff", "Slot 5")  ; White text
enabled6 := MainGUI.Add("Checkbox", "x840 y230 cffffff", "Slot 6")  ; White text

; Drop-down lists for placement options
placement1 := MainGUI.Add("DropDownList", "x1020 y80 w40 cffffff Choose3", [1, 2, 3, 4, 5])  ; White text
placement2 := MainGUI.Add("DropDownList", "x1020 y110 w40 cffffff Choose3", [1, 2, 3, 4, 5])  ; White text
placement3 := MainGUI.Add("DropDownList", "x1020 y140 w40 cffffff Choose3", [1, 2, 3, 4, 5])  ; White text
placement4 := MainGUI.Add("DropDownList", "x1020 y170 w40 cffffff Choose3", [1, 2, 3, 4, 5])  ; White text
placement5 := MainGUI.Add("DropDownList", "x1020 y200 w40 cffffff Choose3", [1, 2, 3, 4, 5])  ; White text
placement6 := MainGUI.Add("DropDownList", "x1020 y230 w40 cffffff Choose3", [1, 2, 3, 4, 5])  ; White text

; Labels for placements
MainGUI.Add("Text", "x940 y80 h60 cffffff +BackgroundTrans", "Placements:")  ; White text
MainGUI.Add("Text", "x940 y110 h60 cffffff +BackgroundTrans", "Placements:")  ; White text
MainGUI.Add("Text", "x940 y140 h60 cffffff +BackgroundTrans", "Placements:")  ; White text
MainGUI.Add("Text", "x940 y170 h60 cffffff +BackgroundTrans", "Placements:")  ; White text
MainGUI.Add("Text", "x940 y200 h60 cffffff +BackgroundTrans", "Placements:")  ; White text
MainGUI.Add("Text", "x940 y230 h60 cffffff +BackgroundTrans", "Placements:")  ; White text

; Activity Log Section
MainGUI.Add("GroupBox", "x830 y320 w238 h210 cffffff", "Activity Log")  ; White text
ActivityLog := MainGUI.Add("Text", "x830 y340 w238 h300 r11 cffffff +BackgroundTrans +Center", "Macro Launched")  ; White text

; Keybinds Section
MainGUI.Add("GroupBox", "x830 y540 w238 h80 cffffff", "Keybinds")  ; White text
KeyBinds := MainGUI.Add("Text", "x830 y560 w238 h300 r7 cffffff +BackgroundTrans +Center", "F1 - Fix Roblox Position`nF2 - Start Macro`nF3 - Stop Macro")  ; White text

; Footer Text with cool font
FooterText := MainGUI.Add("Text", "x12 y650 w1100 cffffff +BackgroundTrans Center", "© KAMI Hub Macro. Made by Hikari")  ; White text

; Display the GUI
MainGUI.Show("x27 y15 w1100 h665")

; Add to Activity Log
AddToLog(text) {
    global lastlog
    ActivityLog.Value := text "`n" ActivityLog.Value
}

; Minimize GUI
MinimizeGUI() {
    WinMinimize("KAMI Macros - Hacker Theme")
}

; Open Hacker Site (Now opens Discord Server)
OpenHackerSite() {
    Run("https://discord.gg/YYaNWdZf") ; Opens the desired Discord server
}

; Save Configuration
SaveConfig() {
    ; Functionality unchanged
}

; Load Configuration (Placeholder)
LoadConfig() {
    ; Functionality unchanged
}
