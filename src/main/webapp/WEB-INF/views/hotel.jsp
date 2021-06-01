<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

.jb-x-small { font-size: x-small; }
s
</style>


<%@include file="layout/header.jsp"%>



		<div class="carousel-item active">
			
		</div>

<img src="../resources/images/banner1.png" alt="..." width="520px" height="200px">
<div>

 <table border="1">
    
        <c:forEach var="row" items="${list}">
  
      
     
        <tr>
          <td>
             
                <a href="${path}detail/${row.restId}">
                    <img src="../resources/images/hotel/${row.restImage}" width="120ox" height="110px">
                </a>
            </td>
            <td>
                <a href="${path}detail/${row.restId}">${row.restName}</a>
            </td>
            <td  class="jb-x-small">
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