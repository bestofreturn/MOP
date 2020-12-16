<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"
   http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"
   href="https://www.w3schools.com/w3css/4/w3.css?after">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!--  calendar -->
<link rel="shortcut icon" href="resources/image/favicon.ico">
<link rel="stylesheet" href="resources/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet" href="resources/vendor/css/bootstrap.min.css">
<link rel="stylesheet" href='resources/vendor/css/select2.min.css' />
<link rel="stylesheet"
   href='resources/vendor/css/bootstrap-datetimepicker.min.css' />
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/css/main2.css?after">

<style>
body, h1, h2, h3, h4, h5, h6 {
   font-family: "Lato", sans-serif;
}

body, html {
   height: 100%;
   color: #777;
   line-height: 1.8;
}

/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
   background-attachment: fixed;
   background-position: center;
   background-repeat: no-repeat;
   background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
   background-image: url('/w3images/parallax1.jpg');
   min-height: 100%;
}

/* Second image (Portfolio) */
.bgimg-2 {
   background-image: url("/w3images/parallax2.jpg");
   min-height: 400px;
}

/* Third image (Contact) */
.bgimg-3 {
   background-image: url("/w3images/parallax3.jpg");
   min-height: 400px;
}

.w3-wide {
   letter-spacing: 10px;
}

.w3-hover-opacity {
   cursor: pointer;
}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1600px) {
   .bgimg-1, .bgimg-2, .bgimg-3 {
      background-attachment: scroll;
      min-height: 400px;
   }
}

#home {
   height: 1000px;
}

a:hover {
   text-decoration: none
}
/* 사이드바 스타일 */
.sidenav {
   height: 100%;
   width: 0;
   position: fixed;
   z-index: 1;
   top: 0;
   left: 0;
   background-color: darkgrey;
   overflow-x: hidden;
   transition: 0.5s ease-in-out;
   padding-top: 60px;
}

.sidenav a {
   padding: 8px 8px 8px 32px;
   text-decoration: none;
   font-size: 25px;
   color: #fff;
   display: block;
   transition: 0.2s ease-in-out;
}

.sidenav a:hover, .offcanvas a:focus {
   color: #000;
}

.closebtn {
   position: absolute;
   top: 0;
   right: 25px;
   font-size: 36px !important;
   margin-left: 50px;
}

.openmenu:hover {
   color: black;
   transition: 0.5s ease-in-out;
}

.openmenu {
   font-size: 25px;
   cursor: pointer;
   transition: 0.5s ease-in-out;
}

.openmenu>i {
   font-size: 30px;
}
/* 미디어쿼리 적용 */
@media screen and (max-height:450px) {
   .sidenav {
      padding-top: 15px;
   }
   .sidenav a {
      font-size: 18px;
   }
}
/*  상단 으로 이동 화살표 추후 추가
#back-to-top {
   display: inline-block;
   background-color: black;
   width: 50px;
   height: 50px;
   text-align: center;
   border-radius: 4px;
   position: fixed;
   bottom: 30px;
   right: 30px;
   transition: background-color .3s, opacity .5s, visibility .5s;
   opacity: 0;
   visibility: hidden;
   z-index: 1000;
}

#back-to-top::after {
   content: "\f077";
   font-family: FontAwesome;
   font-weight: normal;
   font-style: normal;
   font-size: 2em;
   line-height: 50px;
   color: #fff;
}

#back-to-top:hover {
   cursor: pointer;
   background-color: #333;
}

#back-to-top:active {
   background-color: #555;
}

#back-to-top.show {
   opacity: 1;
   visibility: visible;
}
 */
</style>
<body>
   <!-- Navbar (sit on top) -->
   <!--    <div class="w3-top">
      <div class="w3-bar" id="myNavbar">
         <a
            class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right"
            href="javascript:void(0);" onclick="toggleFunction()"
            title="Toggle Navigation Menu"> <i class="fa fa-bars"></i>
         </a> <a href="#home" class="w3-bar-item w3-button">HOME</a> <a
            href="#about" class="w3-bar-item w3-button w3-hide-small"><i
            class="fa fa-user"></i> LOGIN</a> <a href="#portfolio"
            class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-th"></i>
            PORTFOLIO</a> <a href="#contact"
            class="w3-bar-item w3-button w3-hide-small"><i
            class="fa fa-envelope"></i> CONTACT</a> <a href="#"
            class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red">
            <i class="fa fa-search"></i>
         </a>
      </div> -->

   <span class="openmenu" onclick='openNav()'> <i
      class="fas fa-cloud"></i></span>
   <div id="mysidenav" class="sidenav">
      <a href="#" class="closebtn" onclick='closeNav()'>x</a> <a href="#">About</a>
      <a href="#">Services</a> <a href="#">Clients</a> <a href="#">Contact</a>
      <a href="#">Portfolio</a>
   </div>


   <!-- Navbar on small screens -->
   <div id="navDemo"
      class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
      <a href="#about" class="w3-bar-item w3-button"
         onclick="toggleFunction()">ABOUT</a> <a href="#portfolio"
         class="w3-bar-item w3-button" onclick="toggleFunction()">PORTFOLIO</a>
      <a href="#contact" class="w3-bar-item w3-button"
         onclick="toggleFunction()">CONTACT</a>
   </div>


   <!-- Container (About Section) -->
   <div class="w3-content w3-container w3-padding-64" id="about">
      <h3 class="w3-center">MoP</h3>
      <p class="w3-center">
         <em>My Own Calendar</em>
      </p>
   </div>
   <!-- First Parallax Image with Logo Text -->
   <div class="bgimg-1 w3-display-container w3-opacity-min" id="home">
      <div class="w3-display-middle" style="white-space: nowrap;">
         <div class="container">

            <!-- 일자 클릭시 메뉴오픈 -->
            <div id="contextMenu" class="dropdown clearfix">
               <ul class="dropdown-menu dropNewEvent" role="menu"
                  aria-labelledby="dropdownMenu"
                  style="display: block; position: static; margin-bottom: 5px;">
                  <li><a tabindex="-1" href="#">카테고리1</a></li>
                  <li><a tabindex="-1" href="#">카테고리2</a></li>
                  <li><a tabindex="-1" href="#">카테고리3</a></li>
                  <li><a tabindex="-1" href="#">카테고리4</a></li>
                  <li class="divider"></li>
                  <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
               </ul>
            </div>

            <div id="wrapper">
               <div id="loading"></div>
               <div id="calendar"></div>
            </div>


            <!-- 일정 추가 MODAL -->
            <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
               <div class="modal-dialog" role="document">
                  <div class="modal-content">
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title"></h4>
                     </div>
                     <div class="modal-body">

                        <div class="row">
                           <div class="col-xs-12">
                              <label class="col-xs-4" for="edit-allDay">하루종일</label> <input
                                 class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                           </div>
                        </div>

                        <div class="row">
                           <div class="col-xs-12">
                              <label class="col-xs-4" for="edit-title">일정명</label> <input
                                 class="inputModal" type="text" name="edit-title"
                                 id="edit-title" required="required" />
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-xs-12">
                              <label class="col-xs-4" for="edit-start">시작</label> <input
                                 class="inputModal" type="text" name="edit-start"
                                 id="edit-start" />
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-xs-12">
                              <label class="col-xs-4" for="edit-end">끝</label> <input
                                 class="inputModal" type="text" name="edit-end" id="edit-end" />
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-xs-12">
                              <label class="col-xs-4" for="edit-type">구분</label> <select
                                 class="inputModal" type="text" name="edit-type"
                                 id="edit-type">
                                 <option value="카테고리1">카테고리1</option>
                                 <option value="카테고리2">카테고리2</option>
                                 <option value="카테고리3">카테고리3</option>
                                 <option value="카테고리4">카테고리4</option>
                              </select>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-xs-12">
                              <label class="col-xs-4" for="edit-color">색상</label> <select
                                 class="inputModal" name="color" id="edit-color">
                                 <option value="#D25565" style="color: #D25565;">빨간색</option>
                                 <option value="#9775fa" style="color: #9775fa;">보라색</option>
                                 <option value="#ffa94d" style="color: #ffa94d;">주황색</option>
                                 <option value="#74c0fc" style="color: #74c0fc;">파란색</option>
                                 <option value="#f06595" style="color: #f06595;">핑크색</option>
                                 <option value="#63e6be" style="color: #63e6be;">연두색</option>
                                 <option value="#a9e34b" style="color: #a9e34b;">초록색</option>
                                 <option value="#4d638c" style="color: #4d638c;">남색</option>
                                 <option value="#495057" style="color: #495057;">검정색</option>
                              </select>
                           </div>
                        </div>
                        <div class="row">
                           <div class="col-xs-12">
                              <label class="col-xs-4" for="edit-desc">설명</label>
                              <textarea rows="4" cols="50" class="inputModal"
                                 name="edit-desc" id="edit-desc"></textarea>
                           </div>
                        </div>
                     </div>
                     <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default"
                           data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                     </div>
                     <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default"
                           data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                     </div>
                  </div>
                  <!-- /.modal-content -->
               </div>
               <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- /.filter panel -->
         </div>
         <!-- /.container -->
      </div>
   </div>
   <div class="w3-row w3-center w3-dark-grey w3-padding-16">
      <div class="w3-quarter w3-section">
         <span class="w3-xlarge">14+</span><br> Partners
      </div>
      <div class="w3-quarter w3-section">
         <span class="w3-xlarge">55+</span><br> Projects Done
      </div>
      <div class="w3-quarter w3-section">
         <span class="w3-xlarge">89+</span><br> Happy Clients
      </div>
      <div class="w3-quarter w3-section">
         <span class="w3-xlarge">150+</span><br> Meetings
      </div>
   </div>
   <script>
      // Modal Image Gallery
      function onClick(element) {
         document.getElementById("img01").src = element.src;
         document.getElementById("modal01").style.display = "block";
         var captionText = document.getElementById("caption");
         captionText.innerHTML = element.alt;
      }

      // Change style of navbar on scroll
      window.onscroll = function() {
         myFunction()
      };
      function myFunction() {
         var navbar = document.getElementById("myNavbar");
         if (document.body.scrollTop > 100
               || document.documentElement.scrollTop > 100) {
            navbar.className = "w3-bar" + " w3-card" + " w3-animate-top"
                  + " w3-white";
         } else {
            navbar.className = navbar.className.replace(
                  " w3-card w3-animate-top w3-white", "");
         }
      }

      // Used to toggle the menu on small screens when clicking on the menu button
      function toggleFunction() {
         var x = document.getElementById("navDemo");
         if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
         } else {
            x.className = x.className.replace(" w3-show", "");
         }
      }

      function openNav() {
         document.getElementById('mysidenav').style.width = '250px';
      }
      function closeNav() {
         document.getElementById('mysidenav').style.width = '0';
      }

      /*       상단으로 이동 
      var btn = $('#scroll-to-top');

       $(window).scroll(function() {
       if ($(window).scrollTop() > 300) {
       btn.addClass('show');
       } else {
       btn.removeClass('show');
       }
       });

       btn.on('click', function(e) {
       e.preventDefault();
       $('html, body').animate({
       scrollTop : 0
       }, '300');
       }); */
       
       
   </script>
   <script src="resources/vendor/js/jquery.min.js"></script>
   <script src="resources/vendor/js/bootstrap.min.js"></script>
   <script src="resources/vendor/js/moment.min.js"></script>
   <script src="resources/vendor/js/fullcalendar.min.js"></script>
   <script src="resources/vendor/js/ko.js"></script>
   <script src="resources/vendor/js/select2.min.js"></script>
   <script src="resources/vendor/js/bootstrap-datetimepicker.min.js"></script>
   <script src="resources/js/main.js"></script>
   <script src="resources/js/addEvent.js"></script>
   <script src="resources/js/editEvent.js"></script>
   <script src="resources/js/etcSetting.js"></script>
</body>
</html>