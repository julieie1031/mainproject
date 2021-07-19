<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>

<style>
* {
	margin: 0;
	padding: 0;
}

.table-x {
margin-left: 15px;
	height: 300px;
	width: 460px;
}


.jb-medium {
	font-size: medium;
}

.text-a {
	text-align: left;
}

.text-b {
	text-align: right;
}

a {
	text-decoration-line: none;
	color: black;
}

.start{
	width: 215px;
	height:100px;
	font-size:14px;
	float:left;
	background: #f5f4f4;
	border-radius: 8px;
	text-align: left;
	line-height: 1.6;
}

.end{
	width: 215px;
	height:100px;
	font-size:14px;
	margin-left: 5px;
	background: #f5f4f4;
	border-radius: 8px;
	text-align: left;
    line-height: 1.6;
    float:left;
}

.dateDiv{

	margin: 20px;
    width: 160px;
    height: 60px;
    

}

.title {
	font-size: 14px;
    margin-bottom: 25px;
    color: #282828;
    font-weight: bolder;
}

.hotelInfo {
	background: #fff;
    font-size: 18px;
    clear: both;
    border-radius: 10px;
    height: 100px;
}

.empty{
    width: 100%;
    height: 5px;
    background: #f1f0f0;
    clear:both;
    margin:50 0 10 0;


}

.weatherInfo{
	width:450px; 
	margin: 25 0 10 25;
	height: 150px;
}

.reserInfo{
	clear:both; 
	font-size:13px;
	width:450px; 
	margin: 25 0 10 25;
	height: 250px;

}

input {
	border: none;
    width: 440px;
    border-bottom: 1px solid #e9e8e8;
    height: 30px;
    font-size: 15px;
    margin-bottom: 20px;
}


.pay{
	margin-bottom:10px;
	text-align:center;

}
</style>

<%@include file="../layout/header2.jsp"%>

<!-- 이미지 -->
<div>
<img src="../resources/images/hotel/${room[0].roomImage}" style="width: 100%;
    height: 250px;">
</div>


<!-- 호텔정보 -->
<div style="background: #f4f0f0; height: 100px; padding: 7px;">

	<div class="hotelInfo">
		<div style="font-size:8px; padding-left: 25px;
    padding-top: 20px;"><b >${vo.restName}</b></div>
		<div style="padding: 0 0 0 25;">
			${room[0].roomName} (${room[0].roomPeople})
		</div>
		<div style="margin-right:25px; text-align:right;font-weight: bold;">
			${room[0].roomPrice}원
		</div>
	</div>

</div>



<!-- 날짜 정보 -->

<div class="weatherInfo">

<div class="title">선택 날짜</div>

<div class="start">
	<div class="dateDiv">
    	<b style="color:#7b7878;font-size: 12px;">Check-In</b><br>
		${startDate}<br>
		15:00
	</div>

</div>

<div style="margin-left: 5px;
    font-size: 15px;
    padding-top: 40px;float:left;">-</div>

<div class="end">


<div class="dateDiv">
    <b style="color:#7b7878;font-size: 12px;">Check-Out</b><br>
		${endDate}<br>
		11:00
	</div>
</div>

</div>







<script src="/resources/js/kakao.js" type="text/javascript"></script>




<!-- 예약자 정보 -->

<div class="reserInfo">

<div class="title">예약자 정보</div>

<form method="post" action="/reserve/list">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="hidden" id="roomName" name="roomName" value="${room[0].roomName}"/>
<input type="hidden" id="roomPrice" name="roomPrice" value="${room[0].roomPrice}"/>
<input type="hidden" name="reserId" value="${RESER_ID}"/>
<input type="hidden" id="restName" name="restName" value="${vo.restName}"/>
<input type="hidden" id="restPhone" name="restPhone" value="${vo.restPhone}"/>
<input type="hidden" id="restId" name="restId" value="${vo.restId}"/>
<input type="hidden" id="roomPeople" name="roomPeople" value="${room[0].roomPeople}"/>
<input type="hidden" id="startDate" name="startDate" value="${startDate}"/>
<input type="hidden" id="endDate" name="endDate" value="${endDate}"/>
<input type="hidden" id="userId" name="userId" value="<sec:authentication property='principal.username'/>"/>

<div style="color: #797777;
    font-weight: bolder;">견 종</div>
<input type="text" name="dogType" id="dogType" placeholder="ex)말티즈"><br>
<div style="color: #797777;
    font-weight: bolder;">마리 수</div>
<input type="text" name="dogNumber" id="dogNumber" placeholder="ex)2"><br>
<div class="pay">
    <button style="border: none; background: #fff;"><img src="/resources/images/hotel/paymedium.png"></button>
</div>
</form>

</div>

<%@include file="../layout/footer.jsp"%>


</body>
</html>