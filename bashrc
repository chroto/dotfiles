#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1='\033[31m\h\033[0m \w \[\033[33m\]$(git_prompt_info)\[\033[0m\] \[\033[31m\]$(git_status)\[\033[0m\]\n\$ '
export F_PATH="$HOME/.f/unctions"
export H_ENV="$HOME/.ssh/environment"
[[ -f ~/.git-completion.bash ]] && . ~/.git-completion.bash
[[ -f ~/.gitprofile ]] && . ~/.gitprofile
[[ -f ~/.aliases ]] && . ~/.aliases
[[ -f ~/.f/f.sh ]] && . ~/.f/f.sh
[[ -f ~/.b/b.sh ]] && . ~/.b/b.sh && . ~/.b/b_completion.sh
[[ -f ~/.local_settings ]] && . ~/.local_settings
