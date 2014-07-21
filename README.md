setup.git
=========
Clone and run this on Ubuntu to configure both the machine and your individual development environment

The script does the following:
The script will install the following:"
1. Oracle JDK 6 and 7 because OpenJDK has intermittent performance issues
2. git
3. curl
4. nvm
5. npm
6. screen
7. jshint
8. rlwrap
9. emacs and its addons
10. Heroku toolbelt
11. Standard config files
12. Install the Atom editor for HTML5 app development

```sh
cd $HOME
sudo apt-get install -y git-core
git clone https://github.com/cherukumilli/setup.git
./setup/setup.sh
```
