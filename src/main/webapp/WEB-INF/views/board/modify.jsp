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
	background-position: 0px 0px;
	background-repeat: no-repeat;
	width: 40px;
	height: 35px;
	cursor: pointer;
	outline: 0;
	float: right;
	margin-top: 35px;
	margin-bottom: 9px;
	margin-right: 10px;
	outline: 0;
	border: 0;
}

.btn_remove {
	background-position: 0px 0px;
	background-repeat: no-repeat;
	width: 40px;
	height: 38px;
	cursor: pointer;
	outline: 0;
	float: right;
	margin-top: 10px;
	margin-right: 10px;
	outline: 0;
	border: 0;
}

input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
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



<form role="form" action="/board/modify" method="post">

	<button type="submit" data-oper='modify' class='btn_submit'>
		<img src="../resources/images/community/submit.png">
	</button>
	<input type="hidden" name="bno" readonly="readonly"
		value='<c:out value = "${board.bno }"/>'>
		<input type = "hidden" name = 'pageNum' value = '<c:out value = "${cri.pageNum }"/>'>
		<input type = "hidden" name = 'amount' value = '<c:out value = "${cri.amount }"/>'>
		<!-- 키워드와 타입 추가 -->
		<input type = 'hidden' name = 'keyword' value = '<c:out value = "${cri.keyword }"/>'>
        <input type = 'hidden' name = 'type' value = '<c:out value = "${cri.type }"/>'>
        
        
	<table class="table1">

		<tr>
			<td height=100;><input type="text" name="title"
				value='<c:out value = "${board.title }"/>'></td>
		</tr>
		<tr>
			<td><textarea style="height: 300px; font-size : 15px;" name="content"><c:out
						value="${board.content }" /></textarea></td>
		</tr>

		<%-- <tr>
			<td><input type="text" name="userId" readonly = "readonly" value = '<c:out value = "${board.userId }"/>'></td>
		</tr> --%>
		<!-- 
		<tr>
		<td><input type="file" name='uploadFile' multiple></td>
		</tr> -->


	</table>

	<input type="hidden" name="userId" readonly="readonly"
		value='<c:out value = "${board.userId }"/>'>
		

	<button type="submit" data-oper='remove' class='btn_remove'>
		<img src="../resources/images/community/remove.png">
	</button>

</form>

<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form");
			
			$('button').on("click", function(e) {
				e.preventDefault();
				var operation = $(this).data("oper");
				console.log(operation);
				
				if (operation === 'remove') {
					formObj.attr("action", "/board/remove");
				} /* else if (operation === 'list') {
					 //move to list
					formObj.attr("action", "/board/list").attr("method", "get");
					var pageNumTag = $("input[name='pageNum']").clone();	//잠시 보관용
					var amountTag = $("input[name='amount']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();
					formObj.empty();	//제거
					formObj.append(pageNumTag);
					formObj.append(amountTag); 
					formObj.append(keywordTag);
					formObj.append(typeTag); //필요한 태그들만 추가 } */
				 
				formObj.submit();
			});
		});//end javascript
</script>

</body>
</html>