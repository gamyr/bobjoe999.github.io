#!/bin/bash
sudo apt update -y
sudo apt-get update -y
sudo apt-get upgrade -y
cd ~
sudo pip3 install --upgrade adafruit-python-shell click==7.0
sudo apt-get install -y git
git clone https://github.com/adafruit/Raspberry-Pi-Installer-Scripts.git
cd Raspberry-Pi-Installer-Scripts
sudo python3 adafruit-pitft.py --display=st7789_240x135 --rotation=90 --install-type=fbcp
