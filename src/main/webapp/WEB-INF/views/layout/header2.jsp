<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>


<link rel="stylesheet" href="/resources/css/layout.css">
<style>
.headerlogo {
   position: relative;
   bottom: 400px;
   left: 185px;
}

.back {
   position: relative;
   bottom: 1070px;
   left: 15px;
}
</style>

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


<div class="fixed"
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_xiTUZs"
  data-title="consult"
  data-size="small"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div>

<body style="height: 100vh; overflow: hidden;">

	
		<div class="mainRight">
			<div class="logo">
				<img src="resources/images/logo3.png" />
			</div>
			
			 
		</div>
	
		<div class="mainLeft">
			<div class="headerlogo">
         <img src="/resources/images/logo.png" width="150" height="150">
      </div>
      <div class="back">
         <a href="/main"><img src="/resources/images/back.png" width="60"
            height="60"></a>
      </div>
			

</body>
</html>