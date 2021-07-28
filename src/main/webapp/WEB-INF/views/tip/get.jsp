<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>    
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	font-size: 17px;
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
<script>
$(document).ready(function() {
	var operForm = $('#operForm');
	$('a img[data-oper="modify"]').on("click", function(e) {
		operForm.attr("action", "/tip/modify").submit();
	});

	$('a img[data-oper="list"]').on("click", function(e) {
		operForm.find("#tno").remove();
		operForm.attr("action", "/tip/list");
		operForm.submit();

	});

	var bnoValue = '<c:out value="${tip.tno}"/>';

	
	var tno = '<c:out value = "${tip.tno}"/>';
    $.getJSON("/tip/getAttachList", {tno : tno}, function(arr) {
    	console.log(arr);
    	
    	 var str = "";
			$(arr).each(function(i, obj) {
				if(!obj.fileType) {
					
					  var fileCallPath = encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
					  str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
			          + obj.fileName + "'data-type='" + obj.fileType + "'><div>";
			          str += "<img src='/resources/images/attach.png'>";
			          str += "</div></li>";
			        
		    		   
				} else {
					
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
});
</script>
<body>
<%@include file="../layout/header3.jsp"%>

<div class="carousel-item active"></div>


<!-- <img src="../resources/images/community/submit.png" alt="..."
		width="40px" height="40px" align="right" class = "img1" type = "submit"> -->


<sec:authentication property="principal" var="pinfo" />
<sec:authorize access="isAuthenticated()">
	<c:if test="${pinfo.username eq tip.userId }">
		<a href="#"><img src="../resources/images/community/register.png"
			alt="..." width="40px" height="39px" class="img1" data-oper='modify'></a>
	</c:if>
</sec:authorize>


<table class="table1">
	<tr style="margin-top: 10px;">
		<td style="font-weight: bold; font-size: 20px;">${tip.tipTitle }</td>
	</tr>
	<tr>
		<td style ="padding-top:5px; font-size:15px;">${tip.userId }&nbsp;&nbsp;&nbsp;<img src="../resources/images/community/hit.png" alt="..."
			width="15px" height="15px" style="padding-left: 4px;">&nbsp;&nbsp;</td>
		</td>
	</tr>
	<tr>
		<td style="border-bottom: 1px solid #d9d9d9; padding-bottom: 15px; font-size:15px;">
			
			<fmt:formatDate
				pattern="yyyy-MM-dd HH:MM:ss" value="${tip.tipUpdateDate}" />
		</td>
	</tr>
	<tr>
		<td style="width: 500px; padding-bottom: 15px;"><div
				class="uploadResult">
				<ul></ul>
			</div>${tip.tipContent }</td>
	</tr>



</table>

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

<a href="#"><img src="../resources/images/community/board.png"
	alt="..." width="40px" height="39px" class="img2"
	style="float: left; margin-left: 10px;" data-oper='list'></a>

<form id='operForm' action="/tip/modify" method="get">
	<input type='hidden' id='tno' name='tno'
		value='<c:out value = "${tip.tno }"/>'> <input type="hidden"
		name='pageNum' value='<c:out value = "${cri.pageNum }"/>'> <input
		type="hidden" name='amount' value='<c:out value = "${cri.amount }"/>'>
	<!-- 키워드와 타입 추가 -->
	<input type='hidden' name='keyword'
		value='<c:out value = "${cri.keyword }"/>'> <input
		type='hidden' name='type' value='<c:out value = "${cri.type }"/>'>
</form>

<div class="footer1"></div>

</div>

<div class="panel-footer"></div>
</body>
</html>