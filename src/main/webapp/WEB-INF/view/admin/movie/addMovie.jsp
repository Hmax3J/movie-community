<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<title>addMovie</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<script>
function isVal(field) {
	let isGood
	
	if(!field.val() && !$('#movieName').val()) {
		$('#nameErrMsg').css('color', 'red').text('작품명은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#movieReleasedate').val()) {
		$('#relErrMsg').css('color', 'red').text('개봉일은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#movieCountry').val()) {
		$('#ctrErrMsg').css('color', 'red').text('국가명는 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
/* 	if(!field.val() && !$('#directorName').val()) {
		$('#directErrMsg').css('color', 'red').text('감독명은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#castName').val()) {
		$('#castErrMsg').css('color', 'red').text('출연진명은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true */
	
	if(!field.val() && !$('#movieRunningtime').val()) {
		$('#timeErrMsg').css('color', 'red').text('상영시간은 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#movieStory').val()) {
		$('#storyErrMsg').css('color', 'red').text('줄거리는 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	if(!field.val() && !$('#cumulativeAudience').val()) {
		$('#cumeErrMsg').css('color', 'red').text('누적관객수는 필수 입력 사항 입니다.')
		isGood = false
	} else isGood = true
	
	return isGood
}

function init() {
	
	$('#movieName').keyup(function() {
		let movieName =/^[가-힣a-zA-Z0-9]{2,20}$/;
		if(!(movieName.test($('#movieName').val()))) {
			$('#nameErrMsg').css('color', 'red').text('작품명을 2자 이상 20자 이하로 입력하세요.')
		} else {
			$('#nameErrMsg').text('')
		}
	})
	
	//개봉일부분 미완성
/* 	$('#movieReleasedate').keyup(function() {
		let movieReleasedate = false;
		if(!(movieReleasedate.test($('#movieReleasedate').val()))) {
			$('#relErrMsg').css('color', 'red').text('개봉일을 입력하세요.')
		} else {
			$('#relErrMsg').text('')
		}
	}) */
	
	$('#movieCountry').keyup(function() {
		let movieCountry =/^[가-힣a-zA-Z0-9]{1,20}$/;
		if(!(movieCountry.test($('#movieCountry').val()))) {
			$('#ctrErrMsg').css('color', 'red').text('국가명을 1자 이상 20자 이하로 입력하세요.')
		} else {
			$('#ctrErrMsg').text('')
		}
	})
	
	$('#movieRunningtime').keyup(function() {
		let movieRunningtime =/^[0-9]{1,3}$/;
		if(!(movieRunningtime.test($('#movieRunningtime').val()))) {
			$('#timeErrMsg').css('color', 'red').text('상영시간을 1~999 범위 내에 입력하세요.')
		} else {
			$('#timeErrMsg').text('')
		}
	})
	
	$('#cumulativeAudience').keyup(function() {
		let cumulativeAudience =/^[0-9]{1,10}$/;
		if(!(cumulativeAudience.test($('#cumulativeAudience').val()))) {
			$('#cumeErrMsg').css('color', 'red').text('누적관객수를 0~10억 범위 내에 입력하세요.')
		} else {
			$('#cumeErrMsg').text('')
		}
	})
	
	//스토리 수정중
/* 	$('#movieStory').keyup(function() {
		let movieStory =/^[ㄱ-ㅎ가-힣a-zA-Z0-9/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(]{2,2000}$/;
		if(!(movieStory.test($('#movieStory').val()))) {
			$('#storyErrMsg').css('color', 'red').text('줄거리를 2자 이상 20자 이하로 입력하세요.')
		} else {
			$('#storyErrMsg').text('')
		}
	}) */
		
    $('#addMovieBtn').click(() => {
    	if(isVal($('#movieName')) && isVal($('#movieReleasedate')) && isVal($('#movieCountry')) && isVal($('#movieRunningtime')) && isVal($('#movieStory')) && isVal($('#cumulativeAudience'))){
    	
    	$.ajax({
 			url: 'addMovie',
 		    method:'post',
 		    contentType: 'application/json',
 		    data: JSON.stringify({
 		    	movie: {
		 		    movieName: $('#movieName').val(),
		 		    moiveReleasedate: $('#movieReleasedate').val(),
		 		    movieCountry: $('#movieCountry').val(),
		 		    movieImgfileName: $('#movieImgfileName').val(),
		 		    movieRunningtime: $('#movieRunningtime').val(),
		 		    movieStory: $('#movieStory').val(),
		 		    hashtag: $('#hashtag').val(),
		 		    cumulativeAudience: $('#cumulativeAudience').val()
 		    	},
 		    	success: location.href='../movie/addMovie'
	        })
    	})}
    })
}
$(init)
</script>
<style>

	td {
		height: 30px;
		width: 150px;
	}

	#movieStory {
		height: 250px;

	}

	#orButton{
		padding-top: 200px;
		margin-top: 200px;
	}
	
	span {
		font-size: 13px;
	}
</style>
<div class='container-fluid'>
	<div class='header'>
		<div class='float-left mt-3'><h5>| 영화</h5></div>
		 <div id='btn_group' class='float-right mt-3'>
			  <label style='font-size:13'>관리자님</label>&emsp;
			  <span style='font-size:12'>(08:23)</span>&emsp;
			  <a href='#'><button style='font-size:13'>로그아웃</button></a>
		  </div><br>
	  <div class='row mt-5'>
		  <div class='col'>
			 <div class='container'>
				 <div class='row'>
					 <div class='col-12 text-center'>
						 <div class='btn-group btn-block'>
							<button type='button' class='btn btn-secondary' onclick='location.href=".." '>홈</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="#" '>회 원</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="#" '>장 르</button>
							 <button disabled type='button' class='btn btn-primary' onclick='location.href="../movie/listMovie" '>영 화</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="#" '>감독/배우</button>
							 <button type='button' class='btn btn-secondary' onclick='location.href="#" '>신고 조회</button>
						 </div>
					 </div>
				 </div>
			 </div>
		  </div>
	 </div>
</div><hr>
	<div class='col p-5'>
		<form class=' form' method='post'>
			<div class='col'>
				<h5 style='color:#0f56ba'><b>| 영화 추가</b></h5>
				<hr>
			</div>
			<div class='form-group mt-1' >
				<label>작품명*</label><input type='text' id='movieName' name='movieName' class='text-area form-control' minlength='2' maxlength='20' placeholder='작품명을 2자 이상 20자 이하로 입력하세요.' required/>
				<span id='nameErrMsg'></span>
			</div>
			<div class='form-group mt-1'>
				<label>개봉일*</label><input type='date' id='movieReleasedate' name='movieReleasedate' class='form-control' required/>
				<span id='relErrMsg'></span>
			</div>
			<div class='form-group mt-1'>
				 <label>장르*</label>
				<span id='genreErrMsg'></span>
				<div class='col'>
                    <div class='col d-flex justify-content-center align-items-center'></div>
						<table>
						<tr>
						<td><label><input type='checkbox'>액션</input></label></td>
						<td><label><input type='checkbox'>범죄</input></label></td>
						<td><label><input type='checkbox'>SF</input></label></td>
						<td><label><input type='checkbox'>스릴러</input></label></td>
						</tr>
						<tr>
						<td><label><input type='checkbox'>공포</input></label></td>
						<td><label><input type='checkbox'>전쟁</input></label></td>
						<td><label><input type='checkbox'>미스터리</input></label></td>
						<td><label><input type='checkbox'>판타지</input></label></td>
						</tr>
						<tr>
						<td><label><input type='checkbox'>코미디</input></label></td>
						<td><label><input type='checkbox'>로맨스</input></label></td>
						<td><label><input type='checkbox'>멜로</input></label></td>
						<td><label><input type='checkbox'>드라마</input></label></td>
						</tr>
						<tr>
						<td><label><input type='checkbox'>뮤지컬</input></label></td>
						<td><label><input type='checkbox'>음악</input></label></td>
						<td><label><input type='checkbox'>스포츠</input></label></td>
						<td><label><input type='checkbox'>애니</input></label></td>
						</tr>
						</table>
                    </div>
                </div>

            <div class='form-group mt-1'>
				<label>국가*</label><input type='text' id='movieCountry' name='movieCountry' class='form-control' minlength='1' maxlength='20' placeholder='국가명을 입력하세요.' required/>
				<span id='ctrErrMsg'></span>
			</div>

			<div class='form-group mt-1'>
				<label>감독*</label><input type='text' id='directorName' name='directorName' class='form-control' placeholder='감독명을 입력하세요.' required/>
				<span id='directErrMsg'></span>
			</div>
			<div class='form-group mt-1'>
				<label>출연진*</label><input type='text' id='castName' name='castName' class='form-control' placeholder='출연진명을 입력하세요.' required/>
				<span id='castErrMsg'></span>
			</div>
			<div class='form-group mt-1'>
				<label>태그</label><input type='text' id='hashtag' name='hashtag' class='form-control'/>
			</div>
			<div class='form-group mt-2'>
			<label>포스터</label>
			<input type="file" id="movieImgfileName" name='movieImgfileName' accept='image/png, image/jpeg, image/jpg'>
			</div>
			<div class='row form-group m-0 mt-1'>
				<label>상영시간(분)*</label><div><input type='number' id='movieRunningtime' name='movieRunningtime' min='1' max='999' class='form-control w-50 ml-5' required/></div>
			</div>
				<span id='timeErrMsg'></span>
			<div class='row form-group m-0 mt-3'>
				<label>누적관객수* &nbsp</label><div><input type='number' id='cumulativeAudience' name='cumulativeAudience' min='0' max='1000000000' class='form-control w-75 ml-5' required/></div>
			</div>
				<span id='cumeErrMsg'></span>
			<div class='form-group m-0 mt-3'>
				<label>줄거리*</label><textarea id='movieStory' name='movieStory' class='form-control' minlength='2' maxlength='2000' required></textarea>
				<span id='storyErrMsg'></span>
			</div> 
			<div class='row p-5 ml-5 justify-content-end'>
				<div class='p-1'>
				<button class='btn btn-secondary btn-block h-100 w-100 mr-5' onclick='location.href="../movie/listMovie"'>취소</button>
				</div>
				<div class='p-1'>
				<button type='submit' class='btn btn-success btn-block h-100 w-100 mr-5' id='addMovieBtn'>추가</button>
				</div>
			</div>
		</form>
	</div>
</div>