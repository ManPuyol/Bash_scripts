#!/bin/bash

cd /usr/share/jenkins
sudo service jenkins stop
sudo mv jenkins.war jenkins.war.old
sudo wget https://updates.jenkins-ci.org/latest/jenkins.war
sudo service jenkins start
