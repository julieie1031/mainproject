<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위치 페이지</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<style>
.locationBar{
	width:100%;
	height:50px;
	margin: 10px 10px 0px 10px;
	font-size:15px;
}

.locationBar2{
	width:100%;
	height:30px;
	font-size:15px;
	margin: 10px 10px 0px 10px;
}

.locationBarCon{
	margin:10px;

}
.locationBarCon div{
	cursor: pointer;
background: #e8e9e8;
	float:left;
	padding:10px;

}

.locationBarCon div:hover{
	cursor: pointer;
background: #a9a9a9;
	float:left;
	padding:10px;

}


#getMyPositionBtn{
	display:block;
	width:20px;
	height:20px;
}
#getMyPositionBtn img{
	display: block;
    width: 20px;
    height: 20px;
}

#storeInfo{
	width: 200px;
    height: 440px;
    background: #fff;
    opacity: 0.8;
    position: fixed;
    left: 650px;
    top: 220px;
    display:none;
    border: 1px solid #49574b;
    

}

#placesList{
	padding-top: 20px;
	padding-bottom:5px;
	text-align:center;
	font-size:13px;

}

#storeInfo li{
	padding-bottom:5px;
}


#pagination_list{
font-size:13px; text-align: center; position:absolute;  width: 100%;bottom:10px;

}

#pagination a{
	padding-right:3px;
}


.infoContent {
	display:block; 
    background: #50627F;
    color: #fff;
    text-align: center;
    width:160px;
    height: 24px;
    line-height:22px;
    border-radius:4px;
    padding:0px 10px;
   	font-size:13px;
}

.areaSearch{
	cursor: pointer;
	font-size:12px;
	width:100%;
	position: relative;
	left:380px;
    
}

.nomalSearch{
	cursor: pointer;
	font-size:12px;
	width:100%;
	position: relative;
    left:340px;
}

.searchdiv{
	padding-top:10px;
	font-size: 13px;
    clear: both;
    text-align: center;

}

.searchdiv .icon{
  position: absolute;
  margin-left: 15px;
  margin-top: 11px;
  z-index: 1;
  color: #4f5b66;
}

.searchbar{
  width: 413px;
  height: 40px;
  background: #f4f4f4;
  border: none;
  font-size: 10pt;
  color: #787878;
  padding-left: 45px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
}
a{

	text-decoration:none;
	color:#000
}

</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27898b804bcd7311092722c6048cf498&libraries=services"></script>
</head>
<body>
<%@include file="layout/header2.jsp"%>

<!-- 상단바 스크립트 -->
<script>

$(document).ready(function() {
	$('.locationBar').show();
	$('.locationBar2').hide();
	$('.nomalSearch').hide();
	$('.searchdiv').hide();
	
	$(".areaSearch").click(function() {

		
			$('#getMyPositionBtn').hide();
			$('.locationBar').hide();
			$('.locationBar2').show();
			$('.areaSearch').hide();
			$('.nomalSearch').show();
			$('.searchdiv').show();
			


		});
	$(".nomalSearch").click(function() {

		$('#getMyPositionBtn').show();
		$('.locationBar2').hide();
		$('.locationBar').show();
		$('.nomalSearch').hide();
		$('.areaSearch').show();
		$('.searchdiv').hide();



	});

		});
</script>


<script>

var



</script>

<div class="nomalSearch">
내 위치 주변 검색은 click!!
</div>

<div class="areaSearch">
지역검색은 click!!
</div>


<!-- 카테고리bar -->
<div class="locationBar">
	<div class="locationBarCon">
		<div onclick="keywordSearch('동물병원')">동물병원</div>
		<div onclick="keywordSearch('애견카페')">애견카페</div>
		<div onclick="keywordSearch('반려견음식점')">맛집</div>
		<div onclick="keywordSearch('애견호텔')">애견호텔</div>
		<div onclick="keywordSearch('애견유치원')">유치원</div>
		<div onclick="keywordSearch('애견놀이터')">놀이터</div>
		<div onclick="keywordSearch('애견미용')">미용</div>
	</div>
</div>


<!-- 지역검색bar -->

<div class="searchdiv" >
  <span class="icon"><i class="fa fa-search"></i></span>
  <c:if test="${mainKey != null }">
    <c:set var="areakey" value="${mainKey }"></c:set>
  </c:if>
  <input class="searchbar" type="text" value="${areakey }" id="areakeyword" placeholder="지역명을 입력하세요.">
</div>

<div class="locationBar2">
	<div class="locationBarCon">
		<div onclick="keywordSearch2('동물병원')">동물병원</div>
		<div onclick="keywordSearch2('애견카페')">애견카페</div>
		<div onclick="keywordSearch2('반려견음식점')">맛집</div>
		<div onclick="keywordSearch2('애견호텔')">애견호텔</div>
		<div onclick="keywordSearch2('애견유치원')">유치원</div>
		<div onclick="keywordSearch2('애견놀이터')">놀이터</div>
		<div onclick="keywordSearch2('애견미용')">미용</div>
	</div>
</div>




<div style="width:100%; height:30px; left: 470px; position: relative;">

<a href="#" id="getMyPositionBtn" onclick="getCurrentPosBtn()">
<img src="/resources/images/location/myLatLng.png">
</a>

</div>

<!-- 지도 -->
<div class="map_wrap" style="width:100%; height:500px;">
	<div id="map" style="width:100%;height:500px;"></div>
</div>

<div id="storeInfo">
	<ul id="placesList"></ul>
	<div id="pagination_list">
    <div id="pagination"></div>
	</div>
</div>


<!-- 스크립트 -->

<!-- 카테고리검색 -->
<!-- 내 위치 가져오기 -->
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new kakao.maps.LatLng(37.56646, 126.98121), // 지도의 중심좌표
    level: 7, // 지도의 확대 레벨
    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
};

//지도를 생성한다
var map = new kakao.maps.Map(mapContainer, mapOption);
var currentPos;
function locationLoadSuccess(pos){
// 현재 위치 받아오기
currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);

// 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
map.panTo(currentPos);

// 마커 생성
var marker = new kakao.maps.Marker({
    position: currentPos
});

// 기존에 마커가 있다면 제거
marker.setMap(null);
marker.setMap(map);
};

function locationLoadError(pos){
alert('위치 정보를 가져오는데 실패했습니다.');
};

//위치 가져오기 버튼 클릭시
function getCurrentPosBtn(){
navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
};


//위치가져오기 끝

//검색 버튼 클릭시
function keywordSearch(departs){
	
	$('#storeInfo').show();
	
    var keyword = departs;
    var markers = [];
    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places(map);
    

    // 검색 옵션 객체
    var searchOption = {
        location: currentPos,
        radius: 2000,
        size: 10
    };

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword,placesSearchCB,searchOption);
    
    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlacesOnSidebar(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }
 
    // 사이드바에 결과 출력 + 마커 생성
    function displayPlacesOnSidebar(places) {
    	
    	
    	

        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementsByClassName('result-list'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }


// 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '<a href = "'+kakaoSearch(places.id)+'" target="_blank" title"클릭시 네이버 검색">'+
                '   <h5>' + places.place_name + '</h5></a>'/* +'<a href="https://map.kakao.com/link/to/'+places.id+'">길찾기</a>' */;

        itemStr += '  <span class="tel">' + places.phone  + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {

        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(24, 35),  // 마커 이미지의 크기
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });
        

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
    	var content = '<span class="infoContent">' + title + '</span>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
        }
    }
    function kakaoSearch(placeId){
    	return 'https://place.map.kakao.com/' + placeId;
    }
}


</script>


<!-- 지역검색 -->

<script>
function keywordSearch2(departs){
	
	mapOption = {
		 center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		 level: 7, // 지도의 확대 레벨
		 mapTypeId : kakao.maps.MapTypeId.ROADMAP
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
	$('#storeInfo').show();
	
    var keyword = departs;
    var area = document.getElementById('areakeyword').value;
    var result = keyword+area;
    var markers = [];
    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places(map);
    
    var searchOption = {
            radius: 2000,
            size: 10
        };
   

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(result,placesSearchCB,searchOption);
    
    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlacesOnSidebar(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }
 
    // 사이드바에 결과 출력 + 마커 생성
    function displayPlacesOnSidebar(places) {
    	
    	
    	

        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementsByClassName('result-list'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }


// 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '<a href = "'+kakaoSearch(places.id)+'" target="_blank" title"클릭시 네이버 검색">'+
                '   <h5>' + places.place_name + '</h5></a>';

        itemStr += '  <span class="tel">' + places.phone  + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {

        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(24, 35),  // 마커 이미지의 크기
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });
        

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<span class="infoContent">' + title + '</span>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild(el.lastChild);
        }
    }
    function kakaoSearch(placeId){
    	return 'https://place.map.kakao.com/' + placeId;
    }
}



</script>

<script>


var getParameters = function (paramName) {
    // 리턴값을 위한 변수 선언
    var returnValue;

    // 현재 URL 가져오기
    var url = location.href;

    // get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');

    // 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
    for (var i = 0; i < parameters.length; i++) {
        var varName = parameters[i].split('=')[0];
        if (varName.toUpperCase() == paramName.toUpperCase()) {
            returnValue = parameters[i].split('=')[1];
            return decodeURIComponent(returnValue);
        }
    }
};

var categoryId = getParameters('category');
if(categoryId==1){
	keywordSearch('동물병원');
}else if(categoryId==2){
	keywordSearch('애견카페');
}else if(categoryId==3){
	keywordSearch('반려견음식점');
}else if(categoryId==4){
	keywordSearch('애견유치원');
}else if(categoryId==5){
	keywordSearch('애견놀이터');
}else if(categoryId==6){
	keywordSearch('애견미용');
}


</script>




<%@include file="layout/footer.jsp"%>
</body>
</html>