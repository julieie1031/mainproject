<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--     <%@ taglib prefix="fmt" uri=" http://java.sun.com/jsp/jstl/fmt "%> --%>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

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
 
 
.review{
	margin:20px;
	font-size:15px;
}

.title{
    font-size: 15px;
    font-weight: bold;

}

.review_header{
text-align: right;

}

.review_header button{
	padding: 4px;
    border: 0.8px solid #9dbe9d;
    background: #abd3ab;
    font-family: 'S-CoreDream-3Light';
}

.review_body{

}

.empty{
    width: 100%;
    height: 10px;
    background: #f1f0f0;


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
 
 <div class="empty"></div>
 
 
<!-- 리뷰 -->

<script type="text/javascript" src="/resources/js/review.js"></script>


<script>


	console.log("js test");
	
	var restIdValue = '<c:out value="${vo.restId}"/>';
	
	
	reviewService.add(
			{review:"JS test", reviewer:"tester",restId:restIdValue}
			,
			function(result){
				alert("RESULT: " + result);
			}
	);

</script>
<div class="review">

	<div class="title">
	REVIEW
	</div>
	
	
	<div class="review_header">
		<button type="button" id="addReviewBtn">리뷰작성</button>
	</div>

	<div class="review_body">
		<ul class="chat">
			<li>

				<div>
					<div class="star">평점부분</div>
					<div>
						<strong>user00</strong> 
						<small>2021-05-18 13:13</small>
					</div>
					<p>Good job</p>
				</div>



			</li>
		</ul>
	</div>

</div>

<%@include file="layout/footer.jsp"%>
</body>
</html>