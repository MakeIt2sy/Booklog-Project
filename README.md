# :orange_book: Booklog
<br>

> ### 1. 프로젝트 개요 
<br>

  * 소개 : 독서 기록 공유 플랫폼 <br>
  * 제작 기간 : 2022/10/29 ~ 2022/11/22 <br>
  * 참여 인원 : 5명 <br>
  
<br>
<br>

> ### 2. 개발 환경
<br>

 Front-end
 * Javascript
 * HTML5
 * CSS3
 * jQuery
 * Bootstrap
 
  Back-end
 * Java8
 * Spring
 * Maven
 * MyBatis
 * Oracle 11g
 <br>
 
 > ### 3. 맡은 기능 (제목 클릭시 상세 확인 가능) 
<br>

<details>
<summary style="cursor : pointer;">3.1  책 검색 및 독후감 검색</summary>
<br>

 <img width="50%" src="https://user-images.githubusercontent.com/107526525/206477489-14282264-637a-4295-802c-8ba399c6739a.gif">
 
  + **책 검색 기능** <br>
    * 네이버 검색 api 활용
    * keyup 할 때마다 input 의 값을 Ajax로 백엔드에 보냅니다.
    * 보낸 값을 인코딩하고 requestHeader에 아이디와 시크릿키를 세팅한 후, 네이버 서버에 요청을 보내고, 받은 결과를 프론트로 전달합니다. 
    * 자바스크립트의 IntersectionObserver 객체를 이용하여 한 페이지당 6개씩, 스크롤로 해당 페이지의 마지막 요소가 50% 정도 교차되었을 시에 다음 페이지 데이터를 가져와 최대 60개까지 무한 스크롤이 이루어지도록 합니다. 
    * 책 검색 기능은 독후감 작성 시, 독후감 검색 시 모두 활용되어 각 페이지에 따라 데이터 클릭했을 때의 결과가 달라집니다.
<br> 
<img width="50%" src="https://user-images.githubusercontent.com/107526525/206481926-55d7bbd2-617f-4454-a76a-29ef6d5dd328.gif">
    
  + **포스트 검색 기능** <br>
    * 검색 화면에서 책을 검색하고 클릭했을 때 DB에서 데이터를 받아 목록을 띄워주도록 했습니다.
    * 한 페이지당 5개씩 데이터가 나오도록 페이지네이션을 만들었습니다.
    * 각 포스트의 postno 를 이용하여 리스트 클릭시 해당 포스트 상세 화면으로 이동하도록 하였습니다.
    <br>
</details>


<details>
<summary style="cursor : pointer;">3.2  문의사항 게시판 </summary>
<br>
<img width="50%" src="https://user-images.githubusercontent.com/107526525/206483768-aa5c01a5-b515-4740-95f4-e4bd60eab299.png">


  + **목록 페이지** <br>
    * 현재 페이지의 정보를 파라미터로 전달받아 한페이지당 10개씩 게시글 목록을 띄워줍니다.
    * 각 게시물의 qnano 를 이용하여 목록 클릭시 문의 게시글 상세 화면으로 이동하도록 하였습니다.
<br> 
 <img width="50%" src="https://user-images.githubusercontent.com/107526525/206488030-6b56b875-eed9-45a6-8786-0d01694e3757.png">
 
 
  + **비밀 게시글 기능** <br>
    * 비밀글을 체크하고 암호를 건 게시글의 경우, 게시글 상세화면을 보기 전 비밀번호를 체크합니다.  
    * 같은 페이지 내에서 비밀번호가 맞을 경우 display가 none인 클래스로 바꾸는 형식이라 보안에 문제가 있을 것으로 보여 추후 수정 예정입니다. 
<br>    
 <img width="50%" src="https://user-images.githubusercontent.com/107526525/206491057-e58dca3b-105e-4432-8e8e-9dc64d983901.png"> 
  
 
  + **글 상세 페이지(수정/삭제/댓글)** <br>
    * 파라미터로 전달받은 qnano에 해당하는 데이터를 화면에 표시합니다.
    * 세션을 체크하여 글을 작성한 본인일 경우에만 수정,삭제 버튼이 보이도록 합니다.
    * 삭제 버튼 클릭시 ajax로 qnano를 보내 해당 데이터를 삭제하고, 수정 버튼 클릭시 수정 페이지로 연결합니다.
    * 세션을 체크하여 관리자일 경우에만 댓글 작성칸이 활성화되어 댓글을 작성하고 삭제할 수 있습니다. 

<br>    
 <img width="50%" src="https://user-images.githubusercontent.com/107526525/206490554-dbec286d-4bdc-4090-bd8c-4ad18d8dbd72.png"> 
 
 
  + **게시글 작성 페이지** <br>
    * 세션을 체크하여 로그인 상태와 작성자 정보를 확인합니다.
    * 제목, 타입, 내용, 비밀글 여부, 비밀번호를 작성하면 필수 작성 부분의 기입 여부를 확인하고 Ajax로 form의 데이터를 serialize하여 DB에 데이터를 저장합니다.
    * DB INSERT에 실패한 경우 alert창이 뜹니다.
<br>
</details>


<details>
<summary style="cursor : pointer;">3.3  도서관 대출 순위 페이지 및 메인 페이지 슬라이드 </summary>

자세한 내용
</details>


<details>
<summary style="cursor : pointer;">3.4  회원정보 수정</summary>

자세한 내용
</details>


<br>

 > ### 4. 트러블 슈팅
 <br>
 
  > ### 5. 느낀 점
 
 
