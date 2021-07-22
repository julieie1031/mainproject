<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>
<link href="/resources/css/w3school.css" rel="stylesheet"
	type="text/css" />

<style>
*{margin: 0; padding: 0;}
.table-x {
margin-left: 15px;
	height: 300px;
	width: 460px;
}
.jb-x-small { font-size: x-small; }
.jb-medium { font-size: medium; }
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
    clear:both;


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
	cursor:pointer;
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
  
.checkInOut{
    padding: 10px;
    width: 450px;
    text-align: center;
}

.checkInOut table td input{
border: none;
width: 100px;
height: 30px; 
font-size: 15px; 
text-align:center;

}

.roomInfo{
	margin:10px;
	width: 470px;
	border-collapse: collapse;
}

.roomInfo td{
	padding: 5 0 5 0;
}

.imageinfo{
	width:200px;

	margin:13px;
}

.imageInfo img{
    width: 200px;
    height: 150px;
    border-radius: 5px;
}

.infoContent {
	display:block; 
    background: #50627F;
    color: #fff;
    text-align: center;
    width:160px;
    height: 24px;
    line-height:22px;
    border-radius:4px;
    padding:0px 10px;
   	font-size:13px;
}
</style>
<%@include file="../layout/header2.jsp"%>

<div>

	<img src="../../resources/images/hotel/${vo.restImage}" width="495" height="300">
	
       
     <table class="table-x" style="height: 100px; width: 450px;  border-collapse: collapse; ">

         <tr align="left">
             <td style="font-weight:bold"class="text-a">${vo.restName}</td>
         </tr>
         <tr>
         	<td><div id="starView" style="float: left;">★</div>${vo.starAvg }</td>
         </tr>
     
         <tr align="left">
         	<td>${vo.restContent}</td>
         </tr>
     </table>
     
      <div class="empty"></div>


	<div class="checkInOut">
		<table>
			<tr>
				<td>
				<input type="text" name="startDate" id="datepicker1"placeholder="Check-In" /></td>
				<td style="width: 200px;">
					<input type="text" name="endDate" id="datepicker2" placeholder="Check-Out" /></td>
			</tr>

		</table>

	</div>



	<c:forEach var="vo" items="${room}">
	
		
		<div>
		<table class="roomInfo">
		<%-- 수용인원: ${vo.roomPeople}<br> --%>
			<tr>
				<td class="imageInfo"><img src="../resources/images/hotel/${vo.roomImage}"></td>
				<td style="padding-left: 10px; vertical-align: top;"
    			onclick="javascript:getInputValue('${vo.restId}','${vo.roomId}');">
    			<b>${vo.roomName}</b><br>
    			&nbsp;<br>
    			${vo.roomDescription }<br>
    			${vo.roomPeople}
    			</td>
			</tr>
			<tr style="border-bottom:1px solid #eee;">
				<td colspan="2" class="text-b"><b>${vo.roomPrice}원</b></td>
			</tr>

		</table>
		
		<form name="form1" method="get" action="/reserve/list">
                      	<input type="hidden" name="restId" value="${vo.restId}"/>
                      	<input type="hidden" name="roomId" value="${vo.roomId}"/>
		</form> 
		</div>
	</c:forEach>
 </div>
 
 <input type="hidden" name="restAddress" value="${vo.restAddress}"/>
 <input type="hidden" name="restName" value="${vo.restName}"/>
 
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
		
		<P id="star2" style="padding: 0.01em 16px;"> <p>
		
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

 <div class="empty" style="height:20px"></div>

<div style="margin-top:10px;">

 <div class="title" style="margin-left:10px; margin-bottom:15px">오시는길</div>

<div id="map" style="width:470px;height:350px; font-size:10px; margin: 15px;"></div>

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
					str += "<small class='reviewDateDiv'>"+reviewService.timeForToday(list[i].reviewDate)
							+"</small></div>";
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
		var modalStar = modal.find("#star a").attr('value');
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		var reviewer = null;
		<sec:authorize access="isAuthenticated()">
          reviewer='<sec:authentication property="principal.username"/>';
          </sec:authorize>

		var csrfHeaderName="${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		if(reviewer != null){
	    	$("#addReviewBtn").show();
	    }else{
	    	
	    	$("#addReviewBtn").hide();
	    }
		//리뷰등록 클릭 시 
		$("#addReviewBtn").on("click",function(e){
			
			modal.find("input").val("");
			modal.find("input[name='reviewer']").val(reviewer);
			//닫기 버튼 빼고 다 숨김
			modal.find("button[id !='modalCloseBtn']").hide();
			//등록 버튼 보여줌
			modalRegisterBtn.show();
			
			/* $(".w3-modal").modal("show"); */
			
		}); //addReviewBtn 클릭 시
		
		
		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		});
		
		//리뷰 추가 처리
		modalRegisterBtn.on("click",function(e){
			
			var review={	
					review:modalInputReview.val(),
					reviewer:modalInputReviewer.val(),
					restId:restIdValue,
					star:starValue
					};
			reviewService.add(review,function(result){
				
				modal.find("input").val("");
				$(".w3-modal").css('visibility', 'hidden');
				location.reload();
				showList(1);
				
			});
						
		});
		
		//특정 리뷰 클릭
		$(".chat").on("click","li",function(e){
			var originalReviewer = modalInputReviewer.val();
			var reno = $(this).data("reno");
			var reviewUL = $('#star2');
			var str='';
			reviewService.get(reno,function(review){
				
				
				
				modalInputReview.val(review.review);
				modalInputReviewer.val(review.reviewer);
				modal.data("reno",review.reno);
				
				modal.find("button[id !='modalCloseBtn']").hide();
				if(reviewer==null || reviewer !=originalReviewer){
					$('#star').hide();
					if(review.star == 1){
						str += '<div id="starView">★</div>'
						
					}else if(review.star ==2){
						str += '<div id="starView">★★</div>'
					}
					else if(review.star ==3){
						str += '<div id="starView">★★★</div>'
					}
					else if(review.star ==4){
						str += '<div id="starView">★★★★</div>'
					}
					else if(review.star ==5){
						str += '<div id="starView">★★★★★</div>'
					}
					reviewUL.html(str);
					
					modalModBtn.hide();
					modalRemoveBtn.hide();
	             }else{
	            	 $('#star').show();
	            	 $('#star2').hide();
	            	 modalModBtn.show();
	 				 modalRemoveBtn.show();
	             }
				
				
				document.getElementById('id01').style.display='block'
				
				
			});
		});
		
		
		//리뷰 수정,삭제 이벤트 처리
		modalModBtn.on("click",function(e){
			var review= {reno:modal.data("reno"), review:modalInputReview.val(),
					star:starValue,reviewer:originalReviewer};
			
			reviewService.update(review,function(result){
			
				$(".w3-modal").css('visibility', 'hidden');
				location.reload();
				showList(1);
			});
		});
		
		
		modalRemoveBtn.on("click",function(e){
			var reno = modal.data("reno");
			reviewService.remove(reno,function(result){
				
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

<!-- 리뷰 끝 -->


<%@include file="../layout/footer.jsp"%>
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


<!-- 맵 -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27898b804bcd7311092722c6048cf498&libraries=services"></script>
<script>

var address = $("input[name='restAddress']").val();
var restName = $('input[name="restName"]').val();

console.log(address);
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div class="infoContent">'+restName+'</div>'
            
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

</body>
</html>