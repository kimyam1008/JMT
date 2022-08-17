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
<h1>게시글 상세</h1>
<input type="button" value="수정하기" onclick="location.href='dojangPostUpdate.go'"/>
<table>
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
</table>
</div>


</body>
<script>


listCall();

	

function listCall(page){
	
	$.ajax({
		type:'get',
		url:'dojangHomeDetail.ajax',
		data:{
		},
		dataType:'JSON',
		success:function(data){
				$('#leader').html(data.dojangHomeLeader);
				drawMember(data.dojangHomeMember);
				
				$('#dojangPost_subject').html(data.dojangHomeDetail.dojangPost_subject);
				$('#dojangPost_type').html(data.dojangHomeDetail.dojangPost_type);
				$('#member_id').html(data.dojangHomeDetail.member_id);
				
				var date = new Date(data.dojangHomeDetail.dojangPost_date);
				
				$('#dojangPost_date').html(date.toLocaleDateString("ko-KR"));
				$('#dojangPost_content').html(data.dojangHomeDetail.dojangPost_content);
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






</script>
</html>