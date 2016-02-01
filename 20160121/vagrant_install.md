## Zookeeper 테스트 환경 설치

```bash
## http://www.slideshare.net/kthcorp/h3-2012-vagrant
## http://mobicon.tistory.com/322
## https://mmcgrana.github.io/2014/05/getting-started-with-zookeeper-and-go.html

step 0 ) 필수 설치
https://www.virtualbox.org/wiki/Downloads
https://www.vagrantup.com/downloads.html
http://bigmark.tistory.com/27
-----------------------------------------
vagrant 4.5
virtualbox 4.3 


step 1 ) vm에 필요한 파일 copy 
D:\VM\zookeeper2
-----------------------------------------
Vagrantfile
vm-go.sh 
vm-zookeeper.sh 


step 2 ) vm 생성 (1~3) 
-----------------------------------------
D:\VM\zookeeper2
vagrant up --provider virtualbox


step 3 ) vm 구동 
-----------------------------------------
구동 : vagrant up
종료 : vagrant halt

## 설치후 ssh으로 접속 2222
## 접속 계정 vagrant / vagrant 

## 클라이언트 접속 
/opt/zookeeper-3.4.6/bin/zkCli.sh

## 클러스터 확인 
echo 'mntr' | nc localhost 2181

```
