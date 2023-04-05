#!/bin/bash


# linkconf creates symlinks in the .vim/after directory.
# $ linkconf confdir targetdir
#
# confdir: 		Is the local diretory in the repo that the symlink is targeting.
# targetdir: 	Is the directory in .vim/after/target directory
# 				wher the symlinks are created and later used by vim.
function linkconf() {
	confdir=$1
	targetdir=$2
	fpafter=$HOME/.vim/after/$targetdir
	mkdir -p "$fpafter"
	echo "$fpafter"
	for fp in $confdir; do
		fpsource=$(pwd)/$confdir/$fp
		fptarget=$fpafter/$fp
		if [[ ! -L $fptarget ]] && [[ ! -e $fptarget ]]; then
			echo "ln -s $fpsource $fptarget done"
			ln -s "$fpsource" "$fptarget"
		else
			echo "Skip $fp"
		fi


	done

}
# cleanconf unlinks the symlinks in the target diretory
# and if needed removes the directory where it was stored.
# $ cleanconf ftranget [removedir]
#
# target:  		The target diretory in .vim/after/target to unlink targets.
# removedir: 	if sett to 1 the .vim/after/removedir is also removed.
function cleanconf() {
	ftarget="$HOME/.vim/after/$1"
	# removedir="$2"
	for fp in $ftarget; do
		fptarget=$ftarget/$fp
		# echo "Cleaning $fptarget"
		unlink "$fptarget"
		if [[ ! -e $fptarget ]]; then
			echo "Cleaning $fptarget DONE"
		else
			echo "Cleaning $fptarget FAIL"
		fi
	done

}

function install() {
	# linkconf [local source dir] [taregt dir]
    # Makes symbolic links from files and dirs inside source.
    # ex. ~/.vim/ftplugin -> $repos/dotfiles/vimrc/ftplugin
	linkconf ftplugin ftplugin
	linkconf bytevim  plugin
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

}

function clean() {
	# cleanconf [target dir] [delete dir yes=1, no=0]
	cleanconf ftplugin  0
	cleanconf plugin 0
}

__ScriptVersion="1.3"

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
