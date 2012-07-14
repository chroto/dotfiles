#!/bin/sh
xset +fp /usr/share/fonts/local
xset fp rehash
 # set the cursor
xsetroot -cursor_name left_ptr
exec xmonad
xmodmap ~/.keyboards/layouts/colemak
xloadimage -fullscreen -onroot ~/wallpaper/wallpaper.png
