#!/bin/bash
#       instalar docker**

echo " ____  _____  ___  _  _  ____  ____   "
echo "(  _ \\(  _  )/ __)( )/ )( ___)(  _ \\"
echo " )(_) ))(_)(( (__  )  (  )__)  )   /  "
echo "(____/(_____)\___)(_)\_)(____)(_)\_)  "
echo ""
echo ""

sudo apt-get update -y &&\
sudo apt-get install -y \
    apt-transport-https -y \
    ca-certificates -y \
    curl -y\
    gnupg -y\
    lsb-release -y &&\
sudo apt-get install docker.io -y
    
#       Instalar java**     

echo "                                                          "
echo "                                                          "
echo "         ____        ____    ____      ____        ____   "
echo "        |    |  ____|\   \  |    |    |    |  ____|\   \  "
echo "        |    | /    /\    \ |    |    |    | /    /\    \ "
echo "        |    ||    |  |    ||    |    |    ||    |  |    |"
echo "  ____  |    ||    |__|    ||    |    |    ||    |__|    |"
echo " |    | |    ||    .--.    ||    |    |    ||    .--.    |"
echo " |    | |    ||    |  |    ||\    \  /    /||    |  |    |"
echo " |\____\|____||____|  |____|| \ ___\/___ / ||____|  |____|"
echo " | |    |    ||    |  |    | \ |   ||   | / |    |  |    |"
echo "  \|____|____||____|  |____|  \|___||___|/  |____|  |____|"
echo "     \(   )/    \(      )/      \(    )/      \(      )/  "
echo "      '   '      '      '        '    '        '      '   "
echo "  "
echo "  "

sudo apt update &&\
sudo apt install openjdk-11-jdk -y

#       Instalar jenkins**

echo " "
echo "   _                _      _              "
echo "  (_)              | |    (_)             "
echo "   _   ____  ____  | |  _  _  ____    ___ "
echo "  | | / _  )|  _ \ | | / )| ||  _ \  /___)"
echo "  | |( (/ / | | | || |< ( | || | | ||___ |"
echo " _| | \____)|_| |_||_| \_)|_||_| |_|(___/ "
echo "(__/                                      "
echo " "
echo " "
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > \
    /etc/apt/sources.list.d/jenkins.list' &&\
sudo apt-get update -y &&\
sudo apt-get install jenkins -y &&\
sudo systemctl daemon-reload &&\
sudo systemctl start jenkins &&\
sudo systemctl status jenkins

#       Jenkins should be running on localhost:8080


echo "      ___                           "
echo "     /  /\       ___          ___   "
echo "    /  /:/_     /  /\        /  /\  "
echo "   /  /:/ /\   /  /:/       /  /:/  "
echo "  /  /:/_/::\ /__/::\      /  /:/   "
echo " /__/:/__\/\:\\\__\/\:\__  /  /::\   "
echo " \  \:\ /~~/:/   \  \:\/\/__/:/\:\  "
echo "  \  \:\  /:/     \__\::/\__\/  \:\ "
echo "   \  \:\/:/      /__/:/      \  \:."
echo "    \  \::/       \__\/        \__\/"
echo "     \__\/                          "
echo "                                    "

sudo apt update &&\
sudo apt install git -y &&\
git --version

