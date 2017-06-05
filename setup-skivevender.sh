#!/bin/bash

sudo apt update
sudo apt install git
git clone https://github.com/roykollensvendsen/skive_vender.git
sudo apt install nodejs
sudo apt install npm
sudo apt install python-pifacedigitalio

sudo sed -i s/#dtparam=spi=on/dtparam=spi=on/g /boot/config.txt

cd skrive_vender
npm install


sudo apt install dnsmasq hostapd

echo "denyinterfaces wlan0" >> /etc/dhcpcd.conf

sudo cp interfaces /etc/network/interfaces

sudo cp hostapd.conf /etc/hostapd/hostapd.conf

sudo cp dnsmasq.conf /etc/dnsmasq.conf

sudo cp iptables.ipv4.nat /etc/iptables.ipv4.nat

sudo cp local.rc /etc/local.rc

sudo cp skivevender.service /etc/systemd/system/skivevender.service

sudo systemctl enable skivevender

sudo reboot -h now

