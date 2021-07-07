<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<%@include file="layout/header2.jsp"%>





<c:forEach var="ro" items="${room}">
<div class="jb-x-small">
${vo.restName}<br>
${ro.roomName} |
${ro.roomPeople} |
${ro.roomPrice}원<br>
${startDate} ~
${endDate}
</div>
</c:forEach>

<script src="/resources/js/kakao.js" type="text/javascript"></script>

<input type="hidden" name="reserId" value="${RESER_ID}"/>
<input type="hidden" name="restName" value="${restName}"/>
<input type="hidden" name="roomName" value="${roomName}"/>
<input type="hidden" name="roomPhone" value="${roomPhone}"/>
<input type="hidden" name="roomPeople" value="${roomPeople}"/>
<input type="hidden" name="roomprice" value="${roomprice}"/>
<input type="hidden" name="startDate" value="${startDate}"/>
<input type="hidden" name="endDate" value="${endDate}"/>
<label class="jb-x-small">견&nbsp;&nbsp;&nbsp;&nbsp;종:&nbsp;</label><input type="text" name="dogType" id="dotType"><br>
<label class="jb-x-small">마릿 수: </label><input type="text" name="dogNumber" id="dogNumber"><br>
<button type="button" id="apibtn"><img src="/resources/images/hotel/paysmall.png"></button>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

<%@include file="layout/footer.jsp"%>


</body>
</html>