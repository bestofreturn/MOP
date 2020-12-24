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
   href="https://cdnjs.cloudflare.com/ajax/bs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>re:turn 회원가입 페이지</title>
 <script>
 function insertQ(){
    var phone = RegExp(/^01[01][0-9]{7,8}$/);
   var memberName= RegExp(/^[가-힣]{3}$/); 
   var memberId = document.getElementById("memberId").value;

   if(!($("#pwd").val() == $("#pwd2").val())){
       alert("비밀번호와 비밀번호 확인이 다릅니다 다시 확인해주세요");
       $("#pwd").focus();
        return false;
    }
    if(!memberName.test($("#memberName").val())){
       alert("이름을 다시 입력해주세요")
       $("#userName").focus();
       return false;
       }
    if(!phone.test($("#phone").val())){
      alert("폰번호를 다시 입력해주세요")
      $("#phone").focus();
      return false;
    }


 </script> 
</head>
<body>
   <script type="text/javascript"
      src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
   <jsp:include page="insert.do"></jsp:include>
   <jsp:include page="../member/insert.do"></jsp:include>
   <h1 agn="center">re:turn 회원가입</h1>
   <div class="centerText">
      <form action="insert.do" method="post">
         <table width="650" cellspacing="5">
            <tr>
               <td>아이디</td>
               <td><input type="text" name="memberId" id="memberId"></td>
<!--                <input type="hidden" id="idDupcateCheck" value="0"> -->
            </tr>
            <tr>
               <td>비밀번호</td>
               <td><input type="password" name="memberPwd" id="pwd">
            </tr>
<!--             <tr> -->
<!--                <td>비밀번호 확인</td> -->
<!--                <td><input type="password" name="memberPwd" id="pwd2"> -->
<!--             </tr> -->
            <tr>
               <td>이름</td>
               <td><input type="text" name="memberName" id="memberName">
            </tr>
            <tr>
               <td>전화번호</td>
               <td><input type="text" name="phone" id="phone">
            </tr>
            <tr>
               <td>이메일</td>
               <td><input type="text" name="email" id="email">
            </tr>
            <tr>
            <td>
               <div class="all_lst">
                <h3 class="bnd">은행 </h3>
                     <input type="radio" name="bank"  id="bank" value="국민"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_kbbank_70_22.png" width="70" height="22" alt="국민은행" >
                     <input type="radio" name="bank"  id="bank" value="IBK기업"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_ibk_70_22.png" width="70" height="22" alt="기업은행" >
                     <input type="radio" name="bank" id="bank" value="농협"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_nh_70_22.png" width="70" height="22" alt="농협은행"  >
                     <input type="radio" name="bank" id="bank" value="신한"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_sinhanbank_70_22.png" width="70" height="22" alt="신한은행">
                     <input type="radio" name="bank" id="bank" value="한국시티"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_citi_70_22.png" width="70" height="22" alt="한국씨티은행">
                     <input type="radio" name="bank" id="bank" value="SC"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_standardchartered_70_22.png" width="70" height="22" alt="SC은행">
                     <input type="radio" name="bank" id="bank" value="우리"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_woori_70_22.png" width="70" height="22" alt="우리은행">
                     <input type="radio" name="bank" id="bank" value="카카오"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_090_70_22.png" width="70" height="22" alt="카카오뱅크">
                     <input type="radio" name="bank" id="bank" value="케이"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_089_70_22.png" width="70" height="22" alt="케이뱅크">
                     <input type="radio" name="bank" id="bank" value="하나" ><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_081_70_22.png" width="70" height="22" alt="하나은행">
                     <input type="radio" name="bank" id="bank" value="경남"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_kyeongnam_70_22.png" width="70" height="22" alt="경남은행">
                     <input type="radio" name="bank" id="bank" value="광주"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_034_70_22.png" width="70" height="22" alt="광주은행">
                     <input type="radio" name="bank" id="bank" value="대구"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_031_70_22.png" width="70" height="22" alt="대구은행">
                     <input type="radio" name="bank" id="bank" value="부산"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_busan_70_22.png" width="70" height="22" alt="부산은행">
                     <input type="radio" name="bank" id="bank" value="KDB산업"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_002_70_22.png" width="70" height="22" alt="KDB산업은행">
                     <input type="radio" name="bank" id="bank" value="수협"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_suhyup_70_22.png" width="70" height="22" alt="수협은행">
                     <input type="radio" name="bank" id="bank" value="우체국"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_post_70_22.png" width="70" height="22" alt="우체국">
                     <input type="radio" name="bank" id="bank" value="전북"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_037_70_22.png" width="70" height="22" alt="전북은행">
                     <input type="radio" name="bank" id="bank" value="제주"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_035_70_22.png" width="70" height="22" alt="제주은행">
                     <input type="radio" name="bank" id="bank" value="새마을금고"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_045_70_22.png" width="70" height="22" alt="새마을금고">
                     <input type="radio" name="bank" id="bank" value="신협"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_048_70_22.png" width="70" height="22" alt="신협">
                     <input type="radio" name="bank" id="bank" value="SBI저축"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_103_70_22.png" width="70" height="22" alt="SBI저축은행">
                     <input type="radio" name="bank" id="bank" value="저축"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_050_70_22.png" width="70" height="22" alt="저축은행">
                     <input type="radio" name="bank" id="bank" value="미래에셋대우"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_238_70_22.png" width="70" height="22" alt="미래에셋대우">
                     <input type="radio" name="bank" id="bank" value="삼성증권"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_240_70_22.png" width="70" height="22" alt="삼성증권">
                     <input type="radio" name="bank" id="bank" value="SK증권"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_266_70_22.png" width="70" height="22" alt="SK증권">
                     <input type="radio" name="bank" id="bank" value="유안타증권"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_yuanta_70_22.png" width="70" height="22" alt="유안타증권">
                     <input type="radio" name="bank" id="bank" value="유진투자증권"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_eugene_70_22.png" width="70" height="22" alt="유진투자증권">
                     <input type="radio" name="bank" id="bank" value="한국투자증권"><img src="https://ssl.pstatic.net/static.checkout/layout/202012101632/images/customer/bi_bank_243_70_22.png" width="70" height="22" alt="한국투자증권">
            </div>
            <tr>
               <td>계좌 번호</td>
               <td><input type="text" name="accountNumber" id="accountNumber">
            </tr>
            <tr>
               <td>우편 번호</td>
               <td><input type="text" name="zipCode"
                  class="postcodify_postcode5" size="6">
                  <button type="button" id="postcodify_search_button">검색</button>
            </tr>
            <tr>
               <td>주소</td>
               <td><input type="text" name="addr" class="postcodify_address"></td>
            </tr>
            <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js">
            
         </script>
            <script>
               $(function(){
                     $("#postcodify_search_button").postcodifyPopUp();
               });
           
            function vadate(){

              if($("#idDupcateCheck".val()==0)){
              alert("사용 가능한 아이디입니다.")
              $("#memberId").focus();
              return false
           }else{
              return true;
              }
        }
     
        $("#memberId").on("blur",function(){
           var memberId = $(this).val();
           
           //아이디가 4글자 미만인경우
           if(memberId.length <4){
              $(".guide").hide();
              $("#idDupcateCheck").val(0);
              return;
           }
           $.ajax({
              url:"dupId.do",
              data: {"memberId":memberId},
              success: function(result){

                 if(result=="true"){
                    $(".guide.error").hide();
                    $(".guide.ok").show();
                    $("#idDupcateCheck".val(1));
                 }else if(result="false"){
                    $(".guide.ok").hide();
                    $(".guide.error").show();
                    $("#idDupcateCheck").val(0);
                 }
              }   
           })
        });
         </script>

            <tr>
               <td colspan="2" align="center"><input type="submit"
                  value="가입하기">
                  <button type="button" onclick="location.href='home.do';">홈으로</button>
            </tr>
         </table>
      </form>
   </div>
</body>
</html>