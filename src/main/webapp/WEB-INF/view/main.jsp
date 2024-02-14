<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function coinfirmSubmitAction(movieNum) {
	document.querySelector("#movie_" + movieNum).submit();
}

function init() {
	if(${not empty userId}) {
		$('#user').attr('href', 'user/mypage')
		$('#loginSpan').text('프로필')
	}
}
$(init)
</script>
<style>
nav {
   background-color: rgb(19, 19, 29);
}

.fa-compass, .fa-user, .fa-house, .fa-comments {
   color:rgb(221, 221, 221);
   font-size:28px;
}

.iconfont {
   font-size: 12px;
   margin-left: 5px;
}

nav a {
   text-decoration: none;
   color: lightgray;
}

table {
   width: auto;
   text-align: center;
}

[id*='movieImg']{
   width: 120px;
   height: 90px;
   border: 2px solid lightgrey;
   text-align: center;
   margin: 0 auto;
}

[id*='Carousel']{
   width: 170px;
   height: 125px;
   margin: 0 auto;
}
</style>
</head>
<body>
   <header class='container-fulid'>
        <form class='mt-3'>
         <div class='col form-group d-flex justify-content-center align-items-center'>
            <input  class='form-control w-75' type='text' placeholder='검색'/>
            <button type='button' class=" btn ml-3 border" onclick='location.href="movie/01.html"'>
               <i class='fa-solid fa-magnifying-glass'></i>
               <span class='ml-2 d-none d-md-inline'>검색</span>
            </button>
         </div>
      </form>
   </header>
   <div class='container'>
      <hr>
      <div class='ml-2 font-weight-bold'>영화 TOP 5</div>
      <div class='row'>
         <div class='col'>
               <div id='topCarousel' class='carousel slide' data-ride='carousel'>
                  <div class='carousel-inner'>
                     <table class = 'table table-borderless' id='topMv'>
                        <tbody>
                           <tr>
                              <th>
                                 <div class='carousel-item active'>
                                    <div id='movieImg1'><a href='review/01.html'>영화이미지</div>
                                    <div id='topMovie'>블랙 아담</div></a>
                                 </div>
                                 <div class='carousel-item'>
                                 	<form action="review" method="post" id="movie_0">
                                    <form action="review" method="post" id="movie_0">
	                                 	<div id='movieImg2' onclick="coinfirmSubmitAction(0)">영화이미지</div>
	                                    <div id='topMovie' onclick="coinfirmSubmitAction(0)">공조2: 인터내셔날</div>
	                                    <input type="hidden" name="movieNo" value="0">
                                 	</form>
                                 </div>
                                 <div class='carousel-item'>
                                    <div id='movieImg3'><a href='review/01.html'>영화이미지</div>
                                    <div id='topMovie'>인생은 아름다워</div></a>
                                 </div>
                                 <div class='carousel-item'>
                                    <div id='movieImg4'><a href='review/01.html'>영화이미지</div>
                                    <div id='topMovie'>스파이더맨</div></a>
                                 </div>
                                 <div class='carousel-item'>
                                    <div id='movieImg5'><a href='review/01.html'>영화이미지</div>
                                    <div id='topMovie'>어벤저스</div></a>
                                 </div>
                              </th>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  <a href='#topCarousel' class='carousel-control-prev' data-slide='prev'>
                     &nbsp;<i class='fa fa-chevron-left' style='color:#000000'></i>
                  </a>
                  <a href='#topCarousel' class='carousel-control-next' data-slide='next'>
                     &nbsp;<i class='fa fa-chevron-right' style='color:#000000'></i>
                  </a>
               </div>
            </div>
         </div>
         <div class='ml-2 mt-2 font-weight-bold'>오늘의 추천 영화</div>
         <div class='col'>
            <div id='daysCarousel' class='carousel slide' data-ride='carousel'>
               <div class='carousel-inner'>
                  <table class = 'table table-borderless' id='daysMv'>
                     <tbody>
                        <tr>
                           <th>
                              <div class='carousel-item active'>
                                   <div id='movieImg4'><a href='review/01.html'>영화이미지</div>
                                   <div id='daysMovie'>오펀:천사의 탄생</div></a>
                                </div>
                                <div class='carousel-item'>
                                   <div id='movieImg5'><a href='review/01.html'>영화이미지</div>
                                   <div id='daysMovie'>정직한 후보2</div></a>
                                </div>
                                <div class='carousel-item'>
                                   <div id='movieImg6'><a href='review/01.html'>영화이미지</div>
                                   <div id='daysMovie'>귀못</div></a>
                                </div>
                             </th>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <a href='#daysCarousel' class='carousel-control-prev' data-slide='prev'>
                  &nbsp;<i class='fa fa-chevron-left' style='color:#000000'></i>
               </a>
               <a href='#daysCarousel' class='carousel-control-next' data-slide='next'>
                  &nbsp;<i class='fa fa-chevron-right' style='color:#000000'></i>
               </a>
            </div>
         </div>
         <div class='ml-2 mt-1 font-weight-bold'>오늘의 영화</div>
         <div class='col'>
            <div id='todayCarousel' class='carousel slide' data-ride='carousel'>
               <div class='carousel-inner'>
                  <table class = 'table table-borderless' id='todayMv'>
                     <tbody>
                        <tr>
                           <th>
                              <div class='carousel-item active'>
                                 <div id='movieImg7'><a href='review/01.html'>영화이미지</div>
                                   <div id='todayMovie'>리멤버</div></a>
                                </div>
                                <div class='carousel-item'>
                                   <div id='movieImg8'><a href='review/01.html'>영화이미지</div>
                                   <div id='todayMovie'>스마일</div></a>
                                </div>
                                <div class='carousel-item'>
                                   <div id='movieImg9'><a href='review/01.html'>영화이미지</div>
                                   <div id='todayMovie'>미혹</div></a>
                                </div>
                             </th>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <a href='#todayCarousel' class='carousel-control-prev' data-slide='prev'>
                  &nbsp;<i class='fa fa-chevron-left' style='color:#000000'></i>
               </a>
               <a href='#todayCarousel' class='carousel-control-next' data-slide='next'>
                  &nbsp;<i class='fa fa-chevron-right' style='color:#000000'></i>
               </a>
            </div>
         </div>
      </div>
      
   	<div id='navBar' class='container-fulid'>
       	<nav class='row fixed-bottom p-2'>
            <div class='col text-center'>
               	<a id='goHome' href='/' class='ml-1'>
                  	<i class='fa-solid fa-house fa-xl'></i><br>
                  	<span class='iconfont mr-1'>홈</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='community' href='community/list' class='ml-1'>
                  	<i class='fa-regular fa-comments fa-xl'></i><br>
                  	<span class='iconfont'>커뮤니티</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='search' href='movie/searchMovie' class='ml-1'>
                  	<i class='fa-solid fa-compass fa-xl'></i><br>
                  	<span class='iconfont'>탐색</span>
               	</a>
            </div>
            <div class='col text-center'>
              	<a id='user' href='user/login' class='ml-1'>
               		<i class='fa-regular fa-user fa-xl'></i><br>
               		<span id='loginSpan' class='iconfont'>로그인</span>
               	</a>
           	</div>
      	</nav>
   	</div>
</body>
</html>