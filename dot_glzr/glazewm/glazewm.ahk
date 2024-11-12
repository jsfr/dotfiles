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

!^+e::
CapsLock & e:: {
    ActivateOrRun("ahk_exe floorp.exe ahk_class MozillaWindowClass", "C:\Program Files\Ablaze Floorp\floorp.exe")
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
    ActivateOrRun("ahk_exe Obsidian.exe", "C:\Users\JensFredskov\scoop\apps\obsidian\current\Obsidian.exe")
}

!^+w::
CapsLock & w:: {
    ;ActivateOrRun("ahk_exe WindowsTerminal.exe ahk_class CASCADIA_HOSTING_WINDOW_CLASS", "wt.exe")
    ActivateOrRun("ahk_exe wezterm-gui.exe ahk_class org.wezfurlong.wezterm", "C:\Users\JensFredskov\scoop\apps\wezterm\current\wezterm-gui.exe")
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
    ActivateOrRun("ahk_exe Signal.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\scoop\apps\signal\current\Signal.exe")
    ActivateOrRun("ahk_exe Beeper.exe ahk_class Chrome_WidgetWin_1", "C:\Users\JensFredskov\scoop\apps\beeper\current\Beeper.exe")
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

; Simple hotstrings for Danish letters
:?*:;a::å
:?*:;e::æ
:?*:;o::ø

; Email autocompletion
::;mp::jensfredskov@gmail.com
::;mw::jens.fredskov@nekohealth.com

;; Rebind C-e and C-a to home and end
;^e::End
;^a::Home
;#a::^a
;#c::^c
;
;#HotIf WinActive("ahk_exe ms-teams.exe")
;^k::^e
;^l::^k
