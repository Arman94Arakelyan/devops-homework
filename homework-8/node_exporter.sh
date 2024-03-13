#!/bin/bash

mkdir /var/lib/node_exporter/textfile_collector
cd /tmp
curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz

tar -xvf node_exporter*.gz
rm node_exporter*.gz /usr/local/bin/node_exporter
mv node_exporter*/node_exporter /usr/local/bin/
useradd -rs /bin/false node_exporter
echo '
[Unit]
Description=Node Exporter
After=network.target
 
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter --collector.textfile.directory=/var/lib/node_exporter/textfile_collector
 
[Install]
WantedBy=multi-user.target' > /etc/systemd/system/node_exporter.service

systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
systemctl status node_exporter