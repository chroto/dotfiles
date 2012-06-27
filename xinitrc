#!/bin/sh
xset +fp /usr/share/fonts/local
xset fp rehash
xmodmap ~/.keyboards/layouts/colemak
 # set the cursor
xsetroot -cursor_name left_ptr
# desktop background
xloadimage -fullscreen -onroot wallpaper.png
