<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='http://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
<link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
<link rel='preconnect' href="https://fonts.googleapis.com">
<link rel='preconnect' href="https://fonts.gstatic.com" crossorigin>
<link href='https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Serif+KR:wght@200&display=swap' rel='stylesheet'>
<script>
function checkLogin() {
	if(${not empty userId}) {
		$('#loginSpan').text('로그아웃')
		$('#id').text('${userId}님 ${nickname}님')
		$('#loginBtn').attr({
	   		class: "btn btn-secondary",
	   		onclick: "location.href='admin/user/logout'"	
		})
		$.ajax({
	    	url: 'admin/user/getCountList',
	    	dataType: 'json',
	    	success: countList => {
	    	    if(countList) {
	    	        const countArr = []
	   	            countArr.push(
	               			`<tr>
	    	                    <td>\${countList.countUser}</td>
	    	                    <td>\${countList.countWithdrawalUser}</td>
	    	                    <td>\${countList.countCommunity}</td> 
	    	                    <td>\${countList.countInspection}</td>
	   	                	</tr>`
	   	            )
	    	        $('#status').append(countArr.join(''))
	    	    } else $('#status').append(
	    	        '<tr><td colspan=4 class=text-center>등록된 유저, 영화평, 신고가 없습니다.</td></tr>')
	    	}
    	})
	} else {
		$('#status').children().remove()
		$('#status').append('<tr><td colspan=4 class=text-center>로그인을 하세요.</td></tr>')
	}
}
$(checkLogin)
</script>
<style>
th {
	height: 50;
}
td {
	height: 100;
	font-size: 20;
}

#loginBtn{
	height: 1.5rem;
	font-size: 14px;		
}
	
#yesBtn, #noBtn{
    margin: auto;
    width: 100%;
    max-width: 10rem;
    height: 100%;
}
</style>
<body>
	<div class='container'>
		<div class='header'>
			<div class='float-left mt-3'>
				<h5>| 홈</h5>
			</div>
			<div id='loginBtnGroup' class='float-right mt-3'>
				<span id='id' style='font-size:13'></span>
	         	<button id='loginBtn' type='button' class='btn btn-primary btn-block' style='height: 35px' onclick='location.href="admin/user/login"'>
	         		<span id='loginSpan'>로그인</span>
	         	</button>
	        </div><br>
	 		<div class='row mt-5'>
		        <div class='col'>
					<div class='container'>
						<div class='row'>
							<div class='col-12 text-center'>
								<div class='btn-group btn-block'>
									<button disabled type='button' class='btn btn-primary'>홈</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="admin/user/users"'>회 원</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="admin/genre/addGenre"'>장 르</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="#"'>영 화</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="#"'>감독/배우</button>
									<button type='button' class='btn btn-secondary' onclick='location.href="admin/inspection/inspection"'>신고 조회</button>
								</div>
							</div>
						</div>
					</div>
	     		</div>
			</div>
		</div><hr>
		<div class='row mt-5 justify-content-center'>
			<div class='col-11' id='adminStatus'>
				<h5 style='color:#5699f7'><b>| 현황</b></h5>
				<table class='table table-bordered mt-3 text-center'>
					<thead class='thead' style='background-color:#b1c3e0'>
						<tr>
							<th>회원 수</th>
							<th>탈퇴 회원 수</th>
							<th>영화평 수</th>
							<th>신고 수</th>
						</tr>
					</thead>
					<tbody id='status' class='table-bordered'>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
