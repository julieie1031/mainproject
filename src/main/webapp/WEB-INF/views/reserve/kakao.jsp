<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</head>
<body>
<%@include file="../layout/header2.jsp"%>


<div class="jb-medium">결제완료</div>

<form action="../reserve/kakao" method="POST">
<input type="hidden" name="reserId" value="${resrtId}"> 
<input type="hidden" name="restName" value="${restName}"> 
<input type="hidden" name="roomName" value="${roomName}"> 
<input type="hidden" name="roomPeople" value="${roomPeople}"> 
<input type="hidden" name="roomPrice" value="${roomPrice}"> 
<input type="hidden" name="startDate" value="${startDate}"> 
<input type="hidden" name="endDate" value="${endDate}"> 
<input type="hidden" name="dogType" value="${dogType}"> 
<input type="hidden" name="dogNumber" value="${dogNumber}"> 
<input type="hidden" name="userId" value="${userId}"> 
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" value="확인">
</form>

<div class="jb-medium">확인버튼까지 눌러주셔야 예약이 정상적으로 완료가 됩니다.</div>

 <%@include file="../layout/footer.jsp"%>
</body>
</html>