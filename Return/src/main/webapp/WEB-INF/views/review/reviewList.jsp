<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엿같다</title>
<script src="resources/js/star.js"></script>
</head>
<body>
	<jsp:include page="../common/main.jsp"></jsp:include>
	<form action="reviewInsert.do" method="post" name="reviewform"
		enctype="multipart/form-data">
		<table width="700">
			<tr>
				<td width="100" rowspan="2">${review.vWriter }</td>
				<td width="500" height="50" colspan="2">
					<div id="rating" align="center">
						<span> <img id="image1" onmouseover="show(1)"
							onclick="mark(1)" onmouseout="noshow(1)"
							src="resources/images/starOff.png"> <img id="image2"
							onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)"
							src="resources/images/starOff.png"> <img id="image3"
							onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)"
							src="resources/images/starOff.png"> <img id="image4"
							onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)"
							src="resources/images/starOff.png"> <img id="image5"
							onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)"
							src="resources/images/starOff.png">
						</span> <br /> <span id="startext">평가하기</span>
					</div> <input type="hidden" name="star" />
				</td>
				<td width="100" rowspan="2"><input type="submit" value="글쓰기"><input
					type="file" name="uploadFile"></td>

				<input type="hidden" name="vNo" value="" />
			</tr>
			<tr>
				<%-- <c:if test="${sessionScope.memberId == 'N'}">
				<td width="500" height="100" colspan="2"><textarea name="vContent" cols="65" rows="7" readonly="readonly">예약 후 이용하실 수 있습니다.</textarea></td>
			</c:if> --%>
				<%-- <c:if test="${sessionScope.memberId == 'Y' }"> --%>
				<td width="500" height="100" colspan="2"><textarea
						name="vContent" cols="65" rows="7"></textarea></td>
				<%-- </c:if> --%>
			</tr>
		</table>
	</form>
	<c:if test="${vStar != 0 }">
		<table width="700">
			<c:forEach items="${vList }" var="review">
				<tr>
					<td rowspan="3" width="100">${review.vWriter }</td>
					<td width="550" height="20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size="5" border="border">${review.vWriter }</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font size="1">${review.vCreateDate }</font>
					</td>
					<td width="50">
						<c:url var="vDelete" value="reviewDelete.do">
							<c:param name="vId" value="${review.vId }"></c:param>
						</c:url>
						<c:url var="vUpdate" value="reviewUpdate.do">
							<c:param name="vId" value="${review.vId }"></c:param>
							<c:param name="page" value="${currentPage }"></c:param>
						</c:url>
						<a href="${vUpdate }">수정</a>
						<a href="${vDelete }">삭제</a>
					</td>
				</tr>

				<tr>
					<td colspan="2" width="600">
						<c:if test="${review.vStar == 1 }">
							<img src="resources/images/1.png">
							<img src="resources/images/starOn.png">
						</c:if>
						<c:if test="${review.vStar == 2 }">
							<img src="resources/images/2.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
						</c:if>
						<c:if test="${review.vStar == 3 }">
							<img src="resources/images/3.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
						</c:if>
						<c:if test="${review.vStar == 4 }">
							<img src="resources/images/4.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
						</c:if>
						<c:if test="${review.vStar == 5 }">
							<img src="resources/images/5.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
							<img src="resources/images/starOn.png">
						</c:if>
					</td>
				</tr>
				<tr>
					<td height="100" colspan="2">${review.vContent }</td>
				</tr>
			
			</c:forEach>
		</table>
	</c:if>

</body>
</html>