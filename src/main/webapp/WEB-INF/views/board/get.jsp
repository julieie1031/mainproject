<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">-->
<link href="/resources/css/w3school.css" rel="stylesheet"
	type="text/css" />

<style>
* {
	margin: 0;
	padding: 0;
}

.table-x {
	margin-left: 30px;
}

.jb-x-small {
	font-size: x-small;
}

.text-x {
	text-align: right;
	vertical-align: bottom;
}

a {
	text-decoration-line: none;
	color: black;
}

.line {
	border-bottom: 1px solid black;
}

.table1 {
	border-bottom: 1px solid #dddbdb;
	margin-top: 88px;
	margin-bottom: 10px;
	width: 470px;
	margin-left: 15px;
	margin-right: 15px;
}

.table2 {
	margin-bottom:20px;
	width: 480px;
	margin-left: 10px;
	margin-right: 10px;
	
	margin-top: 10px;
}

}
input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	width: 500px;
	height: 30px;
	font-size: 15px;
}

textarea {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	width: 500px;
	height: 50px;
	resize: none;
	font-size: 15px;
}

input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}

.btn_update {
	background-image: url('../resources/images/community/update.png');
	background-position: 0px 0px;
	background-repeat: no-repeat;
	width: 40px;
	height: 35px;
	cursor: pointer;
	outline: 0;
	margin-top: 30px;
	float: right;
}

.img1 {
	position: relative;
	float: right;
	margin-top: 15px;
	margin-right: 9px;
	margin-bottom: 8px;
}

.img2 {
	position: relative;
	float: right;
	margin-top: 10px;
	margin-right: 10px;
}

input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	width: 500px;
	height: 30px;
	font-size: 15px;
}

input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

.inputstyle {
	border-radius: 5px;
	background-color: white;
}

textarea {
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid white;
	border-radius: 4px;
	background-color: white;
	font-size: 16px;
	resize: none;
}

.ul {
	list-style: none;
	float: right;
	display: inline;
	margin-top: 10px;
	margin-bottom: 25px;
}

.ul li {
	float: left;
	margin-left: 4px;
}

.ul li a {
	float: left;
	padding: 8px;
	margin-right: 5px;
	margin-bottom: 20px;
	width: 25px;
	height: 20px;
	color: #000;
	font: bold 15px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
}

.paginate_button.active a {
	background-color: #B0B0B0;
}

.button {
	border: none;
	color: white;
	padding: 8px 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	float: right;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}

.button1:hover {
	background-color: #4CAF50;
	color: white;
}

.button2 {
	border: 1px solid #4CAF50;
	color: black;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	float: right;
	background: #f1f1f1;
}

.uploadResult {
	width: 100%;
}

.uploadResult ul {
	display: flex;
	flex-flow: column;
	justify-content: center;
	
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 445px;
	height: 320px;
}
</style>


<%@include file="../layout/header3.jsp"%>

<div class="carousel-item active"></div>


<!-- <img src="../resources/images/community/submit.png" alt="..."
		width="40px" height="40px" align="right" class = "img1" type = "submit"> -->


<sec:authentication property="principal" var="pinfo" />
<sec:authorize access="isAuthenticated()">
	<c:if test="${pinfo.username eq board.userId }">
		<a href="#"><img src="../resources/images/community/register.png"
			alt="..." width="40px" height="39px" class="img1" data-oper='modify'></a>
	</c:if>
</sec:authorize>


<table class="table1">
	<tr style="margin-top: 10px;">
		<td style="font-weight: bold; font-size: 28px;">${board.title }</td>
	</tr>
	<tr>
		<td style ="padding-top:15px;">${board.userId }&nbsp;&nbsp;&nbsp;<img src="../resources/images/community/hit.png" alt="..."
			width="15px" height="15px" style="padding-left: 4px;">&nbsp;&nbsp;${board.hit}</td>
		</td>
	</tr>
	<tr>
		<td style="border-bottom: 1px solid #d9d9d9; padding-bottom: 15px; padding-top:15px;">
			
			<fmt:formatDate
				pattern="yyyy-MM-dd HH:MM:ss" value="${board.boardUpdateDate}" />
		</td>
	</tr>
	<tr>
		<td style="width: 500px; padding-bottom: 15px;"><div
				class="uploadResult">
				<ul></ul>
			</div>${board.content }</td>
	</tr>
	</div>



</table>
<c:forEach var="getReply" items="${getReply}">
	<table class="table2">


		<tr>

			<td>댓글&nbsp;<c:out value="${getReply.replyCnt }" /></td>
			<sec:authorize access="isAuthenticated()">
				<td><button id="addReplyBtn"
						style="float: right;" class="button button1"
						onclick="document.getElementById('id01').style.display='block'">댓글
						작성</button></td>
			</sec:authorize>
		</tr>


	</table>
</c:forEach>

<div style="font-size: 15px;">
	<ul class="chat" style="margin-left: 15px; margin-right: 15px;">

		<!-- start reply -->
		<li class="left clearfix" data-rno='12'>
			<div></div>
		</li>
		<!-- end reply -->
	</ul>
	<!-- ./ end ul -->
</div>



<%-- <input type = "hidden" name = "userId" value = "${board.userId }"/> --%>






<a href="#"><img src="../resources/images/community/board.png"
	alt="..." width="40px" height="39px" class="img2"
	style="float: left; margin-left: 10px;" data-oper='list'></a>

<form id='operForm' action="/board/modify" method="get">
	<input type='hidden' id='bno' name='bno'
		value='<c:out value = "${board.bno }"/>'> <input type="hidden"
		name='pageNum' value='<c:out value = "${cri.pageNum }"/>'> <input
		type="hidden" name='amount' value='<c:out value = "${cri.amount }"/>'>
	<!-- 키워드와 타입 추가 -->
	<input type='hidden' name='keyword'
		value='<c:out value = "${cri.keyword }"/>'> <input
		type='hidden' name='type' value='<c:out value = "${cri.type }"/>'>
</form>

<div class="footer1"></div>

<!-- Modal -->
<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-animate-top w3-card-4"
		style="font-size: 20px; width: 550px;">
		<header class="w3-container w3-teal">
			<span onclick="document.getElementById('id01').style.display='none'"
				class="w3-button w3-display-topright">&times;</span>
			<h2>댓글 작성</h2>
		</header>
		<br />
		<div class="w3-container">
			<label>내용</label> <input class="form-control" name='replyContent'
				value='New Reply!!!!' placeholder="내용을 입력해주세요">
			<hr>
			<label>아이디</label> <input class="form-control" name='userId' readonly
				value='userId' placeholder="아이디를 입력해주세요">
		</div>
		<br />

		<footer class="w3-container w3-teal">
			<sec:authentication property="principal" var="pinfo" />
			<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.username eq board.userId }">
					<button id='modalModBtn' type="button" class="button2">수정</button>
					<button id='modalRemoveBtn' type="button" class="button2">삭제</button>
				</c:if>
			</sec:authorize>
			<button id='modalRegisterBtn' type="button" class="button2">등록</button>
			<!-- <button id='modalCloseBtn' type="button" >닫기</button> -->

		</footer>

	</div>
</div>
</div>

<div class="panel-footer"></div>

<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $('#operForm');
		$('a img[data-oper="modify"]').on("click", function(e) {
			operForm.attr("action", "/board/modify").submit();
		});

		$('a img[data-oper="list"]').on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();

		});

		var bnoValue = '<c:out value="${board.bno}"/>';
		//댓글 조회
		//ul태그
		var replyUL=$(".chat")
		//showList 함수 호출
		showList(1);
		
		function showList(page) {
	        replyService.getList(
	                    {
	                       bno : bnoValue, page : page || 1
	                    },function(replyCnt, list) {
	                    	console.log("replyCnt:"+replyCnt);
	                        console.log("list:"+list);
	                        if(page==-1){
	                           pageNum = Math.ceil(replyCnt/5.0);
	                           showList(pageNum);
	                           return;
	                        }
	                    	
	                    	
	                        var str = ""
	                        if (list == null
	                              || list.length == 0) {
	                  
	                           return;
	                        }
	                        for (var i = 0, len = list.length || 0; i < len; i++) {
	                        	 str += "<li data-rno='"+list[i].rno+"'>"
	                             str += "<div><div><strong>"
	                                   + list[i].userId
	                                   
	                                   + "</strong>"
	                             str += "<small style = 'float:right'>"
	                                   + replyService
	                                         .displayTime(list[i].replyDate)
	                                   + "</small></div>"
	                             str += "<p>"
	                                   + list[i].replyContent
	                                   + "</p></div></li><hr>"
	                         }
	                        replyUL.html(str);
	                        showReplyPage(replyCnt);
	                    }); //function call
		}//showList
		
		
 	    var modal = $("#id01");  
 	//모달창 팝업
		var modalInputReplyContent = modal.find("input[name='replyContent']");
		var modalInputUserId = modal.find("input[name='userId']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
	                        
		//작성자 null로 선언
	    var userId = null;
	    
	    //로그인 확인하고, 로그인 사용자를 userId에 넣는다
	    <sec:authorize access = "isAuthenticated()">
	        userId = '<sec:authentication property="principal.username"/>';
	    </sec:authorize>
	    
	    //ajax 전송시, 'x-csrf-token' 같은 헤더 정보를 추가해서 csrf 토큰값 전달
	    var csrfHeaderName = "${_csrf.headerName}";
	    var csrfTokenValue = "${_csrf.token}";
	    
		//새로운 댓글 등록 버튼 클릭 시
		$("#addReplyBtn").on("click",function(e){
			modal.find("input").val("");
			
			//replyer (security id가 담긴)
			modal.find("input[name='userId']").val(userId); 
			
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id!='modalCloseBtn']").hide();
			modalRegisterBtn.show();
		   /*  $(".w3-modal").modal("show");    */
		   
		});                    
	                        

		//ajax에 beforeSend 추가 전송 방식말고 기본설정으로 지정해서 사용
	    $(document).ajaxSend(function(e, xhr, options){
	        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	    });    
		
		modalRegisterBtn.on("click", function(e){
			var reply = {
					replyContent : modalInputReplyContent.val(),
					userId : modalInputUserId.val(),
					bno : bnoValue
			};
			
			replyService.add(reply, function(result){
				
			
				modal.find("input").val("");
				$(".w3-modal").css('visibility', 'hidden');
				location.reload();
				showList(pageNum);
			});
		});
		
		//특정 댓글의 클릭 이벤트
		$(".chat").on("click","li",function(e){
			var rno = $(this).data("rno");
			replyService.get(rno,function(reply){
				modalInputReplyContent.val(reply.replyContent);
				modalInputUserId.val(reply.userId);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
				.attr("readonly","readonly");
				modal.data("rno",reply.rno);
				
				modal.find("button[id!='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				document.getElementById('id01').style.display='block'

				
			});
		});
		
		// 댓글 수정/삭제 처리 이벤트
		//수정
		modalModBtn.on("click",function(e){
			
			var originalUserId = modalInputUserId.val();
			
			var reply = {
					rno:modal.data("rno"),
					replyContent:modalInputReplyContent.val(),
					userId:modalInputUserId.val()
					};
			
			if(!userId){
	            alert("로그인 후 수정 가능");
	           /*  modal.modal("hide"); */
	           $(".w3-modal").css('visibility', 'hidden');
			location.reload();
	            return;
	        }
			
			console.log("Orginal userId : " + originalUserId); //원래 댓글 작성자
	        if(userId != originalUserId){
	            alert("자신이 작성한 댓글만 수정 가능");
	            $(".w3-modal").css('visibility', 'hidden');
				location.reload();
	            return;
	        }	
			
			replyService.update(reply, function(result){
				alert("댓글이 수정되었습니다");
				$(".w3-modal").css('visibility', 'hidden');
				location.reload();  
				showList(pageNum); //댓글이 포함된 페이지로 이동
			});
		});
			
		//삭제
		modalRemoveBtn.on("click",function(e){
			var rno = modal.data("rno"); 
			
			 if(!userId){
		            alert("로그인 후 삭제 가능");
		           /*  modal.modal("hide"); */
		           $(".w3-modal").css('visibility', 'hidden');
				location.reload();
		            return;
		        }
			 
			 var originalUserId = modalInputUserId.val();
		        console.log("Orginal userId : " + originalUserId); //원래 댓글 작성자
		        if(userId != originalUserId){
		            alert("자신이 작성한 댓글만 삭제 가능");
		            $(".w3-modal").css('visibility', 'hidden');
					location.reload();
		            return;
		        }	
			 
			replyService.remove(rno, originalUserId,function(result){
				alert("댓글이 삭제되었습니다");
				$(".w3-modal").css('visibility', 'hidden');
				location.reload();
				showList(pageNum);//댓글이 포함된 페이지로 이동
				});
			
		});
		
		//댓글의 페이지 번호 처리
		var pageNum=1;
	    var replyPageFooter = $(".footer1");
	    function showReplyPage(replyCnt){
	       console.log("showReplyPage:"+replyCnt);
	       var endNum =Math.ceil(pageNum/5.0)*5;
	       var startNum =endNum-4;
	       var prev =startNum !=1;
	       var next =false;
	       if(endNum * 5 >= replyCnt){
	          endNum = Math.ceil(replyCnt/5.0);
	       }
	       if(endNum * 5 <replyCnt){
	          next = true;
	       }
	       var str ="<ul class = 'ul'>";
	       if(prev){
	          str +="<li class='paginate_button'><a href='"+(startNum-1)+"'>&laquo;&laquo;</a></li>";
	       }
	       for(var i =startNum;i<=endNum;i++){
	          var active = pageNum ==i? "active":"";
	          str +="<li class='paginate_button "+active+" '><a href='"+i+"'>"+i+"</a></li>";
	       }
	       if(next){
	          str +="<li class='paginate_button'><a href='"+(endNum+1)+"'>&raquo;&raquo;</a></li>";
	       }
	       str+= "</ul>";

	       replyPageFooter.html(str);
	    }//showReplyPage
		
	  //페이지 번호 클릭 시
	    replyPageFooter.on("click","li a",function(e){
	        e.preventDefault();
	        console.log("page click");
	        var targetPageNum =$(this).attr("href");
	        console.log("targetPageNum:"+targetPageNum);
	        pageNum = targetPageNum;
	        showList(pageNum);
	     });
		
	  //게시물 조회 시 파일 관련 자료를 JSON 데이터로 만들어서 화면에 전송
	   var bno = '<c:out value = "${board.bno}"/>';
	    $.getJSON("/board/getAttachList", {bno : bno}, function(arr) {
	    	console.log(arr);
	    	
	    	 var str = "";
				$(arr).each(function(i, obj) {
					if(!obj.fileType) {	//이미지가 아닌 경우
						
						  var fileCallPath = encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
						  str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
				          + obj.fileName + "'data-type='" + obj.fileType + "'><div>";
				          str += "<img src='/resources/images/attach.png'>";
				          str += "</div></li>";
				        
			    		   
					} else { //이미지인 경우
						
						  var fileCallPath = encodeURIComponent( obj.uploadPath+"/s_"+ obj.uuid +"_"+obj.fileName);            
				          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				          str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
				          + obj.fileName + "'data-type='" + obj.fileType + "'><div>";				          
				          str += "<img src='/display?fileName="+ fileCallPath +"'>";
				          str += "</div></li>";
					}
				});
				$(".uploadResult ul").html(str);
	    	
	    });
	        
		
		
		/* 		//댓글 추가
		 replyService.add({
		 reply_content :"JS TEST",
		 userId : "js tester",
		 bno:bnoValue}
		 , function(result){
		 alert("RESULT : "+result); 
		
		 }) */

		/* 	//댓글 조회
		 replyService.getList(
		 {bno:bnoValue , page:1}		
		 ,function(list){
		 for(var i = 0 , len = list.length||0; i<len;i++){
		 console.log(list[i]);
		 }
		 });  */

/* 		//댓글 삭제
		replyService.remove(12, function(count) {
			console.log(count);
			if (count === "success") {
				alert("REMOVED");
			}
		}, function(err) {
			alert("error occured....");
		}); */
		
		/* //댓글 수정
		 replyService.update({
			rno : 3,
			bno : bnoValue,
			reply_content : "modified reply..."
		}, function(result){
			alert("수정 완료");
		});  
		 */
		
		/* //특정 댓글 조회
			replyService.get(3,function(data){
				console.log(data);
			});  */
		
	});//end javascript
</script>

<script src="/resources/js/reply.js?ver=4"></script>

</body>
</html>