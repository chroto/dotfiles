#
# ~/.bash_profile
#

eval $(keychain --eval --agents ssh -Q --quiet id_ecdsa)

[[ -f ~/.bashrc ]] && . ~/.bashrc

