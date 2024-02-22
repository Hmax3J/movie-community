<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>커뮤니티 글</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css'/>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src="https://kit.fontawesome.com/449f39a7b2.js" crossorigin="anonymous"></script>
<!-- 영화평/댓글 modal script -->
<script>
<%
	int num = Integer.parseInt(request.getParameter("num"));
    request.setAttribute("communityNum", num);
%>

let postNickname = sessionStorage.getItem('nickname')
let globalNickname
let postTitle
let postContent

function init() {
    $.ajax({
        url: 'getContent',
        method: 'post',
        contentType: 'application/json',
        data: JSON.stringify({
            communityNum: ${communityNum} }),
        success: content => {
            if(content) {
                globalNickname = content.nickname
                $('#title').text(content.communityTitle)
                $('#content').text(content.communityContent)
                $('#nickname').text(content.nickname)
                $('#date').text(content.communityDate)
                postTitle = content.communityTitle
                postContent = content.communityContent
                $(boardInit)
                $('#editBoardBtn').click(() => {
                    $('#editBoardModal').modal('show')
                    $('#editTitleInput').val(postTitle)
                    $('#editContentInput').val(postContent)
                })
            }
        }
    })
}
function updateBoardContent() {
    // 제목과 내용을 가져오기
    let title = $('#editTitleInput').val().trim();
    let content = $('#editContentInput').val().trim();

    // 최소 2글자 이상인지 확인
    if (title.length < 2 || content.length < 2) {
        // 최소 길이 요구사항 미달 시 모달로 알림 표시
        $('#editTitleInput').val(title); // 기존 입력값 복원
        $('#editContentInput').val(content); // 기존 입력값 복원
        $('#editModalErrorMsg').text("제목과 내용은 2글자 이상 입력해야 합니다.");
        $('#editModalError').modal('show');
        return;
    } else {
        $.ajax({
            url: 'update', // 수정된 내용을 처리할 서버의 경로
            method: 'post',
            contentType: 'application/json',
            data: JSON.stringify({
                communityNum: ${communityNum},
                communityTitle: title,
                communityContent: content
            }),
            success: function(result) {
                if (result) {
                    $('#editBoardModal').modal('hide');
                    postTitle = title
                    postContent = content
                    // 수정된 내용을 화면에 반영
                    $('#title').text(title);
                    $('#content').text(content);
                }
            }
        })
    }

    // 모달 닫기
    $('#editBoardModal').modal('hide');
}

function boardInit() {
    if(postNickname !== globalNickname) {
        $('#editBoardBtn').remove()
        $('#delBoardBtn').remove()
    }

    $('#delBoardBtn').click(() => {
        $('#boardModalHeadMsg').text('영화평 삭제')

        $('#boardModalBodyMsg').text("삭제 하시겠습니까?")
        $('#boardInspectionReasonInput').hide()

        $('#delBoardYesBtn').show()
        $('#delBoardNoBtn').show()
        $('#delBoardOkBtn').show()
        $('#boardInspectionCancelBtn').hide()
        $('#boardInspectionCheckBtn').hide()
        $('#boardInspectionOkBtn').hide()

        $('#boardModal').modal()
    })

    $('#delBoardOkBtn').click(() => {
        $.ajax({
            url: 'del/${communityNum}',
            method:'delete',
            contentType: 'application/json',
            data: JSON.stringify({
                nickname: postNickname
            }),
            success: location.href='list'
        })
        $('#boardModal').modal('hide')
    })




    // $('#inspectionBoardBtn').click(() => {
    //     $('#boardModalHeadMsg').text('영화평 신고')
    //
    //     $('#boardModalBodyMsg').text('신고 사유를 입력해주세요.')
    //     $('#boardInspectionReasonInput').show()
    //
    //     $('#delBoardYesBtn').hide()
    //     $('#delBoardNoBtn').hide()
    //     $('#delBoardOkBtn').hide()
    //     $('#boardInspectionCancelBtn').show()
    //     $('#boardInspectionCheckBtn').show()
    //     $('#boardInspectionOkBtn').hide()
    //
    //     $('#boardModal').modal()
    // })
    //
    // $('#boardInspectionYesBtn').click(() => {
    //     $('#boardModalBodyMsg').text('신고해주셔서 감사합니다. 신고된 내용은 내부 검토를 통해 삭제여부를 확인해보도록 하겠습니다.')
    //     $('#boardInspectionReasonInput').hide()
    //
    //     $('#boardInspectionCancelBtn').hide()
    //     $('#boardInspectionCheckBtn').hide()
    //     $('#boardInspectionOkBtn').show()
    //
    //     $('#boardModal').modal()
    // })
}

// function replyInit() {
//     $('#delReplyBtn').click(() => {
//         $('#modalHeadMsg').text('댓글 삭제')
//
//         $('#modalBodyMsg').text('해당 댓글을 삭제하시겠습니까?')
//         $('#inpectionReasonInput').hide()
//
//         $('#delReplyYesBtn').show()
//         $('#delReplyNoBtn').show()
//         $('#delReplyOkBtn').hide()
//         $('#inpectionCancelBtn').hide()
//         $('#inpectionCheckBtn').hide()
//         $('#inpectionOkBtn').hide()
//
//         $('#replyModal').modal()
//     })
//
//     $('#delYesBtn').click(() => {
//         $('#modalBodyMsg').text('댓글이 삭제 되었습니다.')
//
//         $('#delReplyYesBtn').hide()
//         $('#delReplyNoBtn').hide()
//         $('#delReplyOkBtn').show()
//
//         $('replyModal').modal()
//     })
//
//     $('#inpectionReplyBtn').click(() => {
//         $('#modalHeadMsg').text('댓글 신고')
//
//         $('#modalBodyMsg').text('신고 사유를 입력해주세요.')
//         $('#inpectionReasonInput').show()
//
//         $('#delReplyYesBtn').hide()
//         $('#delReplyNoBtn').hide()
//         $('#delReplyOkBtn').hide()
//         $('#inpectionCancelBtn').show()
//         $('#inpectionCheckBtn').show()
//         $('#inpectionOkBtn').hide()
//
//         $('#replyModal').modal()
//     })
//
//     $('#inpectionYesBtn').click(() => {
//         $('#modalBodyMsg').text('신고해주셔서 감사합니다. 신고된 내용은 내부 검토를 통해 삭제여부를 확인해보도록 하겠습니다.')
//         $('#inpectionReasonInput').hide()
//
//         $('#inpectionCancelBtn').hide()
//         $('#inpectionCheckBtn').hide()
//         $('#inpectionOkBtn').show()
//
//         $('#replyModal').modal()
//     })
// }

$(init)
//$(replyInit)
</script>
</head>
<style>
#delModal{
    text-align: center;
}

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

.fa-tv {
	text-decoration: none;
	color: black;
}

label {
    font-size:12px;
    width: 1px;
}

.board-box {
    height: 250px;
    margin-bottom: 20px;
    padding: 50px;
    border-width: 200px;
}

#replyBg {
        background: rgb(209, 208, 208);
    }

#replyMenu {
    color:black;
    background-color: rgb(209, 208, 208);
    border: 0px;
}

#boardMenu {
    color:black;
    background-color: rgb(209, 208, 208);
    border: 0px;
}

.container{
    font-size: 14px;
}

#empathy{
    color:black;
}

#nonEmpathy{
    color:black;
    transform:scaleX(-1);
    transform:scaleY(-1);
}

#regReplyBtn {
    width: 110%;
}

#modalBodyMsg{
    text-align: center;
}

#boardModalBodyMsg{
    text-align: center;
}
</style>
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
    <table border="1">
        <tr>
            <td width=1500 height=30 id='title'></td>
            <td width=200>
                <div class='row border'>
                    <div class='col d-flex justify-content-center align-items-center'></div>
                    <div class='btn-group btn-block'>
                        <button type='button' class='btn btnBack' data-toggle='dropdown'>
                            <i class="fa-solid fa-ellipsis-vertical fa-lg"></i>
                        </button>
                        <ul class='dropdown-menu'>
                            <li><a class='dropdown-item' id='editBoardBtn'>수정</a></li>
                            <li><a class='dropdown-item' id='delBoardBtn'>삭제</a></li>
                            <li><a class='dropdown-item' id='inspectionBoardBtn'>신고</a></li>
                        </ul>
                    </div>
                </div>
            </td>
        </tr>
    </table>

    <div class= "board-box" style="background-color: #dbe8fb; border: #79a5e4 1px solid; padding: 10px;">
        <table>
	        <tr>
	        	<td id='content'></td>
	        </tr>
	    </table>
    </div>
    <div class="row mt-3">
        <div class="col d-flex">
            <!-- 작성자 표시 -->
            <div class="ml-1">작성자&nbsp;
                <div id="nickname"></div>
            </div>
            <!-- 작성일 표시 -->
            <div class="ml-4">작성일&nbsp;
                <div id="date"></div>
            </div>
            <!-- 이전 페이지로 돌아가는 링크 추가 -->
            <div class="ml-auto">
                <a href="list">
                    <button id="backToListBtn" type="button" class="btn btn-primary">목록</button>
                </a>
            </div>
        </div>
    </div>

<!-- 영화평 공감 버튼 -->
<div class="container text-center">
    <button type='button' class='btn resBtn btnBack'>
        <i class="fa-regular fa-thumbs-up fa-xl"></i>
    </button>

    <!-- 공감수 표시 -->
    <td>2</td>

    <!-- 영화평 공감 버튼 -->
    <button type='button' class='btn resBtn btnBack'>
        <i class="fa-regular fa-thumbs-down fa-xl"></i>
    </button>
</div>

<div>
<hr style="border: double 1px grey;">
</div>

<!-- 네비게이션 바 -->
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
<!-- 영화평 댓글 -->
<div>
    <div class='row mb-3 mt-3'>
        <div class='col'>
            <li class='list-group-item d-flex'>
                댓글
                3   <!-- 해당 영화평의 댓글 수 -->
            </li>
        </div>
    </div>

    <div class='row' id='reply'>
        <div class='col mb-1'>
            <li id='replyBg' class='list-group-item d-flex justify-content-between'>
                <div>
                    Ok_Man dkanro123  <!-- 작성자의 닉네임 id -->
                </div>
                <div>
                    2022-10-17  <!-- 해당 댓글의 작성일 -->
                    <button class='ml-0' id='replyMenu' data-toggle='dropdown'><i class="bi bi-gear-fill"></i></button>
                    <div class='dropdown-menu'>
                        <a class='dropdown-item' id='delReplyBtn'>삭제</a>
                        <div class='dropdown-divider'></div>
                        <a class='dropdown-item' id='inpectionReplyBtn'>신고</a>
                    </div>
                </div>
            </li>
            <li id='replyBg' class='list-group-item'>
                <div class='col mb-3'>
                    너무 기대 되요<br> <!-- 해당 댓글의 내용-->
                    그다음은 어떤내용이 이어질지<br>
                    주인공은 어떻게 될지<br>
                    궁금한거 투성이에요.
                </div>
                <div>
                    <a href='03.html'> <i id='empathy' class="bi bi-hand-thumbs-up-fill"></i></a>
                    3   <!-- 공감표시 수 -->
                    <a href='03.html'> <i id='nonEmpathy' class="bi bi-hand-thumbs-down-fill"></i></a>
                </div>
            </li>
        </div>
    </div>

    <div class='row mb-1'>
        <div class='col flex-low mt-3'>
            <a href='04.html'>
                <button id='listReplyBtn' type='button' class='btn btn-primary btn-block'>더보기</button>
            </a>
        </div>
    </div>

    <div class='row mt-3'>
        <div class='col d-flex'>
            <textarea class='form-control col-10' rows='1' placeholder='댓글을 작성해주세요.'></textarea>
            <a href='03.html'>
                <button id='regReplyBtn' type="button" class="btn btn-primary">등록</button>
            </a>
        </div>
    </div>
</div>
</div>
</c:if>
</body>

<!-- 하단내비바에 안깔리게 하려고 넣어둔 거 -->
<footer class='container-fulid border mt-5 p-1'>
    <div class='row m-3'>
        <div class='col-sm-3 border d-flex justify-content-center align-items-center'>
            <div></div>
        </div>
    </div>
</footer>

<!-- 영화평 modal -->
<div class='modal fade' tabindex='-1' id='boardModal'>
    <div class='modal-dialog modal-dialog-centered'>
        <div class='modal-content'>
            <div class='modal-header'>
                <p id='boardModalHeadMsg'></p>
            </div>
            <div class='modal-body'>
                <p id='boardModalBodyMsg'></p>
                <textarea id='boardInspectionReasonInput' class='form-control' rows='5' placeholder='내용을 입력해주세요.'></textarea>
            </div>
            <div class='modal-footer justify-content-center'>
                <div class='col' id='delBoardNoBtn'>
                    <button type='button' class='btn btn-secondary btn-block' data-dismiss='modal'>취소</button>
                </div>
                <div class='col' id='delBoardYesBtn'>
                    <button type='button' id='delBoardOkBtn' class='btn btn-primary btn-block' onclick='location.href="list"'>확인</button>
                </div>
                <div class='col' id='boardInspectionCancelBtn'>
                    <button type='button' class='btn btn-secondary btn-block' data-dismiss='modal'>취소</button>
                </div>
                <div class='col' id='boardInspectionCheckBtn'>
                    <button type='button' id='boardInspectionYesBtn' class='btn btn-primary btn-block'>확인</button>
                </div>
                <div class='col' id='boardInspectionOkBtn'>
                    <button type='button' class='btn btn-primary btn-block' data-dismiss='modal' onclick='location.href="list"'>확인</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 수정 모달 -->
<div class="modal fade" id="editBoardModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">영화평 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label>제목:</label>
                <input type="text" class="form-control" id="editTitleInput">
                <br>
                <label>내용:</label>
                <textarea class="form-control" id="editContentInput" rows="5"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" onclick="updateBoardContent()">저장</button>
            </div>
        </div>
    </div>
</div>

<!-- 수정 모달에서 발생한 오류를 알리는 모달 -->
<div class="modal fade" id="editModalError">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">알림</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="editModalErrorMsg"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>

<!-- 댓글 modal-->
<div class='modal fade' tabindex='-1' id='replyModal'>
    <div class='modal-dialog modal-dialog-centered'>
        <div class='modal-content'>
            <div class='modal-header'>
                <p id='modalHeadMsg'></p>
            </div>
            <div class='modal-body'>
                <p id='modalBodyMsg'></p>
                <textarea id='inpectionReasonInput' class='form-control' rows='5' placeholder='내용을 입력해주세요.'></textarea>
            </div>
            <div class='modal-footer justify-content-center'>
                <div class='col' id='delReplyNoBtn'>
                    <button type='button' class='btn btn-secondary btn-block' data-dismiss='modal'>취소</button>
                </div>
                <div class='col' id='delReplyYesBtn'>
                    <button type='button' id='delYesBtn' class='btn btn-primary btn-block'>확인</button>
                </div>
                <div class='col' id='delReplyOkBtn'>
                    <button type='button' class='btn btn-primary btn-block' data-dismiss='modal'>확인</button>
                </div>
                <div class='col' id='inpectionCancelBtn'>
                    <button type='button' class='btn btn-secondary btn-block' data-dismiss='modal'>취소</button>
                </div>
                <div class='col' id='inpectionCheckBtn'>
                    <button type='button' id='inpectionYesBtn' class='btn btn-primary btn-block'>확인</button>
                </div>
                <div class='col' id='inpectionOkBtn'>
                    <button type='button' class='btn btn-primary btn-block' data-dismiss='modal'>확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
</html>