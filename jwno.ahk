#SingleInstance Force

; Disable default Caps Lock behavior
SetCapsLockState("AlwaysOff")

; Variable to track if Caps Lock was used with another key
global CapsLockUsed := false

; When Caps Lock is pressed down
~*CapsLock::{
    global CapsLockUsed
    CapsLockUsed := false
}

; When Caps Lock is released
~*CapsLock Up::{
    global CapsLockUsed

    ; If no other key was pressed, send Escape
    if (!CapsLockUsed) {
        Send("{Escape}")
    }
}

; Create hotkeys for all alphanumeric keys with CapsLock
; Letters A-Z
Loop 26 {
    letter := Chr(A_Index + 64)  ; Convert number to letter (A=65)
    Hotkey("CapsLock & " . letter, CapsLockCombo)
}

; Function to handle CapsLock combinations
CapsLockCombo(ThisHotkey) {
    global CapsLockUsed
    CapsLockUsed := true

    ; Extract the key that was pressed with CapsLock
    key := StrReplace(ThisHotkey, "CapsLock & ", "")

    ; Send Ctrl+Alt+Shift+Key
    Send("^!+" . key)
}

; Remap copilot button to Right Control
; rebind copilot to rCtrl
*<+<#f23:: {
    Send("{Blind}{LShift Up}{LWin Up}{RControl Down}")
    KeyWait("F23")
    Send("{RControl up}")
}

; Simple hotstrings for Danish letters
:?*:;a::å
:?*:;e::æ
:?*:;o::ø
:?*:;m::—
:?*:;n::–

; Email autocompletion
:?*:;jm::jensfredskov@gmail.com
:?*:;nm::jens.fredskov@nekohealth.com

; Other hotstrings
:?*:;td::{
    Send(FormatTime(,"'TODO: ('yyyy-MM-dd' - jens)'"))
}
:?*:;jf::jensfredskov
