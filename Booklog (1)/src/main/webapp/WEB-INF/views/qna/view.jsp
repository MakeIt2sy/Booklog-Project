<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/commonHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${config.getValue('client.title')}</title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	
<jsp:include page="/include/resource.jsp" />

<style>
	ul{
		list-style: none;
	}
	.hidden{
		display: none !important;
	}
	
	.pwdCheck{
		margin-top:15px;
	    border-radius:7px;
		text-align: center;
		height: 450px;
		padding-top: 150px;
		background-color: #D8D8D8;
	}
	
	.qnaContainer{
		width: 100%;
		height: 100%;
	}
	
	.questionContainer{
		margin-top:15px;
		padding: 15px;
		padding-left: 20px;
		width:100%;
		min-height: 430px;
		border: 0.5px solid #D8D8D8;
		border-radius: 10px;
		display: grid;
		grid-template-rows: 10% 10% auto 10%;
	}
	
	.qnaTitle{
		margin-top: 5px;
	}
	
	.qnaWriterAndTime {
		display: flex;
		font-size: 0.9em;
		border-bottom: 0.5px solid #8C8C8C;
		line-height: 45px;
	}
	.qnaWriterNickname{
		float: left;
		margin-right: 30px;
	}
	.qnaContent{
		margin-top: 20px;
	}
	.buttons{
		text-align: right;
	}
	.buttons button{
		padding: 6px;
		margin-right:5px;
		margin-top: 10px;
		border: none;
		border-radius: 7px;
		transition: 0.3s ease-in-out;
	}
	
	.buttons button:first-child:hover{
		background-color:#F15F5F;
		color: white;
	}
	
	.buttons button:nth-child(2):hover{
		background-color: #6799FF;
		color: white;
	}
	
	.buttons button:hover{
		background-color:#5D5D5D;
		color: white;
	}
	
	.answerContainer{
		width: 100%;
		padding: 15px;
		padding-left: 20px;
		margin-top: 10px;
		border: 0.5px solid #D8D8D8;
		border-radius: 10px;
	}
	
	.answerInput {
		display: grid;
		grid-template-columns: 85% 15%;	

	}
	
	.answerInput textarea{
		width: 100%;
		height: 6.25em;
		padding: 10px 15px 10px 15px; 
    	border: 0.3px solid #8C8C8C;
    	border-radius: 10px;
    	resize: none;
	}
	.answerInput button{
		margin-left: 30px;
		margin-top: 30px;
		border: none;
		padding: 6px;	
		border-radius:  7px;
	}	
	textarea:focus {
	 outline: 2px solid #8C8C8C;
	}
	
/* 	.answerInput div button:hover{
		background-color:#5D5D5D;
		color: white;
	} */
	
	.answerList{
		width: 100%;
	}
	
	.answerList ul{
		width: 100%;
		padding-left: 0;
	}
	.reply{
		list-style: none;
		width:85%;
		margin: 10px 0 2px 0;
		padding: 5px;
		border-bottom: 0.3px solid #8C8C8C;
		display: grid;
		grid-template-columns : 90% 10%;
	}
	.reply:last-child{
		border:none;
	}
	
	.replyContent{
		margin-top: 4px;
	}
	
	.replyTime {
		margin-top: 4px;
		font-size: 0.7em;
	}
	
	.xBttn{
		width: 15px;
		height: 15px;
		margin-left:20px;
		margin-top: 30px;
		cursor: pointer;
	}
	
	.pwdButtons button {
      padding: 6px;
      margin-right:5px;
      margin-top: 10px;
      border: none;
      border-radius: 7px;
      transition: 0.3s ease-in-out;
   }
   
   .pwdButtons button:first-child:hover{
     background-color: #FF5A5A;
     color: white;
   }
   
   .pwdButtons button:hover{
     background-color: #6799FF;
     color: white;
   }
	
</style>

</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<jsp:include page="/include/floatingmenu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div style="overflow: auto; min-height: 1200px; max-height: 1200px;">
					<div class="row m-3 justify-content-center">
						<div class="col-sm-10 col-xs-10 mt-5">
							<h2>????????????</h2>
								<div class="pwdCheck">
									<p>??? ?????? ??????????????????. <strong>????????? ????????? ????????? ??????????????? ??????????????????.</strong>
										<br>???????????? ??????????????? ???????????? ?????????.
									</p>
									<div class="pwdInput">
										<label for="pwd" style="display:inline-block; width:80px;">????????????</label>
										<input type="password" id="pwd" style="outline: none;">
									</div>
									<div class="pwdButtons">
										<button onclick="checkPassword();">??????</button>
										<button onclick="history.go(-1);">??????</button>
									</div>
								</div>
								<form id="formQnaModify" class="form-horizontal" action="/qna/modify" method="post">
									<input type="hidden"  name="qnaNo" value="${qnaVo.qnaNo}"/>
								</form>
								<div class="qnaContainer hidden">
									<div class="questionContainer">
										<div class="qnaTitle">
											<h3>${qnaVo.qnaTitle}</h3>
										</div>
										<div class="qnaWriterAndTime">
											<div class="hidden" id="qnaWriter"><span>${qnaVo.qnaWriter}</span></div>
											<div class="qnaWriterNickname"><span>${qnaVo.qnaWriterNickname}</span></div>
											<% pageContext.setAttribute("newLineChar", "\n"); %>
											<div class="qnaTime"><span>${qnaVo.qnaWriteTime}</span></div>
										</div>
										<div class="qnaContent"><p>${fn:replace(qnaVo.qnaContent,newLineChar, "<br>")}</p>
										</div>
										<div class="buttons">
											<button id="deleteQ" onclick="deleteQna();">??????</button>
											<button id="modifyQ" onclick="modifyQna();">??????</button>
											<button onclick="selectList();">??????</button>
										</div>
									</div>	
									<div class="answerContainer">
										<h4>??????</h4>
										<div class="answerInput">
											<div><textarea id="qnaReplyContent" name="qnaReplyContent" placeholder="???????????? ????????? ????????? ??? ????????????"></textarea></div>
											<div><button id="replyforQB" onclick="insertQnaReply();">??????</button></div>
										</div>
										<div class="answerList">
											<ul>
												<c:forEach var="qnaReply" items="${qnaReplyList}">
													<li class="reply">
														<div class="replyInfo">
															<div class="replyWriter"><strong>?????????</strong></div>
															<div class="hidden">${qnaReply.qnaReplyNo}</div>
															<div class="replyContent">${qnaReply.qnaReplyContent}</div>
															<div class="replyTime">${fn:substring(qnaReply.qnaReplyTime, 0, 19)}</div>
														</div>
														<div>
															<img id="${qnaReply.qnaReplyNo}" class="xBttn" src="/resources/images/qna/x.png" onclick="deleteQnaReply(this.id);">
														</div>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	</div>

<script type="text/javascript">

	$(document).ready(function(){ //dom??? ???????????? ???????????? ?????? ??? ?????? ??? ????????????????????? ?????? ??????
		if(${qnaVo.qnaIsPublic}.toString() == 'true'){
			showData();
		}
	});
	
	if(identifyUser()==false){
		$('#deleteQ').addClass('hidden');
		$('#modifyQ').addClass('hidden');
		
	}
	
	if(identifyAdmin()==false){
		$('#qnaReplyContent').attr('disabled', 'disabled');
		$('#qnaReplyContent').attr('style','background-color: #EAEAEA;')
		$('.xBttn').addClass('hidden');
		$('.replyforQB').attr('disabled', 'disabled');
		
	}
	
	
	
	function showData(){
		$('.pwdCheck').addClass('hidden');
		$('.qnaContainer').removeClass('hidden');
	}
	
	
	function checkPassword(){
		let qnaNo = ${qnaVo.qnaNo};
		let password = $('.pwdInput input[type=password]').val();
		
		ajaxCall4Html(ctxPath+'/qna/qnaPwChck.do', 
				{ qnaNo: qnaNo,
				  qnaPassword: password},
				  function(data) {
						var retrn = JSON.parse(data);
				 		console.log(retrn);
						
						if (retrn.result == 'YES') {
							alert(retrn.messages);
							showData();
						} else {
							alert(retrn.messages);
						}
					});
	}

	
 	function selectList(){
		location.href=ctxPath +"/qna/list";
	} 
	
	
	function identifyUser(){
		//????????? ??? ?????? ??????
		if(${loginVo.userno} == ${qnaVo.qnaWriter}){
			return true;
		}else{
			return false;
		}

	}
	
	function identifyAdmin(){
		let userRole = ${loginVo.userrole};
		
		if( userRole ==0){
			return true;
		}else{
			return false;
		}
		
	}
	
	 function modifyQna(){
		if(identifyUser()==true){
		 $('#formQnaModify').submit();
		}else{
		 alert("???????????? ????????????.");
		}
	} 
	
	function deleteQna(){
		let qnaNo = ${qnaVo.qnaNo};
		
		if(identifyUser()==true){
			ajaxCall4Html(ctxPath+'/qna/delete.do', 
					{ qnaNo: qnaNo },
					  function(data) {
							var retrn = JSON.parse(data);
					 		console.log(retrn);
							
							if (retrn.result == 'YES') {
								alert(retrn.messages);
								selectList();
							} else {
								alert(retrn.messages);
							}
						});
		}else{
			alert("???????????? ????????????.");
		}
		
	}
	
	function insertQnaReply(){
		let userNo = ${loginVo.userno};
		let replyContent = $('#qnaReplyContent').val();
		let qnaNo = ${qnaVo.qnaNo};
		
		if(identifyAdmin()==true) {
			ajaxCall4Html(ctxPath+'/qna/replyEnrollAjax.do', 
					{qnaNo: qnaNo,
				     qnaReplyWriter: userNo,
					 qnaReplyContent: replyContent
					},
					  function(data) {
							var retrn = JSON.parse(data);
					 		console.log(retrn);
							
							if (retrn.result == 'YES') {
								alert(retrn.messages);
								location.reload(false);
								
							} else {
								alert(retrn.messages);
							}
						});	
		}else{
			alert("????????? ????????? ??? ????????????")
		}
		}
	
	function deleteQnaReply(clickedId){
				
		  if(identifyAdmin()==true){
			ajaxCall4Html(ctxPath+'/qna/deleteReplyAjax.do', 
					{ qnaReplyNo: clickedId},
					  function(data) {
							var retrn = JSON.parse(data);
					 		console.log(retrn);
							
							if (retrn.result == 'YES') {
								alert(retrn.messages);
								location.reload();
							} else {
								alert(retrn.messages);
							}
						});
		}else{
			alert("???????????? ????????????.");
		 	
		}
	}
	
</script>

</body>
</html>
