#SingleInstance Force

SetCapsLockState("AlwaysOff")

ActivateOrRun(window, path) {
    DetectHiddenWindows(true)
    Id := WinExist(window)
    if Id {
        WinActivate(Id)
    } else {
        Run(path)
    }
    DetectHiddenWindows(false)
}

; F18 & s::
; CapsLock & s:: {
;     Run("SnippingTool.exe")
; }

F18 & e::
CapsLock & e:: {
    ActivateOrRun("ahk_exe firefox.exe ahk_class MozillaWindowClass", "C:\Program Files\Mozilla Firefox\firefox.exe")
}

F18 & t::
CapsLock & t:: {
    ActivateOrRun("Microsoft Teams ahk_exe ms-teams.exe ahk_class TeamsWebView", "ms-teams.exe")
    ; DetectHiddenWindows(true)
    ; Run("ms-teams.exe")
    ; WinWait("ahk_exe ms-teams.exe")
    ; WinActivate("ahk_exe ms-teams.exe")
    ; DetectHiddenWindows(false)
}

F18 & l::
CapsLock & l:: {
    ActivateOrRun("ahk_exe Logseq.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\AppData\Local\Logseq\Logseq.exe")
}

F18 & w::
CapsLock & w:: {
    ActivateOrRun("ahk_exe wezterm-gui.exe ahk_class org.wezfurlong.wezterm", "C:\Program Files\WezTerm\wezterm-gui.exe")
}

F18 & c::
CapsLock & c:: {
    ActivateOrRun("ahk_exe olk.exe ahk_class Olk Host", "olk.exe")
}

F18 & a::
CapsLock & a:: {
    DetectHiddenWindows(true)
    if (WinActive("ahk_exe Signal.exe ahk_class Chrome_WidgetWin_1")) {
        ActivateOrRun("ahk_exe Beeper.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\AppData\Local\Programs\BeeperTexts\Beeper.exe")
    } else {
        ActivateOrRun("ahk_exe Signal.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\AppData\Local\Programs\signal-desktop\Signal.exe")
    }
    DetectHiddenWindows(false)
}

F18 & r::
CapsLock & r:: {
    ActivateOrRun("ahk_exe rider64.exe ahk_class SunAwtFrame", "C:\Program Files\JetBrains\JetBrains Rider 2025.1.2\bin\rider64.exe")
}

F18 & q::
CapsLock & q:: {
    Run("C:\Users\JensFredskov\repos\github.com\jsfr\glazewm-listener\glazewm-listener.exe update", , "Hide")
}

F18 & d::
CapsLock & d::{
    Send("^+!d")
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

#HotIf WinActive("Microsoft Teams ahk_exe ms-teams.exe ahk_class TeamsWebView")
    Enter::Send("+{Enter}")
    ^Enter::Send("{Enter}")
#HotIf
