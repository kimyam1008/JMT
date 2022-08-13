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

</style>
</head>
<body>
 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
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
  <li><a href="#">방장페이지</a></li>
</ul>

<div  id="review">
<input type="button" value="모임후기 작성하러 가기" onclick="location.href='groupReviewList'"/>
</div>
</div>


<div id="list">
	<h1>공지 게시판</h1>
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
		url:'dojangHomeL.ajax',
		data:{
			dojang_no:dojang_no,
			cnt:pagePerNum,
			page:page
		},
		dataType:'JSON',
		success:function(data){
				maxPage = data.pages;
				drawList(data.dojangHomeL);
				console.log("데이터",data.dojangHomeL);
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
			content += '<td colspan="3">'+item.dojangPost_subject+'</td>';
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
			content += '</table>';
		});
	}
	$('#list').append(content);
}





</script>
</html>