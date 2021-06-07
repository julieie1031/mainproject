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
	margin-top: 30px;
	margin-bottom: 10px;
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
	margin-top: 30px;
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
</style>


<%@include file="../layout/header.jsp"%>
<div class="carousel-item active"></div>



<form role="form" action="/board/modify" method="post">

	<button type="submit" data-oper='modify' class='btn_submit'>
		<img src="../resources/images/community/submit.png">
	</button>
	<input type="hidden" name="bno" readonly="readonly"
		value='<c:out value = "${board.bno }"/>'>
	<table class="table1">

		<tr>
			<td height=100;><input type="text" name="title"
				value='<c:out value = "${board.title }"/>'></td>
		</tr>
		<tr>
			<td><textarea style="height: 300px" name="content"><c:out
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
					self.location = "/board/list";
					return;
				} */
				formObj.submit();
			});
		});//end javascript
</script>

</body>
</html>