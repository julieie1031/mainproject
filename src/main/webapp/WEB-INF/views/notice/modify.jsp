<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../layout/header3.jsp"%>

<form role="form" action="/notice/modify" method="post">
<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
					
	<sec:authentication property = "principal" var = "pinfo"/>
	<sec:authorize access = "isAuthenticated()">
	<c:if test = "${pinfo.username eq notice.userId }">				
	<button type="submit" data-oper='modify' class='btn_submit'>
		<img src="../resources/images/community/submit.png">
	</button>
	</c:if>
	</sec:authorize>
	<input type="hidden" name="nno" readonly="readonly"
		value='<c:out value = "${notice.nno }"/>'>
		<input type = "hidden" name = 'pageNum' value = '<c:out value = "${cri.pageNum }"/>'>
		<input type = "hidden" name = 'amount' value = '<c:out value = "${cri.amount }"/>'>
		<!-- 키워드와 타입 추가 -->
		<input type = 'hidden' name = 'keyword' value = '<c:out value = "${cri.keyword }"/>'>
        <input type = 'hidden' name = 'type' value = '<c:out value = "${cri.type }"/>'>
        
	<table class="table1">

		<tr>
			<td style="font-weight: bold; border-bottom: 1px solid #dddbdb;">
			<input type="text" name="noticeTitle" style = "font-size: 20px; margin-top:33px"
				value='<c:out value = "${notice.noticeTitle }"/>'></td>
		</tr>
	
		<tr>
			<td><textarea name="noticeContent"><c:out
						value="${noice.noticeContent }" /></textarea></td>
		</tr>


	</table>


	<input type="hidden" name="userId" readonly="readonly"
		value='<c:out value = "${notice.userId }"/>'>
		
	<sec:authentication property = "principal" var = "pinfo"/>
	<sec:authorize access = "isAuthenticated()">
	<c:if test = "${pinfo.username eq notice.userId }">		
	<button type="submit" data-oper='remove' class='btn_remove'>
		<img src="../resources/images/community/remove.png">
	</button>
	</c:if>
	</sec:authorize>
</form>


<%@include file="../layout/footer.jsp"%>
</body>
</html>