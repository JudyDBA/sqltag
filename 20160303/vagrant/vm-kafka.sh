#!/usr/bin/env bash

#yum -y update
yum -y install java-1.8.0-openjdk
yum -y install git nc wget

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

for BROKER_ID in 1 2 3
do 
	mkdir -p /usr1/kafka/log-$BROKER_ID

	## config change
	sed -i "/^broker.id=/s/=.*/=${BROKER_ID}/" server.properties
	sed -i "s/#port=9092/port=900${BROKER_ID}/g"  server.properties
	sed -i "s/9092/900${BROKER_ID}/g"  server.properties
	sed -i "/^log.dirs=/s/=.*/=\/usr1\/kafka\/log-${BROKER_ID}/" server.properties
	sed -i '/^zookeeper.connect=/s/=.*/=kf-broker-1:2181/' server.properties
	sed -i '/^zookeeper.connect=/s/=.*/=kf-broker-1:2181/' consumer.properties
	sed -i '/^metadata.broker.list=/s/=.*/=kf-broker-1:9001,kf-broker-1:9002,kf-broker-1:9003/' producer.properties

	cp -r server.properties server-$BROKER_ID.properties
	cp -r consumer.properties consumer-$BROKER_ID.properties
	cp -r producer.properties producer-$BROKER_ID.properties
	
	cp -r old_server.properties server.properties
	cp -r old_consumer.properties consumer.properties
	cp -r old_producer.properties producer.properties
	
	cat > /etc/init/kafka-$BROKER_ID.conf <<EOF
exec /usr1/kafka/2.11/bin/kafka-server-start.sh /usr1/kafka/2.11/config/server-$BROKER_ID.properties
EOF

done 
