#SingleInstance Force

SetCapsLockState("AlwaysOff")

CapsLock:: {
    Send("{Esc}")
}

ActivateOrRun(window, path) {
    DetectHiddenWindows(true)
    Id := WinExist(window)
    if Id {
        WinActivate(Id)
    } else {
        Run(path)
    }
}

ShiftedSend(key) {
    if GetKeyState("Shift") {
        Send("+" key)
    } else {
        Send(key)
    }
}

!^+s::
CapsLock & s:: {
    Run("SnippingTool.exe")
}


!^+e::
CapsLock & e:: {
    ActivateOrRun("ahk_exe zen.exe ahk_class MozillaWindowClass", "C:\Program Files\Zen Browser\zen.exe")
}

!^+t::
CapsLock & t:: {
    DetectHiddenWindows(true)
    Run("ms-teams.exe")
    WinWait("ahk_exe ms-teams.exe")
    WinActivate("ahk_exe ms-teams.exe")
}

!^+o::
CapsLock & o:: {
    ActivateOrRun("ahk_exe Logseq.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\AppData\Local\Logseq\Logseq.exe")
}

!^+w::
CapsLock & w:: {
    ActivateOrRun("ahk_exe wezterm-gui.exe ahk_class org.wezfurlong.wezterm", "C:\Program Files\WezTerm\wezterm-gui.exe")
}

!^+v::
CapsLock & v:: {
    ActivateOrRun("ahk_exe Code.exe", "C:\Users\JensFredskov\AppData\Local\Programs\Microsoft VS Code\Code.exe")
}

!^+c::
CapsLock & c:: {
    ActivateOrRun("ahk_exe olk.exe ahk_class Olk Host", "olk.exe")
}

!^+a::
CapsLock & a:: {
    ; ActivateOrRun("ahk_exe Signal.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\AppData\Local\Programs\signal-desktop\Signal.exe")
    ActivateOrRun("ahk_exe Beeper.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\AppData\Local\Programs\beeper\Beeper.exe")
}

CapsLock & h:: {
    ShiftedSend("{Left}")
}

CapsLock & j:: {
    ShiftedSend("{Down}")
}

CapsLock & k:: {
    ShiftedSend("{Up}")
}

CapsLock & l:: {
    ShiftedSend("{Right}")
}

CapsLock & Esc::`
CapsLock & d::!^+d

!^+r::
CapsLock & r:: {
    Run("C:\Users\JensFredskov\.local\bin\gwu.exe")
}

; Remap copilot button to Right Control
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
:o:;mp::jensfredskov@gmail.com
:o:;mw::jens.fredskov@nekohealth.com
:o:;pm::jensfredskov@gmail.com
:o:;wm::jens.fredskov@nekohealth.com

; Other hotstrings
:?:;td::TODO: (jens)
:o:;jf::jensfredskov
