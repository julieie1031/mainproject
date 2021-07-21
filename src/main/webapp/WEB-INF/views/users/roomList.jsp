<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.pwd2 {
	position: relative;
	font-size: 20px;
	font-weight: bold;
	left: 215px;
}

#list {
	position: relative;
	top: 100px;
	left: 105px;
	font-family: 'S-CoreDream-3Light';
	font-size: 15px;
}

.pwd {
	position: relative;
	top: 80px;
	font-size: 15px;
	font-weight: bold;
}

.table-x {
	position: relative;
	padding: 0 0 200px 0;
	top: 110px;
	width: 455px;
	margin-left: 23px;
	font-family: 'S-CoreDream-3Light';
	font-size: 15px;
	z-index: 300;
}

.table-x td {
	padding: 20px;
	font-family: 'S-CoreDream-3Light';
	font-size: 15px;
	border-bottom:1px solid #eee;
}

.wave {
	position: relative;
	left: 35px;
}

.move {
	font-weight: bold;
}

.table-x tr {
	font-family: 'S-CoreDream-3Light';
	font-size: 15px;
	
}

a {
	text-decoration: none;
	color: black;
}
</style>
<body>
<%@include file="../layout/header2.jsp"%>
<div class = "pwd">
<p class = "pwd2">예약 목록</p>
</div>

 <table class="table-x">
    
        <c:forEach items = "${list }" var = "vo">
        <tr>
          <td style="width: 180px;">
                <a href='<c:out value = "${vo.restName }"/>' class="move">
                ${vo.restName }
                </a>
                <div>${vo.roomName } &#183; ${vo.roomPeople }</div>
             </td>
             
            <td>
                <a href='<c:out value = "${row.restName }"/>' class="move">${row.restName}</a><br>
                <div id="starView" style="position: relative; bottom: 10px;">${vo.roomPrice }</div>
            </td>
            <td class="text-x" colspan="5">
            ${vo.startDate }<div class = "wave">~</div>${vo.endDate }
            </td>
        </tr>
        </c:forEach>
         
    </table>

 <%@include file="../layout/footer.jsp"%>


</body>
</html>