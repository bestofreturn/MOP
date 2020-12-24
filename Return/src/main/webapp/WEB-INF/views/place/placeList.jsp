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
div.wrap {
	font-family: "Montserrat", sans-serif;
	width: 200px;
	height: 200px;
	color: black;
	text-align: center;
}

body {
	margin: 0;
}

header {
	height: 100px;
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
	padding-top: 10px;
}

.w3-col.m2 {
	position: relative;
	left: 400px;
}

.w3-container w3-white {
	height: 290px;
}

div.left {
	float: left;
}

div.right {
	padding-top: 10px;
	float: right;
	right: 0;
	width: 55%;
	height: 100%;
	position: absolute;
	z-index: 1;
	left: 560px;
}
/* 로그인 창 
 Full-width input fields */
input[type=text], input[type=password] {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}
/* Set a style for all buttons */
button {
	background-color: black;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 50%;
}

button:hover {
	opacity: 0.8;
}
/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 9999 !important; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 40%; /* Could be more or less, depending on screen size */
}
/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}
/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
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
		<div id="map" style="width: 100%; height: 430px;"></div>
	</div>
	<!--  로그인 form  -->
	<div id="id01" class="modal">
		<form class="modal-content animate" action="login1.do" method="post">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span>
			</div>
			<div class="container">
				<label for="uname"><br> <b>Username</b><br></label> <input
					type="text" placeholder="Enter memberId" name="memberId"> <label
					for="psw"><br> <b>Password</b><br></label> <input
					type="password" placeholder="Enter Password" name="memberPwd">
				<p>
					<button type="submit" id="login-btn" class="btn btn-login">Login</button>
					<button type="button" onclick="location.href='enrollView.do';">Sign
						Up</button>
			</div>
		</form>
	</div>
	
	<!--  장소 전체 리스트 출력  -->
	<c:forEach var="place" items="${pList }">
		<div class="w3-content" style="max-width: 86%;">
			<div class="w3-row-padding w3-padding-13">
				<div class="w3-third w3-margin-bottom" style="width: 38%;">
					<%-- <input type="hidden" data-pId="${place.pId }" value="${place.pId }"> --%>
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

	<c:forEach var="place" items="${categoryList }">
		<div class="w3-content" style="max-width: 86%;">
			<div class="w3-row-padding w3-padding-13">
				<div class="w3-third w3-margin-bottom" style="width: 38%;">
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
		// 카테고리 분류 하여 리스트 출력하는 ajax 
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
			var option = {
				//처음 중심 좌표
				center : {
					lat : 37.5642135,
					lng : 127.0016985
				},
				//처음 줌 값. 숫자가 작을수록 낮은 배율
				zoom : 11,
				mapTypeControl : false
			}
			//지도 스타일
			var map = new google.maps.Map(document.getElementById('map'),
					option);
			//마커 정보
			var locations = [
					// 3번
					[
						'<div class="wrap"><div class="text-box"><h4>어썸 스터디 카페</h4><div class="img-box"><img src="/resources/image/img/lg_3.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=3"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.577624, 126.976020 ],
					// 4번
					[
						'<div class="wrap"><div class="text-box"><h4>작심 스터디 카페</h4><div class="img-box"><img src="/resources/image/img/lg_4.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=4"><p style="color : black; text-align:center;" >상세보기</p></a></div>',		
							37.559524, 126.976710 ],

					// 1번
					[
						'<div class="wrap"><div class="text-box"><h4>스터디 카페 북킹 </h4><div class="img-box"><img src="/resources/image/img/lg_1.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=1"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.579711, 126.991043 ],
					//30번
					[
						'<div class="wrap"><div class="text-box"><h4>롯데호텔 페닌슐라 라운지 / 바 </h4><div class="img-box"><img src="/resources/image/img/lg_30.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=30"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.5652962,126.9788531 ],
					//20번
					[
						'<div class="wrap"><div class="text-box"><h4>더 파크 뷰</h4><div class="img-box"><img src="/resources/image/img/lg_20.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=20"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.5554698,127.0033856 ],
					//25번
					[
						'<div class="wrap"><div class="text-box"><h4>스카이 라운지</h4><div class="img-box"><img src="/resources/image/img/lg_25.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=25"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.579711, 126.991043 ],
					//10번
					[
						'<div class="wrap"><div class="text-box"><h4>랭 스터디 카페 대학로점 </h4><div class="img-box"><img src="/resources/image/img/lg_10.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=10"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.5822206,127.0005696 ],
							
					//15번
					[
						'<div class="wrap"><div class="text-box"><h4>엘 올리브</h4><div class="img-box"><img src="/resources/image/img/lg_15.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=15"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.5047005,127.0253226 ],
					//26번
					[
						'<div class="wrap"><div class="text-box"><h4>쉐라톤 서울 디큐브 시티 라운지 바 </h4><div class="img-box"><img src="/resources/image/img/lg_26.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=26"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.508807,126.8875999 ],
					//19번
					[
						'<div class="wrap"><div class="text-box"><h4>밀레폴리에</h4><div class="img-box"><img src="/resources/image/img/lg_19.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=19"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
						37.6622976,126.7846428],
					//22번
					[
						'<div class="wrap"><div class="text-box"><h4>신라 호텔 라운지 제주 </h4><div class="img-box"><img src="/resources/image/img/lg_22.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=22"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
						33.2473942,126.4058431 ],
					//21번
					[
						'<div class="wrap"><div class="text-box"><h4>시그니엘 서울 </h4><div class="img-box"><img src="/resources/image/img/lg_21.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=21"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
						37.5127973,127.1004395 ],
					
					//11번
					[ 
						'<div class="wrap"><div class="text-box"><h4> Monday Blues </h4><div class="img-box"><img src="/resources/image/img/lg_11.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=11"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
						37.5049534,127.0959039	],
					// 12번
					[
						'<div class="wrap"><div class="text-box"><h4>압구정 미연</h4><div class="img-box"><img src="/resources/image/img/lg_12.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=12"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
						37.5269553,127.0372125 ],
					// 23번
					[
						'<div class="wrap"><div class="text-box"><h4>리바 | Re:bar </h4><div class="img-box"><img src="/resources/image/img/lg_23.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=23"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.577624, 126.976020 ],
					// 28번
					[
						'<div class="wrap"><div class="text-box"><h4> 라운지 </h4><div class="img-box"><img src="/resources/image/img/lg_28.jpg" style="width:150px;height:100px;"></div><a target="_blank" href="placeDetail.do?pId=28"><p style="color : black; text-align:center;" >상세보기</p></a></div>',
							37.472611,127.038996 ],
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
					position : new google.maps.LatLng(locations[i][1],
							locations[i][2]),

					//마커 아이콘
					icon : customicon,

					//마커를 표시할 지도
					map : map
				});

				google.maps.event.addListener(marker, 'click', (function(
						marker, i) {
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
						map.setZoom(12);
					});
				}
			}
		}

		// 플로팅
		$(function() {
			var offset = $("#map").offset();
			var topPadding = 200;
			$(window).scroll(
					function() {
						if ($(window).scrollTop() > offset.top) {
							$("#map").stop().animate(
									{
										marginTop : $(window).scrollTop()
												- offset.top + topPadding
									});
						} else {
							$("#map").stop().animate({
								marginTop : 0
							});
						}
						;
					});
		});
		
	</script>
	<!-- key= 뒤에 API 키 입력 -->
	<script
		src="https://maps.google.com/maps/api/js?key=AIzaSyAWyXsL_ueqnHIPOyOWeywqEbPStXQSMHw&callback=initMap"
		type="text/javascript" async defer></script>

</body>
</html>