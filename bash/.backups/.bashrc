#source /usr/share/undistract-me/long-running.bash

#notify_when_long_running_commands_finish_install


# # colors!
red="\[\033[38;5;203m\]"
green="\[\033[38;05;38m\]"
blue="\[\033[0;34m\]"
reset="\[\033[0m\]"

source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\[\033[38;5;203m\]\h\[\033[00m\]:$(__git_ps1) \[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:$(__git_ps1)\w\n\$ '
fi
unset color_prompt force_color_prompt
#\[\033[38;5;203m\]
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h:\$(__git_ps1)\w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias py='python'
alias py3='python3'
alias gti='git'
alias shop='code ~/Workspace/oq-client-web-ssr'
alias blog='code ~/Workspace/oq-ui-ssr'
alias back='code ~/Workspace/OQ-3'
alias db='cd ~/Workspace/OQ-3 && nodemon --inspect app.js'
alias mon='mono /usr/share/ssm/Screenshot\ Monitor.exe & exit'



# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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
#if [ $TILIX_ID ] || [ $VTE_VERSION ] ; then source /etc/profile.d/vte.sh; fi # Ubuntu Budgie END





# export GIT_PS1_SHOWDIRTYSTATE=1

# # '\u' adds the name of the current user to the prompt
# # '\$(__git_ps1)' adds git-related stuff
# # '\W' adds the name of the current directory
# export PS1="$red\u@\h$green\$(__git_ps1)$blue [\W]$ $reset"

df(){
	if [ $# -eq 1 ]	
           then
		wget --continue "$1" ;
		zenity --notification --text="File has been Successfully Downloaded\!\!"
	fi
	if [ $# -eq 2 ]	
           then
		wget --continue "$1" -O "$2";
		zenity --notification --text="$2 has been Successfully Downloaded\!\!"
	fi
}


dyv(){
	youtube-dl --format best --output "%(title)s.%(ext)s" --no-playlist --continue "$1";
	zenity --notification --text="Video has been Successfully Downloaded\!\!"
}
dyvs(){
	youtube-dl --format best --output "%(title)s.%(ext)s" --no-playlist --continue --sub-lang "$2" --write-sub --embed-subs "$1";
	zenity --notification --text="Video has been Successfully Downloaded\!\!"
}

dyp(){

	youtube-dl  -i --format best --output "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --yes-playlist --continue  "$1";
	zenity --notification --text="Playlist has been Successfully Downloaded\!\!";
}
dyps(){

	youtube-dl  -i --format best --output "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" --yes-playlist --continue --sub-lang "$2" --write-sub --embed-subs  "$1";
	zenity --notification --text="Playlist has been Successfully Downloaded\!\!";
}
dymp3(){
	youtube-dl --extract-audio --audio-format mp3 --output "%(title)s.%(ext)s" "$1";
	zenity --notification --text="MP3 file is ready\!\!"
}

merge-subtitle-into-video(){
    ffmpeg -i "$1" -i "$2" -c:v copy -c:a copy -c:s mov_text "$3"
}

merge-audio-into-video(){
    ffmpeg -i "$1" -i "$2" -c:v copy -c:a aac -strict experimental "$3"
}

extract-audio-from-video(){
    ffmpeg  -i "$1" "$2"
}

download-pluralsight-video(){
    if [ $# -eq 1 ]
        then
            youtube-dl --username "abdel-aziz-abdel-nas" --password "DYBPsWDg9QrcGZr" --sleep-interval 20  -o '%(playlist_title)s/%(chapter_number)s - %(chapter)s/%(playlist_index)s-%(title)s.%(ext)s' --sub-lang en --write-sub --playlist-start 1 "$1"
    fi

    if [ $# -eq 2 ]
        then
            youtube-dl --username "abdel-aziz-abdel-nas" --password "DYBPsWDg9QrcGZr" --sleep-interval 20  -o '%(playlist_title)s/%(chapter_number)s - %(chapter)s/%(playlist_index)s-%(title)s.%(ext)s' --sub-lang en --write-sub --playlist-start "$2" "$1"
    fi

    if [ $# -eq 3 ]
        then
            youtube-dl --username "abdel-aziz-abdel-nas" --password "DYBPsWDg9QrcGZr" --sleep-interval "$3"  -o '%(playlist_title)s/%(chapter_number)s - %(chapter)s/%(playlist_index)s-%(title)s.%(ext)s' --sub-lang en --write-sub --playlist-start 1 "$1"
    fi
}
rm-branches(){
    git branch | grep -v "master" | grep -v "blog" | grep -v ^* | xargs git branch -D
}