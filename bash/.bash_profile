# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export PATH="$HOME/.local/bin:$PATH";

export THEME=~/.dotfiles/bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi

# source ~/.dotfiles/bash/.bash_prompt
source ~/.dotfiles/bash/aliases/.aliases
source ~/.dotfiles/bash/exports/.exports
source ~/.dotfiles/bash/functions/.functions

