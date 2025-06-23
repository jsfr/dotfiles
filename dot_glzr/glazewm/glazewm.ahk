#SingleInstance Force

SetCapsLockState("AlwaysOff")

LocalAppData := EnvGet("LocalAppData")

; ActivateOrRun(window, path) {
;     DetectHiddenWindows(true)
;     Id := WinExist(window)
;     if Id {
;         WinActivate(Id)
;     } else {
;         Run(path)
;     }
;     DetectHiddenWindows(false)
; }

ActivateOrRun(ProcessName, AppPath) {
    Run("nu activate-or-run.nu " . ProcessName . ' "' . AppPath . '"', , "Hide")
}

F18 & e::
CapsLock & e:: {
    ActivateOrRun("firefox", A_ProgramFiles . "\Mozilla Firefox\firefox")
}

F18 & t::
CapsLock & t:: {
    ActivateOrRun("ms-teams", "ms-teams")
}

F18 & l::
CapsLock & l:: {
    ActivateOrRun("Logseq", LocalAppData . "\Logseq\Logseq")
}

F18 & w::
CapsLock & w:: {
    ActivateOrRun("wezterm-gui", A_ProgramFiles . "\WezTerm\wezterm-gui")
}

F18 & c::
CapsLock & c:: {
    ActivateOrRun("olk", "olk")
}

F18 & a::
CapsLock & a:: {
    if (WinActive("ahk_exe Signal.exe ahk_class Chrome_WidgetWin_1")) {
        ActivateOrRun("Beeper", LocalAppData . "\Programs\BeeperTexts\Beeper")
    } else {
        ActivateOrRun("Signal", LocalAppData . "\Programs\signal-desktop\Signal.exe")
    }
}

F18 & r::
CapsLock & r:: {
    ActivateOrRun("rider64", "C:\Program Files (x86)\JetBrains\JetBrains Rider 2025.1.3\bin\rider64")
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
