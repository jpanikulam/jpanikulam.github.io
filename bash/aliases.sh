export PATH=~/install/linux-`uname -r | sed 's/-.*//'`/tools/perf:$PATH

# Folder Navigation
alias b='cd ..';
alias bb='b;b';
alias bbb='bb;b';
alias bbbb='bb;bb';
alias bbbbb='bbbb; b';
alias bbbbbb='bbbb; bb';
alias back='cd $OLDPWD';
alias ll='ls -AlF --group-directories-first';

# Location Aliases
alias exp='cd ~/repos/experiments/;'

# Silly
alias balias='subl ~/repos/bash/aliases.sh';
alias src='echo "Sourcing from ~/.bashrc"; . ~/.bashrc';
alias o='xdg-open'
alias pgit='cat ~/repos/PAT_GIT | c'
alias mount_jet="sshfs -o idmap=user jacob@jet:/home/jacob/repos/hover-jet ~/repos/mnt-odroid/;"
alias jetdocker="docker run -ti -v /home/jacob/repos:/jet -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY hoverjet/jet bash;"


alias success_sound='paplay /usr/share/sounds/ubuntu/stereo/message.ogg;'
makel() {
        make $@
        SX=$?

        if [ $SX ]; then
            date
            # success_sound
        fi
        echo $SX
}
# alias make='makel';

#alias pdf='mupdf';
alias chrome='google-chrome-stable &'

xrun() {
    exp
    cd bin/;
    cmake ..
    make $1 && ./run/$1;
}

# Xclip
alias c='xclip -selection clipboard'
alias v='xclip -o -selection clipboard'
alias pgit='cat ~/repos/PAT_GIT|c'
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
     find $1 \( -iname "*.py" -o -iname "*.cc" -o -iname "*.cpp" -o -iname "*.m" -o -iname "*.h" -o -iname "*.hh" -o -iname "*.hpp" \) | xargs wc -l
}

rp () {
    sed -i "s/$1/$2/g" $3;
}

firp() {
    # Find and replace
    find . -type f -exec sed -i "s@$1@$2@g" {} \;
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


bootwin() {
    WINDOWS_ENTRY=`grep menuentry /boot/grub/grub.cfg  | grep --line-number Windows`
    MENU_NUMBER=$(( `echo $WINDOWS_ENTRY | sed -e "s/:.*//"` - 1 ))
    sudo grub-reboot $MENU_NUMBER
    sudo reboot

}

export CUDA_HOME=/usr/local/cuda-9.0
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64

PATH=${CUDA_HOME}/bin:${PATH}
export PATH

# convert -delay 5 -loop 0 *.png myimage.gif
# ffmpeg -i ../gjk.mp4  -r 1 'frame-%03d.png'



# Phrases other people have said that should be incorporated more readily into normal speaking
#
# - Paul on the road to Damascus
# - Between Scylla and Charybdis
# - Jesus wept, because there were no more worlds to conquer
# - Scott for scientific method, Amundsen for speed and efficiency but when disaster strikes and all hope is gone, get down on your knees and pray to Shackleton
# - Nobless oblige
# - Bunburying (From the Importance of Being Earnest)
# - Eureka
# - When I lose, I don't look for consolation in the score
# - Be like Nelson at Trafalgar
# - "Burn the ships", "Alea Iacta Est", "The Die is Cast"
#
# To Watch/Read:
# - The Importance of Being Earnest (I think I read it in high school?)
# - Murderball (Rhett)
# - Who Killed Captain Alex (Rhett: Some kind of Ugandan bootleg homemade action movie?)
#
#
# Nostalgia:
# - Medal of Honor
#
#
# To Play:
# RHCP: Snow
# BOC: Don't Fear the Reaper
#
#
#
# ctrl+u
# alt-
#
# regexes:
# self._properties\[(.*)\]\['type'\]
# self._type(\1)