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

.jb-x-small {
	font-size: x-small;
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
</style>

<%@include file="../layout/header2.jsp"%>





<div class="jb-x-small">
${vo.restName}<br>
${room[0].roomName} |
${room[0].roomPeople} |
${room[0].roomPrice}원<br>
${startDate} ~
${endDate}
</div>

<script src="/resources/js/kakao.js" type="text/javascript"></script>

<input type="hidden" name="reserId" value="${RESER_ID}"/>
<input type="hidden" id="restName" name="restName" value="${vo.restName}"/>
<input type="hidden" id="restPhone" name="restPhone" value="${vo.restPhone}"/>
<input type="hidden" id="restId" name="restId" value="${vo.restId}"/>
<input type="hidden" id="roomName" name="roomName" value="${room[0].roomName}"/>
<input type="hidden" id="roomPeople" name="roomPeople" value="${room[0].roomPeople}"/>
<input type="hidden" id="roomPrice" name="roomPrice" value="${room[0].roomPrice}"/>
<input type="hidden" id="startDate" name="startDate" value="${startDate}"/>
<input type="hidden" id="endDate" name="endDate" value="${endDate}"/>
<input type="hidden" id="userId" name="userId" value="<sec:authentication property='principal.username'/>"/>
<label class="jb-x-small">견&nbsp;&nbsp;&nbsp;&nbsp;종:&nbsp;</label><input type="text" name="dogType" id="dogType"><br>
<label class="jb-x-small">마릿 수: </label><input type="text" name="dogNumber" id="dogNumber"><br>
<button type="button" id="apibtn"><img src="/resources/images/hotel/paysmall.png"></button>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

<%@include file="../layout/footer.jsp"%>


</body>
</html>