#  Kafka 설치 및 컨슈머&프로듀서 테스트 

* zookeeper+kafka  cluster vagrant install
* zookeeper znode data 확인


### kafka cluster node 3 tea
hostname  | private ip | program
------------ | ------------- | -------------
kf-broker-1  |  192.168.13.11   |  zookeeper 1 tea, kafka  3 tea cluster


```bash
구동 또는 생성 : vagrant up --provider virtualbox
구동 : vagrant up
종료 : vagrant halt

주의) kafka 각 클러스터가 다 올라와야 서비스 올려주는 이슈가 있음

start zookeeper 
start kafka

각 서비스들이 살아 있는지 확인 하는 명령어 
ps -ef | grep kafka
ps -ef | grep zookeeper
```

###  kafka 연동 테스트 
```bash

## 서비스가 실행되지 않았을 경우 
start zookeeper
start kafka

-- kafka system log 
/usr1/kafka/2.11/logs    

-- kafka log 
/usr1/kafka/log


1) kf-procedure host )) kafka topic 생성 
/usr1/kafka/2.11/bin/kafka-topics.sh --create --zookeeper kf-broker-1:2181  --replication-factor 3 --partitions 3 --topic sqltag

## /usr1/kafka/2.11/bin/kafka-topics.sh --delete --zookeeper kf-broker-1:2181 --topic sqltag

2) kf-procedure host )) kafka topic list 
/usr1/kafka/2.11/bin/kafka-topics.sh --list --zookeeper kf-broker-1:2181

3) kf-procedure host )) kafka topic detail 
/usr1/kafka/2.11/bin/kafka-topics.sh --describe --zookeeper kf-broker-1:2181 --topic sqltag
Topic:test      PartitionCount:5        ReplicationFactor:3     Configs:
        Topic: test     Partition: 0    Leader: 3       Replicas: 3,1,2 Isr: 3,1,2
        Topic: test     Partition: 1    Leader: 1       Replicas: 1,2,3 Isr: 1,2,3
        Topic: test     Partition: 2    Leader: 2       Replicas: 2,3,1 Isr: 2
        Topic: test     Partition: 3    Leader: 3       Replicas: 3,2,1 Isr: 3,2,1
        Topic: test     Partition: 4    Leader: 1       Replicas: 1,3,2 Isr: 1,3,2

4) simple test 
[ kf-consumer ] 
/usr1/kafka/2.11/bin/kafka-console-consumer.sh --zookeeper kf-broker-1:2181 --topic sqltag --from-beginning

[ kf-procedure ] Procedure host (메세지 생성)
/usr1/kafka/2.11/bin/kafka-console-producer.sh --broker-list kf-broker-1:9092,kf-broker-2:9092,kf-broker-3:9093  --topic sqltag

메세지를 입력 한다. 

5) kafka 서버 시작 / 종료 
/usr1/kafka/2.11/bin/kafka-server-stop.sh
/usr1/kafka/2.11/bin/kafka-server-start.sh /usr1/kafka/2.11/config/server.properties


```

###  zookeeper에 등록된 broker 정보 확인 
```bash

/usr1/zookeeper/3.4.6/bin/zkCli.sh
---------------------------------
[zk: localhost:2181(CONNECTED) 1] ls /
[controller, controller_epoch, brokers, zookeeper, admin, isr_change_notification, consumers, config]
[zk: localhost:2181(CONNECTED) 2] ls /brokeers
Node does not exist: /brokeers
[zk: localhost:2181(CONNECTED) 3] ls /brokers
[ids, topics, seqid]
[zk: localhost:2181(CONNECTED) 4] ls /brokers/ids
[1, 2]
[zk: localhost:2181(CONNECTED) 5] ls /brokers/ids
[1, 2, 3]
[zk: localhost:2181(CONNECTED) 6] ls /brokers/ids/1
[]
[zk: localhost:2181(CONNECTED) 7] get /brokers/ids/1
{"jmx_port":-1,"timestamp":"1453969745721","endpoints":["PLAINTEXT://localhost:9092"],"host":"localhost","version":2,"port":9092}
cZxid = 0x100000023
ctime = Thu Jan 28 08:29:05 UTC 2016
mZxid = 0x100000023
mtime = Thu Jan 28 08:29:05 UTC 2016
pZxid = 0x100000023
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x352874f9a660000
dataLength = 129
numChildren = 0


## ----------------------------------------------------------
## zookeeper 상태 확인 
## ----------------------------------------------------------
echo stat | nc 127.0.0.1 2181

```

### Reference link
* http://kafka.apache.org/downloads.html
* http://kafka.apache.org/documentation.html
* https://github.com/KHELYS/kafka
* http://www.yongbok.net/blog/apache-kafka-a-high-throughput-distributed-messaging-system/
