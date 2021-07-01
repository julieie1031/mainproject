<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	border-bottom: 1px solid #444444;
	margin-top: 87px;
	margin-bottom: 10px;
	width: 500px;
}

.table2 {
	margin-bottom: 20px;
	width: 500px;
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
	margin-top: 4px;
	margin-right: 7px;
	margin-bottom: 6px;
}

.img2 {
	position: relative;
	float: right;
	margin-top: 10px;
	margin-right: 10px;
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
	border: 3px solid #4CAF50;
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
}

.uploadResult {
	width: 100%;
}

.uploadResult ul {
	display: flex;
	flex-flow: column;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 450px;
	height: 300px;
}
</style>


<%@include file="../layout/header3.jsp"%>

<div class="carousel-item active"></div>


<!-- <img src="../resources/images/community/submit.png" alt="..."
		width="40px" height="40px" align="right" class = "img1" type = "submit"> -->

<a href="#"><img src="../resources/images/community/register.png"
	alt="..." width="40px" height="39px" class="img1" data-oper='modify'></a>



<table class="table1">
	<tr style="margin-top: 10px;">
		<td style="padding-bottom: 15px;">${board.title }</td>
	</tr>

	<tr>
		<td width=500px><div class="uploadResult">
				<ul></ul>
			</div>${board.content }</td>
	</tr>
	</div>
	<%-- <tr>
			<td><input type="text" name="userId" readonly = "readonly" value = '<c:out value = "${board.userId }"/>'></td>
		</tr> --%>
	<!-- 
		<tr>
		<td><input type="file" name='uploadFile' multiple></td>
		</tr> -->


</table>
<c:forEach var="getReply" items="${getReply}">
	<table class="table2">


		<tr>

			<td>댓글&nbsp;<c:out value="${getReply.replyCnt }" /></td>

			<td><button id="addReplyBtn" style="float: right;"
					class="button button1"
					onclick="document.getElementById('id01').style.display='block'">댓글
					작성</button></td>
		</tr>


	</table>
</c:forEach>
<hr>
<div style="font-size: 15px;">
	<ul class="chat">

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
			<label>내용</label> <input class="form-control" name='reply_content'
				value='New Reply!!!!' placeholder="내용을 입력해주세요">
			<hr>
			<label>아이디</label> <input class="form-control" name='userId'
				value='userId' placeholder="아이디를 입력해주세요">
		</div>
		<br />

		<footer class="w3-container w3-teal">

			<button id='modalModBtn' type="button" class="button2">수정</button>
			<button id='modalRemoveBtn' type="button" class="button2">삭제</button>
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
	                                         .displayTime(list[i].reply_date)
	                                   + "</small></div>"
	                             str += "<p>"
	                                   + list[i].reply_content
	                                   + "</p></div></li><hr>"
	                         }
	                        replyUL.html(str);
	                        showReplyPage(replyCnt);
	                    }); //function call
		}//showList
		
		
 	    var modal = $("#id01");  
 	//모달창 팝업
		var modalInputReply_Content = modal.find("input[name='reply_content']");
		var modalInputuserId = modal.find("input[name='userId']");
		var modalInputReply_Date = modal.find("input[name='reply_date']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
	                        
		//새로운 댓글 등록 버튼 클릭 시
		$("#addReplyBtn").on("click",function(e){
			modal.find("input").val("");
			modalInputReply_Date.closest("div").hide();
			modal.find("button[id!='modalCloseBtn']").hide();
			modalRegisterBtn.show();
		   /*  $(".w3-modal").modal("show");    */
		   
		});                    
	                        

		modalRegisterBtn.on("click", function(e){
			var reply = {
					reply_content : modalInputReply_Content.val(),
					userId : modalInputuserId.val(),
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
				modalInputReply_Content.val(reply.reply_content);
				modalInputuserId.val(reply.userId);
				modalInputReply_Date.val(replyService.displayTime(reply.reply_date))
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
			var reply = {
					rno:modal.data("rno"),
					reply_content:modalInputReply_Content.val()
					};
			replyService.update(reply,function(result){
				alert("댓글이 수정되었습니다");
				$(".w3-modal").css('visibility', 'hidden');
				location.reload();
				showList(pageNum); //댓글이 포함된 페이지로 이동
			});
		});
			
		//삭제
		modalRemoveBtn.on("click",function(e){
			var rno = modal.data("rno"); 
			
			replyService.remove(rno, function(result){
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
	       console.log(str);
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
				          + obj.fileName + "'data-type='" + obj.image + "'><div>";
				          str += "<img src='/resources/images/attach.png'>";
				          str += "</div></li>";
				        
			    		   
					} else { //이미지인 경우
						
						  var fileCallPath = encodeURIComponent( obj.uploadPath+"/s_"+ obj.uuid +"_"+obj.fileName);            
				          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				          str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
				          + obj.fileName + "'data-type='" + obj.image + "'><div>";				          
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

<script src="/resources/js/reply.js?ver=3"></script>

</body>
</html>