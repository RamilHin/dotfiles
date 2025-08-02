#
# ~/.bashrc

export TERM=xterm-256color
force_color_prompt=yes


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias r='ranger'
alias sf='screenfetch'
alias ll='ls -l'
alias la='ls -la'
alias l='ls -l'
alias ..='cd ..'
alias h='cd ~'
alias c='clear'
alias q='exit'

# Git aliases
alias g='lazygit'
alias gl='git log --oneline --graph --decorate --all'
alias gs='git status'
alias lg='lazygit'




# PS1='[\u@\h \W]\$ '
export PS1="\[\e[96m\]\u\[\e[m\]:\[\e[92m\]\w\[\e[m\]\$ "

source /etc/environment

[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

[[ -s /home/ramilhin/.autojump/etc/profile.d/autojump.sh ]] && source /home/ramilhin/.autojump/etc/profile.d/autojump.sh

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
ISTFILESIZE=2000

export VISUAL=nvim
export EDITOR=nvim

bind 'set completion-ignore-case on'

# screenfetch
# cd ~

eval "$(zoxide init bash)"
