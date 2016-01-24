#!/usr/bin/env bash

apt-get update
apt-get install -y openjdk-7-jdk
apt-get install -y git nc wget

mkdir -p /usr1/zookeeper/data
mkdir -p /usr1/zookeeper/log
mkdir -p /usr1/zookeeper/3.4.6
mkdir -p /usr1/program

cd /usr1/program
wget -q http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar -xzf zookeeper-3.4.6.tar.gz

MYID=$1
echo -n $MYID > /usr1/zookeeper/data/myid
cat > /usr1/zookeeper/3.4.6/conf/zoo.cfg <<EOF
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/usr1/zookeeper/data
dataLogDir=/usr1/zookeeper/log
clientPort=2181
server.1=192.168.12.11:2888:3888
server.2=192.168.12.12:2888:3888
server.3=192.168.12.13:2888:3888
EOF

cat > /etc/init/zookeeper.conf <<EOF
exec /usr1/zookeeper/3.4.6/bin/zkServer.sh start-foreground /usr1/zookeeper/3.4.6/conf/zoo.cfg
EOF
start zookeeper