#!/bin/sh
xset +fp /usr/share/fonts/local
xset fp rehash
 # set the cursor
xsetroot -cursor_name left_ptr
exec xmonad
xmodmap /home/chris/.keyboards/layout/colemak
