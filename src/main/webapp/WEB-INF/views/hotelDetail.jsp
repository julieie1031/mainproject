<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--     <%@ taglib prefix="fmt" uri=" http://java.sun.com/jsp/jstl/fmt "%> --%>

<style>
*{margin: 0; padding: 0;}
.table-x {margin-left: 20px;}
.jb-x-small { font-size: x-small; }
.jb-medium { font-size: medium; }
.text-a {text-align: left;}
.text-b {text-align: right;}
a {
  text-decoration-line: none;
  color: black;
 }

</style>

<%@include file="layout/header2.jsp"%>

<div>
    <table>
        <tr>
            <td> 
                <img src="../../resources/images/hotel/${vo.restImage}" width="495" height="300">
            </td>
            </table>
 
            <td>
                <table class="table-x" style="height: 300px; width: 460px;">
                    <tr align="center">
                        <td colspan="5" class="text-a"><br><b>${vo.restName}</b><br><br><br><hr><br><small class="jb-medium"><b>객실정보</small></td>
                    </tr>
                
                    <tr align="center">
                        <td rowspan="3"><img src="../../resources/images/hotel/${vo.restImage}" width="120" height="110"></td>
                       <%--  <td><fmt:formatNumber value="${vo.restPrice}" pattern="###,###,###"/></td> --%>
                    </tr>
                    <tr align="center">
                    <td>${vo.restContent}</td>
                    </tr>
                    <tr>
                    <td class="text-b"><%-- ${vo.restNumber}<br>${vo.restPrice} --%></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                           <form name="form1" method="get" action="/room/list">
                            	<input type="hidden" name="id" value="${id}">
                                <input type="hidden" name="restId" value="${vo.restId}">
                                <input type="submit" value="예약하기">
                            </form>
                             <a href="javascript:history.back();">이전으로</a>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>

 </div>

<%@include file="layout/footer.jsp"%>
</body>
</html>