<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	margin-top: 15px;
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
	margin-top: 34px;
	margin-right: 10px;
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
</style>


<%@include file="../layout/header.jsp"%>
<div class="carousel-item active"></div>


<!-- <img src="../resources/images/community/submit.png" alt="..."
		width="40px" height="40px" align="right" class = "img1" type = "submit"> -->

<a href= "#"><img
	src="../resources/images/community/register.png" alt="..." width="40px"
	height="39px" class="img1" data-oper='modify'></a>



<table class="table1">
	<tr style="margin-top: 10px">
		<td height=100;><input type="text" name="title"
			readonly="readonly" value='<c:out value = "${board.title }"/>'></td>
	</tr>
	<tr>
		<td><textarea style="height: 300px; font-size : 15px;" name="content"
				readonly="readonly"><c:out value="${board.content }" /></textarea></td>
	</tr>

	<%-- <tr>
			<td><input type="text" name="userId" readonly = "readonly" value = '<c:out value = "${board.userId }"/>'></td>
		</tr> --%>
	<!-- 
		<tr>
		<td><input type="file" name='uploadFile' multiple></td>
		</tr> -->
</table>

<a href= "#"><img
	src="../resources/images/community/board.png" alt="..." width="40px"
	height="39px" class="img2" align="left" data-oper='list'></a>

<form id='operForm' action="/board/modify" method="get">
	<input type='hidden' id='bno' name='bno' value='<c:out value = "${board.bno }"/>'>
		<input type = "hidden" name = 'pageNum' value = '<c:out value = "${cri.pageNum }"/>'>
		<input type = "hidden" name = 'amount' value = '<c:out value = "${cri.amount }"/>'>
		<!-- 키워드와 타입 추가 -->
		<input type = 'hidden' name = 'keyword' value = '<c:out value = "${cri.keyword }"/>'>
        <input type = 'hidden' name = 'type' value = '<c:out value = "${cri.type }"/>'>
</form>

<script src = "/resources/js/reply.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
	var operForm = $('#operForm');
	$('a img[data-oper="modify"]').on("click",function(e){
		operForm.attr("action","/board/modify").submit();
	});
	
	 $('a img[data-oper="list"]').on("click",function(e){
		operForm.find("#bno").remove();
		operForm.attr("action","/board/list");
		operForm.submit(); 
		
	});
});//end javascript
</script>


</body>
</html>