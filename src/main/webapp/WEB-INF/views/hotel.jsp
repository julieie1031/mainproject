<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<%@include file="layout/header.jsp"%>



<div>
<h2>상품목록</h2>
    <table border="1">
        <tr>
            <th>상품ID번호</th>
            <th>상품이미지</th>
            <th>상품명</th>
            <th>가격</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>
                ${row.restId}
            </td>
            <td>
                <a href="${path}hotelDetail/${row.restId}">
                    <img src="${path}/images/${row.restImage}" width="120ox" height="110px">
                </a>
            </td>
            <td>
                <a href="${path}detail/${row.restId}">${row.restName}</a>
            </td>
            <td>
            ${row.restPrice}
            <%--  <fmt:formatNumber value="${row.restPrice}" pattern="###,###,###"/> --%>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>
<%@include file="layout/footer.jsp"%>
</body>
</html>