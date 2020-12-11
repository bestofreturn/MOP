<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<jsp:include page="../common/main.jsp"></jsp:include>
	<h1 align="center">${loginUser.memberName }님의정보보기</h1>
	<div class="centerText">
		
		<form action="memberModify.do" method="post">
         <table width="650" cellspacing="5">
            <tr>
               <td width="150">* 아이디</td>
               <td width="300"><input type="text" name="memberId" id="memberId" value="${loginMember.memberId }" readonly></td>
            </tr>
            <tr>
               <td>이름</td>
               <td><input type="text" name="memberName" value="${loginMember.memberName }" readonly></td>
            </tr>
            <tr>
               <td>나이</td>
               <td><input type="text" min="20" max="100" name="age" value="${loginMember.age }" readonly></td>
            </tr>
            <tr>
               <td>이메일</td>
               <td><input type="text" name="email" value="${loginMember.email }"></td>
            </tr>
            <tr>
               <td>전화번호</td>
               <td><input type="text" name="phone" value="${loginMember.phone }"></td>
            </tr>
            <!-- DB에서 가져온 주소값은 41092, 대구광역시 동구 대림로 28, (대림동) 22 -->
            <!-- ,(콤마)를 기준으로 잘라서 우편번호, 도로명 주소, 상세 주소에 입력 -->
            <c:forTokens items="${loginMember.address }" var="addr" delims="," varStatus="status">
               <c:if test="${status.index eq 0 }">
            <tr>
               <td>우편번호</td>
               <td>
                  <input type="text" name="zipCode" class="postcodify_postcode5" size="6" value="${addr }">
                  <button type="button" id="postcodify_search_button">검색</button>
               </td>
            </tr>
            </c:if>
            <c:if test="${status.index eq 1 }">
            <tr>
               <td>도로명 주소</td>
               <td><input type="text" name="addr" class="postcodify_address" value="${addr }"></td>
            </tr>
            </c:if>
            </c:forTokens>
            <tr>
            	<td><input type="text" name="accountNumber" value="${accountNumber }"></td>
            </tr>
            <tr>
            	<td><input type="text" name ="won" ></td>
            </tr>
          <!--   <tr>
            	<td><input type="checkbox" name="reservation" value="Y">YES</td>
            	<td><input type="checkbox" name="reservation" value="N">NO</td>
            </tr> -->
            <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js">
            </script>
            
            <script>
               $(function() {
                  $("#postcodify_search_button").postcodifyPopUp();
               })
            </script>
            
            <tr>
               <td colspan="2" align="center">
                  <input type="submit" value="수정하기">
                  <c:url var="mDelete" value="memberDelete.do">
                     <c:param name="memberId" value="${loginMember.memberId }"/>
                  </c:url>
                  <a href="${mDelete}">탈퇴하기</a> 
                 </td>
            </tr>
         </table>
      </form> 
	</div>
	
	
		
	
	
	
</body>
</html>