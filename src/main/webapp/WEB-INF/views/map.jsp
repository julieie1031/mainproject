<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어서오개 지도</title>

<style>

*{margin: 0; padding: 0;}    

.introduce{

display: block;
margin: auto;

}

.h1a{

margin: auto;
text-align: center;

}


</style>

</head>
<body>


<h1 class = "h1a">오시는길</h1>


<div class="introduce" id="map" style="width:50%;height:550px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa2581ede15701d778af70c55ce1fc52"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.4809692236376, 126.95210362865886), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.4809692236376, 126.95210362865886); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null); 
</script>
<br>
<div class="h1a">■ 주소: 서울시 관악구 관악로 000 0동 000호&nbsp;&nbsp; ■ 고객상담센터 : 1644-0000&nbsp;&nbsp; ■ E-mail: dogdog@naver.com</div>


	
</body>
</html>