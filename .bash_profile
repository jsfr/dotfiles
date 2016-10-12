#
# ~/.bash_profile
#

[[ -f ~/.profil ]] && . ~/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx -- -keeptty -nolisten tcp > ~/.xorg.log 2>&1
fi
