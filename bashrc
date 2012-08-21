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

function append_to_path {
   if [[ -n $1 ]]; then
       PATH=$PATH:$1;
       export PATH;
   fi
}

if [[ -d ~/scripts ]]; then
    append_to_path ~/scripts;
fi

if [[ -d ~/.gem/ruby/1.9.1/bin ]]; then
    append_to_path ~/.gem/ruby/1.9.1/bin;
fi

# http://help.github.com/ssh-key-passphrases/

SSH_ENV="$HOME/.ssh/environment"

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ssh-add
}

# test for identities
function test_identities {
    # test whether standard identities have been added to the agent already
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $? -eq 0 ]; then
        ssh-add
        # $SSH_AUTH_SOCK broken so we start a new proper agent
        if [ $? -eq 2 ];then
            start_agent
        fi
    fi
}

# check for running ssh-agent with proper $SSH_AGENT_PID
if [ -n "$SSH_AGENT_PID" ]; then
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
	test_identities
    fi
# if $SSH_AGENT_PID is not properly set, we might be able to load one from
# $SSH_ENV
else
    if [ -f "$SSH_ENV" ]; then
	. "$SSH_ENV" > /dev/null
    fi
    ps -ef | grep "$SSH_AGENT_PID" | grep -v grep | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
        test_identities
    else
        start_agent
    fi
fi
alias tags="ctags --exclude=*.min.* --exclude=*/CACHE/* -R"
