<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 수정</title>
<jsp:include page="../common/sidenav.jsp"></jsp:include>
</head>
<body>
	<h1 align="center">${freeBoard.fId }번게시글수정</h1>
	<br>
	<form action="freeBoardUpdate.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="page" value="${currentPage }"> 
		<input type="hidden" name="fId" value="${freeBoard.fId }"> 
		<input type="hidden" name="fOriginalFileName" value="${freeBoard.fOriginalFileName }">
     	 <input type="hidden" name="fRenameFileName" value="${freeBoard.fRenameFileName}">
     	 
		<table align="center" id="tb" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" name="fTitle"
					value="${freeBoard.fTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="fWriter"
					value="${freeBoard.fWriter }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="fContent">${freeBoard.fContent }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="reloadFile"> <c:if
						test="${ !empty freeBoard.fOriginalFileName }">
						<br>현재 업로드한 파일: <a href="/resources/fuploadFiles/${freeBoard.fOriginalFileName }" download>
							${freeBoard.fOriginalFileName }"</a>
					</c:if></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정">&nbsp;
					<c:url var="fList" value="freeBoardList.do">
						<c:param name="page" value="${currentPage }"></c:param>
					</c:url> <a href="${fList }">목록으로</a> <a href="javascript:history.go(-1);">이전페이지로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>