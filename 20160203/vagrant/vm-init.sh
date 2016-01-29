#!/usr/bin/env bash


## hostname 제거
BROKER_ID=$1

if [ $BROKER_ID -lt 4 ]; then
    sed -i "s/kf-broker-${BROKER_ID}//" /etc/hosts    
fi

if [ $BROKER_ID -eq 4 ]; then
    sed -i "s/kf-procedure//" /etc/hosts    
fi

if [ $BROKER_ID -eq 5 ]; then
    sed -i "s/kf-consumer//" /etc/hosts    
fi

## host
echo '192.168.13.11 kf-broker-1' >> /etc/hosts
echo '192.168.13.12 kf-broker-2' >> /etc/hosts
echo '192.168.13.13 kf-broker-3' >> /etc/hosts

echo '192.168.13.14 kf-procedure' >> /etc/hosts
echo '192.168.13.15 kf-consumer' >> /etc/hosts