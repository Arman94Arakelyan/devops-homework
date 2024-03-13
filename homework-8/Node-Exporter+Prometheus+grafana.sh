#!/bin/bash


if systemctl --all --type service | grep -q "prometheus"
then

true
   ./prometheus.sh
fi

if systemctl --all --type service | grep -q "Node-Exporter"
then

true
   ./Node-Exporter.sh
fi

if systemctl --all --type service | grep -q "grafana"
then

true
   ./grafana.sh
   
fi