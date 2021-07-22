<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.trash{
    color: #f6f6f6;
    border: none;
    background: #7692e0;
    border-radius: 5px;
    font-family: 'S-CoreDream-3Light';
    width: 80px;

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
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
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
                    <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
           

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th><input id='allCheck' type='checkbox' name='allCheck'/></th>
                                           <th>이름</th>
                                           <th>아이디</th>
                                            <th>주소</th>
                                            <th>전화번호</th>
                                            <th>이메일</th>
                                            <th>등록일</th>
                                            <th>권한</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th><input id='allCheck' type='checkbox' name='allCheck'/></th>
                                            <th>이름</th>
                                           <th>아이디</th>
                                            <th>주소</th>
                                            <th>전화번호</th>
                                            <th>이메일</th>
                                            <th>등록일</th>
                                            <th>권한</th>
                                            
                        
                                        </tr>
                                    </tfoot>
                                    <tbody class="chat">
                                     	
                            
                            		
                                    </tbody>
                                    
                                    
                                </table>
                                <div style="text-align:right;">
                                <select name="Auth" id="Auth">
    								<option value="none">=== 선택 ===</option>
    								<option value="ROLE_MEMBER" selected>일반</option>
    								<option value="ROLE_ADMIN">관리자</option>
								</select>
								 <input class="trash" type='button' value="변경" onclick='updateValue();'/>
                                <input class="trash" type='button' value="삭제" onclick='deleteValue();'/></div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
  </div>          



 

<%@include file="layout/Adfooter.jsp"%>
<script type="text/javascript" src="/resources/js/adMem.js"></script>

<script>
$(document).ready(function(){
	
	
	var memberUL = $(".chat");
	var length=0;
	showList(1);
	
	//회원 목록
	function showList(page){
		
		adMemService.adMemList({page:page||1},function(list){
			var str = "";
			length = list.length;
			if(list == null || list.length == 0){
				memberUL.html("실패");
				
				return;
			}
			for(var i = 0, len = list.length || 0 ; i <len; i++){
				console.log(list[i].authList);
				str += "<tr>";
				str += "<td><input name='RowCheck' type='checkbox' value='"+list[i].userId+"'/></td>"
				str += "<td>"+list[i].userName+"</td>";
				str += "<td>"+list[i].userId+"</td>";
				str += "<td>"+list[i].address+"</td>";
				str += "<td>"+list[i].phone+"</td>";
				str += "<td>"+list[i].email+"</td>";
				
				function isAuth(element)  {
					  if(element.userId === list[i].userId)  {
					    return true;
					  }
					}

				const auth = list[i].authList.find(isAuth);
	
				
				str += "<td>"+adMemService.getToday(list[i].registerdate)+"</td>";
				str += "<td>"+auth.authority+"</td>";
				str += "</tr>";
				
			}
			
			
			
			
			memberUL.html(str);
		});
		
	};
	
	
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	//전체 체크
	$('input[name="allCheck"]').click(function(){
		console.log("실행됌");
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

//권한 수정

function updateValue(){
	var valueArr = new Array();
	var list = $('input[name="RowCheck"]');
	var target = document.getElementById("Auth");
	var auth = target.options[target.selectedIndex].value;
	for(var i = 0 ; i < list.length ; i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length ==0){
		alert("선택된 회원이 없습니다.");
	}else{
		var chk = confirm("정말 변경하시겠습니까?");
		$.ajax({
			url:'/members/update',
			type:'post',
			traditional:true,
			data:{
				valueArr:valueArr,
				auth:auth
			},
			success:function(jdata){
				if(jdata = 1){
					location.reload();
					showList(1);
				}else{
					alert("수정 실패");
				}
			}
		});
		
	}
	
}

//삭제

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
			url:'/members/delete',
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