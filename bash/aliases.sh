# Folder Navigation
alias b='cd ..';
alias bb='b;b';
alias bbb='bb;b';
alias bbbb='bb;bb';
alias bbbbb='bbbb; b';
alias bbbbbb='bbbb; bb';
alias back='cd $OLDPWD';
alias ll='ls -AlF';

# Location Aliases
alias ieee='cd ~/repos/ieee_ws/src/IEEE2015';
alias visar='cd ~/repos/visar/computer/src/python/libVisar';
alias rift='cd ~/repos/rift';
alias ippd='cd ~/repos/visar';
alias cop='cd ~/repos/cop3503/cop3503project';
alias oqulus='cd ~/repos/oqulus';
alias personal='cd ~/repos/personal/';
alias prop='cd ~/repos/mil_ws/src/uf-mil/PropaGator';
alias sub='cd ~/repos/rosboat_ws/src/Sub8';
alias sub8l='sub; subl ..; roscore &'
alias cap='cd ~/repos/CAP6515';
alias books='cd ~/repos/books';
alias exp='cd ~/repos/experiments/perception/data/';

# Silly
alias balias='vim ~/repos/bash_stuff/bash_aliases.sh';
alias src='echo "Sourcing from ~/.bashrc"; . ~/.bashrc';
alias o='gnome-open'
alias subm='rosrun sub8_missions tx_mission'


alias success_sound='paplay /usr/share/sounds/ubuntu/stereo/message.ogg;'
#alias make='make; date; success_sound'
makel() {
        make $@
        date
        success_sound
}
alias make='makel';

# Applications
# alias matlab='~/repos/Matlab_Code/matlab &';
alias matlab='/usr/local/MATLAB/R2014b/bin/matlab &';
#alias pdf='mupdf';
alias chrome='google-chrome-stable &'

# Network
alias netstart='sudo service network-manager restart';
alias netkill='sudo killall -STOP NetworkManager';

# Catkin
alias makeieee='catkin_make -C ~/repos/ieee_ws/';
alias makemil='catkin_make -C ~/repos/mil_ws';
#alias makerb='catkin_make -C ~/repos/rosboat_ws';

makerb() {
    catkin_make -C ~/repos/rosboat_ws "$@";
    success_sound
}


# MIL
alias rosprop='export ROS_MASTER_URI=http://propagator:11311';

# Xclip
alias c='xclip -selection clipboard'
alias v='xclip -o -selection clipboard'
# Run whatever command is in the clipboard
rv() {
    v
    `v`
}

pdf() {
    if [ $# -eq 0 ]; then
        echo "No arguments provided";
    else
        mupdf "$@" &
    fi
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
            if [ "$lines" -le "30" ]; then
                ls;
            else
                echo "$lines files/folders in $PWD"
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
hml() {
     # How much time have I wasted (How many lines of code have I written)
     find $1 \( -iname "*.py" -o -iname "*.cc" -o -iname "*.cpp" -o -iname "*.m" -o -iname "*.h" -o -iname "*.hpp" \) | xargs wc -l
}

rp () {
    sed -i "s/$1/$2/g" $3;
}

firp() {
    # Find and replace
    find . -type f -exec sed -i "s/$1/$2/g" {} \;
}

alias cd='cl';

# gnome-open -> Open file with default
# eog -> Open image
# guvcview -> GUVC View!



# Tricks:
# - kazam (screen cap)
togif() {
    avconv -i $1 -r $2 output%05d.png
    convert output*.png $3
    rm output*.png
}

cpwd() {
    if [ $# -eq 0 ]; then
        echo $PWD | c
    else
        FOO="$(echo -e "$PWD/$1" | sed -e 's/[[:space:]]*$//')"
        echo "$FOO" | c
        #echo "$PWD/$1" | c
    fi
}

py() {
    if [ $# -eq 0 ]; then
        ipython
    else
        python $@
    fi
}

yt() {
    py /home/jacob/repos/youtube_playlist_manager/youtube.py all --diff --update
}
