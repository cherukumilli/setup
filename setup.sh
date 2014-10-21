#!/bin/bash
# Simple setup.sh for configuring Ubuntu 14.04 LTS development environment
# for headless setup.

echo "The script will install or update(if needed) the following:"
echo "1. Oracle JDK 6 and 7 because OpenJDK has intermittent performance issues"
echo "2. git"
echo "3. curl"
echo "4. nvm"
echo "5. npm"
echo "6. screen"
echo "7. jshint"
echo "8. rlwrap"
echo "9. emacs and its addons"
echo "10. Heroku toolbelt"
echo "11. Standard config files"
echo "12. Install the Brackets editor for HTML5 app development"
read -p "Press [Enter] key to continue or [Cancel] to quit"

echo "*****************************************************************"
echo "Install Oracle JDK 6 and 7 because OpenJDK has intermittent performance issues"
echo "*****************************************************************"
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java6-installer # install oracle jdk 6
sudo apt-get install oracle-java7-installer # install oracle jdk 7

echo "*****************************************************************"
echo "Install git"
echo "*****************************************************************"
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git

echo "*****************************************************************"
echo "Install curl"
echo "*****************************************************************"
sudo apt-get install -y curl

echo "*****************************************************************"
echo "Install nvm: node-version manager"
echo "https://github.com/creationix/nvm"
echo "*****************************************************************"
curl https://raw.githubusercontent.com/creationix/nvm/v0.10.0/install.sh | bash
#curl https://raw.github.com/creationix/nvm/master/install.sh | sh

echo "*****************************************************************"
echo "Load nvm and install latest production node"
echo "*****************************************************************"
source $HOME/.nvm/nvm.sh
nvm install v0.10
nvm use v0.10

echo "*****************************************************************"
echo "install npm"
echo "*****************************************************************"
sudo apt-get install npm

echo "*****************************************************************"
echo "install screen"
echo "*****************************************************************"
sudo apt-get install screen

echo "*****************************************************************"
echo "Install jshint to allow checking of JS code within emacs"
echo "http://jshint.com/"
echo "*****************************************************************"
npm install -g jshint

echo "*****************************************************************"
echo "Install rlwrap to provide libreadline features with node"
echo "See: http://nodejs.org/api/repl.html#repl_repl"
echo "*****************************************************************"
sudo apt-get install -y rlwrap

echo "*****************************************************************"
echo "Install emacs24"
echo "https://launchpad.net/~cassou/+archive/emacs"
echo "*****************************************************************"
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

echo "*****************************************************************"
echo "Install Heroku toolbelt"
echo "https://toolbelt.heroku.com/debian"
echo "*****************************************************************"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo "*****************************************************************"
echo "git pull and install dotfiles as well"
echo "*****************************************************************"
cd $HOME
if [ -d ./dotfiles.old/ ]; then
    rm -rf dotfiles.old
fi
if [ -d .emacs.d~/ ]; then
    rm -rf .emacs.d~
fi
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/cherukumilli/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

echo "*****************************************************************"
echo "Please select the latest oracle java version from the list below (openjdk has problems)"
echo "*****************************************************************"
read -p "Press [Enter] key to continue"
sudo update-alternatives --config java
sudo update-alternatives --config javac

echo "*****************************************************************"
echo "Install Brackets IDE for HTML5 app development. (brackets.io)"
echo "*****************************************************************"
cd $HOME/Downloads
wget https://github.com/adobe/brackets/releases/download/release-0.41/Brackets.Release.0.41.64-bit.deb
sudo dpkg -i Brackets.Release.0.41.64-bit.deb
