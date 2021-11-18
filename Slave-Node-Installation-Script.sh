#!/bin/bash

#Remember to => adduser jenkins before running this script.
#Run this script with sudo

sudo mkdir /var/jenkins
cd /var/jenkins

sudo mkdir .ssh 
sudo touch .ssh/authorized_keys
sudo chmod 777 .ssh/authorized_keys
#Replace with master ssh key
echo " -x- " > .ssh/authorized_keys

sudo chown -R jenkins:jenkins /var/jenkins
chmod -R  777  /var/jenkins/

#       instalar docker**

echo " "
echo "  ______   _______  _______  ___   _  _______  ______   "
echo " |      | |       ||     __||   | | ||       ||    _ |  "
echo " |  _    ||   _   ||    |   |   |_| ||    ___||   | ||  "
echo " | | |   ||  | |  ||    |   |      _||   |___ |   |_||_ "
echo " | |_|   ||  |_|  ||    |   |     |_ |    ___||    __  |"
echo " |       ||       ||    |__ |    _  ||   |___ |   |  | |"
echo " |______| |_______||_______||___| |_||_______||___|  |_|"
echo " "

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

#       Jenkins should be running on localhost:8080


echo "      ___                           "
echo "     /  /\       ___          ___   "
echo "    /  /:/_     /  /\        /  /\  "
echo "   /  /:/ /\   /  /:/       /  /:/  "
echo "  /  /:/_/::\ /__/::\      /  /:/   "
echo " /__/:/__\/\:\\\__\/\:\__  /  /::\  "
echo " \  \:\ /~~/:/   \  \:\/\/__/:/\:\  "
echo "  \  \:\  /:/     \__\::/\__\/  \:\ "
echo "   \  \:\/:/      /__/:/      \  \:."
echo "    \  \::/       \__\/        \__\/"
echo "     \__\/                          "
echo "                                    "

sudo apt update &&\
sudo apt install git &&\
git --version

# add jenkins to docker group

echo ""
echo "    _            _    _                __       _            _             "
echo "   (_) ___ _ __ | | _(_)_ __  ___      \ \   __| | ___   ___| | _____ _ __ "
echo "   | |/ _ \ '_ \| |/ / | '_ \/ __| _____\ \ / _  |/ _ \ / __| |/ / _ \ '__|"
echo "   | |  __/ | | |   <| | | | \__ \ _____/ /  (_| | (_) | (__|   <  __/ |   "
echo "  _/ |\___|_| |_|_|\_\_|_| |_|___/     /_/  \__,_|\___/ \___|_|\_\___|_|   "
echo " |__/                                                                    "
echo ""
echo ""

sudo groupadd docker &&\
sudo usermod -aG docker jenkins &&\
newgrp docker 

# Install node

echo ""
echo ""
echo "             _________    ________        "
echo "___________________  /__________(_)_______"
echo "__  __ \  __ \  __  /_  _ \____  /__  ___/"
echo "_  / / / /_/ / /_/ / /  __/___  / _(__  ) "
echo "/_/ /_/\____/\__,_/  \___/___  /  /____/  "
echo "                          /___/           "
echo ""
echo ""

sudo apt install nodejs -y &&\
nodejs -v &&\

# Install npm

echo ""
echo ""
echo "  ____ ______   _____   "
echo " /    \.____ \ /     \  "
echo "|   |  \  |_> >  Y Y  \ "
echo "|___|  /   __/|__|_|  / "
echo "     \/|__|         \/  "
echo ""
echo ""

sudo apt install npm -y &&\
npm -v

# Install yarn

sudo npm install --global yarn &&\
yarn -v

# Install php

echo ""
echo "            __         "
echo "     ____  / /_  ____  " 
echo "    / __ \/ __ \/ __ \ "
echo "   / /_/ / / / / /_/ / "
echo "  / .___/_/ /_/ .___/  "
echo " /_/         /_/       "
echo ""
echo ""

sudo apt install php libapache2-mod-php -y &&\
sudo apt-get install php-curl -y
sudo apt-get install php-mbstring -y
sudo apt install php-xml -y
sudo apt-get install php7.4-zip -y
sudo apt-get install php-gd -y
sudo systemctl restart apache2          


# Install composer

echo ""
echo -E ""
echo -E "   ______                                          "
echo -E "  / ____/___  ____ ___  ____  ____  ________  _____"
echo -E ' / /   / __ \/ __ `__ \/ __ \/ __ \/ ___/ _ \/ ___/'
echo -E "/ /___/ /_/ / / / / / / /_/ / /_/ (__  )  __/ /    "
echo -E "\____/\____/_/ /_/ /_/ .___/\____/____/\___/_/     "
echo -E "                    /_/                            "
echo -E ""


php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

echo ""
echo ""
hostname -I
echo ""
echo ""
echo " USERNAME : jenkins "
echo " PASSWD : (jenkins-USER-PASSWD) "

