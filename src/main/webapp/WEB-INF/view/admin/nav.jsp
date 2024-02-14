<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>

<title>admin movie</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='http://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.6.3/css/all.css'/>
<link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'>
<link rel='preconnect' href="https://fonts.googleapis.com">
<link rel='preconnect' href="https://fonts.gstatic.com" crossorigin>
<link href='https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Noto+Serif+KR:wght@200&display=swap' rel='stylesheet'>
<!-- link rel='stylesheet' href='../res/font.css'/>  -->
<script>
function checkLogin() {
<%
	if(session.getAttribute("user") != null) {
%>
	$('#myModal').modal('hide')
	$('#loginBtn').attr({
   		class: "btn btn-secondary",
   		onclick: "location.href='admin/user/logout'"	
	})
	$('#loginSpan').text('로그아웃')
	//이 위치
	
<%
	} else {
%>
	$('button[name="page"]').attr({
		onclick: "location.href"	
	})
<%
	}
%>
}
$(checkLogin)	
</script>
<style>
.btn:hover{
    background-color: #b1c3e0;
}
	
#loginBtn{
	height: 1.5rem;
	font-size: 14px;		
}
	
</style>
<div class='container'>
	<div class='header'>
		<div class='float-left mt-3'><h5>| 홈</h5></div>
			<div id='loginBtnGroup' class='float-right mt-3'>
         		<button id='loginBtn' type='button' class='btn btn-primary btn-block' onclick='location.href="admin/user/login"'>
         			<span id='loginSpan'>로그인</span>
         		</button>
         	</div><br>
 		<div class='row mt-5'>
	        <div class='col'>
				<div class='container'>
					<div class='row'>
						<div class='col-12 text-center'>
							<div class='btn-group btn-block'>
								<button type='button' class='btn btn-secondary' onclick='location.href="admin"'>홈</button>
								<button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#modal' 
									name='page' onclick='location.href="admin/user/fixUser"'>회 원</button>
								<button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#modal' 
									name='page' onclick='location.href="movie"'>영 화</button>
								<button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#modal' 
									name='page' onclick='location.href="inspection"'>신고 조회</button>
							</div>
						</div>
					</div>
				</div>
     		</div>
		</div>
	</div><hr>	
</div>
	
<div class='modal fade' tabindex='-1' id='modal'>
    <div class='modal-dialog modal-dialog-centered' id='myModal'>
        <div class='modal-content'>
            <div class='modal-header'></div>
            <div class='modal-body' style='text-align: center;'>
                <h4 id='modalMsg' style='color: red;'>로그인 하세요</h4>
                <div class='row'>
                    <button type='button' class='col btn btn-block btn-secondary' data-dismiss='modal'
                        id='noBtn'>취소</button>
                    <button type='button' class='col btn btn-block btn-primary' data-dismiss='modal'
                    	id='yesBtn' onclick='location.href="admin/user/login"'>확인</button>
                </div>
            </div>
        </div>
    </div>
</div>