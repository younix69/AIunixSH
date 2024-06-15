VAR_OS=$(cat /etc/os-release | awk /ID=debian/ | tr -d \ID=)
if [[ "$VAR_OS" == "debian" ]]; then
    COMMAND="apt install xsel curl wget zip screen -y"
    $(echo $COMMAND)
elif [[ "$VAR_OS" == "rhel" ]]; then
    COMMAND="dnf install xsel curl wget zip screen -y"
    $(echo $COMMAND)
else
   echo "NOT SUPPORTED OS" ;
fi

SELECTED=($(whiptail --title "Select Packages to Install" --checklist \
"List of packages | Develop.this GUI - unix_91@inbox.lv" 25 100 15 \
"htop" "Manager Process" ON \
"neofetch" "CLI SYS INFO" ON \
"mc" "Filemanager CLI" ON \
"ansible" "Automation Scripts" OFF \
"docker.io" "Container Virtual" OFF \
"cockpit" "WEB GUI Server" OFF \
"xrdp" "RDP Server" OFF \
"greybird-gtk-theme" "THEMES XFCE" OFF \
"traceroute" "Utils Network" ON \
"openssh-server" "SSHD Server" OFF \
"flatpak" "Special Softwares" OFF \
3>&1 1>&2 2>&3))

echo ${SELECTED[@]} | tr -d \" | xsel -i -b
VAR_OS=$(cat /etc/os-release | awk /ID=debian/ | tr -d \ID=)
if [[ "$VAR_OS" == "debian" ]]; then
    COMMAND="apt install $(xsel -o -b) -y"
    $(echo "$COMMAND")
elif [[ "$VAR_OS" == "rhel" ]]; then
    COMMAND="dnf install $(xsel -o -b) -y"
    $(echo "$COMMAND")
else
    echo "ERROR, VIEW LOG TERMINAL"
fi
