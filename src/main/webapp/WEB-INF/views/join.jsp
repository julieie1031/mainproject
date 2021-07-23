<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(function() {

		$("#join").on("click", function() {
			if ($("#userId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if ($("#userPwd").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPwd").focus();
				return false;
			}
			if ($("#userName").val() == "") {
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			if ($("#email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if ($("#phone2").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#phone").focus();
				return false;
			}
			if ($("#phone3").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#phone").focus();
				return false;
			}
			if ($("#address").val() == "") {
				alert("주소를 입력해주세요.");
				$("#address").focus();
				return false;
			}

		});
		$(function () {
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$(document).ajaxSend(function(e, xhr, options) {
			    xhr.setRequestHeader(header, token);
			});

		   })
		$('#userId').on("propertychange change keyup paste input", function() {

			var userId = $('#userId').val(); // .id_input에 입력되는 값
			var data = {userId : userId } // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

			$.ajax({
				type : "POST",
				url : "/users/idCheck",
				data : data,
				success : function(result) {
					// console.log("성공 여부" + result);
					if (result != 'fail') {
						$('.id_input_re_1').css("display", "inline-block");
						$('.id_input_re_2').css("display", "none");
					} else {
						$('.id_input_re_2').css("display", "inline-block");
						$('.id_input_re_1').css("display", "none");
					}
				}// success 종료
			}); // ajax 종료
		});// function 종료

	});
</script>



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
												$(".header").css("top",
														"-100px");
												//  $(".centerlogo").css("top","800px");
											} else {
												$(".header").css("top", "0px");
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
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("roadAddress").value = roadAddr;
						document.getElementById("jibunAddress").value = data.jibunAddress;

						document.getElementById("engAddress").value = data.addressEnglish;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>

<style>
/* 중복아이디 존재하지 않는경우 */
.id_input_re_1 {
	color: green;
	display: none;
	font-family: 'S-CoreDream-3Light';
	font-size: 10px;
	position: absolute;
    bottom: 150px;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2 {
	color: red;
	display: none;
	font-family: 'S-CoreDream-3Light';
	font-size: 10px;
	position: absolute;
    bottom: 150px;
}

.homie {
	position: relative;
	bottom: 455px;
	left: 185px;
}

.back {
	position: relative;
	bottom: 1080px;
	left: 15px;
}

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
	background-image: url(resources/images/background.jpg);
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
	z-index: 400;
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
	z-index: 400;
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

.user {
	position: relative;
	bottom: 1400px;
	font-weight: bold;
	left: 150px;
	z-index: 300;
}

#userId {
	font-family: 'S-CoreDream-3Light';
	width: 250px;
	display: block;
	padding: 15px;
	background-color: lightgrey;
	border-radius: 4px;
	margin: 0 0 35px 0;
}

#userPwd {
	font-family: 'S-CoreDream-3Light';
	width: 250px;
	display: block;
	padding: 15px;
	background-color: lightgrey;
	border-radius: 4px;
	margin: 20px 0 40px 0;
}

#userName {
	font-family: 'S-CoreDream-3Light';
	width: 250px;
	display: block;
	padding: 15px;
	background-color: lightgrey;
	border-radius: 4px;
	margin: 20px 0 30px 0;
}

.phone1 {
	position: relative;
	bottom: 1345px;
	font-weight: bold;
	left: 75px;
	margin: 0 20px 0 0;
	z-index: 180;
}

.phone2 {
	position: relative;
	bottom: 1477.5px;
	left: 192px;
	margin: 0 20px 0 0;
	z-index: 190;
}

.phone3 {
	position: relative;
	bottom: 1555px;
	left: 325px;
	margin: 0 20px 0 0;
	z-index: 200;
}

#phone1 {
	box-shadow: 1px 2px 5px gray;
	font-family: 'S-CoreDream-3Light';
	width: 80px;
	display: block;
	padding: 11px;
	background-color: #E9E9E9;
	border-radius: 2px;
	margin: 0 0 35px 0;
}

.frontNum {
	box-shadow: 1px 2px 5px gray;
	font-family: 'S-CoreDream-3Light';
	width: 70px;
	display: block;
	padding: 12px;
	background-color: #E9E9E9;
	border-radius: 2px;
	margin: 0 0 35px 0;
}

.backNum {
	box-shadow: 1px 2px 5px gray;
	font-family: 'S-CoreDream-3Light';
	width: 70px;
	display: block;
	padding: 12px;
	background-color: #E9E9E9;
	border-radius: 2px;
	margin: 0 0 35px 0;
}

input::placeholder {
	color: #EEEEEE;
}

.memberjoin {
	position: relative;
	top: 225px;
	left: 215px;
	color: #7D7D7D;
	font-family: 'S-CoreDream-3Light';
	font-size: 20px;
}

.text {
	position: relative;
	bottom: 1105px;
	left: 45px;
	margin: 20px;
	color: #7D7D7D;
	font-family: 'S-CoreDream-3Light';
	font-size: 12px;
	font-weight: bold;
}

.hyphen {
	position: relative;
	bottom: 1415px;
	left: 170px;
	font-family: 'S-CoreDream-3Light';
	font-size: 20px;
	font-weight: bold;
}

.hyphen2 {
	position: relative;
	bottom: 1443px;
	left: 301px;
	font-family: 'S-CoreDream-3Light';
	font-size: 20px;
	font-weight: bold;
}

.atsign {
	position: absolute;
	top: 733px;
	left: 255px;
	font-size: 20px;
	font-weight: bold;
}

.email {
	position: relative;
	bottom: 2063px;
	left: 73px;
}

#email {
	font-family: 'S-CoreDream-3Light';
	width: 140px;
	padding: 15px;
	background-color: lightgrey;
	border-radius: 4px;
}

.Eselect {
	position: relative;
	bottom: 2759px;
	left: 285px;
}

#Eselect {
	font-family: 'S-CoreDream-3Light';
	width: 140px;
	padding: 12px;
	background-color: #E9E9E9;
	border-radius: 2px;
	box-shadow: 1px 2px 5px gray;
}

.emailtxt {
	position: relative;
	bottom: 1565px;
	left: 65px;
	color: #7D7D7D;
	font-family: 'S-CoreDream-3Light';
	font-size: 12px;
	font-weight: bold;
}

.add {
	position: absolute;
	top: 835px;
	left: 72px;
}

#postcode {
	box-shadow: 0 0 4px gray;
	font-family: 'S-CoreDream-3Light';
	width: 140px;
	display: block;
	padding: 12px;
	background-color: white;
	margin: 0 0 35px 0;
}

.addbtn {
	width: 100px;
	display: block;
	padding: 15px;
	font-weight: bold;
	color: #7D7D7D;
	background-color: #EEEEEE;
}

.add1 {
	position: absolute;
	top: 833px;
	left: 255px;
}

#roadAddress {
	box-shadow: 0 0 4px gray;
	font-family: 'S-CoreDream-3Light';
	width: 325px;
	display: block;
	padding: 12px;
	background-color: white;
	margin: 0 0 35px 0;
}

.add2 {
	position: absolute;
	top: 890px;
	left: 72px;
}

.add3 {
	position: absolute;
	top: 945px;
	left: 72px;
}

#detailAddress {
	box-shadow: 0 0 4px gray;
	font-family: 'S-CoreDream-3Light';
	width: 325px;
	display: block;
	padding: 12px;
	background-color: white;
	margin: 0 0 35px 0;
}

.addresstxt {
	position: absolute;
	top: 795px;
	left: 65px;
	color: #7D7D7D;
	font-family: 'S-CoreDream-3Light';
	font-size: 12px;
	font-weight: bold;
}

.join {
	position: absolute;
	top: 1050px;
	left: 102px;
	font-family: 'S-CoreDream-3Light';
	font-size: 15px;
}

#join {
	width: 290px;
	display: block;
	padding: 12px;
	margin: 25px 0 25px 0;
	font-weight: bold;
	color: #EEEEEE;
	background-color: #77A26B;
}

a {
	text-decoration: none;
}

.stars1 {
	position: relative;
	bottom: 3330px;
	left: 105px;
	color: #FF0000;
	font-family: 'S-CoreDream-3Light';
	font-size: 12px;
	font-weight: bold;
}

.stars2 {
	position: relative;
	bottom: 3270px;
	left: 116px;
	color: #FF0000;
	font-family: 'S-CoreDream-3Light';
	font-size: 12px;
	font-weight: bold;
}

.stars3 {
	position: relative;
	bottom: 3202px;
	left: 94px;
	color: #FF0000;
	font-family: 'S-CoreDream-3Light';
	font-size: 12px;
	font-weight: bold;
}

.stars4 {
	position: relative;
	bottom: 3141px;
	left: 116px;
	color: #FF0000;
	font-family: 'S-CoreDream-3Light';
	font-size: 12px;
	font-weight: bold;
}

.stars5 {
	position: relative;
	bottom: 3047px;
	left: 104px;
	color: #FF0000;
	font-family: 'S-CoreDream-3Light';
	font-size: 12px;
	font-weight: bold;
}

.stars6 {
	position: relative;
	bottom: 2952px;
	left: 93px;
	color: #FF0000;
	font-family: 'S-CoreDream-3Light';
	font-size: 12px;
	font-weight: bold;
}
</style>
</head>
<div class="fixed" id="kakao-talk-channel-chat-button"
	data-channel-public-id="_xiTUZs" data-title="consult" data-size="small"
	data-color="yellow" data-shape="pc"
	data-support-multiple-densities="true"></div>

<body style="height: 100vh;">


	<div class="mainRight">
		<div class="logo">
			<img src="resources/images/logo3.png" />
		</div>


	</div>

	<div class="mainLeft">
		<div class="header"></div>

		<c:url var="joinPath" value="/join" />
		<f:form modelAttribute="member" action="${ joinPath }" method="post">
			<h4 class="memberjoin">회원가입</h4>
			<div class="homie">
				<img src="resources/images/logo.png" width="150" height="70">
			</div>
			<div class="back">
				<a href="/main"><img src="resources/images/back.png" width="60"
					height="60"></a>
			</div>
			<div class="text">
				<p style="margin: 0 0 62px 0">아이디</p>
				<p style="margin: 0 0 68px 0">비밀번호</p>
				<p style="margin: 0 0 60px 0">성명</p>
				<p>전화번호</p>
			</div>
			<p>
			<div class="user">

				<p>
					<input type="text" id="userId" name="userId"
					 maxlength='20' placeholder="아이디를 입력해주세요" style="border: none; font-size: 12px;">
					<f:errors path="userId" element="div" cssClass="alert text-danger" />
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span></p>
					<f:password path="userPwd" id="userPwd" name="userPwd"
						maxlength='20' placeholder="비밀번호를 입력해주세요"
						style="border: none; font-size: 12px;" />
					<f:errors path="userPwd" element="div" cssClass="alert text-danger" />
					<input type="text" id="userName" name="userName" maxlength='10'
						placeholder="성명을 입력해주세요" style="border: none; font-size: 12px;">
			</div>

			<div class="phone1">
				<select id="phone1" name="phone" style="border: none; cursor:pointer;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select>
			</div>
			<div class="hyphen">
				<p>-</p>
			</div>
			<div class="hyphen2">
				<p>-</p>
			</div>
			<div class="phone2">
				<input type="text" class="frontNum" id="phone2" name="phone"
					maxlength='4' style="border: none">
			</div>
			<div class="phone3">
				<input type="text" class="backNum" id="phone2" name="phone"
					maxlength='4' style="border: none">
			</div>

			<div class="emailtxt">
				<p>이메일</p>
			</div>
			<div class="email">
				<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요"
					style="border: none; font-size: 12px;">
				<f:errors path="email" element="div" cssClass="alert text-danger" />
			</div>
			<div class='atsign'>@</div>
			<div class="Eselect">
				<select id="Eselect" id="email" name="email"
					style="border: none; cursor:pointer; font-size: 12px;">
					<option value="">이메일주소</option>
					<option value="@naver.com">naver.com</option>
					<option value="@daum.net">daum.net</option>
					<option value="@gmail.com">gmail.com</option>
				</select>
			</div>

			<div class="stars1">
				<p>*</p>
			</div>
			<div class="stars2">
				<p>*</p>
			</div>
			<div class="stars3">
				<p>*</p>
			</div>
			<div class="stars4">
				<p>*</p>
			</div>
			<div class="stars5">
				<p>*</p>
			</div>
			<div class="stars6">
				<p>*</p>
			</div>
			<div class="addresstxt">
				<p>주소</p>
			</div>
			<div class="add">
				<input type="text" id="postcode" name="address" placeholder="우편번호"
					style="border: none; font-size: 12px;">
			</div>
			<div class="add1">
				<input type="button" class="addbtn" name="address"
					onclick="execDaumPostcode()" value="우편번호"
					style="border: none; cursor:pointer; font-size: 9px;"><br>
			</div>
			<div class="add2">
				<input type="text" id="roadAddress" name="address"
					placeholder="도로명주소" style="border: none; font-size: 12px;"><br>
			</div>
			<input type="hidden" id="jibunAddress" placeholder="지번주소">
			<span id="guide" style="color: #999; display: none"></span>
			<div class="add3">
				<input type="text" id="detailAddress" name="address"
					placeholder="상세주소" style="border: none; font-size: 12px;"><br>
			</div>
			<input type="hidden" id="extraAddress" placeholder="참고항목">
			<input type="hidden" id="engAddress" placeholder="영문주소">
			<br>

			<s:csrfInput />
			<div class="join">
				<input type="submit" id="join" value="회원가입" style="border: none; cursor:pointer;">
			</div>
		</f:form>

		<div class="footer">
			<div class="bottom_bar">
				<ul>
					<li><a href="/category"><img
							src="resources/images/category.png"></a></li>
					<li><a href="/hotel/list"><img
							src="resources/images/hotel.png"></a></li>
					<li><a href="/home"><img src="resources/images/logo2.png"></a></li>
					<li><a href="/community"><img
							src="resources/images/community.png"></a></li>
					<li><a href="/login"><img src="resources/images/login.png"></a></li>
				</ul>


			</div>
		</div>

	</div>

</body>
</html>