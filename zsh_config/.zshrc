################# DO NOT MODIFY THIS FILE #######################
####### PLACE YOUR CONFIGS IN ~/.config/ezsh/zshrc FOLDER #######
#################################################################

# This file is created by ezsh setup.
# Place all your .zshrc configurations / overrides in a single or multiple files under ~/.config/ezsh/zshrc/ folder
# Your original .zshrc is backed up at ~/.zshrc-backup-%y-%m-%d


# Load ezsh configurations
source "$HOME/.config/ezsh/ezshrc.zsh"

# Any zshrc configurations under the folder ~/.config/ezsh/zshrc/ will override the default ezsh configs.
# Place all of your personal configurations over there
ZSH_CONFIGS_DIR="$HOME/.config/ezsh/zshrc"

if [ "$(ls -A $ZSH_CONFIGS_DIR)" ]; then
    for file in "$ZSH_CONFIGS_DIR"/*; do
        source "$file"
    done
fi

# Now source oh-my-zsh.sh so that any plugins added in ~/.config/ezsh/zshrc/* files also get loaded
source $ZSH/oh-my-zsh.sh


# Configs that can only work after "source $ZSH/oh-my-zsh.sh", such as Aliases that depend oh-my-zsh plugins

# Now source fzf.zsh , otherwise Ctr+r is overwritten by ohmyzsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# Define ANSI color codes with C_ prefix

# This is for the espressif platform to auto load each time conditions apply.
ZSH_PRIVATE_SCRIPTS_DIR="$HOME/repos/scripts/zsh"
ESPRESSIF_EXPORT_SCRIPT="$HOME/esp/esp-idf/export.sh"
# Both the scirpt files and the espressif platform needs to be installd to work.
if [[ -d "$ZSH_PRIVATE_SCRIPTS_DIR" ]]; then
    # Source Colors and Fags.
    source "$ZSH_PRIVATE_SCRIPTS_DIR/zsh_colors_flags.zsh"
    if [[ -f $ESPRESSIF_EXPORT_SCRIPT  ]]; then
    # Source the idf functions.
        source "$ZSH_PRIVATE_SCRIPTS_DIR/load_idf.zsh"
    fi
fi
# DONE
#
alias setwp="feh --bg-fill $HOME/.config/current_wallpaper.jpg"

alias k="k -htr"       # show human readable file sizes, in kb, mb etc
# alias update_idf='CURRDIR=$(pwd); cd $HOME/esp/esp-idf; git pull; git submodule update --init --recursive  ; cd $CURRDIR'

# Strarts the esp development kit

vimcad() {
    local filename="$1"
    openscad $filename &
    local openscad_pid=$!
    vim $filename
    kill $openscad_pid
}

CPATH="$CPATH:/usr/include/opencv4"

# Add the sendto0x0 function to send piped output to the 0x0 server.
source "$HOME/repos/scripts/zsh/sendto0x0.zsh"

