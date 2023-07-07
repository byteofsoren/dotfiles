#!/bin/bash


# linkconf creates symlinks in the .vim/after directory.
# $ linkconf sourec installdir
#
# sourcedir: 		Is the local diretory in the repo that the symlink is targeting.
# installdir: 	Is the directory in .vim/after/target directory
# 				wher the symlinks are created and later used by vim.
function linkconf() {
	sourcedir="$1"
	installdir="$2"
    echo "start link configuration $sourcedir $installdir"
	installtarget=$HOME/.vim/after/$installdir
	mkdir -p "$installtarget"
    find "$sourcedir" -type f | while read -r filepath; do
        filename=$(basename "$filepath")
		fpsource=$(pwd)/bytevim/$filename
		fptarget=$installtarget/$filename
        echo "$fptarget -----"
		if [[ ! -L $fptarget ]] && [[ ! -e $fptarget ]]; then
			echo "ln -s $fpsource $fptarget done"
            if [[ -f "$fpsource" ]]; then
			    ln -s "$fpsource" "$fptarget"
            else
                echo "Error the file $fpsource did not exists"
            fi
		else
			echo "Skip $filename"
		fi
	done

}

# Copy the key file to the plugin directory.
# This is done in order to not have the private keys
# end up in the public repo.
function copykeysfile(){
	fpafter="$HOME/.vim/after/plugin"
	mkdir -p "$fpafter"
    if [[ -e "$fpafter/keys.vim" ]]; then
        echo "Key file existed, Do not overwrite."
    else
        cp keys.vim "$fpafter/."
        echo "Please edit the $fpafter/keys.vim file"
    fi
}

# cleanconf unlinks the symlinks in the target diretory
# and if needed removes the directory where it was stored.
# $ cleanconf ftranget [removedir]
#
# target:  		The target diretory in .vim/after/target to unlink targets.
# removedir: 	if sett to 1 the .vim/after/removedir is also removed.
function cleanconf() {
	ftarget="$HOME/.vim/after/$1"
	removedir="$2"
    find "$ftarget" -type l | while read -r fp; do
        echo "Unlinking $fp"
		unlink "$fp"
		if [[ ! -e $fp ]]; then
			echo "Cleaning $fp DONE"
		else
			echo "Cleaning $fp FAIL"
		fi
	done
    if [[ "$removedir" -eq 1 ]]; then
        rm -r "$ftarget"
    fi
}

# Function to create the symlink between the vimrc and $HOME/.vimrc file
# Arguments
#   None
# Returns
#   0 Fail
#   1 OK
function install_vimrc() {
    # CHeck if vim rc is aleady existing.
	if [[ -L "$HOME/.vimrc" ]] ; then
        symlink_target=$(readlink -f "$HOME/.vimrc")                # Target of the .vimrc link
        script_dir=$(dirname "$(readlink -f "$0")")                 # Contains the current directory
        expected_target="$script_dir/$(basename "$symlink_target")" # Contains the path and file name in the current dir
        if [[ "$symlink_target" == "$expected_target" ]]; then
            echo "The .vimrc symlink is already created and points to this repo. Do nothing"
        else
            echo "The symlink $HOME/.vimrc existed."
            if confirm "Remove the faulty .vimrc symlink?"; then
                unlink "$HOME/.vimrc"
            else
                echo "Did not remove the symlink. Aborting the installation"
                return 0
            fi
        fi
    elif [[ -e "$HOME/.vimrc" ]]; then
        echo "There is already $HOME/.vimrc file."
        if confirm "Delete the $HOME/.vimrc file"; then
            echo "Deleting the $HOME/.vimrc file"
            rm -rf "$HOME/.vimrc"
        else
            echo "Did not delete the $HOME/.vimrc file. Aborting the installer"
            return 0
        fi
    fi


    # New symlink for .vimrc
    echo "Creating new symlink between $(pwd)/vimrc and $HOME/.vimrc"
    ln -s "$(pwd)/vimrc" "$HOME/.vimrc"
    echo "Done creating new symlink"
    return 1
}

# Function to install the skeleton template files
# Arguments:
#   None
# Returns:
#   0 Fail
#   1 OK
function install_skeletons() {
    echo "Starting to install the skeleton templates."
    target_dir="$HOME/.vim/skeletons"
    if [[ -L "$target_dir" ]]; then
        symlink_target=$(readlink -f "$target_dir")
        expected_target="$(pwd)/skeletons"
        if [[ "$target_dir" == "$expected_target" ]]; then
            echo "The $target_dir was a symlink and linked to the current repo. Do nothing"
        else
            echo "The $target_dir was a symlink but do not target the current repo."
            if confirm "Delete the old symlink"; then
                unlink "$target_dir"
            else
                echo "Did not remove the $target_dir symlink. Aborting the installer"
                return 0
            fi
        fi
    elif [[ -d "$target_dir" ]]; then
        echo "The $target_dir was a directory"
        if confirm "Delete the $target_dir directory before creating the links"; then
            rm -rf "$target_dir"
            echo "Removed the target. Done"
        else
            echo "Did not remove the $target_dir. Aborting"
            return 0
        fi

    fi

    echo "Creating the symlink $(pwd)/skeletons to $target_dir"
    if [[ -d "$(pwd)/skeletons" ]]; then
        ln -s "$(pwd)/skeletons" "$target_dir"
        echo "Done"
    else
        echo "The $(pwd)/skeletons directory did not exists. Abort"
        return 0
    fi
    return 1
}

function install() {
	# linkconf [local source dir] [taregt dir]
    # Makes symbolic links from files and dirs inside source.
    # ex. ~/.vim/ftplugin -> $repos/dotfiles/vimrc/ftplugin
    echo "Starts installation"
	linkconf ftplugin ftplugin
	linkconf bytevim  plugin
    copykeysfile

    # Create symbolik link to the $HOME/.vimrc
    install_vimrc
    install_skeletons

    # VimWiki settings.
	if [[ ! -L "$HOME/.vim/plugin/vimwiki_settings/vimwikiconf.vim" ]] && [[ ! -e "$HOME/.vim/plugin/vimwiki_settings/vimwikiconf.vim" ]]; then
		mkdir -p "$HOME/.vim/plugin/vimwiki_settings"
		ln -s "$(pwd)/vimwikiconf.vim" "$HOME/.vim/plugin/vimwiki_settings/vimwikiconf.vim"
	fi

    # Symlink for Skeletons.


    echo "Done with installation"

}

# Confirm function.
# This function asks the user to select ether yes/no in a prompt.
# Arguments:
#   $1 Prompt text
#
# How to use:
#   if confirm "Do you wish to delete this file"; then
#     rm file
#   fi
confirm() {
    while true; do
        read -r -p "$1 Y/n: " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes (Y/y) or no (N/n).";;
        esac
    done
}
function clean() {
	# cleanconf [target dir] [delete dir yes=1, no=0]
	cleanconf ftplugin  1
	cleanconf plugin 1
    if confirm "Do you want to unlink the vimrc?"; then
        unlink "$HOME/.vimrc"
        unlink "$HOME/.vim/plugin/vimwiki_settings/vimwikiconf.vim"
    fi
    if confirm "Do you want DELETE the plugged folder? "; then
        sudo rm -rf "$HOME/.vim/plugged"
        rm -rf "$HOME/.vim/autoload"
    fi
}

__ScriptVersion="1.5"

#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function usage ()
{
	echo "Usage :  $0 [options] [--]

    Options:
    -h|help       Display this message
    -v|version    Display script version
	-i|install    Installs the pacages
	-c|clean   	  Clean or remove the plugins
	-t|target     Set target Default $target
	"

}    # ----------  end of function usage  ----------

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hvict:" opt
do
	case $opt in

		h )  usage; exit 0   	;;
		c )  clean; exit 0   	;;
		i )  install; 			;;
		t )  target=${OPTARG}   ;;
		v )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;
		* )  echo -e "\n  Option does not exist : $OPTARG\n"
		     usage
             exit 1   ;;

	esac    # --- end of case ---
done
# shift $(($OPTIND-1))
