<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix = "sec" %>
<style>
* {
	margin: 0;
	padding: 0;
}

.table-x {
	margin-left: 30px;
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

.line {
	border-bottom: 1px solid black;
}

.table1 {
	margin-left:15px;
	margin-right: 15px;

}

input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	width: 470px;
	height: 30px;
	font-size: 15px;
}

textarea {
	 height: 300px;
  box-sizing: border-box;
  border: 2px solid white;
  border-radius: 4px;
  background-color: white;
  font-size: 16px;
  resize: none;
  width:470px;
  }

.btn_submit {
	background-image: url('../resources/images/community/submit.png');
	background-position: 0px 0px;
	background-repeat: no-repeat;
	width: 40px;
	height: 35px;
	cursor: pointer;
	outline: 0;
	float: right;
	margin-top: 16px;
	margin-bottom: 10px;
	margin-right: 10px;
}

input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}

.attach {
	width: 42px;
	height: 42px;
	margin-left: 10px;
	
}

input[type=text] {
	width: 470px;
	
	margin: 8px 0;
	box-sizing: border-box;
}


textarea {
	padding: 12px 0px;
	box-sizing: border-box;
	border: 2px solid white;
	border-radius: 4px;
	background-color: white;
	font-size: 16px;
	resize: none;
}
.uploadResult {
	width: 100%;
	
}
.uploadResult ul {
	display: flex;
	flex-folw: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 110px;
	height : 100px;
} 
.button{
background-color : white;
border : 0;
outline : 0;
cursor : pointer;
}
</style>


<%@include file="../layout/header2.jsp"%>
<div class="carousel-item active"></div>

<form role="form" action="/board/register" method="post">
	

	<input type="submit" value="" class="btn_submit">
	
		     
	<table class="table1">

		<tr>
			<td style="font-weight: bold;"><input type="text" name="title" style = "font-size: 20px; margin-top:33px"
				placeholder = "제목을 입력해주세요"></td>
		</tr>
		<tr>
			<td style="border-bottom: 1px solid #dddbdb; width :470px;">
			<input type="hidden" name="userId" value='<sec:authentication
				property = "principal.username"/>' ></td>
		</tr>
		<tr>
			<td><textarea name="content" placeholder = "내용을 입력해주세요" style = "border-bottom: 1px solid #dddbdb;"><c:out
						value="${board.content }" /></textarea></td>
		</tr>


	</table>
		<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
	
	<table style = "height : 150px;">
		<tr>
			<td><a id="" href="javascript:fnUpload();"><img
					src="../resources/images/community/attach.png" alt="찾아보기"
					class="attach" /></a> <input name="uploadFile" type="file"
				id="fileUpload" style="display: none; float : top;" multiple 
				onchange="$('#fileNm').val(this.value)" /></td>
			<!-- <td><input type="text" id="fileNm" readonly
				style="margin-left: 10px; margin-top: 20px;"
				placeholder="사진을 첨부해주세요" /></td> -->
				
	
		<td><div class = "uploadResult">
					<ul></ul></div></td>
						</tr>
	</table>
	<script>
		function fnUpload() {

			$('#fileUpload').click();

		}
		$(document).ready(function(e) {
			//form 전송 시 <input type = 'hidden'> 태그들을 첨부된 파일의 수 만큼 생성해서 같이 전송
			var formObj = $("form[role='form']");
			$("input[type='submit']").on("click", function(e) {
				e.preventDefault();
				console.log("submit clicked");
				var str = "";
				
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					
					str += "<input type = 'hidden' name = 'attachList["+i+"].fileName' value = '" + jobj.data("filename")+"'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].uuid' value = '" + jobj.data("uuid") + "'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].fileType' value = '" + jobj.data("type") + "'>";

			
				});
				formObj.append(str).submit();
			});//button submit

			//uploadAjax의 checkExtension 부분 복사
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; //5MB

			function checkExtension(fileName, fileSize) {
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드 할 수 없음");
					return false;
				}
				return true;
			}//checkExtension

			var csrfHeaderName = "${_csrf.headerName}";
		    var csrfTokenValue = "${_csrf.token}";
			$("input[type='file']").change(function(e) {
				//FormData 사용
				var formData = new FormData();
				//선택된 파일
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;

				//formData에 파일데이터 추가
				for (var i = 0; i < files.length; i++) {
					//파일의 확장자와 크기 검사
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
				}

				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					 beforeSend: function(xhr){
			               xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			           },
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
					
						console.log(result);
						showUploadedFile(result);
					}
				});//$.ajax
				
				function showUploadedFile(uploadResultArr){
					  if(!uploadResultArr || uploadResultArr.length == 0){return ;}
					  var uploadUL = $(".uploadResult ul");
					  var str = "";
					$(uploadResultArr).each(function(i, obj) {
						if(!obj.image) {	//이미지가 아닌 경우
							
							  var fileCallPath = encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
							  str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
					          + obj.fileName + "'data-type='" + obj.image + "'><div>";
					          str += "<span> "+ obj.fileName+"</span>";
					          str += "<button class = 'button' type='button' data-file=\'"+ fileCallPath +"\' data-type='file'>&nbsp;X</button><br>";
					          str += "<img src='/resources/images/attach.png'>";
					          str += "</div></li>";
					        
				    		   
						} else { //이미지인 경우
							
							  var fileCallPath = encodeURIComponent( obj.uploadPath+"/s_"+ obj.uuid +"_"+obj.fileName);            
					          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					          str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'data-filename='"
					          + obj.fileName + "'data-type='" + obj.image + "'><div>";				          
					          str += "<span> "+ obj.fileName+"</span>";
					          str += "<button class = 'button' type='button' data-file=\'"+ fileCallPath +"\' data-type='image'>&nbsp;X</button><br>";
					          str += "<img src='/display?fileName="+ fileCallPath +"'>";
					          str += "</div></li>";
						}
					});
					uploadUL.append(str);
				}//showUploadedFile
				
				 $(".uploadResult").on("click", "button", function(e){
					 var targetFile = $(this).data("file");
					  var type = $(this).data("type");
					  var targetLi = $(this).closest("li");
					  
					  $.ajax({
					  	url : '/deleteFile',
					  	data : {fileName : targetFile, type : type},
					  	dataType : 'text',
					  	 beforeSend: function(xhr){
				               xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				           },
					  	type : 'POST',
					  		success : function(result) {
					  		
					  			targetLi.remove();
					  		}
					  });//$.ajax
				 });//uploadResult
			});
		});//end javascript
	</script>





</form>
</body>
</html>