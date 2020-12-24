<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<style>
body {
	background-image: url('../img/login_background.jpg');
	background-size: 100%;
}

.btn {
	outline: 0;
	border: 0;
	padding: 15px;
	margin: 15px 0 15px;
	background: #f2f2f2;
	font-size: 14px;
	cursor: pointer;
	box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.2), 0 1px 1px 0
		rgba(0, 0, 0, 0.24);
	position : relative;
	bottom : -30px;
}

.btn:active {
	box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.2), 0 0 0 0 rgba(0, 0, 0, 0.24);
}

#loginDiv, #registDiv, #myInfoDiv {
	background: #ffffff99;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
	width: 900px;
	height : 500px;
	margin: 20% auto 0;
	padding: 45px;
	text-align: center;
	position: relative;
	left: 50px;
}

#loginDiv
a:visited {
	color: black;
}

.loginTB, .registTB, .myInfoTB {
	width: 100%;
	outline: 0;
	background: #f2f2f2;
	border: 0;
	padding: 15px;
	margin: 0 0 15px;
	box-sizing: border-box;
}

#myInfoDiv table {
	width: 150%;
    position: relative;
    left: -60px;
    top: 20px;
    font-size: small;
}
#img {
	width :20%;
	float : left;
}
#detail {
	width : 60%;
	float: left;
}
#review {
	width : 20%;
	float : left;
}
#mypagecontent {
	width : 100%;
	height :100px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>내 정보</title>
</head>
<body>
	<jsp:include page="../common/sidenav.jsp"></jsp:include>
	<div id=myInfoDiv style="margin-top: 6%"> 예약 정보 
	<hr>
	<div>
	 ${loginMember.memberName }님 <span style="color: red"> 사용 가능 포인트 :${loginMember.won } </span>
	</div>
	<hr style="width:40%; text-align:center;    width: 40%;
    position: relative;
    left: 238px;
    margin-top: 5px;">
	<div id="mypagecontent">
		<div id="img"> 이미지 </div> 
		<div id="detail"> 예약 상세 설명 </div>
		<div id="review"> 리뷰 작성  </div>
	</div>
	<hr>
	</div>
</body>
</html>