<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--     <%@ taglib prefix="fmt" uri=" http://java.sun.com/jsp/jstl/fmt "%> --%>
<link href="/resources/css/w3school.css" rel="stylesheet"
	type="text/css" />

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<style>
*{margin: 0; padding: 0;}
.table-x {margin-left: 20px;}
.jb-x-small { font-size: x-small; }
.jb-medium { font-size: medium; }
.text-a {text-align: left;}
.text-b {text-align: right;}
a {
  text-decoration-line: none;
  color: black;
 }
 
 
.review{
	margin:20px;
	font-size:15px;
}

.title{
    font-size: 15px;
    font-weight: bold;

}

.review_header{
text-align: right;

}

.review_header button{
	padding: 4px;
    border: 0.8px solid #9dbe9d;
    background: #abd3ab;
    font-family: 'S-CoreDream-3Light';
}

.review_body{

}

.empty{
    width: 100%;
    height: 10px;
    background: #f1f0f0;


}


</style>






<%@include file="layout/header2.jsp"%>
<div>
    <table>
        <tr>
            <td> 
                <img src="../../resources/images/hotel/${vo.restImage}" width="495" height="300">
            </td>
            </table>
 
            <td>
                <table class="table-x" style="height: 300px; width: 460px;">
                    <tr align="center">
                        <td colspan="5" class="text-a"><br><b>${vo.restName}</b><br><br><br><hr><br><small class="jb-medium"><b>객실정보</small></td>
                    </tr>
                
                    <tr align="center">
                        <td rowspan="3"><img src="../../resources/images/hotel/${vo.restImage}" width="120" height="110"></td>
                       <%--  <td><fmt:formatNumber value="${vo.restPrice}" pattern="###,###,###"/></td> --%>
                    </tr>
                    <tr align="center">
                    <td>${vo.restContent}</td>
                    </tr>
                    <tr>
                    <td class="text-b"><%-- ${vo.restNumber}<br>${vo.restPrice} --%></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                           <form name="form1" method="get" action="/room/list">
                            	<input type="hidden" name="id" value="${id}">
                                <input type="hidden" name="restId" value="${vo.restId}">
                                <input type="submit" value="예약하기">
                            </form>
                             <a href="javascript:history.back();">이전으로</a>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>

 </div>
 
 
 
 <!-- 리뷰 -->
 
 <!-- Modal -->
<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-animate-top w3-card-4"
		style="font-size: 20px; width: 550px;">
		<header class="w3-container w3-teal">
			<span onclick="document.getElementById('id01').style.display='none'"
				class="w3-button w3-display-topright">&times;</span>
			<h2>리뷰 작성</h2>
		</header>
		<br />
		<div class="w3-container">
			<label>내용</label> <input class="form-control" name='review'
				value='New Review' placeholder="내용을 입력해주세요">
			<hr>
			<label>아이디</label> <input class="form-control" name='reviewer'
				value='reviewer' placeholder="아이디를 입력해주세요">
		</div>
		<br />

		<footer class="w3-container w3-teal">

			<button id='modalModBtn' type="button" class="button2">수정</button>
			<button id='modalRemoveBtn' type="button" class="button2">삭제</button>
			<button id='modalRegisterBtn' type="button" class="button2">등록</button>
			<button id='modalCloseBtn' type="button" >닫기</button>

		</footer>

	</div>
</div>
 
 <div class="empty"></div>
 
 
 <div class="review">

	<div class="title">
	REVIEW
	</div>
	
	
	<div class="review_header">
		<button type="button" id="addReviewBtn">리뷰작성</button>
	</div>

	<div class="review_body">
		<ul class="chat">
		
		</ul>
	</div>

</div>
 

<script type="text/javascript" src="/resources/js/review.js"></script>


<script>
	$(document).ready(function(){
		
		var restIdValue = '<c:out value="${vo.restId}"/>';
		var reviewUL = $(".chat");
		
		showList(1);
		
		function showList(page){
			
			reviewService.getList({restId:restIdValue,page:page||1},function(list){
				var str = "";
				if(list == null || list.length == 0){
					reviewUL.html("");
					return;
				}
				for(var i = 0, len = list.length || 0 ; i <len; i++){
					str += "<li data-reno='"+list[i].reno+"'>";
					str += "<div><div><strong>"+list[i].reviewer+"</strong>";
					str += "<small>"+reviewService.displayTime(list[i].reviewDate)+"</small></div>";
					str += "<p>"+list[i].review+"</p></div></li>";
				}
				
				reviewUL.html(str);
			});//getList function 끝
		}//showList 끝
		
		
		//모달
		
		var modal = $("#id01");  
		var modalInputReview = modal.find("input[name='review']");
		var modalInputReviewer = modal.find("input[name='reviewer']");
		
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		//리뷰등록 클릭 시 
		$("#addReviewBtn").on("click",function(e){
			
			modal.find("input").val("");
			//닫기 버튼 빼고 다 숨김
			modal.find("button[id !='modalCloseBtn']").hide();
			//등록 버튼 보여줌
			modalRegisterBtn.show();
			
			
			 $(".w3-modal").modal("show");
			 console.log("성공");
			
		});
		
		
	});

	
	
	
	
	
	//리뷰 등록
	/* reviewService.add(
			{review:"JS test", reviewer:"tester",restId:restIdValue}
			,
			function(result){
				alert("RESULT: " + result);
			}
	); */
	
	//리뷰 목록
	/* reviewService.getList({restId:restIdValue,page:1},function(list){
		
		for(var i = 0 , len = list.length||0; i<len ; i++){
			console.log(list[i]);
		}
	}); */
	
	//리뷰 삭제
	/* reviewService.remove(21,function(count){
		
		console.log(count);
		
		if(count === "success"){
			alert("REMOVED");
		}
		
	}, function(err){
		alert(ERROR);	
	}); */
	
	//리뷰 수정
	/* reviewService.update({
		reno:2,
		restId:restIdValue,
		review:"Modified review..."
	}, function(result){
		alert("수정완료!");
	}); */
	
	//특정 리뷰 조회
	/* reviewService.get(10,function(data){
		console.log(data);
	})
 */

</script>


<%@include file="layout/footer.jsp"%>
</body>
</html>