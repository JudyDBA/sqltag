# GitHub 사용하기 

Github desktop 다운로드 후 설치(윈도우 사용자) : https://desktop.github.com/

```bash
// 로컬 디렉토리 만들고
cd d:\
mkdir git\testgit
cd git\testgit

// 깃 명령어를 사용할 수 있는 디렉토리로 만든다.
git init           

 // 매번 물어보는 귀찮음을 피하기 위해 설정.
git config --global user.name "ㅇㅇ"  // 이름
git config --global user.email "ㅇㅇ"  // 메일 주소  

// 로컬과 원격 저장소를 연결한다.
git remote add origin https://github.com/JudyDBA/sqltag.git 

 // 연결상태를 확인한다.
git remote -v 

// 현재 상태를 훑어보고
git status          

// 최신 소스를 가져온다. 
git pull origin master 

// 파일 추가 
git add 20160203/gitHub_ReadMe.md
git commit -m "git hub readme append"

// 깃허브로 최신 소스를 반영 한다. 
git push origin master 

```

### Reference link
* [GitHub Windows 커밋하고 원격저장소에 반영하기] ( http://demun.tistory.com/2427)
* [완전 초보를 위한 깃허브] (https://nolboo.github.io/blog/2013/10/06/github-for-beginner/)
* [Github 마크다운 Mastering Markdown] (http://demun.tistory.com/2496)
* https://help.github.com/articles/creating-and-highlighting-code-blocks/


