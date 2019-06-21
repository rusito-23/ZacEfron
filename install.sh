
# IMPORTANT: this file should be executed
# without cloning the repo
# it will setup the hole prank
# and then will remove all obvious trace ;)


# INSTALL

git clone https://github.com/rusito-23/ZacEfron.git $HOME/ZacEfron
cd $HOME/ZacEfron
sh zac-efron.sh

# REMOVE ALL TRACES
cd $HOME
rm -rf $HOME/ZacEfron

SB_GREEN="\033[0;32m"
SB_NOCOLOR="\033[0m"
echo "${SB_GREEN}READY BITCH${SB_NOCOLOR}"
