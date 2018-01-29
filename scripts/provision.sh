#!/usr/bin/env bash
sudo yum -y update *
sudo yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel
sudo yum -y install unzip
sudo yum -y install ntp
sudo service ntpd start
sudo chkconfig ntpd on
sudo yum -y install wget
sudo yum -y install net-tools
sudo yum -y install mlocate
sudo updatedb

