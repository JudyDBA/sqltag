# GitHub 사용하기 


`
// 로컬 디렉토리 만들고
cd d:\
mkdir git\testgit
cd git\testgit

 // 매번 물어보는 귀찮음을 피하기 위해 설정.
git config --global user.name "JudyDBA"
git config --global user.email "chusouk@gmail.com"

// 로컬과 원격 저장소를 연결한다.
git remote add origin https://github.com/JudyDBA/sqltag.git 

 // 연결상태를 확인한다.
git remote -v

// 최신 소스를 가져온다. 
git pull origin master 

// 깃허브로 최신 소스를 반영 한다. 
git push origin master 


git init            // 깃 명령어를 사용할 수 있는 디렉토리로 만든다.
git status          // 현재 상태를 훑어보고
git add 화일명.확장자  // 깃 주목 리스트에 화일을 추가하고 or
git add .           // 이 명령은 현재 디렉토리의 모든 화일을 추가할 수 있다.
git commit -m “대문 수정”
`

### Reference link
* http://demun.tistory.com/2427
* https://nolboo.github.io/blog/2013/10/06/github-for-beginner/
* https://teragoon.wordpress.com/2012/04/04/github%EC%97%90%EC%84%9C-readmemd-%EC%9E%91%EC%84%B1%ED%95%98%EA%B8%B0markdown-%EB%AC%B8%EB%B2%95/
