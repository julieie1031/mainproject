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
	/* border-top: 1px solid #444444; */
	border-bottom: 1px solid #444444;
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

.btn_submit {
	background-image: url('../resources/images/community/submit.png');
	background-position: 0px 0px;
	background-repeat: no-repeat;
	width: 40px;
	height: 35px;
	cursor: pointer;
	outline: 0;
	float: right;
	margin-top: 35px;
	margin-bottom: 10px;
	margin-right : 10px;
}

input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}
.attach {
width : 42px;
height : 42px;
margin-top : 10px;
margin-left : 10px;
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

<form role="form" action="/board/register" method="post">
	<!-- <img src="../resources/images/community/submit.png" alt="..."
		width="40px" height="40px" align="right" class = "img1" type = "submit"> -->

	<input type="submit" value="" class="btn_submit">
<div class = "inputstyle">
	<table class="table1">
		<tr>
			<td height=50><input type="text" name="title"
				placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<td><textarea style="height: 300px; font-size : 15px;" name="content" 
					placeholder="내용을 입력해주세요"></textarea></td>
		</tr>

		<tr>
			<td><input type="text" name="userId" placeholder="작성자를 입력해주세요"></td>
		</tr>

	</table>
	</div>
	<table>
<tr>
<td><a id="" href="javascript:fnUpload();"><img src="../resources/images/community/attach.png" 
alt="찾아보기" class = "attach" /></a>
<input type="file" id="fileUpload" style="display:none" onchange="$('#fileNm').val(this.value)"/></td>
<td><input type="text" id="fileNm" readonly style = "margin-left : 10px; margin-top : 20px;" placeholder = "사진을 첨부해주세요"/></td>
</tr>
</table>
<script>

function fnUpload(){

	$('#fileUpload').click();

}

</script>





</form>
</body>
</html>