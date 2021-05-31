<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--     <%@ taglib prefix="fmt" uri=" http://java.sun.com/jsp/jstl/fmt "%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>상품 상세정보</h2>
    <table border="1">
        <tr>
            <td>
                <img src="${path}/images/${vo.restImage}" width="340" height="300">
            </td>
            <td>
                <table border="1" style="height: 300px; width: 400px;">
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
                            <a href="${path}/shop/product/list.do">상품목록</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>