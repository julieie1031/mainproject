<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
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
   font-size:13px;
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
   border-bottom: 1px solid #d2d0d0;
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

.move{
	font-weight: bold;
}
.move img{
    border-radius: 10px;

}

.searchDiv{
padding-top: 10px;
    font-size: 13px;
    clear: both;
    text-align: center;
}

.searchbar{
  width: 350px;
  height: 30px;
  background: #f4f4f4;
  border: none;
  font-size: 10pt;
  color: #787878;
  padding-left: 45px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
}

.searchdiv .icon{
  position: absolute;
  left: 143px;
  margin-top: 13px;
  z-index: 1;
  color: #4f5b66;
}

#searchForm table{

margin-left: 15px;
}

.table-x{
 width: 455px;
 margin-left: 23px;
 border-collapse: collapse;

}


.table-x a img{
	width: 150px;
    height: 130px;

}

.table-x td{
    padding: 10px;
}

.table-x tr{

border-bottom:1px solid #eee;
}

.empty{
    width: 100%;
    height: 15px;
    background: #f1f0f0;


}

#starView{
	color: gold;
  }


</style>


<%@include file="../layout/header2.jsp"%>

		<div class="carousel-item active">
			
		</div>

<img src="../resources/images/banner1.png" alt="..." width="520px" height="150px">
<div class="empty"></div>

<div class="searchDiv">
<form id='searchForm' action="/hotel/list" method='get'>
	<table >
		<tr class="img1">
			<td><select name='type' style="width: 110px; height: 30px; border: none; font-size: 10pt; color: #787878; background: #f4f4f4;">
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
			<span class="icon"><i class="fa fa-search"></i></span>
			<td><input type="text" name='keyword' class="searchBar"
				placeholder="어디를 찾고 계신가요?"
				value='<c:out value = "${pageMaker.cri.keyword }"/>' /> <input
				type='hidden' name='pageNum'
				value='<c:out value = "${pageMaker.cri.pageNum }"/>' /> <input
				type='hidden' name='amount'
				value='<c:out value = "${pageMaker.cri.amount }"/>' /></td>

</tr>
</table>
			</form>

</div>

<div>

 <table class="table-x">
    
        <c:forEach var="row" items="${list}">
        <tr>
          <td style="width: 180px;">
                <a href='<c:out value = "${row.restId }"/>' class="move">
                    <img src="../resources/images/hotel/${row.restImage}" width="120ox" height="110px">
                </a>
            </td>
            <td>
                <a href='<c:out value = "${row.restId }"/>' class="move">${row.restName}</a><br>
                <div id="starView" style="float: left;">★</div> ${row.starAvg }
            </td>
            <td class="text-x" colspan="5">
            ${row.restAddress}
            <%--  <fmt:formatNumber value="${row.restPrice}" pattern="###,###,###"/> --%>
            </td>
        </tr>
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

 <%@include file="../layout/footer.jsp"%>
</body>
</html>