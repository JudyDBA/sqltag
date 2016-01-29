
sudo su -

echo "1" > /var/zookeeper/data/myid
echo "2" > /var/zookeeper/data/myid
echo "3" > /var/zookeeper/data/myid

## 시작 서버 
start zookeeper

## 서버 시작 
/opt/zookeeper-3.4.6/bin/zkServer.sh start /var/zookeeper/conf/zoo.cfg

## 서버 접속 
/opt/zookeeper-3.4.6/bin/zkCli.sh -server 192.168.12.11 


