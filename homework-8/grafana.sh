#!/bin/bash


apt install -y apt-transport-https software-properties-common
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
apt update
apt -y install grafana
systemctl enable grafana-server
systemctl start grafana-server
cp ./datasources.yaml /etc/grafana/provisioning/datasources/datasources.yaml
systemctl restart grafana-server
curl -X POST http://localhost:9090/-/reload