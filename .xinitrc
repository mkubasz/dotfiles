#!/bin/bash
setxkbmap -model 'pc104angle-z' -layout 'pl(colemak)'
xsetroot -cursor_name left_ptr

source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
exec xmonad 
