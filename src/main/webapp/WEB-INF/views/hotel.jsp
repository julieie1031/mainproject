<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

*{margin: 0; padding: 0;}

.table-x {margin-left: 30px;}

.jb-x-small { font-size: x-small; }

.text-x {text-align: right; vertical-align : bottom;}

a {
  text-decoration-line: none;
  color: black;
 }

</style>


<%@include file="layout/header.jsp"%>



		<div class="carousel-item active">
			
		</div>

<img src="../resources/images/banner1.png" alt="..." width="520px" height="200px">
<div>

 <table class="table-x">
    
        <c:forEach var="row" items="${list}">
  
      
     
        <tr>
          <td>
               <br><br> 
                <a href="${path}detail/${row.restId}">
                    <img src="../resources/images/hotel/${row.restImage}" width="120ox" height="110px">
                </a>  
                             <br><br>     
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>
                <a href="${path}detail/${row.restId}">${row.restName}</a>
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td  class="text-x" colspan="5">
            <a href="${path}detail/${row.restId}">${row.restAddress}</a>
            <%--  <fmt:formatNumber value="${row.restPrice}" pattern="###,###,###"/> --%>
            </td>
        </tr>
 
        </c:forEach>
         
    </table>
 
</div>

<%@include file="layout/footer.jsp"%>
</body>
</html>