<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 후기 상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table,th,td {
		border:1px solid black;
		border-collapse:collapse;
	}
	th,td {
		padding:5px 10px;
	}


 	/*댓글 작성 폼 */
	 .comment-form {
	  display: flex;
	  flex-direction: column;
	}
	.comment-form textarea {
	  resize: none;
	  border: 1px solid #dbdbdb;
	  padding: 15px 20px;
	  outline: none;
	}
	.comment-form .submit {
	  border: 1px solid #8f8f8f;
	  background-color: #8f8f8f;
	  color: #fff;
	  padding: 5px;
	  cursor: pointer;
	}
 	
 	
 	
 	/*댓글 리스트 */
 	/* 레이아웃 - 댓글 */
	.comments {
	  border: 1px solid #dbdbdb;
	}
	.comments .comment {
	  border-bottom: 1px solid #dbdbdb;
	  padding: 20px;
	}
	.comments .comment:last-child {
	  border-bottom: none;
	}

	/* 상단 메뉴 */
	.top {
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	}
	.top .member_id {
	  font-weight: bold;
	}
	.top .utility {
	  display: flex;
	  flex-direction: row;
	  margin-left: auto;
	}

	/* 하단 메뉴 */
	.bottom {
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	  list-style: none;
	  padding: 0;
	  margin: 0;
	  text-transform: uppercase;
	  letter-spacing: -0.5px;
	  font-weight: bold;
	  font-size: 14px;
	}
	.bottom .divider {
	  width: 1px;
	  height: 20px;
	  background-color: #dbdbdb;
	  margin: 0 20px;
	}
	.bottom .menu {
	  margin: 0;
	  padding: 0;
	  color: #bebebe;
	}
	.bottom .menu.report {
	  color: #333;
	}
	
</style>
</head>
<body>
	<div>
	 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
	</div>
	<h3>모임 후기 상세보기</h3>
	<input type="hidden" id="groupReview_no" value="${dto.groupReview_no}"/>
	<input type="hidden" id="groupReview_status" value="${dto.groupReview_status}"/>
	<input type="hidden" id="member_id" value="${dto.member_id}"/>
	<input type="hidden" id="login_id" value="${dto.login_id}"/>
	<table>
		<tr>
			<th>글 제목</th>
			<td colspan="3" id="">${dto.review_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.member_name}</td>
			<th>작성일</th>
			<td>${dto.review_date}</td>
		</tr>
		<tr>
			<th>모임 이름</th>
			<td>${dto.dojang_title} ${dto.lightning_title}</td>
			<th>모임 종류</th>
			<td>${dto.class_name}</td>
		</tr>
		<tr>
			<td colspan="4">
				${dto.review_content}
				<button onclick="groupReviewDel()">삭제</button>
				<button onclick="grReviewReport_pop()">신고하기</button>
			</td>
		</tr>
		<tr>
			<th colspan="4">
				<input type="button" value="수정" onclick="groupReviewUpdateForm()"/>
				<input type="button" value="목록" onclick="location.href='groupReviewList.go'"/>
			</th>
		</tr>
	</table>

	
	<div class="comment-form">
  		<textarea  id="cmtInput" placeholder="댓글을 작성하세요."></textarea>
  		<button type="button" class="submit" id="cmtWrite">댓글 쓰기</button>
	</div>
	<div id="cmtList">
	</div>
	<!-- 댓글리스트
	<div id="cmtList">
	  <ul>
	    <li>작성자</li>
	    <li>댓글내용</li>
	    <li>작성날짜</li>
	    <li>기능</li>
	  </ul>
	<div class="comments">
	  <div class="comment">
	    <div class="content">
	      <header class="top">
	        <div class="member_id">우연히 들어온 사람</div>
	        <div class="utility">
	          <button class="update">수정</button>
	          <button class="delete">삭제</button>
	        </div>
	      </header>
	      <p>content</p>
	      <ul class="bottom">
	        <li class="menu comment_date">날짜</li>
	         <li class="divider"></li>
        	<li class="menu report">신고하기</li>
	      </ul>
	    </div>
	  </div>
	</div>
	</div>-->
	
	
	
</body>
<script>
//상세보기 눌렀을 때 댓글리스트 보여주기 
var groupReview_no =  ${dto.groupReview_no};
groupReviewList(groupReview_no);

var login_id = "${dto.login_id}"; //업데이트폼 이동, 삭제 처리할 때 쓸거
var loginId = "${loginId}"; //댓글에서 쓸거

//신고창 팝업
function grReviewReport_pop(){
	window.open("/grReviewReport.go?groupReview_no="+${dto.groupReview_no},"new","width=400, height=200, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

//업데이트폼 이동
function groupReviewUpdateForm(){
	var member_id = $("#member_id").val();
	
	if (member_id == login_id) {
		location.href="/groupReviewUpdate.go?groupReview_no="+${dto.groupReview_no};
	} else if(member_id != login_id) {
		alert("작성자만 수정할 수 있습니다.");
	} else {
		alert("작성자만 수정할 수 있습니다.");
	}
}


//삭제(숨김처리)
function groupReviewDel(){
	var member_id = $("#member_id").val();
	
	if (member_id == login_id) {
		location.href="/groupReviewDelete.go?groupReview_no="+${dto.groupReview_no};
	} else {
		alert("작성자만 수정할 수 있습니다.");
	}
}


//댓글 
//로그인 아이디 위에 변수 설정 되어있음 loginId 
//var lightning_no =  ${dto.lightning_no};
//작성 시 
$("#cmtWrite").on("click",function(){
console.log(loginId, groupReview_no);
  var comment_content = $("#cmtInput").val();
  if(comment_content == null ||comment_content ==''){
    alert("댓글을 입력해 주세요.");
    $("#cmtInput").focus();
	return false;
  }else{
    var cmtData = {'idx':groupReview_no,'member_id':loginId,'comment_content':comment_content};
    
	$.ajax({
		type:"post",
		url:"comment/lightWrite",
		data:JSON.stringify(cmtData),
		contentType:"application/json; charset=utf-8",
		success : function(data){
			if(data.success){
				groupReviewList(groupReview_no);
			}
		},
		error : function(e){
			console.log(e);
		}
	})
  
  }
});

//06_TeamProject 참고 
//댓글 리스트 가져오기 
function groupReviewList(idx){
	var url ='comment'+ "/" + 'groupReviewList'+"/" +idx;
	
	$.ajax({
		url:url,
		type:'get',
		dataType:'json',
		success : function(data){
			console.log(data);
			drawCmt(data.groupReviewList);
			
		},
		error : function(e){
			console.log(e);
		}
	});
}


function drawCmt(list){
	console.log(list);
	var content = "";
	//데이터가 있는 경우
	if(list.length>0){					
		list.forEach(function(item,idx){
			//console.log(item);
			content += '<div class ="comments">';
			content += '<div class ="comment">';
			content += '<div class ="content">';
			content += '<header class="top">';
			content += '<div class="member_id">'+item.member_id+'</div>';
			content += '<div class="utility">';
			content += '<button class="update">수정</button>';
			content += '<button class="delete">삭제</button>';
			content += '</div>';
			content += '</header>';
			content += '<p>'+item.comment_content+'</p>';
			content += '<ul class="bottom">';
			content += '<li class="menu comment_date">'+item.comment_date+'</li>';
			content += '<li class="divider"></li>';
			content += '<li class="menu report">신고하기</li>';
			content += '</ul>';
			content += '</div>';
			content += '</div>';
			content += '</div>';
			
		});
	//데이터가 없을 경우	
	}else{
		content += "데이터 없음";
	}
	
	$('#cmtList').empty();
	$('#cmtList').append(content); 
}
</script>
</html>