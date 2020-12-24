<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>이벤트게시판 리스트</title>
</head>
<body>
	<h1 align="center">게시글 목록</h1>
	<div class="container">
		<table class="table table-striped" align="center" border="0"
			cellspacing="0" width="700">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>

			<c:forEach items="${eList }" var="eventboard">
				<tr>
					<td>${eventboard.eId }</td>
					<td><c:url var="eDetail" value="eventBoardDetail.do">
							<c:param name="eId" value="${eventboard.eId }"></c:param>
							<c:param name="page" value="${pi.currentPage }"></c:param>
						</c:url> <a href="${eDetail}">${eventboard.eTitle }</a></td>
					<td>${eventboard.eWriter }</td>
					<td>${eventboard.eCreateDate }</td>
					<td>${eventboard.eCount }</td>
				</tr>
			</c:forEach>
		</table>
		<button type="button" class="btn btn-default pull-right"
			onclick="location.href='EventBoardWriteView.do'">글쓰기</button>
		<div class="text-center">
			<ul class="pagination">
				<!-- 이전 -->
				<c:if test="${pi.currentPage <= 1 }">
					<li><a><</a>&nbsp;</li>
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<c:url var="before" value="eventBoardList.do">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>
					<li><a href="${before }"><</a>&nbsp;</li>
				</c:if>

				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${p eq pi.currentPage }">
						<li><a style="background: #eee">${p }</a>&nbsp;</li>
					</c:if>
					<c:url var="pagination" value="eventBoardList.do">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p ne pi.currentPage }">
						<li><a href="${pagination }">${p }</a>&nbsp;</li>
					</c:if>
				</c:forEach>

				<!-- 다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					<li><a>></a>&nbsp;</li>
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="after" value="eventBoardList.do">
						<c:param name="page" value="${pi.currentPage +1 }"></c:param>
					</c:url>
					<li><a href="${after }">></a>&nbsp;</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>