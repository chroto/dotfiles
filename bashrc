#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

H_ENV="$HOME/.ssh/environment"
[[ -f ~/.local_settings ]] && . ~/.local_settings
