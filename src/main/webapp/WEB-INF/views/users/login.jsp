<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>



<script>
	$(document)
			.ready(
					function() {

						var lastScrollTop = 0;
						var delta = 5;
						$(".mainLeft")
								.scroll(
										function() {
											var scrollTop = $(this).scrollTop()

											if (Math.abs(lastScrollTop
													- scrollTop) <= delta)
												return;

											if ((scrollTop > lastScrollTop)
													&& (lastScrollTop > 0)) {
												$(".header").css("top", "-100px");
												$(".header2").css("top","-100px");
												//  $(".centerlogo").css("top","800px");
											} else {
												$(".header").css("top", "0px");
												$(".header2").css("top","0px");
												//  $(".centerlogo").css("top", "-150px");
											}
											lastScrollTop = scrollTop;
										});

						window.kakaoAsyncInit = function() {
							Kakao.Channel.createChatButton({
								container : '#kakao-talk-channel-chat-button',
							});
						};
						(function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id))
								return;
							js = d.createElement(s);
							js.id = id;
							js.src = 'https://developers.kakao.com/sdk/js/kakao.channel.min.js';
							fjs.parentNode.insertBefore(js, fjs);
						})(document, 'script', 'kakao-js-sdk');

						$('#regBtn').on("click", function() {
							self.location = "/test";
						});
					});
	
	function back() {
	     history.back(); //방법 2


	}
</script>


<style>
/* .homie {
	position: relative;
	bottom: 400px;
	left: 185px;
}

.back {
	position: relative;
	bottom: 1070px;
	left: 15px;
} */

* {
	margin: 0px;
	padding: 0px;
}

.mainLeft::-webkit-scrollbar {
	display: none;
}

@font-face {
	font-family: 'BMJUA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'S-CoreDream-3Light';
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

.logo img {
	width: 140px;
	top: 30px;
	margin: 0 0 0 600px;
	z-index: 0;
}

.header {
	position: fixed;
	top: 0px;
	width: 500px;
	height: 30px;
	background-color: #bfdfbf;
	transition: top 0.2s ease-in-out;
}

.footer {
	position: fixed;
	width: 498px;
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
	bottom: 0;
	right: 0;
	width: 100px;
}

.m_footer {
	position: absolute;
	top: 1020px;
	background: #f1f0f0;
	width: 100%;
	height: 400px;
	font-size: 13px;
}

.centerlogo {
	display: block;
    position: relative;
    bottom: 320px;
    left: 130px;
}

#userId {
	font-family: 'S-CoreDream-3Light';
	width: 300px;
	display: block;
	padding: 15px;
	background-color: lightgrey;
	border-radius: 4px;
	margin: 20px 0 20px 0;
}

#userPwd {
	font-family: 'S-CoreDream-3Light';
	width: 300px;
	display: block;
	padding: 17px;
	background-color: lightgrey;
	border-radius: 4px;
	margin: 25px 0 25px 0;
}

.idpw {
    display: block;
    position: relative;
    bottom: 450px;
    font-size: 15px;
    font-weight: bold;
    left: 85px;
}

input::placeholder {
	color: #EEEEEE;
}

.log {
	position: relative;
    bottom: 380px;
    left: 105px;
    font-family: 'S-CoreDream-3Light';
    font-size: 15px;
}

#login {
	width: 290px;
	display: block;
	padding: 12px;
	margin: 25px 0 25px 0;
	font-weight: bold;
	color: #EEEEEE;
	background-color: #77A26B;
}

#join {
	width: 290px;
	display: block;
	padding: 12px;
	font-weight: bold;
	color: #EEEEEE;
	background-color: #DDDDDD;
}

a {
	text-decoration: none;
}
.header2 img{
	display:block;
	float:left;
}
</style>
</head>
<div class="fixed" id="kakao-talk-channel-chat-button"
	data-channel-public-id="_xiTUZs" data-title="consult" data-size="small"
	data-color="yellow" data-shape="pc"
	data-support-multiple-densities="true"></div>

<body style="height: 100vh; overflow: hidden;">


	<div class="mainRight">
		<div class="logo">
			<img src="/resources/images/logo3.png" />
		</div>


	</div>

	<div class="mainLeft">
	<div class="header"></div>
		<div class="header2" style="width:100%; height:60px;">
        		<img src="/resources/images/back.png" style="padding-top:50px; padding-left:10px;"  width="50"
            height="50" onclick="back()">
            	<a href="../main">
        		<img src="/resources/images/logo.png" style="padding-left:140px;"width="120" height="120">
         		</a>
      </div>


<!-- 
		<div class="homie">
			<img src="/resources/images/logo.png" width="150" height="150">
		</div>
		<div class="back">
			<a href="/main"><img src="/resources/images/back.png" width="60"
				height="60"></a>
		</div> -->
		<%-- <form action="<c:url value='/mypage' />" method="post"> --%>
		<form action="/login" method="post">
			<div class="centerlogo">
				<img src="/resources/images/logo4.png" width="250" height="250">
			</div>
			<div class="idpw">
				<p>아이디</p>
				<input type="text" id="userId" name="username" placeholder="ID"
					style="border: none">
				<p>비밀번호</p>
				<input type="password" id="userPwd" name="password"
					placeholder="PASSWORD" style="border: none">
			</div>

			<div class="log">
				<input type="submit" id="login" value="LOGIN" style="border: none;">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</div>

		</form>
		<div class="log">

			<a href="/join"><input type="submit" id="join" value="JOIN"
				style="border: none;"></a>
		</div>

		<!-- footer -->
		<div class="m_footer"
			style="background: #f1f0f0; width: 100%; height: 300px;">
			<div style="font-size: 12px; text-align: center; padding-top: 50px;">
				<ul>
					<li style="padding-bottom: 10px;"><b>COMPANY-(주)모여봐요 반려의 숲</b></li>
					<li>TEL - 02.111.1111</li>
					<li>EMAIL - THATDAY@NAVER.COM</li>
					<li>BUSINESS NO - 111-11-11111</li>
					<li>2020-SEOULGLOBAL-00000</li>
					<li>862-1 AGGYELLOW,7F,BONGCHEON-DONG,
					<li>GWANAK-GU,SEOUL,KOREA</li>
					<li>COPYRIGHT(C) 2021</li>
				</ul>
			</div>
		</div>
		<!-- footer 끝 -->

		<div class="footer">
			<div class="bottom_bar">
				<ul>
					<li><a href="/category"><img
							src="/resources/images/category.png"></a></li>
					<li><a href="/hotel/list"><img
							src="/resources/images/hotel.png"></a></li>
					<li><a href="/home"><img src="/resources/images/logo2.png"></a></li>
					<li><a href="/community"><img
							src="/resources/images/community.png"></a></li>
					<li><a href="/login"><img src="/resources/images/login.png"></a></li>
				</ul>


			</div>
		</div>

	</div>

</body>
</html>