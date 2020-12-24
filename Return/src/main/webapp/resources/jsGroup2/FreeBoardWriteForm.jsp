<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 작성</title>
</head>
<body>
	<h1 align="center">게시글 작성하기</h1>
	<br>
	<form action="insertFreeBoard.do" method="post"
		enctype="multipart/form-data">
		<table align="center" id="tb">
			<tr>
				<td>제목</td>
				<td><input type="text" name="fTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="fWriter" value="${loginUser.memberId }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="fContent"></textarea></td>
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