<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<head>
<title>커뮤니티 목록</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function init() {
	$.ajax({
      	url: 'getCommunities',
      	dataType: 'json',
      	success: result => {
      		if(result.length) {
    	        const communityArr = []
    	        $.each(result, (i, community) => {
    	            communityArr.push(
                			`<li class='row pt-3 pb-3 list-unstyled border-bottom'>
	                		<!--	<span class='col-1'>\${community.communityNum}</span> -->
	                			<a href='content?num=\${community.communityNum}'>
	                				<span class='col-2'>\${community.communityTitle}</span>
	                			</a>
	                			<span class='col-3'>\${community.communityDate}</span>
                				<span class='col-3'>\${community.nickname}</span>
                			</li>`
    	            )
    	        })
    	        $('#communities').append(communityArr.join(''))
    	    } else $('#communities').append(
    	        '<div style="text-align: center">등록된 영화평이 없습니다.</div>')
      	}
   })
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
	font-size:12px;
	margin-left: 5px;
}

nav a {
	text-decoration: none;
	color: white;
}

.fa-tv {
	text-decoration: none;
	color: black;
}

label {
    font-size:12px;
    width: 1px;
}

pagination {
	text-align:center;
}
</style>
</head>
<body>
<c:if test='${empty userId}'>
	<div class='row' style='margin-top: 100px; text-align: center;'>
        <div class='col'>
            <span class='h4'>로그인을 하세요.</span>
        </div>
	</div>
    <div class='row' style='margin-top: 150px; margin-left: 100px;'>
        <div class='col'>
            <button id='okBtn' type='button' class='btn btn-primary' onclick='location.href="../user/login"' style='margin-left: 30px;'>
                <span class='h6'>로그인</span>
            </button>
        </div>
    </div>
</c:if>
<c:if test='${not empty userId}'>
<div class="container">
    <h2><strong><br><center>커뮤니티</center></strong></h2>
    <hr style="border: double 1px black;">
    <h3><em><u><center>영화평</center></u></em></h3>
    <div class='row'>
    	<div class='col' id='communities'>
        </div>
    </div>
    <button type="button" onclick='location.href="write"' style="width: 245pt; HEIGHT: 25pt" class="btn btn-primary">글쓰기</button>

<!-- PAGINATION -->

<!-- / <div class='d-flex justify-content-center'>
         <ul class='pagination'>
         	<c:if test='${startNum > 1 }'>
         		<a href='?p=${startNum-1}' class='page-link'>«</a>
         	</c:if>
         	<c:if test='${startNum <= 1}'>
		    	<span id='noPrev' class='page-link' data-toggle='modal' data-target='#prePageAlert'>«</span>
		    </c:if>
			
         	<c:forEach var='i' begin='0' end='4'>
         		<c:if test='${page eq startNum+i}'>
         			<li class='page-item'><a class='page-link' href='?p=${startNum+i}' style='background:#d3d3d3'>${startNum+i}</a></li>
         		</c:if>
         		<c:if test='${page ne startNum+i}'>
         			 <c:if test='${startNum+i <= lastNum }'> 
           				<li class='page-item'><a class='page-link' href='?p=${startNum+i}'>${startNum+i}</a></li>
           			 </c:if> 
           		</c:if>
            </c:forEach>
            <c:if test='${startNum+5 <= lastNum}'>
	      		<a href='?p=${startNum+5}' class='page-link'>»</a>
		    </c:if>
		    <c:if test='${startNum+5 > lastNum}'>
		    	<span class='page-link' data-toggle='modal' data-target='#nextPageAlert'>»</span>
		    </c:if>
         </ul>
      </div>
 --%>
<!-- <div class="row mt-5 justify-content-center" aria-label="Page navigation example">      
    <ul id="paging" class="pagination" style="justify-content: center;">
      <li class="page-item"><a class="page-link" href="#">＜</a></li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">4</a></li>
      <li class="page-item"><a class="page-link" href="#">5</a></li>
      <li class="page-item"><a class="page-link" href="#">＞</a></li>
    </ul>
</div> -->

<!-- <div class="row mt-5 justify-content-center" aria-label="Page navigation">
  	<ul class="pagination">
    	<li class="page-item">
      	<a class="page-link" href="#" aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>
      	</a>
    	</li>
    	
    	<li class="page-item"><a class="page-link" style="width:35pt" href="#">1</a></li>
    	<li class="page-item"><a class="page-link" style="width:35pt" href="#">2</a></li>
    	<li class="page-item"><a class="page-link" style="width:35pt" href="#">3</a></li>
    	<li class="page-item"><a class="page-link" style="width:35pt" href="#">4</a></li>
    	<li class="page-item"><a class="page-link" style="width:35pt" href="#">5</a></li>
    	
    	<li class="page-item">
      	<a class="page-link" href="#" aria-label="Next">
        	<span aria-hidden="true">&raquo;</span>
      	</a>
    	</li>
  	</ul>
</div> -->

	<div id='navBar' class='container-fulid'>
       	<nav class='row fixed-bottom p-2'>
            <div class='col text-center'>
               	<a id='goHome' href='/' class='ml-1'>
                  	<i class='fa-solid fa-house fa-xl'></i><br>
                  	<span class='iconfont mr-1'>홈</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='community' href='list' class='ml-1'>
                  	<i class='fa-regular fa-comments fa-xl'></i><br>
                  	<span class='iconfont'>커뮤니티</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='search' href='../movie/searchMovie' class='ml-1'>
                  	<i class='fa-solid fa-compass fa-xl'></i><br>
                  	<span class='iconfont'>탐색</span>
               	</a>
            </div>
            <div class='col text-center'>
              	<a id='user' href='../user/mypage' class='ml-1'>
               		<i class='fa-regular fa-user fa-xl'></i><br>
               		<span id='loginSpan' class='iconfont'>프로필</span>
               	</a>
           	</div>
      	</nav>
   	</div>
</div>

<!-- 검색 -->
<div class="container">
    <div class="row">
        <form method="post" name="search" action="">
            <table class="pull-right">
                <tr>
                    <td><select class="form-control" name="searchField" style="width: 55pt; HEIGHT: 30pt">
                            <option value="0">선택</option>
                            <option value="bbsTitle">제목</option>
                            <option value="userID">작성자</option>
                    </select></td>
                    <td><input type="text" class="form-control"
                        placeholder="검색어 입력" name="searchText" maxlength="50"></td>
                    <td><button type="submit" onclick='location.href="#"' style="width: 50pt; HEIGHT: 25pt" class="btn btn-primary">검색</button></td>
                </tr>
            </table>
        </form>
    </div>
</div>    
    <hr style="border: double 1px grey;">
</c:if>
</body>
<footer class='container-fulid border mt-5 p-3 '>
    <div class='row m-3'>
        <div class='col-sm-3 border d-flex justify-content-center align-items-center'>
            <div></div>
        </div>
    </div>
</footer>