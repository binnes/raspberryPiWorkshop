#!/bin/bash

# Fetch and install the driver for DHT11/22

cd /home/pi  
wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.55.tar.gz
tar zxvf bcm2835-1.55.tar.gz
cd bcm2835-1.55
./configure
make
sudo make check
sudo make install
cd /home/pi/.node-red
sudo npm install --unsafe-perm -g node-dht-sensor
sudo npm install --unsafe-perm node-red-contrib-dht-sensor