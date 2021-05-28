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
	    return; // ~ 리턴

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

	
});



</script>

<style>
* {
	margin: 0px;
	padding: 0px;
}

ul, li {
	list-style: none;
}

.background {
	width: 100%;
}

html {
	background-image: url(/resources/images/background.jpg);
	background-size: 100% 100%;
}

.mainRight {
	position: fixed;
	z-index: 0;
	width: 100%;
	max-width: 512px;
	height: 100%;
	right: calc(50vw - 512px);
}

.mainLeft {
	position: absolute;
	overflow: auto scroll;
	margin: 0 calc(50vw - 1px) 0 100px;
	border-width: 0 1px;
	border-style: solid;
	border-color: #136a37;
	transition: initial;
	color: #000 !important;
	background-color: #fff;
	width: 100%;
	max-width: 500px;
	height: 100%;
	z-index: 0;
	font-size: 500px;
}

.mainLeft::-webkit-scrollbar {
	display: none;
}

.logo img {
	width: 140px;
	top: 30px;
	margin: 0 0 0 600px;
	aling: right;
	z-index: 0;
}

.header {
	position: fixed;
	top: 0px;
	width: 500.5px;
	height: 30px;
	background-color: #bfdfbf;
	transition: top 0.2s ease-in-out;
}

.footer {
	position: fixed;
	width: 498.5px;
	height: 70px;
	background-color: #fafafa;
	bottom: 0px;
	border-style: solid;
	border-width: thin;
	border-color: #e1e1e1;
}

.bottom_bar {
	position: relative;
	overflow: hidden;
	margin: 3px;
	width: 494.5px;
	height: 60px;
	background-color: #fafafa;
}

.bottom_bar ul li img {
	float: left;
	width: 50px;
	padding: 5px 23px;
}

div.fixed {
  position: fixed;
  top: 800px;
  right: 0;
  width: 100px;
 }

</style>
</head>
<body style="height: 100vh; overflow: hidden;">
	<div class="background">
		<!-- 오른쪽 -->
		<div class="mainRight">
			<div class="logo">
				<img src="/resources/images/logo.png" />
			</div>
		</div>
		<!-- 왼쪽 -->
		<div class="mainLeft">
			화이팅!
			<div class="header"></div>

			<div class="footer">
				<div class="bottom_bar">
					<ul>
						<li><img src="/resources/images/attach.png"></li>
						<li><img src="/resources/images/attach.png"></li>
						<li><img src="resources/images/logo2.png"></li>
						<li><img src="/resources/images/attach.png"></li>
						<li><img src="/resources/images/attach.png"></li>
					</ul>


				</div>
			</div>

		</div>

	</div>
	
	
	  <div class="fixed"
  id="kakao-talk-channel-chat-button"
  data-channel-public-id="_xiTUZs"
  data-title="consult"
  data-size="small"
  data-color="yellow"
  data-shape="pc"
  data-support-multiple-densities="true"
></div>

</body>
</html>