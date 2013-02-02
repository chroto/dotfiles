#!/bin/sh
xset +fp /usr/share/fonts/local
xset fp rehash
 # set the cursor
xsetroot -cursor_name left_ptr
setxkbmap us -variant colemak
xautolock -time 10 -locker "gnome-screensaver-command -l" -notify 10 \
  -notifier "notify-send -t 5000 -i gtk-dialog-info 'Locking in 10 seconds'" &

export XIM=fcitx
export XIM_PROGRAM=fcitx
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"

# 你好
fcitx -d

exec xmonad
