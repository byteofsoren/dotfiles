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

function install() {
	# linkconf [local source dir] [taregt dir]
    # Makes symbolic links from files and dirs inside source.
    # ex. ~/.vim/ftplugin -> $repos/dotfiles/vimrc/ftplugin
    echo "Starts installation"
	linkconf ftplugin ftplugin
	linkconf bytevim  plugin
    copykeysfile
    # CHeck if vim rc is aleady existing.
	if [[ -L "$HOME/.vimrc" ]]; then
        echo "The ~/.vimrc was a symbolic link delete if you want to install a new version with \$ unlink ~/.vimrc"
    elif [[ -e "$HOME/.vimrc" ]]; then
        echo "The ~/.vimrc was a file delete if you want to install a new version with \$ rm ~/.vimrc"
    else
        echo "Creating symlink for $HOME/.vimrc"
        ln -s "$(pwd)/vimrc" "$HOME/.vimrc"
        echo "Done.."
	fi
	if [[ ! -L "$HOME/.vim/plugin/vimwiki_settings/vimwikiconf.vim" ]] && [[ ! -e "$HOME/.vim/plugin/vimwiki_settings/vimwikiconf.vim" ]]; then
		mkdir -p "$HOME/.vim/plugin/vimwiki_settings"
		ln -s "$(pwd)/vimwikiconf.vim" "$HOME/.vim/plugin/vimwiki_settings/vimwikiconf.vim"
	fi
    echo "Done with installation"

}

# Confirm function.
# This function asks the user to select ether yes/no in a prompt.
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
