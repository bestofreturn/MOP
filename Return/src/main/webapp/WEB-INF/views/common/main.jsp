<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>Re:turn</title>
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

body {
  background-color: white;
  color: black;
}

.dark-mode {
  background-color: black !important;
  color: white !important;
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

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
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
<body class="w3-black">
	<!-- Icon Bar (Sidebar - hidden on small screens) -->
	<div class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">

		<a href="#" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
			<i class="fa fa-home w3-xxlarge"></i>
			<p>HOME</p>
		</a>
		<c:if test="${empty sessionScope.loginMember }">
			<a onclick="document.getElementById('id01').style.display='block'"
				style="width: auto;"
				class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
				class="fa fa-user w3-xxlarge"></i>
				<p>LOGIN</p>
			</a>
		</c:if>
		<c:if test="${!empty sessionScope.loginMember }">
			<a onclick="location.href='logout.do'" style="width: auto;"
				class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
				class="fa fa-user w3-xxlarge"></i>
				<p>LOGOUT</p>
			</a>
		</c:if>
		<!--  로그인 form  -->
		<div id="id01" class="modal">
			<form class="modal-content animate" action="login1.do" method="post">
				<div class="imgcontainer">
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="close" title="Close Modal">&times;</span>
				</div>
				<div class="container">
					<label for="uname"><br> <b>Username</b><br></label> <input
						type="text" placeholder="Enter memberId" name="memberId">
					<label for="psw"><br> <b>Password</b><br></label> <input
						type="password" placeholder="Enter Password" name="memberPwd">
					<p>
						<button type="submit" id="login-btn" class="btn btn-login">Login</button>
						<button type="button" onclick="location.href='enrollView.do';">Sign
							Up</button>
				</div>
			</form>
		</div>
		<a href="placeList.do"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-eye w3-xxlarge"></i>
			<p>제휴업체</p>
		</a> <a href="freeBoardList.do"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fas fa-edit w3-xxlarge"></i>
			<p>게시판</p>
		</a>
	</div>

	<!-- Navbar on small screens (Hidden on medium and large screens) -->
	<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
		<div
			class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
			<a href="#" class="w3-bar-item w3-button"
				style="width: 25% !important">HOME</a> <a href="#about"
				class="w3-bar-item w3-button" style="width: 25% !important">LOGIN</a>
			<a href="#photos" class="w3-bar-item w3-button"
				style="width: 25% !important">PHOTOS</a> <a href="#contact"
				class="w3-bar-item w3-button" style="width: 25% !important">CONTACT</a>
		</div>
	</div>

	<!-- Page Content -->
	<div class="w3-padding-large" id="main">
		<!-- Header/Home -->
		<header class="w3-container w3-padding-32 w3-center w3-black-hover"
			id="home">

			<img src="/resources/image/logo.png"
				style="width: 185px; margin-top: -50px;">
			<!-- 여기다가 스케줄러를 넣어볼까? -->
			<!-- <img src="" alt="" class="w3-image" width="992" height="1108"> -->
			<a href="/schedulerList.do">스케줄러</a>
		</header>
		<!-- <button onclick="myFunction()">Toggle dark mode</button> -->
	
		<!-- Grid for pricing tables -->
		<h3 class="w3-padding-16 w3-text-light-grey">My Price</h3>
		<div class="w3-row-padding" style="margin: 0 -16px">
			<div class="w3-half w3-margin-bottom">
				<ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
					<li class="w3-dark-grey w3-xlarge w3-padding-32">Basic</li>
					<li class="w3-padding-16">Web Design</li>
					<li class="w3-padding-16">Photography</li>
					<li class="w3-padding-16">5GB Storage</li>
					<li class="w3-padding-16">Mail Support</li>
					<li class="w3-padding-16">
						<h2>$ 10</h2> <span class="w3-opacity">per month</span>
					</li>
					<li class="w3-light-grey w3-padding-24">
						<button class="w3-button w3-white w3-padding-large w3-hover-black">Sign
							Up</button>
					</li>
				</ul>
			</div>

			<div class="w3-half">
				<ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
					<li class="w3-dark-grey w3-xlarge w3-padding-32">Pro</li>
					<li class="w3-padding-16">Web Design</li>
					<li class="w3-padding-16">Photography</li>
					<li class="w3-padding-16">50GB Storage</li>
					<li class="w3-padding-16">Endless Support</li>
					<li class="w3-padding-16">
						<h2>$ 25</h2> <span class="w3-opacity">per month</span>
					</li>
					<li class="w3-light-grey w3-padding-24">
						<button class="w3-button w3-white w3-padding-large w3-hover-black">Sign
							Up</button>
					</li>
				</ul>
			</div>
			<!-- End Grid/Pricing tables -->
		</div>
		<!-- Portfolio Section -->
		<div class="w3-padding-64 w3-content" id="photos">
			<h2 class="w3-text-light-grey">My Photos</h2>
			<hr style="width: 200px" class="w3-opacity">

			<!-- Footer -->
			<footer class="w3-content w3-padding-64 w3-text-grey w3-xlarge">

				<!-- End footer -->
			</footer>
		</div>
		<!-- END PAGE CONTENT -->
	</div>
</body>
</html>