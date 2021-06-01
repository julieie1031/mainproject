<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--     <%@ taglib prefix="fmt" uri=" http://java.sun.com/jsp/jstl/fmt "%> --%>

<style>

.jb-x-small { font-size: x-small; }

</style>

<%@include file="layout/header.jsp"%>

<div>
    <table border="1">
        <tr>
            <td> 
                <img src="../../resources/images/hotel/${vo.restImage}" width="495" height="300">
            </td>
            </table>
            <table border="1">
            <td>
                <table border="1" style="height: 300px; width: 495px;">
                    <tr align="center">
                        <td>상품명</td>
                        <td>${vo.restName}</td>
                    </tr>
                    <tr align="center">
                        <td>가격</td>
                        <td>${vo.restPrice}</td>
                       <%--  <td><fmt:formatNumber value="${vo.restPrice}" pattern="###,###,###"/></td> --%>
                    </tr>
                    <tr align="center">
                        <td>상품소개</td>
                        <td>${vo.restContent}</td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <form name="form1" method="post" action="${path}/shop/cart/insert.do">
                                <input type="hidden" name="restId" value="${vo.restId}">
                                <select name="amount">
                                    <c:forEach begin="1" end="10" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>&nbsp;개
                                <input type="submit" value="장바구니에 담기">
                            </form>
                            <a href="${path}/hotel/list">상품목록</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
 </div>

<%@include file="layout/footer.jsp"%>
</body>
</html>