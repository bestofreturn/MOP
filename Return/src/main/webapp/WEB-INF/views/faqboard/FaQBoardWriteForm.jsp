<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">



<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>



<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<link rel="shortcut icon" type="image⁄x-icon" href="/resources/image/calendar-icon.png">

<title>faqboard</title>





<style>

body {

  padding-top: 70px;

  padding-bottom: 30px;

}



</style>

</head>

<body>

	<article>

		<div class="container" role="main">

			<h2>faq write Form</h2>

			<form action="insertFaQBoard.do" method="post"
		enctype="multipart/form-data">
				<input type="hidden" name="faqWriter" value="${loginMember.memberId }">
				<div class="mb-3">

					<label for="faqTitle">제목</label>

					<input type="text" class="form-control" name="faqTitle" id="faqTitle" placeholder="제목을 입력해 주세요">

				</div>


				<div class="mb-3">

					<label for="faqContent">내용</label>

					<textarea class="form-control" rows="5" name="faqContent" id="faqContent" placeholder="내용을 입력해 주세요" ></textarea>

				</div>

			

				<input type="submit" value="등록하기">

				&nbsp; <a href="FaQBoardList.do">목록으로</a>
			</form>

			<div >


			</div>

		</div>

	</article>

</body>

</html>



