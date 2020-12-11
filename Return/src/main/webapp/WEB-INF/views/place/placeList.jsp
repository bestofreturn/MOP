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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e2ff479e69641e529685675a0c08ffd4"></script>
<script
	src="https://unpkg.com/@webcreate/infinite-ajax-scroll/dist/infinite-ajax-scroll.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<title>MoP - 제휴 업체 리스트</title>
<style>
body {
	margin : 0;
}
div {
	font-family: "Montserrat", sans-serif;
}

div.placeList {
	width: 35%;
	float: left;
	height: 100%;
	margin: 0 150px;
}

.map {
	width: 40%;
	float: right;
	height: 100%;
}

div.empty {
	width: 10%;
	float: left;
}

hr.class-2 {
	border-top: 3px double #8c8b8b;
}

body.hr {
	background-color: gray;
	width: 80px;
	float: center;
	border: 2px solid;
}

</style>
</head>
<body>
	<jsp:include page="../common/sidenav.jsp"></jsp:include>
	<header class="w3-container w3-padding-32 w3-center w3-black" id="home">
		<img src="/resources/image/logo.png"
			style="width: 185px; margin-top: -75px;">
	</header>
	<hr class="class-2" />
	<div class="placeList">
		<table>
			<c:forEach var="place" items="${pList }">
				<tr>
					<td><img src="/resources/image${place.pImg }"
						style="width: 200px; height: 200px;"></td>
					<td>${place.pName }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="map">
		<div id="map" style="width: 500px; height: 600px;"></div>
	</div>

	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);

		map.setDraggable(true);
		map.setZoomable(true);
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	</script>

</body>
</html>