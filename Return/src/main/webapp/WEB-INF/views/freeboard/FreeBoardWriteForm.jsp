<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 작성</title>
<script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h1 align="center">게시글 작성하기</h1>
	<br>
	<form action="insertFreeBoard.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="fWriter" value="${loginMember.memberId }">
		<table align="center" id="tb">
			<tr>
				<td>제목</td>
				<td><input  type="text" name="fTitle" style="width:560px;"></td>
			</tr>
<!-- 			<tr> -->
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="fContent" id="editor"></textarea></td>
				<script>CKEDITOR.replace('editor');</script>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="등록하기"> &nbsp; <a href="#">목록으로</a></td>
			</tr>
		</table>
	</form>
</body>
</html>