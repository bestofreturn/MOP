<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<style>
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://www.w3schools.com/w3css/4/w3.css?after">
<!--  지도 api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2ff479e69641e529685675a0c08ffd4"></script>
<title>MoP - 제휴 업체 리스트</title>
<style>
body {
	margin: 0;
}

div {
	font-family: "Montserrat", sans-serif;
}

div.empty {
	width: 30%;
	float: left;
}

.w3-content {
	position: relative;
	left: 50px;
}

.w3-col.m2 {
	position: relative;
	left: 450px;
}

div.left {
	float: left;
}

div.right {
	float: right;
	width: 55%;
	height: 100%;
	position : absolute;
	z-index : 1;
	left : 800px;

}
</style>
</head>
<body>
	<jsp:include page="../common/sidenav.jsp"></jsp:include>
	<header class="w3-container w3-padding-32 w3-center w3-black" id="home">
		<img src="/resources/image/logo.png"
			style="width: 185px; margin-top: -75px;">
	</header>
	<!-- Page content -->
	<div class="w3-row-padding">
		<div class="w3-col m2">
			<button style="width: 100px;" value="all">전체보기</button>
		</div>
		<div class="w3-col m2">
			<button style="width: 130px;" value="CF">스터디 카페</button>
		</div>
		<div class="w3-col m2">
			<button style="width: 100px;" value="LG">라운지</button>
		</div>
		<div class="w3-col m2">
			<button style="width: 100px;" value="RS">레스토랑</button>
		</div>
	</div>
	<div class="right">
		<div id="map" style="width :100%; height : 1000px;"></div>
	</div>
	<c:forEach var="place" items="${pList }">
		<div class="w3-content" style="max-width: 85%;">
			<div class="w3-row-padding w3-padding-13">
				<div class="w3-third w3-margin-bottom">
					<img src="/resources/image${place.pImg }" alt="Image"
						style="width: 100%;">
					<div class="w3-container w3-white">
						<h3>${place.pName }</h3>
						<h6 class="w3-opacity">${place.price }원</h6>
						<p class="w3-large">
							<i class="fa fa-car"></i> <i class="fa fa-phone"></i> <i
								class="fa fa-wifi"></i>
						</p>
						<button class="w3-button w3-block w3-black w3-margin-bottom" onclick="location.href='placeDetail.do?pId=${place.pId}';">상세보기</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

	<c:forEach var="place" items="${categoryList }">
		<div class="w3-content" style="max-width: 85%;">
			<div class="w3-row-padding w3-padding-13">
				<div class="w3-third w3-margin-bottom">
					<img src="/resources/image${place.pImg }" alt="Image"
						style="width: 100%;">
					<div class="w3-container w3-white">
						<h3>${place.pName }</h3>
						<h6 class="w3-opacity">${place.price }원</h6>
						<p class="w3-large">
							<i class="fa fa-car"></i> <i class="fa fa-phone"></i> <i
								class="fa fa-wifi"></i>
						</p>
						<button class="w3-button w3-block w3-black w3-margin-bottom"
							style="text-align: center">상세보기</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<script>
		$(function() {
			$("button").on('click', function() {
				var pCode = $(this).val();
				$.ajax({
					url : 'psort.do',
					type : "GET",
					cache : false,
					headers : {
						"cache-control" : "no-cache",
						"pragma" : "no-cache"
					},
					data : {
						"pCode" : pCode
					},
					success : function(data) {
						console.log(data);
						$('body').html(data);
					},
					error : function(data) {
						alert('error');
					}
				});
			});
		});

		
		// 지도 
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(37.57322751275347, 126.9823491544678), //지도의 중심좌표.
			level : 8
		//지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		var positions = [
		    {
		        title: 'KH 정보교육원', 
		        latlng: new kakao.maps.LatLng(37.57322751275347, 126.9823491544678)
		    },
		    {
		        title: '스터디 카페 북킹', 
		        latlng: new kakao.maps.LatLng(37.6486518,127.0598204)
		    },
		    {
		        title: '더 스터디 카페 (회기)', 
		        latlng: new kakao.maps.LatLng(37.4983333,127.0000335)
		    },
		    {
		        title: '작심 스터디 카페',
		        latlng: new kakao.maps.LatLng(37.4971688,127.0344931)
		    },
		    {
		        title: '디플레이스 스터디 카페 일산',
		        latlng: new kakao.maps.LatLng(37.4999791,126.9909113)
		    },
		    {
		        title: '포텐 스터디카페',
		        latlng: new kakao.maps.LatLng(37.6686013,126.7647988)
		    },
		    {
		        title: '스터디 카페 ON24 잠실점',
		        latlng: new kakao.maps.LatLng(37.576401, 127.001090)
		    },
		    {
		        title: '르하임 스터디 카페',
		        latlng: new kakao.maps.LatLng(37.5711842,127.0195243)
		    },
		    {
		        title: '비에이블 스터디 카페 문래센터',
		        latlng: new kakao.maps.LatLng(37.4873419,127.0173855)
		    },
		    {
		        title: '랭스터디카페 대학로점',
		        latlng: new kakao.maps.LatLng(37.5343925,126.9956614)
		    },
		    {
		        title: 'Monday Blues',
		        latlng: new kakao.maps.LatLng(37.5671447,126.9785753)
		    },
		    {
		        title: '압구정 미연',
		        latlng: new kakao.maps.LatLng(37.5014438,126.9950806)
		    },
		    {
		        title: '만요 임피리얼 팰리스 호텔',
		        latlng: new kakao.maps.LatLng(37.5014438,126.9950806)
		    },
		    {
		        title: '아트리움(Atrium)',
		        latlng: new kakao.maps.LatLng(37.4958262,126.9866563)
		    },
		    {
		        title: '엘올리브',
		        latlng: new kakao.maps.LatLng(37.5282375,127.0529482)
		    },
		    {
		        title: '피터팬스테이크',
		        latlng: new kakao.maps.LatLng(37.5558303,127.0040056)
		    },
		    {
		        title: '세종클럽',
		        latlng: new kakao.maps.LatLng(37.5557742,127.1092363)
		    },
		    {
		        title: '임페리얼 트레져',
		        latlng: new kakao.maps.LatLng(37.5507732,127.1052563)
		    },
		    {
		        title: '밀레폴리에',
		        latlng: new kakao.maps.LatLng(37.5571565,127.0363003)
		    },
		    {
		        title: '더파크뷰',
		        latlng: new kakao.maps.LatLng(37.5454952,127.0548793)
		    },
		    {
		        title: '시그니엘 서울',
		        latlng: new kakao.maps.LatLng(37.5408164,127.0733652)
		    },
		    
		    
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, marker);  
		});
		
	</script>
</body>
</html>