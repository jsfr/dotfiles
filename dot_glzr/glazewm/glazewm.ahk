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

CapsLock & s:: {
    Run("SnippingTool.exe")
}

CapsLock & e:: {
    ActivateOrRun("ahk_exe firefox.exe ahk_class MozillaWindowClass", "C:\Program Files\Mozilla Firefox\firefox.exe")
}

CapsLock & t:: {
    DetectHiddenWindows(true)
    Run("ms-teams.exe")
    WinWait("ahk_exe ms-teams.exe")
    WinActivate("ahk_exe ms-teams.exe")
    DetectHiddenWindows(false)
}

CapsLock & o:: {
    ActivateOrRun("ahk_exe Logseq.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\AppData\Local\Logseq\Logseq.exe")
}

CapsLock & w:: {
    ActivateOrRun("ahk_exe wezterm-gui.exe ahk_class org.wezfurlong.wezterm", "C:\Program Files\WezTerm\wezterm-gui.exe")
}

CapsLock & v:: {
    ActivateOrRun("ahk_exe Code.exe", "C:\Users\JensFredskov\AppData\Local\Programs\Microsoft VS Code\Code.exe")
}

CapsLock & c:: {
    ActivateOrRun("ahk_exe olk.exe ahk_class Olk Host", "olk.exe")
}

CapsLock & a:: {
    DetectHiddenWindows(true)
    if (WinActive("ahk_exe Signal.exe ahk_class Chrome_WidgetWin_1")) {
        ActivateOrRun("ahk_exe Beeper.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\AppData\Local\Programs\beeper\Beeper.exe")
    } else {
        ActivateOrRun("ahk_exe Signal.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\AppData\Local\Programs\signal-desktop\Signal.exe")
    }
    DetectHiddenWindows(false)
}

CapsLock & r:: {
    ActivateOrRun("ahk_exe rider64.exe ahk_class SunAwtFrame", "C:\Program Files (x86)\JetBrains\JetBrains Rider 2024.3.6\bin\rider64.exe")
}

CapsLock & q:: {
    Run("C:\Users\JensFredskov\repos\github.com\jsfr\glazewm-listener\glazewm-listener.exe update", , "Hide")
}

; CapsLock & g:: {
;     Run("C:\Program Files\WezTerm\wezterm.exe connect wuake --class org.wezfurlong.wezterm.wuake", , "Hide")
; }

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

; Email autocompletion
:?*:;mp::jensfredskov@gmail.com
:?*:;mw::jens.fredskov@nekohealth.com

; Other hotstrings
:?*:;td::{
    Send(FormatTime(,"'TODO: ('yyyy-MM-dd' - jens)'"))
}
:?*:;jf::jensfredskov
