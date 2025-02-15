#!/usr/bin/bash
# Tool Name : Termux-lock
# Author   : invisiblehackers
# Github   : https://github.com/invisiblehackers
# Email    : invisiblehackersofficial@gmail.com
# Version  : 2.0

clear
echo -e "\033[32m\033[1m{────────────────────────────────────────────────}"
echo -e "\033[35m\033[1m Installing Packages... Please Wait..."
clear

# Package installation
pkg update
pkg upgrade -y
pkg install python3 -y
pkg install cmatrix -y

echo -e "\033[32m\033[1m]──────────────────────────────────────────────["
echo -e "\033[32m\033[1m        INSTALLATION COMPLETED \033[32m[\033[36m✓\033[32m]"
echo -e "\033[32m\033[1m]──────────────────────────────────────────────["

# Request storage permissions
termux-setup-storage

# Check if Termux-lock && version exists
if [ ! -d "$HOME/Termux-lock" ]; then
    echo "Error: Directory 'Termux-lock' not found in home!"
    exit 1
fi

if [ ! -f "$HOME/Termux-lock/.img/version.txt" ] || ! grep -q "2.0" "$HOME/Termux-lock/.img/version.txt"; then
    echo -e "\e[1;31mError: Version 2.0 not found! Exiting...\e[0m"
    exit 1
fi
cd "$HOME/Termux-lock"

# Copy login script
if [ -f "login.sh" ]; then
    cp login.sh $PREFIX/etc
else
    echo "Error: login.sh not found!"
    exit 1
fi

# Set permissions
for file in login.sh backup.sh; do
    if [ -f "$file" ]; then
        chmod 755 "$file"
    else
        echo "Warning: $file not found!"
    fi
done

# Run banner script
banner() {
clear

echo -e '\e[1;32m 
                     ┬  ┌─┐┌─┐┌┬┐┬┌┐┌┌─┐
                     │  │ │├─┤ │││││││ ┬
                     ┴─┘└─┘┴ ┴─┴┘┴┘└┘└─┘
\e[0m'

sleep 0.1

for i in {1..100}; do
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

    # Loading Bar with flashing "INVISIBLE" text
    if (( i % 2 == 0 )); then
        echo -e "\e[1;32m█████████████████████ \e[1;31mINVISIBLE\e[1;32m █████████████████████\e[0m $i%"
    else
        echo -e "\e[1;32m█████████████████████ \e[1;33mINVISIBLE\e[1;32m █████████████████████\e[0m $i%"
    fi

    sleep 0.03
done

clear
echo -e "\033[32m\033[1m
       
               ╔═╗┬┌─┐┌┐┌  ╦ ╦┌─┐  
              \033[33m ╚═╗││ ┬│││  ║ ║├─┘ \033[32m 
               ╚═╝┴└─┘┘└┘  ╚═╝┴    
\033[33m________________________________________________________
  \033[31m☠️ Warning: \033[37mDon't Forgot Your \033[35mPassword
\033[33m________________________________________________________

\033[1m\033[36mTool Name    \033[32m: \033[33mTermux-lock
\033[1m\033[36mAuthor Name  \033[32m: \033[33minvisiblehackers
\033[1m\033[36mGithub       \033[32m: \033[33mhttps://github.com/invisiblehackers
\033[1m\033[36mVersion      \033[32m: \033[33m2.0
\033[1m\033[36mCountry      \033[32m: \033[33mIndia
\033[31m________________________________________________________
"

}
banner 

# Set password
echo
read -p $'\e[1;32m  Enter \033[33mPassword \033[37mfor \033[32mLogin:\e[0m ' password 
echo "$password" > "$HOME/.termux_lock_password"
echo

# Modify bash.bashrc
cd $PREFIX/etc

# Delete files
# Define file paths
BASHRC_PATH="/data/data/com.termux/files/usr/etc/bash.bashrc"
MOTD_PATH="/data/data/com.termux/files/usr/etc/motd"

# Check and delete files silently
[ -f "$BASHRC_PATH" ] && rm -f "$BASHRC_PATH"
[ -f "$MOTD_PATH" ] && rm -f "$MOTD_PATH"

# Backup original files
# [ -f "bash.bashrc" ] && cp bash.bashrc bash.bashrc.backup
# [ -f "motd" ] && cp motd motd.backup

# Replace bash.bashrc
cat <<'LOGIN' > bash.bashrc
trap '' 2                                          
echo -e "\e[1;32m      
██████╗  █████╗ ██████╗ ██╗  ██╗
██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝   ┌─────┐
██║  ██║███████║██████╔╝█████╔╝    | WEB |
██║  ██║██╔══██║██╔══██╗██╔═██╗    └─────┘
██████╔╝██║  ██║██║  ██║██║  ██╗   ┌─────┐
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   | 2.0 |
                                   └─────┘
\033[31m           ────────────────────────────
\033[33m               Login To \033[32mContinue
\033[31m           ────────────────────────────
\e[0m"
echo
read -p $'       \e[32m\033[1m\033[33m[\033[31m+\033[33m] \033[37mINPUT \033[33mPASSWORD FOR LOGIN:\033[33m ' pass                                                
stored_password=$(cat "$HOME/.termux_lock_password")
if [[ "$pass" == "$stored_password" ]]; then
    clear
    cd $HOME 
    echo -e "\033[1m\033[32m

    ██████╗  █████╗ ██████╗ ██╗  ██╗
    ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝   ┌─────┐
    ██║  ██║███████║██████╔╝█████╔╝    | WEB |
    ██║  ██║██╔══██║██╔══██╗██╔═██╗    └─────┘
    ██████╔╝██║  ██║██║  ██║██║  ██╗   ┌─────┐
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   | 2.0 |  
                                       └─────┘
"
    echo -e  "  \e[1m\e[32m▂▃▄▅▆▇▓▒░ \033[1mCoded By \e[31minvisiblehackers \e[1m\e[32m░▒▓▇▆▅▄▃▂"
cd $HOME
echo -e " \033[1m\033[33m]\033[31m─────────────────────────────────────────────\033[33m["
echo 
PS1="\e[35m┌──(\e[32minvisible\e[33m@\e[36mTermux\e[35m)-[\e[33m\d\e[35m]-[\e[33m\t\e[35m]
\e[35m│
\e[35m├─[\e[33m\w\e[35m]
└─[$] "
    
    export PS1  # Ensure PS1 is applied

else
    echo ""
    echo -e "\e[1;31m  You Entered wrong Details! \e[0m"
    sleep 1
    cmatrix -L
fi
LOGIN

echo -e "\033[1m\e[1;32m Your Termux is \033[33mReady. Please \033[31mExit \033[37mand \033[32mLogin.\e[0m"
echo
echo