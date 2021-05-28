<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>

<script>
$(document).ready(function(){
	
	
	var lastScrollTop=0;
	var delta = 5;
	$(".mainLeft").scroll(function(){
		var scrollTop = $(this).scrollTop()
	   
	    if(Math.abs(lastScrollTop - scrollTop) <= delta)
	    return; 

	    if ((scrollTop > lastScrollTop) && (lastScrollTop>0)) {
	        $(".header").css("top","-100px");
	    } else {
	        $(".header").css("top","0px");
	    }
	    lastScrollTop = scrollTop;
	});
	
	
	  window.kakaoAsyncInit = function() {
	    Kakao.Channel.createChatButton({
	      container: '#kakao-talk-channel-chat-button',
	    });
	  };

	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
	    fjs.parentNode.insertBefore(js, fjs);
	  })(document, 'script', 'kakao-js-sdk');

	
	  
	  $('#regBtn').on("click",function(){
	 		self.location="/test";
	 	});
});



</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/layout.css">


</head>
<body style="height: 100vh; overflow: hidden;">
	
		<div class="mainRight">
			<div class="logo">
				<img src="/resources/images/logo.png" />
			</div>
		</div>
	
		<div class="mainLeft">
			<div class="header"></div>
</body>
</html>