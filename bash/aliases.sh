# Navigation
alias b='cd ..';
alias bb='b; b;';
alias bbb='bb; b;';
alias bbbb='bb; bb;';
alias bbbbb='bbbbb; b;';
alias back='cd $OLDPWD';

# Locations
alias apc='cd ~/repos/apc/src/apc_ros'

rosc() {
	export ROS_MASTER_URI=http://patlabor:11311;
	export ROS_IP=`hostname -I | cut -f1 -d" "`;
}

# Silly
alias balias='vim ~/repos/bash/aliases.sh';
## KEEP!
alias success_sound='paplay /usr/share/sounds/ubuntu/stereo/message.ogg;'
#alias make='make; date; success_sound'
makel() {
	make $@
	date
	success_sound
}
alias make='makel';

# alias makeapc='catkin_make -C ~/repos/apc; date; success_sound';

makeapc() {
	catkin_make -C ~/repos/apc "$@"
	date
	success_sound
}

cm() {
	catkin_make "$@";
	date;
	success_sound
}

alias catkin_make='cm';

hml() {
	# How much time have I wasted (How many lines of code have I written)
	find $1 \( -iname "*.py" -o -iname "*.cpp" -o -iname "*.m" -o -iname "*.h" \) | xargs wc -l
}

# Xclip
alias c='xclip -selection clipboard';
alias v='xclip -o -selection clipboard';

# Run whatever command is in the clipboard
rv() {
	v
	`v`
}

# cd alias that behaves in a more Jacob-friendly way
cl() {
	if [ $# -eq 0 ]; then
		echo "No arguments provided";
	else
		builtin cd "$@";
		if [ "$PWD" != "$OLDPWD" ]; then
			if [ $named = false ]; then
				# If the tab is not already named, call it dir
				rn $(basename $(dirname $PWD))/$(basename $PWD) false
			fi
			lines=`ls | wc -w $f | cut -f1 -d' '`
			if [ "$lines" -le "4" ]; then
				ls;
			fi
		fi
	fi
}
# Rename the current tab
# Flag for checking if something has a user-defined name
# This does not survive re-sourcing .bashrc
named=false;
rn() {
	if [ $# -eq 0 ]; then
		echo -en "\033]0;$PWD\a"
		named=false;
	else 
		echo -en "\033]0;$1\a"
		if [ $# -eq 2 ]; then
			named=false;
		else
			named=true;
		fi
	fi
}
# Todo: Make a new-tab function 'nt' to auto-create a new tab'

alias cd='cl';

# Tricks: ls -l | awk '{print $9}'
