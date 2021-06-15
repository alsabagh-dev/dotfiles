# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export PATH="$HOME/.local/bin:$PATH";


export THEME=~/.dotfiles/bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi

export PS2="\[\e[38;5;241m\]\[\e[0m\] "
export PS3="\[\e[38;5;241m\]\[\e[0m\] "
export PS4="\[\e[48;5;241m\e[39m\]+\[\e[0m\e[38;5;241m\]\[\e[0m\] "

# source ~/.dotfiles/bash/.bash_prompt
source ~/.dotfiles/bash/aliases/.aliases
source ~/.dotfiles/bash/exports/.exports
source ~/.dotfiles/bash/functions/.functions

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi