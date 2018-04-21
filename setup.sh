sudo apt-get install git -y
sudo apt-get install terminator -y
sudo apt-get install compiz-config-settings-manager -y
sudo apt-get install compizconfig-settings-manager  compiz-plugins-default compiz-plugins-extra compiz-plugins-main -y
sudo apt-get install cmake -y
sudo apt-get install xclip -y

#
# Gtest
#
dpkg -l | grep libgtest-dev
if [ $? -eq 1 ]; then
    sudo apt-get install libgtest-dev -y
    cd /usr/src/gtest
    sudo cmake CMakeLists.txt
    sudo make
    sudo cp *.a /usr/lib
fi


#
# Libs
#
sudo apt-get install libopencv-dev python-opencv -y
sudo apt-get install libxmu-dev libxi-dev -y
# sudo apt-get install eigen3-dev  # Probably you (Jake) will have to download eigen3 manually if 3.4 hasn't been added to launchpad -y


#
# Tools
#
sudo apt-get install python-pip ipython -y


#
# Viewer
#
sudo apt-get install xorg-dev libglu1-mesa-dev -y
sudo apt-get install libglfw3 libglfw3-dev libglew-dev -y
sudo apt-get install freeglut3-dev -y

#
# Sublime
#

dpkg -l | grep sublime-text
if [ $? -eq 1 ]; then
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https -y
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update -y
    sudo apt-get install sublime-text -y
fi


#
# Bash
#

cat ~/.bashrc | grep "ZZZIDSJIJIJIASNDNKVKNV"
if [ $? -eq 1 ]; then
    echo "
for file in ~/repos/jpanikulam.github.io/bash/*.sh
do
    source '$file'
done
alias ZZZIDSJIJIJIASNDNKVKNV='echo sand'
" >> ~/.bashrc
fi


# CUDA?
# sudo apt-get install linux-headers-$(uname -r) -y
# sudo apt-get nvidia-375 nvidia-modprobe -y
# sudo apt-get install nvidia-375 nvidia-modprobe -y