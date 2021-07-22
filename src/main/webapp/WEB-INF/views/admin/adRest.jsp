<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/w3school.css" rel="stylesheet"
	type="text/css" />
<style>
.trash {
	color: #f6f6f6;
	border: none;
	background: #7692e0;
	border-radius: 5px;
	font-family: 'S-CoreDream-3Light';
	width: 80px;
}

.rest_header{
text-align: right;

}

#id01 input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	width: 500px;
	height: 30px;
	font-size: 15px;
}


.button2 {
    background: #f1f1f1;
	border: 1px solid #4CAF50;
	color: black;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	float: right;
}
</style>
</head>
<body>

	<%@include file="layout/Adheader.jsp"%>



	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<form class="form-inline">
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>
				</form>

				<!-- Topbar Search -->
				<form
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>

			</nav>
			<!-- End of Topbar -->

			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800">숙소 관리</h1>


				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">숙소 목록</h6>

					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>

									<tr>
										<th><input id='allCheck' type='checkbox' name='allCheck' /></th>
										<th>이름</th>
										<th>주소</th>
										<th>전화번호</th>
										<th>평점</th>

									</tr>
								</thead>
								<tfoot>
									<tr>
										<th><input id='allCheck' type='checkbox' name='allCheck' /></th>
										<th>이름</th>
										<th>주소</th>
										<th>전화번호</th>
										<th>평점</th>

									</tr>
								</tfoot>
								<tbody class="chat">

								</tbody>
							</table>
							<div style="text-align: right;">
								<input class="trash" type='button' value="삭제"
									onclick='deleteValue();' />
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /.container-fluid -->

	</div>




	<%@include file="layout/Adfooter.jsp"%>

	<script type="text/javascript" src="/resources/js/adRest.js"></script>
	<script>
$(document).ready(function(){
	
	var restUL = $(".chat");
	var length=0;
	showList(1);
	
	//회원 목록
	function showList(page){
		
		adRestService.adRestList({page:page||1},function(list){
			var str = "";
			length = list.length;
			if(list == null || list.length == 0){
				restUL.html("실패");
				
				return;
			}
			for(var i = 0, len = list.length || 0 ; i <len; i++){
				
				str += "<tr>";
				str += "<td><input name='RowCheck' type='checkbox' value='"+list[i].restId+"'/></td>"
				str += "<td>"+list[i].restName+"</td>";
				str += "<td>"+list[i].restAddress+"</td>";
				str += "<td>"+list[i].restPhone+"</td>";
				str += "<td>"+list[i].starAvg+"</td>";
				str += "</tr>";
				
			}
			
			
			
			
			restUL.html(str);
		});
	};
		
		
		
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		//전체 체크
		$('input[name="allCheck"]').click(function(){
			var chk_listArr = $('input[name="RowCheck"]');
			for(var i = 0; i < chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		
		$('input[name="RowCheck"]').click(function(){
			if($('input[name="RowCheck"]:checked').length == rowCnt){
				$('input[name="allCheck"]')[0].checked = true;
			}else{
				$('input[name="allCheck"]')[0].checked = false;
			}
		});
		
		var csrfHeaderName="${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";	

		$(document).ajaxSend(function(e,xhr,options){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		});
		
		
	
});


function deleteValue(){
	var valueArr = new Array();
	var list = $('input[name="RowCheck"]');
	for(var i = 0 ; i < list.length ; i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length ==0){
		alert("선택된 회원이 없습니다.");
	}else{
		var chk = confirm("정말 삭제하시겠습니까?");
		$.ajax({
			url:'/rest/delete',
			type:'post',
			traditional:true,
			data:{
				valueArr:valueArr
			},
			success:function(jdata){
				if(jdata = 1){
					location.reload();
					showList(1);
				}else{
					alert("삭제 실패");
				}
			}
		});
		
	}
};

</script>
</body>
</html>