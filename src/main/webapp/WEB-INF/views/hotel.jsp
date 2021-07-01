<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

* {
   margin: 0;
   padding: 0;
}


.jb-x-small {
   font-size: x-small;
}

.text-x {
   text-align: right;
   vertical-align: bottom;
}

a {
   text-decoration-line: none;
   color: black;
}

.img1 {
   position: relative;
   float: right;
   
}

.img2 {
   align: right;
}

.line {
   border-bottom: 1px solid gray;
}

.ul {
   list-style: none;
   float: right;
   display: inline;
   margin-top: 25px;
}

#li {
   float: left;
   margin-left: 4px;
}

.a {
   float: left;
   padding: 8px;
   margin-right: 5px;
   margin-bottom: 20px;
   width: 25px;
   height: 20px;
   color: #000;
   font: bold 15px tahoma;
   border: 1px solid #eee;
   text-align: center;
   text-decoration: none;
}

.a:hover, .a:focus {
   color: #fff;
   border: 1px solid #B0B0B0;
   background-color: #B0B0B0;
}

.btn_search {
   background-position: 0px 0px;
   background-repeat: no-repeat;
   width: 15px;
   height: 10px;
   cursor: pointer;
   outline: 0;
   float: right;
   outline: 0;
   border: 0;
}

.button {
   border: 0;
   outline: 0;
   background-color: white;
}

.paginate_button.active a {
   background-color: #B0B0B0;
}

</style>


<%@include file="layout/header2.jsp"%>


<form id='searchForm' action="/hotel/list" method='get'>
	<table >
		<tr class="img1">
			<td><select name='type' style="width: 100px; height: 23px">
					<option value=""
						<c:out value = "${pageMaker.cri.type==null?'selected':'' }"/>>--</option>
					<option value="N"
						<c:out value = "${pageMaker.cri.type eq 'N'?'selected':'' }"/>>호텔명</option>
					<option value="A"
						<c:out value = "${pageMaker.cri.type eq 'A'?'selected':'' }"/>>지역</option>
					<option value="NA"
						<c:out value = "${pageMaker.cri.type eq 'NA'?'selected':'' }"/>>호텔명
						or 지역</option>
			</select></td>

			<td><input type="text" name='keyword'
				style="width: 170px; height: 23px"
				value='<c:out value = "${pageMaker.cri.keyword }"/>' /> <input
				type='hidden' name='pageNum'
				value='<c:out value = "${pageMaker.cri.pageNum }"/>' /> <input
				type='hidden' name='amount'
				value='<c:out value = "${pageMaker.cri.amount }"/>' /></td>

			<td>
				<button class="button">
					<img src="../resources/images/community/search.png" width=40px
						height=40px style = "cursor : pointer"/>
				</button>
			</td>
			</form>

</tr>
</table>
		<div class="carousel-item active">
			
		</div>

<img src="../resources/images/banner1.png" alt="..." width="520px" height="200px">
<div>

 <table class="table-x" style=" padding-left:15px; padding-right:15px; width : 500px;">
    
        <c:forEach var="row" items="${list}">
  
      
     
        <tr>
          <td>
               <br><br> 
                <a href='<c:out value = "${row.restId }"/>' class="move">
                    <img src="../resources/images/hotel/${row.restImage}" width="120ox" height="110px">
                </a>  
                             <br><br>     
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>
                <a href='<c:out value = "${row.restId }"/>' class="move">${row.restName}</a>
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td class="text-x" colspan="5">
            <a href='<c:out value = "${row.restId }"/>' class="move">${row.restAddress}</a>
            <%--  <fmt:formatNumber value="${row.restPrice}" pattern="###,###,###"/> --%>
            </td>
        </tr>
 		<td class="line" colspan="5"></td>
        </c:forEach>
         
    </table>
    
 <div>
 <table style = "margin-left : 183px" >
 <tr>
 <td>
          <ul class = "ul">
      <c:if test="${pageMaker.prev }">
         <li class="paginate_button" id = "li"><a class = "a"
               href="${pageMaker.startPage-1 }">&laquo;&laquo;</a></li>
      </c:if>


      <c:forEach var="num" begin="${pageMaker.startPage }"
         end="${pageMaker.endPage }">
         <li class="paginate_button ${pageMaker.cri.pageNum==num?"active":""}" id = "li"><a class = "a"
               href="${num }">${num }</a></li>
      </c:forEach>
      <c:if test="${pageMaker.next }">
         <li class="paginate_button" id = "li"><a class = "a"
               href="${pageMaker.endPage+1 }">&raquo;&raquo;</a></li>
      </c:if>
   </ul>
   </td>
   </tr>
</table>
</div>
<form id='actionForm' action="/hotel/list" method="get">
 		<%-- <input type="hidden" id="restId" name="restId" value='${list.restId }'> --%>
 		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
		<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
		<!-- 키워드와 타입 추가 -->
		<input type='hidden' name='keyword' value='<c:out value = "${pageMaker.cri.keyword }"/>'> 
			<input type='hidden' name='type' value='<c:out value = "${pageMaker.cri.type }"/>'>
	</form>


<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var result = '<c:out value = "${result}"/>';

							var actionForm = $("#actionForm");
							$(".paginate_button a").on(
									"click",
									function(e) {
										e.preventDefault();
										console.log('click');
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

						 var searchForm = $("#searchForm");
							$(
									"#searchForm table tbody tr.img1 td:nth-child(3) button img")
									.on(
											"click",
											function(e) {
												if (!searchForm.find(
														"option:selected")
														.val()) {
													alert("검색종류를 선택하세요");
													return false;
												}

												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요");
													return false;
												}

												searchForm
														.find(
																"input[name='pageNum']")
														.val("1");
												e.preventDefault();
												searchForm.submit();
											}); 
							
							$(".move").on("click", function(e) {
								e.preventDefault();
								//console.log('click');
								actionForm.append("<input type = 'hidden' name = 'restId' value = '" + $(this).attr("href") + "'>");
								actionForm.attr("action", "/hotel/detail");
								actionForm.submit();
							}); 
							 

						});//end javascript
	</script>

 <%@include file="layout/footer.jsp"%>
</body>
</html>