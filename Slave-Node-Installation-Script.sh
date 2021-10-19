#!/bin/bash

#Remember to => adduser jenkins before running this script.

sudo mkdir /var/jenkins
sudo chown -R jenkins:jenkins /var/jenkins
cd /var/jenkins
mkdir .ssh 
#Replace with master ssh key
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqipQmSQqTiRrvDA1TjNjupXlp2d/PD9oHhFGoYZrvFrqldzF4yKpDBssOV3vV4zn92O7a99Z6HAEjc8hGAe365eZKxnXUBuj2w/Ug0h8jhioa6Xxfe+Qbwp4wVY6gB1wx0nN+NwmcbqTKjIWwUVawmx/SBp6Z/+UMRLHBHiPwN1PfT+yXlF/kXpzpxRoQKhYQmx3eYuzCfAoKuzQu1kuW+5MVVJvuWFJKKHyG5oOo+y4n9MqKF7eepfMdgjYsiqadDyKAYY4aO6r5f9s/DfBhtoZb5+uf7xgOw626LSE/Ip4Cf5J4X0jgwTZ8CukYCtj+B1ws4e4lDbjoAEC6DdYMVAPvxM6AVklGEmVeSm5Z32zi1ZgGqHKCGTwyDMGd+pQM6f1bB4sPIdLDaYENvyvDSyKLd57F/Ybl93Sm/p38Wv1/cH5c5uqbTVnQC45qhBrZCy/rsgnK1GUDqEfjcLliktrIY/vO6wQ0Lvb1+Q+IQRsWl+pI0/OuqnNy/V64+AM= sys_start@sys" > .ssh/authorized_keys


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
