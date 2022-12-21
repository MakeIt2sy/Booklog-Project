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
    * 자바스크립트의 IntersectionObserver API를 이용하여 한 페이지당 6개씩, 스크롤로 해당 페이지의 마지막 요소가 50% 정도 교차되었을 시에 다음 페이지 데이터를 가져와 최대 60개까지 무한 스크롤이 이루어지도록 합니다. 
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
    * 각 게시물의 게시물 번호를 이용하여 목록 클릭시 문의 게시글 상세 화면으로 이동하도록 하였습니다.
<br> 
 <img width="50%" src="https://user-images.githubusercontent.com/107526525/206488030-6b56b875-eed9-45a6-8786-0d01694e3757.png">
 
 
  + **비밀 게시글 기능** <br>
    * 비밀글을 체크하고 암호를 건 게시글의 경우, 게시글 상세화면을 보기 전 비밀번호를 체크합니다.  
    * 같은 페이지 내에서 비밀번호가 맞을 경우 display가 none인 클래스로 바꾸는 형식이라 보안에 문제가 있을 것으로 보여 추후 수정 예정입니다. 
<br>    
 <img width="50%" src="https://user-images.githubusercontent.com/107526525/206491057-e58dca3b-105e-4432-8e8e-9dc64d983901.png"> 
  
 
  + **글 상세 페이지(수정/삭제/댓글)** <br>
    * 파라미터로 전달받은 게시물 번호에 해당하는 데이터를 화면에 표시합니다.
    * 세션을 체크하여 글을 작성한 본인일 경우에만 수정,삭제 버튼이 보이도록 합니다.
    * 삭제 버튼 클릭시 Ajax로 게시물 번호를 보내 해당 데이터를 삭제하고, 수정 버튼 클릭시 수정 페이지로 연결합니다.
    * 세션을 체크하여 관리자일 경우에만 댓글 작성칸이 활성화되어 댓글을 작성하고 삭제할 수 있습니다. 

<br>    
 <img width="50%" src="https://user-images.githubusercontent.com/107526525/206490554-dbec286d-4bdc-4090-bd8c-4ad18d8dbd72.png"> 
 
 
  + **게시글 작성 페이지** <br>
    * 세션을 체크하여 로그인 상태와 작성자 정보를 확인합니다.
    * 제목, 타입, 내용, 비밀글 여부, 비밀번호를 작성하면 필수 작성 부분의 기입 여부를 확인하고 form의 데이터를 serialize하여 Ajax로 백엔드에 보내 DB에 데이터를 저장합니다.
    * DB INSERT에 실패한 경우 alert창이 뜹니다.
<br>
</details>


<details>
<summary style="cursor : pointer;">3.3  홈 페이지 슬라이드 및 도서관 대출 순위 페이지 </summary>
<br>
<img width="50%" src="https://user-images.githubusercontent.com/107526525/206593612-566d658b-3a6f-4d31-83bb-b697e8b0d39c.gif">


  + **홈 페이지 슬라이드** <br>
    * 책과 관련한 사이트인만큼 도서관 대출 순위 공공DB를 활용하면 좋겠다고 생각하여 월마다 업데이트되는 대출 순위 API를 활용하였습니다.
    * Ajax를 이용하여 서버에서 제공하는 도서 순위 1~10위까지를 5개씩 2개의 리스트를 만들고 부트스트랩으로 캐러셀 슬라이드로 보여주었습니다.
    * more 클릭시 상세 리스트 페이지로 이동합니다.
<br>
<img width="50%" src="https://user-images.githubusercontent.com/107526525/206596491-c26902c3-1ba0-4bfc-8f02-03a865fede16.png">


  + **도서관 대출 순위 상세 페이지** <br>
    * Ajax로 서버에서 제공하는 도서 순위 1~30위까지의 리스트를 제공하는 페이지입니다.
    * 교보문고 웹사이트의 베스트셀러 리스트를 참고하였습니다.
<br>
</details>


<details>
<summary style="cursor : pointer;">3.4  회원정보 수정</summary>
<br>
<img width="50%" src="https://user-images.githubusercontent.com/107526525/206596703-b701c28c-1e2e-4e41-b646-df000e915478.png">


  + **회원 비밀번호 확인페이지** <br>
    * 수정페이지로 들어가기 전, 비밀번호를 다시 한 번 입력 받고 세션에 저장된 로그인 정보와 일치하는지 확인하고 일치할 시에는 정보 수정 페이지로 이동하고, 불일치할 시에는 alert창을 띄웁니다.
<br>
<img width="50%" src="https://user-images.githubusercontent.com/107526525/206597346-8876055d-90b4-44f6-9bcd-ef614e3ba26a.png">


  + **회원 정보 수정 페이지** <br>
    * 아이디를 제외한 비밀번호, 이메일, 닉네임을 변경할 수 있습니다. 
    * 모든 칸이 입력되어 있는지 확인한 후, form의 내용을 serialize하여 Ajax로 백엔드에 데이터를 보내 DB 테이블 row를 Update 합니다. 
<br>
</details>

<details>
<summary style="cursor : pointer;">코드 확인</summary>
<br>

 
  + **검색 기능** <br>

    * Mapper : [포스트 검색](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/resources/com/booklog/mapper/PostSearchMapper.xml) , [API](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/resources/com/booklog/mapper/ApiMapper.xml)
    * DTO : [검색된 포스트 DTO](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/vos/web/SearchedPostDTO.java) 
    * DAO : [포스트 검색 DAO](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/dao/PostSearchDAO.java)
    * Service : [포스트 검색 서비스](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/service/PostSearchService.java) , [책 검색 서비스](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/service/BookSearchService.java)
    * Controller : [검색 전체 컨트롤러](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/controller/SearchController.java)
    * View : [책 검색/ 포스트 검색 뷰](https://github.com/MakeIt2sy/Booklog-Project/tree/main/Booklog%20(1)/src/main/webapp/WEB-INF/views/search)

<br> 
    
  + **문의사항 게시판** <br>
    * Mapper : [QNA](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/resources/com/booklog/mapper/QnaMapper.xml), 
    [QNA 코드](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/resources/com/booklog/mapper/QnaCodeMapper.xml), 
    [QNA 댓글](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/resources/com/booklog/mapper/QnaReplyMapper.xml)
    * DTO : [QNA VO](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/vos/web/QnaVO.java), 
    [QNA 코드](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/vos/web/QnaCodeVo.java), 
    [QNA 페이징 기준](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/vos/web/QnaCriteria.java) , 
    [QNA 페이지네이션](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/vos/web/QnaPageMakerDTO.java) , 
    [QNA 댓글](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/vos/web/QnaReplyVo.java)
    * DAO : [QNA DAO](https://github.com/MakeIt2sy/Booklog-Project/tree/main/Booklog%20(1)/src/main/java/com/booklog/dao), 
    [QNA 코드 DAO](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/dao/QnaCodeDAO.java) , 
    [QNA 댓글 DAO](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/dao/QnaReplyDAO.java)
    * Service : [QNA 서비스](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/service/QnaService.java), 
    [QNA 코드 서비스](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/service/QnaCodeService.java), 
    [QNA 댓글 서비스](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/service/QnaReplyService.java)
    * Controller : [QNA Controller](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/java/com/booklog/controller/QnaController.java)
    * View : [QNA 뷰](https://github.com/MakeIt2sy/Booklog-Project/tree/main/Booklog%20(1)/src/main/webapp/WEB-INF/views/qna)
<br>  
    
  + **홈 페이지 슬라이드 및 도서관 대출 순위 페이지 ** <br>
    * View: [홈페이지 슬라이드](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/webapp/WEB-INF/views/home.jsp) , 
    [도서관 대출 순위 페이지](https://github.com/MakeIt2sy/Booklog-Project/blob/main/Booklog%20(1)/src/main/webapp/WEB-INF/views/mostCheckedoutBookList.jsp)
    <br>
    
  + **회원 정보 수정 ** <br>
    * Controller : [회원정보 수정 컨트롤러](https://github.com/MakeIt2sy/Booklog-Project/blob/ae4cdc09bcc227cf6210ac8f5fc2ddf935d8d695/Booklog%20(1)/src/main/java/com/booklog/controller/UserController.java#L239)
    * View: [비밀번호 확인](https://github.com/MakeIt2sy/Booklog-Project/blob/ae4cdc09bcc227cf6210ac8f5fc2ddf935d8d695/Booklog%20(1)/src/main/webapp/WEB-INF/views/user/beforeEdit.jsp) , 
    [회원정보 수정](https://github.com/MakeIt2sy/Booklog-Project/blob/ae4cdc09bcc227cf6210ac8f5fc2ddf935d8d695/Booklog%20(1)/src/main/webapp/WEB-INF/views/user/editMemberInfo.jsp)
    <br>
</details>


<br>

 > ### 4. 트러블 슈팅
 <br>
 <details>
  <summary style="cursor : pointer;">4.1 책 검색 속도 문제</summary>
 <br>
 
 
  * 처음에 keyup할 때마다 함수가 작동하면 데이터가 꼬일 수 있다고 생각해서 async: false 로 동기식 Ajax를 사용하다가 검색 속도가 너무 느려 **비동기식 ajax로 변경**하였습니다.
  * 그 결과 같은 검색어를 입력했을 때 약 2.7배 정도 속도면에서 성능이 향상되었습니다.
 
</details>

 <details>
  <summary style="cursor : pointer;">4.2 책 검색 결과 정확성 문제</summary>
 <br>
 
 
  * 단어 단위로 입력했을 때에는 검색창에 뜨는 책 정보가 완전한 제목을 입력하였을 때는 뜨지 않는 문제가 발생하였습니다.
  * 백엔드에서 받아오는 정보에 문제가 있는 것으로 짐작하여 service 계층을 테스트 -> 문제 없이 리스트를 받아오는 것을 확인
  * Ajax에서 return을 받은 직후 data를 console로 확인 -> 문제 없이 리스트를 받아오는 것을 확인
  * data를 for문에 넣어 리스트를 만드는 과정에서 문제가 있는 것으로 짐작하여 조건식 확인 -> **변수 식의 오류로 0번 데이터가 아닌 1번 데이터부터 받아오는 문제 확인 후 식 변경**하여 해결하였습니다.
 
</details>
<br>


  > ### 5. 후기
 
   * 팀으로 협업할 때 구체적인 의사소통이 얼마나 중요한지 깨달았다. 의견에 일치를 보았다고 생각했는데 막상 실제로 DB를 짜거나 화면을 구성해보면 다른 이야기를 하고 있었다는 것이 드러나는 경우가 많았다. 앞으로도 계속 협업 프로젝트를 해나가게 될테니 정확한 의사소통에 주의를 기울여야겠다는 생각이 들었다. 
   * 책으로 읽고 부분적으로만 실습을 하다가 하나의 프로젝트를 만들게 되면서 spring mvc 구조에 대한 이해가 많이 늘었다.
   * 트러블이 있을 때 그때 그때 정리를 안 해놓으니 비슷한 트러블이 발생했을 때 처음만큼은 아니지만 또 시간을 허비하게 된다. 꼼꼼한 기록의 필요성을 느꼈다. 
   * 하면.. 된다! 
 
 
