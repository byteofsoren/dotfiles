#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Alias
alias ls='ls --color=auto'
alias cdA='cd ~/.config/awesome'
export wine32=”WINEPREFIX=' /home/$username/.wine32'”

# batery meter 

function powerText
{
    POWER=$(acpi 2>&1| awk '{print $4}' | sed 's/%,*$//g')
    #POWER=50           # Debug
 #   if [ "$POWER" -lt 70 ]
 #   then
 #       echo "$POWER%"
 #   else
 #       echo "█"
 #   fi

    if [ "$POWER" -gt 90 ]; then
        echo "█"
    elif [ "$POWER" -gt 80 ]; then
        echo "▇"
    elif [ "$POWER" -gt 60 ]; then
        echo "▆"
    elif [ "$POWER" -gt 50 ]; then
        echo "▅"
    elif [ "$POWER" -gt 40 ]; then
        echo "▄"
    elif [ "$POWER" -gt 30 ]; then
        echo "▃"
    elif [ "$POWER" -gt 20 ]; then
        echo "▂"
    elif [ "$POWER" -gt 10 ]; then
        echo "▁"
    fi
}

#█ ▇ ▆ ▅ ▄ ▃ ▂ ▁

# Git function to PS1.

exec fish
# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

# add this to ps1 export PS1="\`parse_git_branch\` "

# Collor Sheemes.
BOLD="\[$(tput bold)\]"
NORM=$(tput sgr0)
RESTORE='\033[37m'

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'
HISTCOLLOR='\033[38;5;214m'

#prompt
#function fansy_ps1_no1
{
   export PS1="\[${LGREEN}\]┌─[\u@\h]\[${LBLUE}\] \w\[${LGREEN}\]\n└──> \[${RESTORE}\]"
}
#function fansy_ps1_no2
{
   export PS1="\[${LGREEN}\]┌─[\[${LCYAN}\]\!\[${LGREEN}\]][\u@\h]\[${LBLUE}\] \w\[${LGREEN}\]\n└──> \[${RESTORE}\]"
}
#function fansy_ps1_no3
{
   export PS1="\[${LGREEN}\]┌─[\[${HISTCOLLOR}\]\!\[${LGREEN}\]][\u@\h]\[${LBLUE}\] \w \[${HISTCOLLOR}\]\[\`parse_git_branch\`\]\[${LGREEN}\]\n└──> \[${RESTORE}\]"
}
function fansy_ps1_no4
{
    export PS1="\[${LGREEN}\]┌─[\[${HISTCOLLOR}\]\!\[${LGREEN}\]][\u@\h]\[${LBLUE}\] \w \[${HISTCOLLOR}\]\[\`parse_git_branch\`\] \[\`powerText\`\]\[${LGREEN}\]\n└──> \[${RESTORE}\]"
}

function fansy_ps1_no5
{
    export PS1="\[${LGREEN}\]┌─[\[${HISTCOLLOR}\]\!\[${LGREEN}\]][\[${HISTCOLLOR}\]\[\`powerText\`\]\[${LGREEN}\]][\u@\h]\[${LBLUE}\] \w \[${HISTCOLLOR}\]\[\`parse_git_branch\`\]\[${LGREEN}\]\n└──> \[${RESTORE}\]"
}




fansy_ps1_no5

# PS1='[\u@\h \W]\$ '
#export PS1="\[$(tput bold)\e[38;5;113m┌─[\u@\h] \A\e[38;5;75m \w \`parse_git_branch\` \n\e[38;5;113m└──> \[$(tput bold)\]\e[1;037m"
#export PS1="\[$(tput bold)\e[38;5;113m┌─[\e[38;5;214m\!\e[38;5;113m]\e[38;5;113m[\u@\h] \A\e[38;5;75m \w \`parse_git_branch\` \e[38;5;167m\`powerText\` \n\e[38;5;113m└──> \[$(tput bold)\]\e[1;037m\[\033[0m\]"
#export PS1="${BOLD}\[${ALGREEN}\]┌─[\e[38;5;214m\!\e[38;5;113m]\e[38;5;113m[\u@\h] \A\e[38;5;75m \w \`parse_git_branch\` \e[38;5;167m\`powerText\` \n\e[38;5;113m└──> \[$(tput bold)\]\e[1;037m\e(B\e[m${NORM}${BOLD}"

#,qexport PS1="\[\033[38;5;22m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;22m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[\033[38;5;2m\]\u@\[$(tput sgr0)\]\[\033[38;5;28m\]\h\[$(tput sgr0)\]\[\033[38;5;4m\][\[$(tput bold)\]\[\033[38;5;63m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;4m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;8m\]\$?\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\e[037m\]\[$(tput bold)\]"


#PS1='\[\e[0;32m\]\u@\[\e[0;36m\]\h\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#export PS1="\[\e[00;32m\]\!\[\e[0m\]\[\e[00;37m\]^\[\e[0m\]\[\e[00;32m\]\t\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;32m\]\u@\h\[\e[0m\]\[\e[00;37m\]\n\[\e[0m\]\[\e[00;32m\]\w\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;36m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
#PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# The ps2 prompt if ever neded 
export PS2="\n\e[38;5;214m>\e[1;037m"
# Edditor
export EDITOR="vim"
#export PYTHONPATH='/usr/local/lib/python2.7/site-packages/:/usr/lib/python3.4/site-packages/'

#256 bit color suport..
export TERM=xterm-256color

#Stop ctl - s in gnome terminal 
stty stop undef
