<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/resources/css/w3school.css" rel="stylesheet"
	type="text/css" />

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<style>
*{margin: 0; padding: 0;}
.table-x {
margin-left: 15px;
	height: 300px;
	width: 460px;
}
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
    cursor: pointer;
}

.review_body{

}

.empty{
    width: 100%;
    height: 10px;
    background: #f1f0f0;


}

.button2 {
    background: #f1f1f1;
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
}

#id01 input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	width: 500px;
	height: 30px;
	font-size: 15px;
}

.reviewDiv{
	padding: 10px 0px 10px 0px;

}

.reviewDateDiv{
	float: right;

}

.chat{

	margin-top: 10px;
}

#star{
	padding: 0.01em 16px;
}

#star a{  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #7e7d7b;}
#star a.on{  color: #fff58c;
  -webkit-text-fill-color: gold;}
  
 
#starView{
	color: gold;
  }
</style>
<%@include file="layout/header2.jsp"%>

<div>
    <table>
        <tr>
		    <td> 
		        <img src="../../resources/images/hotel/${vo.restImage}" width="495" height="300">
		    </td>
	    </tr>
    </table>
       
     <table class="table-x" style="height: 300px; width: 460px;">

         <tr align="center">
             <td colspan="5" class="text-a"><br><b>${vo.restName}</b><br><br><br><hr><br><small class="jb-medium"><b>객실정보</small></td>
         </tr>
     
         <tr align="center">
             <td rowspan="3"><img src="../../resources/images/hotel/${vo.restImage}" width="120" height="110"></td>
          </tr>
         <tr align="center">
         	<td>${vo.restContent}</td>
         </tr>
         <tr>
         	<td class="text-b"><%-- ${vo.restNumber}<br>${vo.restPrice} --%></td>
         </tr>

		<tr>
			<td colspan="1" style="text-align: right; padding-right: 15px;">체크인</td>
			<td colspan="2" style="text-align: center;">체크아웃</td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="startDate" id="datepicker1" style="text-align: center;"/></td>
			<td colspan="2" style="width: 200px;"><input type="text" name="endDate" id="datepicker2" style="text-align: center;"/></td>
		</tr>

     </table>
                
                

<c:forEach var="vo" items="${room}">
		<table>
			<tr>
				<td>
					<img src="../resources/images/hotel/${vo.roomImage}"
					width="495" height="300">
				</td>
			</tr>
		</table>


		<table class="table-x">
			<tr align="center">
				<td colspan="5" class="text-a"><br><b>${vo.roomName}</b><br>
					<br> <br>
					<hr> <br> <small class="jb-medium"><b>객실정보</b></small></td>
			</tr>

			<tr align="center">
				<td rowspan="3"><img src="../resources/images/hotel/${vo.roomImage}"
					width="120" height="110"></td>
			</tr>
			<tr align="center">
				<td>${vo.roomDescription}</td>
			</tr>
			<tr>
				<td class="text-b">수용인원: ${vo.roomPeople}<br>객실가격: ${vo.roomPrice}원</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<form name="form1" method="get" action="/reserve/list">
					  	<input type="hidden" name="id" value="${id}"/>
                      	<input type="hidden" name="restId" value="${vo.restId}"/>
                      	<input type="hidden" name="roomId" value="${vo.roomId}"/>
                    	<input type="button" onclick="javascript:getInputValue('${vo.restId}','${vo.roomId}');" value="예약하기"/>
					</form> 
				</td>
			</tr>

		</table>
	</c:forEach>
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
		<P id="star"> <!-- 부모 --> 
		<a href="#" value="1">★</a> <!-- 자식들--> 
		<a href="#" value="2">★</a> 
		<a href="#" value="3">★</a> 
		<a href="#" value="4">★</a> 
		<a href="#" value="5">★</a> <p>
		
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
			

		</footer>

	</div>
</div>
 
 <div class="empty"></div>
 
 
 <div class="review">

	<div class="title">
	REVIEW
	</div>
	
	
	<div class="review_header">
		<button type="button" id="addReviewBtn" onclick="document.getElementById('id01').style.display='block'">리뷰작성</button>
	</div>

	<div class="review_body" >
		<ul class="chat" id="reviews">
		
		</ul>
	</div>
	
	
	<a href="#" title="" id="results-show-more">show more</a>

</div>
 

<script type="text/javascript" src="/resources/js/review.js"></script>

<script>




</script>

<script>
	$(document).ready(function(){
		
		var restIdValue = '<c:out value="${vo.restId}"/>';
		var starValue;
		var reviewUL = $(".chat");
		var length=0;
		
		showList(1);
		
		function showList(page){
			
			reviewService.getList({restId:restIdValue,page:page||1},function(list){
				var str = "";
				length = list.length;
				console.log("aaa"+length);
				if(list == null || list.length == 0){
					reviewUL.html("");
					return;
				}
				for(var i = 0, len = list.length || 0 ; i <len; i++){
					
					str += "<li data-reno='"+list[i].reno+"'>";
					if(list[i].star == 1){
						str += '<div id="starView">★</div>'
					}else if(list[i].star ==2){
						str += '<div id="starView">★★</div>'
					}
					else if(list[i].star ==3){
						str += '<div id="starView">★★★</div>'
					}
					else if(list[i].star ==4){
						str += '<div id="starView">★★★★</div>'
					}
					else if(list[i].star ==5){
						str += '<div id="starView">★★★★★</div>'
					}
					str += "<div><div class='reviewerDiv'><strong>"+list[i].reviewer+"</strong>";
					str += "<small class='reviewDateDiv'>"+reviewService.timeForToday(list[i].reviewDate)+"</small></div>";
					str += "<p class='reviewDiv'>"+list[i].review+"</p></div><hr></li>";
				}
				
				
				
				
				reviewUL.html(str);
				
				
				var limit = 5;
				var per_page = 5;
				console.log("length:"+length);
				for(var i = limit ; i <=length;i++){
					$('#reviews > li:nth-child('+i+')').hide();
				}
				
				
				
				if (length <= limit) {
				    $('#results-show-more').hide();
				};
				$('#results-show-more').bind('click', function(event){
				    event.preventDefault();
				    limit += per_page;
				    for(var i = 1 ; i <= limit;i++){
						$('#reviews > li:nth-child('+i+')').show();
					}
				  
				    if (length <= limit) {
				        $(this).hide();
				    }
				});
				
			});//getList function 끝
			
			
			
		}//showList 끝
		
		
		console.log(length);
		
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
			
			/* $(".w3-modal").modal("show"); */
			
		}); //addReviewBtn 클릭 시
		
		//리뷰 추가 처리
		modalRegisterBtn.on("click",function(e){
			
			var review={	
					review:modalInputReview.val(),
					reviewer:modalInputReviewer.val(),
					restId:restIdValue,
					star:starValue
					};
			reviewService.add(review,function(result){
				alert(result);
				
				modal.find("input").val("");
				$(".w3-modal").css('visibility', 'hidden');
				location.reload();
				showList(1);
				
			});
						
		});
		
		//특정 리뷰 클릭
		$(".chat").on("click","li",function(e){
			
			var reno = $(this).data("reno");
			
			reviewService.get(reno,function(review){
				
				
				modalInputReview.val(review.review);
				modalInputReviewer.val(review.reviewer);
				modal.data("reno",review.reno);
				
				modal.find("button[id !='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				document.getElementById('id01').style.display='block'
				
				
			});
		});
		
		
		//리뷰 수정,삭제 이벤트 처리
		modalModBtn.on("click",function(e){
			
			var review= {reno:modal.data("reno"), review:modalInputReview.val(),star:starValue};
			
			reviewService.update(review,function(result){
				alert(result);
				$(".w3-modal").css('visibility', 'hidden');
				location.reload();
				showList(1);
			});
		});
		
		
		modalRemoveBtn.on("click",function(e){
			
			var reno = modal.data("reno");
			
			reviewService.remove(reno,function(result){
				
				alert(result);
				$(".w3-modal").css('visibility', 'hidden');
				location.reload();
				showList(1);
				
			});
		});
		
		
		$('#star a').click(function(){ 
			$(this).parent().children("a").removeClass("on"); 
			$(this).addClass("on").prevAll("a").addClass("on"); 
			starValue= $(this).attr("value"); 
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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker1,#datepicker2").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
       		
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)      
           
   });
   
</script>

<script>
	function getInputValue(restId, roomId) {
		var startDate = $('input[name=startDate]').val();
		var endDate = $('input[name=endDate]').val();
		window.location.href = "/reserve/list?restId="+restId+"&roomId="+roomId+"&startDate="+startDate+"&endDate="+endDate;
	}
</script>

</body>
</html>