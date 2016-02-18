#!/usr/bin/env bash

#yum -y update
yum -y install java-1.8.0-openjdk
yum -y install git nc wget


mkdir -p /usr1/kafka/log
mkdir -p /usr1/kafka/2.11
mkdir -p /usr1/program

cd /usr1/program
wget -q http://apache.mirror.cdnetworks.com/kafka/0.9.0.0/kafka_2.11-0.9.0.0.tgz
tar -xzf kafka_2.11-0.9.0.0.tgz
mv kafka_2.11-0.9.0.0/*  /usr1/kafka/2.11


cd /usr1/kafka/2.11/config

# config backup
cp -r server.properties old_server.properties
cp -r consumer.properties old_consumer.properties
cp -r producer.properties old_producer.properties

BROKER_ID=$1

## config change
sed -i "/^broker.id=/s/=.*/=${BROKER_ID}/" server.properties
sed -i '/^log.dirs=/s/=.*/=\/usr1\/kafka\/log/' server.properties
sed -i '/^zookeeper.connect=/s/=.*/=kf-broker-1:2181,kf-broker-2:2181,kf-broker-3:2181/' server.properties
sed -i '/^zookeeper.connect=/s/=.*/=kf-broker-1:2181,kf-broker-2:2181,kf-broker-3:2181/' consumer.properties
sed -i '/^metadata.broker.list=/s/=.*/=kf-broker-1:9092,kf-broker-2:9092,kf-broker-3:9092/' producer.properties

cat > /etc/init/kafka.conf <<EOF
exec /usr1/kafka/2.11/bin/kafka-server-start.sh /usr1/kafka/2.11/config/server.properties
EOF
