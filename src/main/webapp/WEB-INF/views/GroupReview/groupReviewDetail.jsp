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
	<input type="hidden" id="lightning_title" value="${dto.lightning_title}"/>
	<input type="hidden" id="dojang_title" value="${dto.dojang_title}"/>
	<input type="hidden" id="lightning_no" value="${dto.lightning_no}"/>
	<input type="hidden" id="dojang_no" value="${dto.dojang_no}"/>
	<input type="hidden" id="class_no" value="${dto.class_no}"/>
	<input type="hidden" id="dojang_class_no" value="${dto.dojang_class_no}"/>
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
			<td>${dto.lightning_title} ${dto.dojang_title}</td>
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

	
</body>
<script>
//상세보기 눌렀을 때 댓글리스트 보여주기 
var groupReview_no =  ${dto.groupReview_no};
var class_no = 7;
cmtList(class_no,groupReview_no);

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
		//location.href="/groupReviewUpdate.go";
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
		if (!confirm("정말로 삭제하시겠습니까?")) {
			alert("삭제가 취소되었습니다.");
			window.location.reload();
		} else {
			location.href="/groupReviewDelete.do";
			alert("삭제되었습니다.");
		}
	} else {
		alert("작성자만 수정할 수 있습니다.");
	}
}


/*********댓글***********/ 
//로그인 아이디 위에 변수 설정 되어있음 loginId 
//var lightning_no =  ${dto.lightning_no};
//작성 시 
$("#cmtWrite").on("click",function(){
console.log(loginId, groupReview_no);
  var comment_content = $("#cmtInput").val();
  if(comment_content == null ||comment_content ==''){
    alert("댓글을 입력해 주세요.");
    $("#cmtInput").focus();
	}else if(comment_content.length>300){
	  alert("최대 300자까지 입력 가능합니다.");
	    $("#cmtInput").val(comment_content.substring(0, 300));
	}else{
  var cmtData = {'idx':groupReview_no,'member_id':loginId,'comment_content':comment_content,'class_no':class_no};
    
	$.ajax({
		type:"post",
		url:"comment/cmtWrite",
		data:JSON.stringify(cmtData),
		contentType:"application/json; charset=utf-8",
		success : function(data){
			if(data.writeSuccess){
				cmtList(class_no,groupReview_no);
				$("#cmtInput").val("");
			}
		},
		error : function(e){
			console.log(e);
		}
	});
  
  }
});

//06_TeamProject 참고 
//댓글 리스트 가져오기 
function cmtList(class_no,idx){
	var url ='comment'+ "/" + 'cmtList'+"/" +class_no+"/"+idx;
	
	$.ajax({
		url:url,
		type:'get',
		dataType:'json',
		success : function(data){
			console.log(data);
			drawCmt(data.cmtList);
			
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
			var date = new Date(item.comment_date);	
			console.log(item);
			//댓글 작성 시 엔터누르면 댓글 줄바꿈 되며, 수정버튼 오류 처리 
			var str = item.comment_content;
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		
			content += '<div class ="comments c'+item.comment_no+'">';
			content += '<div class ="comment">';
			content += '<div class ="content">';
			content += '<header class="top">';
			content += '<div class ="img">';
			
			if (item.photo_newFileName!= null){
			content += '<a href="#"><img src ="/photo/'+item.photo_newFileName+'" class="profileImg"></a>';
			}else{ //프로필 등록을 안했을 시
				content += '<a href="#"><img src ="/photo/profile.jpeg" class="profileImg"></a>';
			}
			
			content += '</div>';
			content += '<div class="member_id"><a href="#">'+item.member_id+'</a></div>';
			content += '<div class="grade_name g'+item.grade_no+'">'+item.grade_name+'</div>';
			content += '<div class="utility">';
			
			if(loginId == item.member_id){ //본인 댓글만 수정,삭제 보이게 
			content += '<button class="btn" id="updBtn'+item.comment_no+'" onclick="updBtn('+item.comment_no+   ","     +  "\'" +  str   +"\'"  + ')">수정</button>';
			content += '<button class="btn" id="delBtn'+item.comment_no+'" onclick="cmtDel('+item.comment_no+')">삭제</button>';
			}
			
			content += '</div>';
			content += '</header>';
			content += '<p id="p'+item.comment_no+'">'+str+'</p>';
			content += '<ul class="bottom">';
			content += '<li class="menu comment_date">'+date.toLocaleDateString("ko-KR")+'</li>';
			
			if(loginId != item.member_id){ //본인 댓글은 '신고하기' 안보이게
			content += '<li class="divider"></li>';
			content += '<li class="menu report" onclick="lightCmtReport_pop('+item.comment_no+')">신고하기</li>';
			}
			
			content += '</ul>';
			content += '</div>';
			content += '</div>';
			content += '</div>';
				
		});	
	}else{
		content += '<div class ="comment">';
		content = "작성된 댓글이 없습니다.";
		content += '</div>';
	}
	$('#cmtList').empty();
	$('#cmtList').append(content); 	
}	


//삭제 
function cmtDel(cno){
	
	$.ajax({
		url:"comment/cmtDel",
		type:'post',
		data : {
			'comment_no' : cno
		},
		dataType:'json',
		success : function(data){
			console.log(data.delSuccess);
			if(data.delSuccess){
				cmtList(class_no,groupReview_no);
			}
		},
		error : function(e){
			console.log(e);
		}
	});
}




//수정버튼 눌렀을 때 
function updBtn(cno,content){
	//console.log("수정하고싶다");
	console.log(cno,content);
	var updcontent = content.split('<br/>').join("\r\n");
	//수정 버튼 누른 댓글의 태그 변경 
	$('#p'+cno).replaceWith('<textarea id="updtextarea">'+updcontent+'</textarea>');
	$('#updBtn'+cno).attr('onclick','updCmt('+cno+')');
	
	
	//글자 수 500자 제한
	$('#updtextarea').keyup(function(){
		  var content = $(this).val();
		  if (content.length > 500){
		    alert("최대 500자까지 입력 가능합니다.");
		    $(this).val(content.substring(0, 500));
		  }
	});
}



//수정하기 요청 
function updCmt(cno){
	console.log("수정하기!!!!!" + cno);
	var updcontent = $("#updtextarea").val();
	console.log("바뀐 내용" + updcontent);
	
	$.ajax({
		url:"comment/cmtUpd",
		type:'post',
		data : {
			'comment_no' : cno,
			'comment_content' : updcontent
		},
		dataType:'json',
		success : function(data){
			console.log(data);
			if(data.updSuccess){
				cmtList(class_no,groupReview_no);
			}
		},
		error : function(e){
			console.log(e);
		}
	});
}



//댓글 신고 팝업
function lightCmtReport_pop(cno){
	window.open("/grCmtReport.go?comment_no="+cno,"new","width=400, height=200, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}
</script>
</html>