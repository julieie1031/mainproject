<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
*{margin: 0; padding: 0;}
.table-x {
margin-left: 15px;
	height: 300px;
	width: 460px;
}
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
	    </tr>
    </table>
       
     <table class="table-x" style="height: 300px; width: 460px;">

         <tr align="center">
             <td colspan="5" class="text-a"><br><b>${vo.restName}</b><br><br><br><hr><br><small class="jb-medium"><b>객실정보</small></td>
         </tr>
     
         <tr align="center">
             <td rowspan="3"><img src="../../resources/images/hotel/${vo.restImage}" width="120" height="110"></td>
          </tr>
         <tr align="center">
         	<td>${vo.restContent}</td>
         </tr>
         <tr>
         	<td class="text-b"><%-- ${vo.restNumber}<br>${vo.restPrice} --%></td>
         </tr>

		<tr>
			<td colspan="1" style="text-align: right; padding-right: 15px;">체크인</td>
			<td colspan="2" style="text-align: center;">체크아웃</td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="startDate" id="datepicker1" style="text-align: center;"/></td>
			<td colspan="2" style="width: 200px;"><input type="text" name="endDate" id="datepicker2" style="text-align: center;"/></td>
		</tr>

     </table>
                
                

<c:forEach var="vo" items="${room}">
		<table>
			<tr>
				<td>
					<img src="../resources/images/hotel/${vo.roomImage}"
					width="495" height="300">
				</td>
			</tr>
		</table>


		<table class="table-x">
			<tr align="center">
				<td colspan="5" class="text-a"><br><b>${vo.roomName}</b><br>
					<br> <br>
					<hr> <br> <small class="jb-medium"><b>객실정보</b></small></td>
			</tr>

			<tr align="center">
				<td rowspan="3"><img src="../resources/images/hotel/${vo.roomImage}"
					width="120" height="110"></td>
			</tr>
			<tr align="center">
				<td>${vo.roomDescription}</td>
			</tr>
			<tr>
				<td class="text-b">수용인원: ${vo.roomPeople}<br>객실가격: ${vo.roomPrice}원</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<form name="form1" method="get" action="/reserve/list">
					  	<input type="hidden" name="id" value="${id}"/>
                      	<input type="hidden" name="restId" value="${vo.restId}"/>
                      	<input type="hidden" name="roomId" value="${vo.roomId}"/>
                    	<input type="button" onclick="javascript:getInputValue('${vo.restId}','${vo.roomId}');" value="예약하기"/>
					</form> 
				</td>
			</tr>

		</table>
	</c:forEach>
 </div>
 


<%@include file="layout/footer.jsp"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker1,#datepicker2").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
       		
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)      
           
   });
   
</script>

<script>
	function getInputValue(restId, roomId) {
		var startDate = $('input[name=startDate]').val();
		var endDate = $('input[name=endDate]').val();
		window.location.href = "/reserve/list?restId="+restId+"&roomId="+roomId+"&startDate="+startDate+"&endDate="+endDate;
	}
</script>

</body>
</html>