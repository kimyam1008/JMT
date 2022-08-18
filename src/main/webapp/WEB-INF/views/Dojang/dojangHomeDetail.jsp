<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#test {
  list-style-type: none;
  padding: 10px;
  margin: 0px;
  width: 190px;
  background: #edacb1;
  height: 100%;
  overflow: auto;
  position: fixed;
  top: 70px;
}

li a {
  text-decoration: none;
  padding: 10px;
  display: block;
  color: #000;
  font-weight: bold;
}

li a:hover {
  background: #333;
  color: #fff;
}

#list {
  margin-left: 260px;
}

table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		width: 600px;
		hi
	}
	td, th{
		padding: 5px 10px;
	}
	
#test2{
		width: 170px;
       height: 170px;
       border: 1px solid black;
       overflow:scroll;
      padding:10px; 
      background-color: #cd5c5c;
}

#review{
	display: flex;
	justify-content: center;
}

td a {
	display:block; 
	line-height:350px; 
	text-decoration:none;
	cursor:pointer;
	color: black; 
}

#review2{
	display: flex;
	justify-content: center;
}

/*댓글 작성 폼 */
	 .comment-form {
	  display: flex;
	  flex-direction: column;
	  width : 515px;
	  height : 80px;
	  margin : 10px 0px;
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
	  border: 0.5px solid #dbdbdb;
	  border-left: none;
	  border-right: none;
	  width : 510px;
	}
	.comments .comment {
	  border-bottom: 1px solid #dbdbdb;
	  padding: 15px;
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
	  font-size : 13px;
	}
	
	.top .grade_name{
		font-size : 12px;
		padding : 5px;
	}
	
	.content {
		padding : 5px;
	}
	
	/*등급색상*/
	.g1{
		color :green;
	}
	
	.g2{
		color :brown;
	}
	
	.g3{
		color :lightblue;
	}
	
	.g4{
		color :gold;
	}
	
	.g5{
		color :purple;
	}
	
	.top .utility {
	  display: flex;
	  flex-direction: row;
	  margin-left: auto;
	}

	p {
		font-size : 13px;
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
	  height: 15px;
	  background-color: #dbdbdb;
	  margin: 0 20px;
	}
	.bottom .menu {
	  margin: 0;
	  padding: 0;
	  color: #bebebe;
	  font-size: 13px;
	}
	.bottom .menu.report:hover {
		color : #333;
		cursor : pointer;
	}
 	
 	/*수정*/
 	#updtextarea{
 		width : 380px;
 		height : 40px;
 		resize : none;
 	}
 	
 	
 	/*버튼*/
 	.btn{
 		margin : 3px;
 		padding : 5px;
 		border-radius : 5px;
 		border : 1px black;
 		background-color: #lightgrey;
 	}
 	
 	.btn:hover{
 		background-color: #bebebe;
 	}
 	
 	/*프로필 사진*/
 	.img{
 		width : 35px;
 		height : 35px;
 		margin : 0 7 5 0px;
 		border-radius : 70%;
 		overflow : hidden;
 	}
 	
 	.profileImg {
 		width : 100%;
 		height : 100%;
 		object-fit : cover;
 	} 	




</style>
</head>
<body>
 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
 <input type="hidden" id="dojangPost_no" value="${sessionScope.dojangPost_no}"/>
  <input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>
<div id="test">
<h3>도장 격파원</h3>
<div id="test2">
<h5>방장</h5>
<ul id="leader">
</ul>
<h5>멤버</h5>
<ul id="member">
</ul>
</div>
<br/>
<h3>게시판</h3>
<ul id="post_type">
  <li class="post"><a href="dojangHome.go?dojang_no=${sessionScope.dojang_no}">전체게시판</a></li>
  <li class="post"><a href="dojangHomeL.go?dojang_no=${sessionScope.dojang_no}">공지게시판</a></li>
  <li class="post"><a href="dojangHomeM.go?dojang_no=${sessionScope.dojang_no}">일반게시판</a></li>
   <c:if test="${list.leader_id == loginId}">
  <li><a href="dojangLeaderPage.go?dojang_no=${sessionScope.dojang_no}">방장페이지</a></li>
	</c:if>
</ul>

<div  id="review">
<input type="button" value="모임후기 작성하러 가기" onclick="location.href='groupReviewList'"/>
</div>
<br/>
<c:if test="${member == loginId}">
<div id="review2">
<input type="button" value="도장깨기 회원 탈퇴" onclick="memberStatus()"/>
</div>
</c:if>
</div>


<div id="list">
<h1>게시글 상세</h1>
	<c:choose>
		<c:when test="${list.member_id ==loginId}">
			<input type="button" value="수정하기" onclick="dojangPostUpdate()"/>
			<input type="button" value="삭제하기" onclick="dojangPostDel()"/>
		</c:when>
		<c:otherwise>
			<input type="button" value="신고하기" onclick="dojangPostReport()"/>
		</c:otherwise>
	</c:choose>
<table>
	<tr id="dojangPost_no_tr">
		<th>글번호</th>
		<td id="dojangPost_no"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="2" id="dojangPost_subject"></td>
		<td id="dojangPost_type"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td id="member_id"></td>
		<th>작성일</th>
		<td id="dojangPost_date"></td>
	</tr>
	<tr>
		<td height=350 colspan="4" id="dojangPost_content"></td>
	</tr>
	<tr>
		<th colspan="2">
		<c:choose>
			<c:when test="${list.leader_id == loginId and list.dojangPost_type == '공지게시판'}">
				이번 모임장소는?
			</c:when>
			<c:otherwise>
				추천 맛집은?
			</c:otherwise>
		</c:choose>
		</th>
		<c:choose>
			<c:when test="${list.restaurant_name == null or list.restaurant_name == '검색버튼을 눌러주세요'}">
				<td colspan="2">등록된 맛집이 없습니다.</td>
			</c:when>
			<c:otherwise>
				<td colspan="2" id="restaurant_name"></td>
			</c:otherwise>
		</c:choose>
	</tr>
</table>
<!-- 댓글 -->
<div class="comment-form">
  		<textarea  id="cmtInput" placeholder="댓글을 작성하세요 (최대 300자)"></textarea>
  		<button type="button" class="submit" id="cmtWrite">댓글 쓰기</button>
	</div>
	<div id="cmtList">
	</div>


</div>


</body>
<script>

/*상세보기 들어왔을 때 댓글리스트 보여주기 */
var dojangPost_no =  $('#dojangPost_no').val();
var class_no = 5;
cmtList(class_no,dojangPost_no);

var msg = "${msg}";
	if (msg != ""){
		alert(msg);
	}
	
	var status = "${dto.status}";
	var leader_id="${dto.leader_id}";
	var loginId = "${loginId}";
	//사용자 프로필
	var eat_speed = "${profileInfo.eat_speed}";
	var profile_gender = "${dto.profile_gender}";
	var profile_job = "${profileInfo.profile_job}";


console.log($('#dojangPost_no').val());

$('#dojangPost_no_tr').attr('style', "display:none;");


	
	$.ajax({
		type:'get',
		url:'dojangHomeDetail.ajax',
		data:{
		},
		dataType:'JSON',
		success:function(data){
				$('#leader').html(data.dojangHomeLeader);
				drawMember(data.dojangHomeMember);
				$('#dojangPost_no').html(data.dojangHomeDetail.dojangPost_no);
				$('#dojangPost_subject').html(data.dojangHomeDetail.dojangPost_subject);
				$('#dojangPost_type').html(data.dojangHomeDetail.dojangPost_type);
				$('#member_id').html(data.dojangHomeDetail.member_id);
				$('#restaurant_name').html(data.dojangHomeDetail.restaurant_name);
				var date = new Date(data.dojangHomeDetail.dojangPost_date);
				
				$('#dojangPost_date').html(date.toLocaleDateString("ko-KR"));
				$('#dojangPost_content').html(data.dojangHomeDetail.dojangPost_content);
		},
		error:function(e){
			console.log(e);
		}
			
	});	
	



function drawMember(member){
	var content = '';

	member.forEach(function(item){
		content += '<li>'+item.member_id+'</li>';
	});
	$('#member').empty();
	$('#member').append(content);
}

function dojangPostUpdate(){
	var dojangPost_no = $('#dojangPost_no').val();
	location.href='dojangPostUpdate.go?dojangPost_no='+dojangPost_no;
}


//신고하기 팝업
function dojangPostReport(){
	var dojangPost_no = $('#dojangPost_no').val();
	window.open("/dojangPostReport.go?dojangPost_no="+dojangPost_no,"new","width=600, height=400, left=450 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

//삭제(숨김처리)
function dojangPostDel(){
	
	var dojangPost_no = $('#dojangPost_no').val();
	var dojang_no = $('#dojang_no').val();
	
		if (!confirm("정말로 삭제하시겠습니까?")) {
			alert("삭제가 취소되었습니다.");
			window.location.reload();
		} else {
			$.ajax({
				type:'get',
				url:'dojangHomeDetail..ajax',
				data:{
					dojangPost_no:dojangPost_no
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.success){
						console.log(data.success)
						alert("삭제가 완료됐습니다.")
						location.href='/dojangHome.go?dojang_no='+dojang_no;
					}else{
						alert("삭제 실패");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		
		}
	
}


//회원탈퇴
function memberStatus(){
	
	var loginId = $('#loginId').val();
	var dojang_no = $('#dojang_no').val();
	
		if (!confirm("정말로 탈퇴 하시겠습니까?")) {
			alert("탈퇴가 취소됐습니다.");
			window.location.reload();
		} else {
			$.ajax({
				type:'get',
				url:'dojangHome..ajax',
				data:{
					dojang_no:dojang_no,
					loginId:loginId
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.Mstatus){
						console.log(data.Mstatus)
						alert("탈퇴가 완료됐습니다.")
						location.href='/dojang.go';
					}else{
						alert("탈퇴 실패");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		
		}
	
}


/*********댓글*********/ 

//로그인 아이디 위에 변수 설정 되어있음 loginId 
//var lightning_no , var class_no 위에 변수 설정 


//댓글 작성 시
$("#cmtWrite").on("click",function(){
console.log(loginId, dojangPost_no);
  var comment_content = $("#cmtInput").val();
  if(comment_content == null ||comment_content ==''){
    alert("댓글을 입력해 주세요.");
    $("#cmtInput").focus();
  }else if(comment_content.length>300){
	  alert("최대 300자까지 입력 가능합니다.");
	    $("#cmtInput").val(comment_content.substring(0, 300));
  }else{
    var cmtData = {'idx':dojangPost_no,'member_id':loginId,'comment_content':comment_content,'class_no':class_no};
    
	$.ajax({
		type:"post",
		url:"comment/cmtWrite",
		data:JSON.stringify(cmtData),
		contentType:"application/json; charset=utf-8",
		success : function(data){
			if(data.writeSuccess){
				cmtList(class_no,dojangPost_no);
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
	var url ='comment'+ "/" + 'cmtList'+"/" +class_no+"/" +idx;
	
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
			content += '<li class="menu comment_date">'+date.toLocaleString("ko-KR")+'</li>';
			
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
				cmtList(class_no,dojangPost_no);
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
				cmtList(class_no,dojangPost_no);
			}
		},
		error : function(e){
			console.log(e);
		}
	});
}



//댓글 신고 팝업
function lightCmtReport_pop(cno){
	window.open("/dojangCmtReport.go?comment_no="+cno,"new","width=400, height=200, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}







</script>
</html>