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
	left: 400px;
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
	left : 700px;

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
		<div class="w3-content" style="max-width: 86%;">
			<div class="w3-row-padding w3-padding-13">
				<div class="w3-third w3-margin-bottom" style="width:38%;">
					<img src="/resources/image${place.pImg }" alt="Image"
						style="width: 100%;">
					<div class="w3-container w3-white">
						<h2>${place.pName }</h2>
						<h6 class="w3-opacity">가격 : ${place.price }원</h6>
						<h6 class="w3-opacity">최대 인원 수 : ${place.pMax }명</h6>
						<h6 class="w3-opacity">상세 정보 :${place.pDetail }</h6>
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
		<div class="w3-content" style="max-width: 86%;">
			<div class="w3-row-padding w3-padding-13">
				<div class="w3-third w3-margin-bottom" style="width:38%;">
					<img src="/resources/image${place.pImg }" alt="Image"
						style="width: 100%;">
					<div class="w3-container w3-white">
						<h2>${place.pName }</h2>
						<h6 class="w3-opacity">가격 : ${place.price }원</h6>
						<h6 class="w3-opacity">최대 인원 수 : ${place.pMax }명</h6>
						<h6 class="w3-opacity">상세 정보 :${place.pDetail }</h6>
						<p class="w3-large">
							<i class="fa fa-car"></i> <i class="fa fa-phone"></i> <i
								class="fa fa-wifi"></i>
						</p>
						<button class="w3-button w3-block w3-black w3-margin-bottom"
							onclick="location.href='placeDetail.do?pId=${place.pId}';">상세보기</button>
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
		
        function initMap() {
            //지도 스타일
            var map = new google.maps.Map(document.getElementById('map'), {  
                //처음 중심 좌표
                center: {
                    lat: 37.587624,
                    lng: 126.976020
                },
                //처음 줌 값. 숫자가 작을수록 낮은 배율
                zoom: 13
            });
 
            //마커 정보
            var locations = [
                //경복궁 마커
                ['<div class="wrap"><div class="text-box"><h4>경복궁</h4><div class="img-box"><img src="https://image.shutterstock.com/image-vector/palace-icon-outline-vector-web-260nw-1046855677.jpg"></div><a target="_blank" href="https://www.royalpalace.go.kr/"><p>홈페이지 방문하기</p></a></div>', 37.577624, 126.976020],          
                
                //딸기케이크 마커
                ['<div class="wrap"><div class="text-box"><h4>딸기케이크</h4><div class="img-box"><img src="https://media.istockphoto.com/vectors/piece-of-cake-with-strawberries-icon-element-of-bakery-icon-premium-vector-id931551700"></div><a target="_blank" href="https://noa-xyz.tistory.com"><p>홈페이지 방문하기</p></a></div>', 37.559524, 126.976710],
                
                
                //창덕궁 마커
                ['<a target="_blank" href="https://cdg.go.kr/">창덕궁 홈페이지</a>', 37.579711, 126.991043]
                
                
                ]
 
            //마커 이미지
            var customicon = 'http://drive.google.com/uc?export=view&id=1tZgPtboj4mwBYT6cZlcY36kYaQDR2bRM'
 
            //인포윈도우
            var infowindow = new google.maps.InfoWindow();
 
            //마커 생성
            var marker, i;
            for (i = 0; i < locations.length; i++) {
                marker = new google.maps.Marker({
                    
                    //마커의 위치
                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                    
                    //마커 아이콘
                    icon: customicon,
                    
                    //마커를 표시할 지도
                    map: map
                });
 
                google.maps.event.addListener(marker, 'click', (function(marker, i) {
                    return function() {
                        
                        //html로 표시될 인포 윈도우의 내용
                        infowindow.setContent(locations[i][0]);
                        
                        //인포윈도우가 표시될 위치
                        infowindow.open(map, marker);
                    }
                })(marker, i));
                
                if (marker) {
                    marker.addListener('click', function() {
                        
                        //중심 위치를 클릭된 마커의 위치로 변경
                        map.setCenter(this.getPosition());
 
                        //마커 클릭 시의 줌 변화
                        map.setZoom(14);
                    });
                }
            }
        }
	</script>
    <!-- key= 뒤에 API 키 입력 -->
    <script src="https://maps.google.com/maps/api/js?key=AIzaSyAWyXsL_ueqnHIPOyOWeywqEbPStXQSMHw&callback=initMap" type="text/javascript" async defer></script>
</body>
</html>