#3장 서비스 구성 및 조정, 책 리뷰

### 상세
* 일자 : 2016.02.18 (목요일) 8시 ~ 무한....  
* 장소 : NHN 그린팩토리 사옥 
* 내용 :
 * 책 내용 리뷰
 * git으로 2장 업로드 파일 공유 받기. 
 * vagrant 감 잡기. ㅋㅋ
 * kafka 설치 스크립트 이해하기.

### github 가입 및 설치 
* 툴 다운로드 https://desktop.github.com/
* 툴 사용 방법 http://metalkin.tistory.com/45 참고하세요~
* sqltag 으로 repository검색 후 추가 로컬에 clone 받으세요

### Sample source 빌드
```bash

1. 사전 준비
----------------------------------------

JAVA JDK 윈도우  설치
http://webnautes.tistory.com/457
http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

IntelliJ 다운로드 설치
https://www.jetbrains.com/idea/download/#section=windows

인텔리J 시작하기 Part1 
http://blog.woniper.net/184
https://beyondj2ee.wordpress.com/2013/06/01/%EC%9D%B8%ED%85%94%EB%A6%ACj-%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-part1-getting-start-intellij-%EA%B8%B0%EB%B3%B8-%EC%84%A4%EC%A0%95%ED%8E%B8/

샘플 소스 다운로드 
http://as.wiley.com/WileyCDA/WileyTitle/productCd-1118837916.html


2. host 파일에 host 정보 등록(관리자 권한으로 실행)
----------------------------------------
C:\windows\system32\drivers\etc\hosts

192.168.13.11	kf-broker-1
192.168.13.12	kf-broker-2
192.168.13.13	kf-broker-3
192.168.13.14	kf-procedure
192.168.13.15	kf-consumer


import > 
	import maven projects auto~~ -  enable
file > Project Structure
	java jdk 추가 
		java jdk 1.7 설치가 되어 있어야 함.
		
pom 파일
- 주석해제 후 저장
- zookeeper 버젼 변경 후 저장 
- 추가
    <dependency>
     <groupId>junit</groupId>
     <artifactId>junit</artifactId>
     <version>4.12</version>
     <scope>test</scope>
    </dependency>


```
메롱33