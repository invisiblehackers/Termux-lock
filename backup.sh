#!/bin/bash

# Define file paths
BASHRC_PATH="/data/data/com.termux/files/usr/etc/bash.bashrc"
MOTD_PATH="/data/data/com.termux/files/usr/etc/motd"

# Create and write content to bash.bashrc
cat > "$BASHRC_PATH" << 'EOF'
# Command history tweaks:
# - Append history instead of overwriting
#   when shell exits.
# - When using history substitution, do not
#   exec command immediately.
# - Do not save to history commands starting
#   with space.
# - Do not save duplicated commands.
shopt -s histappend
shopt -s histverify
export HISTCONTROL=ignoreboth

# Default command line prompt.
PROMPT_DIRTRIM=2
PS1='\[\e[0;32m\]\w\[\e[0m\] \[\e[0;97m\]\$\[\e[0m\] '

# Handles nonexistent commands.
# If user has entered command which invokes non-available
# utility, command-not-found will give a package suggestions.
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
        command_not_found_handle() {
                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        }
fi

[ -r /data/data/com.termux/files/usr/share/bash-completion/bash_completion ] && . /data/data/com.termux/files/usr/share/bash-completion/bash_completion
EOF

# Create and write content to motd
cat > "$MOTD_PATH" << 'EOF'
Welcome to Termux!

Docs:       https://termux.dev/docs
Donate:     https://termux.dev/donate
Community:  https://termux.dev/community

Working with packages:

 - Search:  pkg search <query>
 - Install: pkg install <package>
 - Upgrade: pkg upgrade

Subscribing to additional repositories:

 - Root:    pkg install root-repo
 - X11:     pkg install x11-repo

For fixing any repository issues,
try 'termux-change-repo' command.

Report issues at https://termux.dev/issues
EOF

clear

echo -e '\e[1;32m 
                     ┬  ┌─┐┌─┐┌┬┐┬┌┐┌┌─┐
                     │  │ │├─┤ │││││││ ┬
                     ┴─┘└─┘┴ ┴─┴┘┴┘└┘└─┘
\e[0m'

sleep 0.1

for i in {1..20}; do
    clear
    echo -e "\e[1;32m"
    echo " "
    echo " "
    echo " "
    echo " "
    echo " "
    echo " "
    echo " "
    echo " "
    echo " "
    echo " "
    echo " "
    echo " "
    echo " "

    # Loading Bar with flashing "PROCESSING" text
    if (( i % 2 == 0 )); then
        echo -e "\e[1;32m█████████████████████ \e[1;31mPROCESSING\e[1;32m █████████████████████\e[0m $i%"
    else
        echo -e "\e[1;32m█████████████████████ \e[1;33mPROCESSING\e[1;32m █████████████████████\e[0m $i%"
    fi

    sleep 0.03
done
clear
echo " "
echo " "
echo " "
echo " "
echo -e "\033[32m\033[1mYour Termux is Normal successfully!"
echo " "
echo -e "\033[32m\033[1mRestart Your Termux!"
echo " "
echo " "