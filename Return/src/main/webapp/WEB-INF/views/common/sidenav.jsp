<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Montserrat", sans-serif
}

.w3-row-padding img {
	margin-bottom: 12px
}
/* Set the width of the sidebar to 120px */
.w3-sidebar {
	width: 120px;
	background: #222;
}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {
	margin-left: 120px
}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {
	#main {
		margin-left: 0
	}
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

</style>
</head>
<body class="w3-black">

	<!-- Icon Bar (Sidebar - hidden on small screens) -->
	<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">

		<a href="#" class="w3-bar-item w3-button w3-padding-large w3-black">
			<i class="fa fa-home w3-xxlarge"></i>
			<p>HOME</p>
		</a> <a onclick="document.getElementById('id01').style.display='block'"
			style="width: auto;"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-user w3-xxlarge"></i>
			<p>LOGOUT</p>
		</a>
		<a href="placeList.do"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-eye w3-xxlarge"></i>
			<p>제휴업체</p>
		</a> 
		<a href="#"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fas fa-edit w3-xxlarge"></i>
			<p>게시판</p>
		</a> 
	</nav>
	
	<!-- Navbar on small screens (Hidden on medium and large screens) -->
	<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
		<div
			class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
			<a href="home.do" class="w3-bar-item w3-button"
				style="width: 25% !important">HOME</a> <a href="#"
				class="w3-bar-item w3-button" style="width: 25% !important">LOGIN</a>
			<a href="placeList.do" class="w3-bar-item w3-button"
				style="width: 25% !important">제휴업체</a> <a href="#"
				class="w3-bar-item w3-button" style="width: 25% !important">게시판</a>
		</div>
	</div>
</body>


</html>