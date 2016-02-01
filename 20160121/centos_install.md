/*
    vagrant 사이트 접속
    https://atlas.hashicorp.com/boxcutter/boxes/centos66
    
    vagrant init boxcutter/centos66; vagrant up --provider virtualbox
*/

1) 폴더 생성 
-----------------------------------------------------------------------------
D:\VM\centos_zookeeper

+ Vagrantfile
+ vm-zookeeper.sh



2) Vagrantfile 파일 생성 
-----------------------------------------------------------------------------
# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  ["1", "2", "3"].each do |n|
    config.vm.define "zk#{n}" do |zk_config|
      zk_config.vm.box = "boxcutter/centos66"
      zk_config.vm.network "private_network", :ip => "192.168.12.1#{n}"
      zk_config.vm.provision :shell, :path => "vm-zookeeper.sh", :args => n
    end
  end
end 


3) Vagrantfile 파일 생성 
-----------------------------------------------------------------------------
vagrant up --provider virtualbox


4) 접속
-----------------------------------------------------------------------------
putty 192.168.13.11, 192.168.13.12, 192.168.13.13
vagrant / vagrant
sudo su - 

## 클라이언트 접속 
/usr1/zookeeper/3.4.6/bin/zkCli.sh

## 서버 모니터링
[root@localhost ~]# echo ruok | nc 127.0.0.1 2181
imok

[root@localhost ~]# echo stat | nc 127.0.0.1 2181
Zookeeper version: 3.4.6-1569965, built on 02/20/2014 09:09 GMT
Clients:
 /127.0.0.1:49411[0](queued=0,recved=1,sent=0)

Latency min/avg/max: 0/0/0
Received: 2
Sent: 1
Connections: 1
Outstanding: 0
Zxid: 0x100000002
Mode: leader
Node count: 4

5) VM 구동 및 종료 
-----------------------------------------------------------------------------
구동 : vagrant up
종료 : vagrant halt
제거 : vagrant destroy

6) 예제 소스 (maven)
cd /usr1/program 
yum install -y install unzip
wget http://www.hanbit.co.kr/exam/2229/source.zip
unzip source.zip
unzip 2229_source/Chapter3Sources.zip
cd /usr1/program/chapter3/java
mvn clean package

컴파일 에러 ㅠㅠ


wget http://media.wiley.com/product_ancillary/16/11188379/DOWNLOAD/Chapter3Sources.zip
unzip Chapter3Sources.zip
cd /usr1/program/chapter3/java

## 
Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
http://blog.daum.net/lkflower/17224511

mvn verify







