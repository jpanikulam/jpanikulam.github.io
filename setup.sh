sudo apt-get install git
sudo apt-get install terminator
sudo apt-get install compiz-config-settings-manager
sudo apt-get install compizconfig-settings-manager  compiz-plugins-default compiz-plugins-extra compiz-plugins-main
sudo apt-get install cmake

#
# Gtest
#
sudo apt-get install libgtest-dev
cd /usr/src/gtest
sudo cmake CMakeLists.txt
sudo make
sudo cp *.a /usr/lib


#
# Libs
#
sudo apt-get install libopencv-dev python-opencv
sudo apt-get install libxmu-dev libxi-dev
sudo apt-get install eigen3-dev  # Probably you (Jake) will have to download eigen3 manually if 3.4 hasn't been added to launchpad


#
# Tools
#
sudo apt-get install python-pip ipython


#
# Viewer
#
sudo apt-get install xorg-dev libglu1-mesa-dev
sudo apt-get install libglfw3 libglfw3-dev libglew-dev
sudo apt-get install freeglut3-dev

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text


# CUDA?
# sudo apt-get install linux-headers-$(uname -r)
# sudo apt-get nvidia-375 nvidia-modprobe
# sudo apt-get install nvidia-375 nvidia-modprobe