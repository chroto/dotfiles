#!/bin/sh
xset +fp /usr/share/fonts/local
xset fp rehash
xmodmap ~/.keyboards/layout/colemak
 # set the cursor
xsetroot -cursor_name left_ptr
exec xmonad
