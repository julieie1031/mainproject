<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.uploadResult {
	width: 100%;
	background-color: #ddd;
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
	width: 150px;
	height: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>
</head>
<body>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	<div class="uploadResult">
		<ul></ul>
	</div>
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>
	<button id="uploadBtn">Upload</button>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	function showImage(fileCallPath) {
		//alert(fileCallPath);
		//썸네일 클릭 시 커짐
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture")
		.html("<img src = '/display?fileName=" + encodeURI(fileCallPath)+"'>")
		.animate({width:'100%', height:'100%'}, 1000);
		
		//커진 사진 클릭 시 다시 작아짐
		$(".bigPictureWrapper").on("click", function(e){
			$(".bigPicture").animate({width : '0%', height : '0%'}, 1000);
			setTimeout(() => {
				$(this).hide();
			}, 1000);
		});//bigPictureWrapper click
	}
	
	$(document).ready(function(){
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
		
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없음");
				return false;
			}
			return true;
		}//checkExtension
		
		//업로드 전에 <input type = 'file'>객체가 포함된 <div> 복사
		var cloneObj = $(".uploadDiv").clone(); 
		
		$("#uploadBtn").on("click", function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			//add file data to formdata
			for(var i=0; i<files.length; i++){
				
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			}
			
			var uploadResult = $(".uploadResult ul");
			function showUploadedFile(uploadResultArr){
				var str = "";
				$(uploadResultArr).each(function(i, obj) {
					if(!obj.image) {	//이미지가 아닌 경우
						
						/*  str += "<li><img src = '/resources/images/2.png'>" + obj.fileName + "<li>"; */
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
			       		var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						 str += "<li><a href='/download?fileName="+ fileCallPath +"'><img src='/resources/images/attach.png'>"
			    		   + obj.fileName +"</a>" + "<span data-file=\ '"+ fileCallPath +"\' data-type='file'> x </span>"
			    		   + "<div></li>"
			    		   
					} else { //이미지인 경우
						
						/* str += "<li>" + obj.fileName + "</li>"; */
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						 var originPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
							originPath = originPath.replace(new RegExp(/\\/g), "/");
							
							str += "<li><a href=\"javascript:showImage(\'"
					    		   + originPath +"\')\"><img src='/display?fileName="+ fileCallPath +"'></a>"
					    				   + "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span><li>";
							
					}
				});
				uploadResult.append(str);
			}//showUploadedFile
			
			//'x'표시 이벤트 처리
			$(".uploadResult").on("click", "span", function(e){
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			console.log(targetFile);
			
			$.ajax({
				url : '/deleteFile',
				data : {fileName : targetFile, type : type},
				dataType : 'text',
				type : 'POST',
					success : function(result){
						alert(result);
					}
			}); // $ajax
		});

				console.log("files.length : " + files.length);

				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						//첨부파일을 등록하면 등록한 파일 화면에 출력
						showUploadedFile(result);
						//첨부파일을 등록하고 다시 첨부파일을 등록할 수 있도록 변경
						$(".uploadDiv").html(cloneObj.html());
					}
				}); // $.ajax
			});//uploadbutton
		});//end javascript
	</script>

</body>
</html>