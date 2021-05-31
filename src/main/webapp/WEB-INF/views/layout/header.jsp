<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>


<link rel="stylesheet" href="resources/css/layout.css">

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




</head>
<body style="height: 100vh; overflow: hidden;">
<div class="fixed" id="kakao-talk-channel-chat-button"
		data-channel-public-id="_xiTUZs" data-title="consult"
		data-size="small" data-color="yellow" data-shape="pc"
		data-support-multiple-densities="true"></div>
	
		<div class="mainRight">
			<div class="logo">
				<img src="/resources/images/logo.png" />
			</div>
			
			
		</div>
	
		<div class="mainLeft">
			<div class="header"></div>
</body>
</html>