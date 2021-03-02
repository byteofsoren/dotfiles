#!/bin/bash

target=$HOME/.vim/after/plugin
# target=$HOME/.vim/myset

function install() {
	mkdir -p $target

	for f in $(ls bytevim/*.vim) ; do
		fsource=$(pwd)/$f
		ftarget=$(echo $target$f | sed 's/bytevim//g')
		if [[ ! -L $ftarget ]] && [[ ! -e $ftarget ]]; then
			echo "$fsource"
			echo "$ftarget"
			ln -s $fsource $ftarget
		else
			echo "$f exists"
		fi
	done
	if [[ ! -L $HOME/.vimrc ]] && [[ ! -e $HOME/.vimrc ]]; then
		ln -s vimrc $HOME/.vimrc
		echo "installing vimrc."
	else
		echo "Vimrc OK"
	fi
}
function clean() {
	if [[ $(ls $target | wc -l ) > 0 ]]; then
		for f  in $(ls $target); do
			sh=$target/$f
			if [[ -L $sh ]]; then
				echo "unlink $sh"
				unlink $sh
			fi
		done
	else
		echo "Nothing to clean"
	fi
}

__ScriptVersion="1"

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

		h|help     )  usage; exit 0   	;;
		c|clean    )  clean; exit 0   	;;
		i|install  )  install; 			;;
		t|target   )  target=${OPTARG}; ;;

		v|version  )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

		* )  echo -e "\n  Option does not exist : $OPTARG\n"
		  usage; exit 1   ;;

	esac    # --- end of case ---
done
shift $(($OPTIND-1))
