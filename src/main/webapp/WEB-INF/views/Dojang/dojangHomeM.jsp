<!DOCTYPE html>
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


</style>
</head>
<body>
 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
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
   <c:if test="${leader == loginId}">
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
	<h1>일반 게시판</h1>
	<input type="button" value="글쓰기" onclick="location.href='dojangPostReg.go'"/>
</div>


</body>
<script>
var page = 1;
var maxPage = undefined;

listCall(page);

// 무한스크롤
$(window).scroll(function() {
	let percent = Math.floor(($(window).scrollTop() / ($(document).height() - $(window).height())) * 100);
	
	if(percent == 100) {
		if(page < maxPage)
			listCall(++page);
	}
});

function listCall(page){
	
	var pagePerNum = 5;
	var dojang_no = $('#dojang_no').val();
	
	$.ajax({
		type:'get',
		url:'dojangHomeM.ajax',
		data:{
			dojang_no:dojang_no,
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
				maxPage = data.pages;
				drawList(data.dojangHomeM);
				console.log("데이터",data.dojangHomeM);
				$('#leader').html(data.dojangHomeLeader);
				drawMember(data.dojangHomeMember);
		},
		error:function(e){
			console.log(e);
		}
			
	});	
	

}



function drawMember(member){
	var content = '';

	member.forEach(function(item){
		content += '<li>'+item.member_id+'</li>';
	});
	$('#member').empty();
	$('#member').append(content);
}




function drawList(list){
	var content = '';
	
	var loginId = $("#loginId").val();
	
	
	if(list.length == 0){
		content += '<div>'+"등록된 게시글이 없습니다."+'</div>';
	} else {
		list.forEach(function(item){
			var date = new Date(item.dojangPost_date);
			var create = date.toLocaleDateString("ko-KR");
	
			content += '<br/>';
			content += '<table>';
			content += '<tr>';
			content += '<th>'+"제목"+'</th>';
			content += '<td colspan="2">'+item.dojangPost_subject+'</td>';
			content += '<td>'+item.dojangPost_type+'</td>';
			content += '</tr>';
			content += '<tr>';
			content += '<th>'+"작성자"+'</th>';
			content += '<td>'+item.member_id+'</td>';
			content += '<th>'+"작성일"+'</th>';
			content += '<td>'+create+'</td>';
			content += '</tr>';
			content += '<tr>';
			content += '<td  height=350 colspan="4"><a href="dojangHomeDetail.go?dojangPost_no='+item.dojangPost_no+'">'+item.dojangPost_content+'</td>';
			content += '</tr>';
			content += item.leader_id ==loginId && item.dojangPost_type == "공지게시판"?'<th colspan="2">'+"이번 모임장소는?"+'</th>' : '<th colspan="2">'+item.member_id+"님의 추천맛집은?"+'</th>';
			content += item.restaurant_name==null || item.restaurant_name=="검색버튼을 눌러주세요"? '<td colspan="2">'+"등록된 맛집이 없습니다."+'</td>': '<td colspan="2">'+item.restaurant_name+'</td>';
			content += '</table>';
		});
	}
	$('#list').append(content);
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



</script>
</html>