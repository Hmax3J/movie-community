<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>searchMovie</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>

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
	color: white;
}

[id*='movie']{
   width: 90px;
   height: 80px;
   border: 2px solid lightgrey;
   text-align: center;
   margin: auto;
}

</style>
</head>
<body>
	<header class='container-fulid'>
        <form class='mt-3'>
			<div class='col form-group d-flex justify-content-center align-items-center'>
				<input  class='form-control w-75' type='text' placeholder='검색'/>
				<button class=" btn ml-3 border">
					<i class='fa-solid fa-magnifying-glass'></i>
					<span class='ml-2 d-none d-md-inline'>검색</span>
				</button>
			</div>
		</form>
	</header>
	
	<div class='container-fluid'>
		<hr>
		<div class='ml-2'>검색결과</div>
		<div class='row'>
			<div class='col mt-4 text-center'>
				<a href='#'>
					<div id='movie1' class='p-0 border justify-content-center'>
						<br>영화이미지
					</div>
					<div>영화이름</div>
				</a>
			</div>
			<div class='col mt-4 text-center'>
				<a href='#'>
					<div id='movie2' class='p-0 border justify-content-center'>
						<br>영화이미지
					</div>
					<div>영화이름</div>
				</a>
			</div>
			<div class='col mt-4 text-center'>
				<a href='#'>
					<div id='movie3' class='p-0 border justify-content-center'>
						<br>영화이미지
					</div>
					<div>영화이름</div>
				</a>
			</div>
        </div>
		<div class='ml-1'></div>
		<div class='row'>
			<div class='col mt-4 text-center'>
				<a href='#'>
					<div id='movie4' class='p-0 border justify-content-center'>
						<br>영화이미지
					</div>
					<div>영화이름</div>
				</a>
			</div>
			<div class='col mt-4 text-center'>
				<a href='#'>
					<div id='movie5' class='p-0 border justify-content-center'>
						<br>영화이미지
					</div>
					<div>영화이름</div>
				</a>
			</div>
			<div class='col mt-4 text-center'>
				<a href='#'>
					<div id='movie6' class='p-0 border justify-content-center'>
						<br>영화이미지
					</div>
					<div>영화이름</div>
				</a>
			</div>
        </div>
		<div class='ml-2'></div>
		<div class='row'>
			<div class='col mt-4 text-center'>
				<a href='#'>
					<div id='movie7' class='p-0 border justify-content-center'>
						<br>영화이미지
					</div>
					<div>영화이름</div>
				</a>
			</div>
			<div class='col mt-4 text-center'>
				<a href='#'>
					<div id='movie8' class='p-0 border justify-content-center'>
						<br>영화이미지
					</div>
					<div>영화이름</div>
				</a>
			</div>
			<div class='col mt-4 text-center'>
				<a href='#'>
					<div id='movie9' class='p-0 border justify-content-center'>
						<br>영화이미지
					</div>
					<div>영화이름</div>
				</a>
			</div>
        </div>
	</div>

   	<div id='navBar' class='container-fulid'>
       	<nav class='row fixed-bottom p-2'>
            <div class='col text-center'>
               	<a id='goHome' href='..' class='ml-1'>
                  	<i class='fa-solid fa-house fa-xl'></i><br>
                  	<span class='iconfont mr-1'>홈</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='community' href='#' class='ml-1'>
                  	<i class='fa-regular fa-comments fa-xl'></i><br>
                  	<span class='iconfont'>커뮤니티</span>
               	</a>
            </div>
            <div class='col text-center'>
               	<a id='search' href='#' class='ml-1'>
                  	<i class='fa-solid fa-compass fa-xl'></i><br>
                  	<span class='iconfont'>탐색</span>
               	</a>
            </div>
            <div class='col text-center'>
              	<a id='user' href='#' class='ml-1'>
               		<i class='fa-regular fa-user fa-xl'></i><br>
               		<span id='loginSpan' class='iconfont'>로그인</span>
               	</a>
           	</div>
      	</nav>
   	</div>
</body>
</html>