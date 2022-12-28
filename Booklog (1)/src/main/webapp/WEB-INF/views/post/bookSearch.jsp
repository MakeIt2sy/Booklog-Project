<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>	
<jsp:include page="/include/resource.jsp" />
<style>
/* .scroll{
    -ms-overflow-style: none !important; 
    scrollbar-width: none; 
}
.scroll::-webkit-scrollbar {
    display: none; 
} */

</style>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/floatingmenu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="padding:0px;">
				<div class="scroll" style="overflow: auto; min-height: 1200px; max-height: 1200px;">
					<div id="listLoader" style="height: 1200px; width: 100%;">
						<jsp:include page="/WEB-INF/views/search/innerBookSearch.jsp"></jsp:include>
					</div>
				
				</div>
				<!-- <form id="tooController" method="post" action="/post/write"> -->
				<form id="tooController" method="get" action="/post/edit">
					<input name="toController" type="hidden" value="">
				</form>
			</main>
			
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>
	<script>

        let currentPage = 1;
        const DATA_PER_PAGE = 6
        const LAST_PAGE = 9;
        
        

        const observerOption = {
            rootMargin: "0px 0px 30px 0px",
            threshold: 0.5
        }
     

         
        

      function searchFunction(){
        $.ajax({
            method: 'GET', // 요청방식
            url: 'postsBookSearch.do',
 /*            async : false, */
            data: {keyword: $('.bookSearchInput').val()} ,
            dataType: "json",
            timeout: 1000,
            success: function(data){
               
                //데이터 추가 함수
                function addData(currentPage){
                   
                    let total = data.total;
                    let str = "";

                  if(data.total>=1){

                           
                           for(let i = (currentPage-1)*DATA_PER_PAGE; i <= currentPage*DATA_PER_PAGE-1; i++){
                              data.items[i]
                              str  = "<li class='suggestedBook'><div class='bookLink' id='{ \"isbn\":\""+data.items[i].isbn+"\", \"booktitle\": \""+data.items[i].title+"\", \"bookauthor\":\""+data.items[i].author+"\", \"bookcover\":\""+data.items[i].image+"\" }' onclick='data(id);'>";
                              /* str += "http://localhost:8181/search/postSearch?query="+data.items[i].isbn+"'>"; */
                              str += "<div class='bookImage'><img src='"+data.items[i].image+"'/></div>";
                              str += "<div class='leftInformation'><div class='bookTitle'><p><strong>"+data.items[i].title+"</strong></p></div>";
                              str += "<div class='bookAuthorAndPublisher'><p>"+data.items[i].author+" / "+data.items[i].publisher+"</p></div>";
                              str += "<div class='bookDescription'><p>"+data.items[i].description.substring(0,150)+"</p></div>";
                              str += "</div></div></li>";
                                $('#suggestedBookList').append(str); 
                           
                           }
                        }
              
                }
                

                function observerLastChild(intersectionObserver){
                              
                   const listChildren = $('.suggestedBook');
                   
                   for(i=0; i<listChildren.length; i++){

                      if(!listChildren[i].nextSibling && currentPage < LAST_PAGE ){
                         intersectionObserver.observe(listChildren[i])  
                      }else if (currentPage >= LAST_PAGE ){
                         intersectionObserver.disconnect();
                      }
                      
                      
                   }
           
                   
                }


                const io = new IntersectionObserver(function(entries, observer){
                    entries.forEach(function(entry){


                        if (entry.isIntersecting) {
                           

                            setTimeout( function() {
                                addData(++currentPage);
                                observer.unobserve(entry.target);
                                observerLastChild(observer);

                            }, 1000)
                        }
                    })
                }, observerOption)
                     
               
               $('#suggestedBookList').empty();
               addData(currentPage);         
               observerLastChild(io);

              }
            })
        }
      
       
       function data(id){
    	   $('input[name=toController]').attr('value',id);
    	   $('#tooController').submit();
    	   
       }
</script>
</body>
</html>