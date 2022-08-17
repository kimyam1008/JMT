<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.top {height:200px;}
	.left {float:left; width:400px; height:300px;}
	.right {float:right; width:320px; height:300px;}
	div, th, td {border: 1px solid black;}
	.wel {float:left;}
	.profile {float:right;}
</style>
</head>
<body>
	<h3>마이페이지</h3>
	<div class="top">
		<span class="wel">
			<img src="/photo/${photo.photo_newFileName}" width="150" height="100"/>
			${list.member_id} 님의 마이페이지
			등급 : ${list.grade_name }
			팔로워 : <a href="#" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${follower }</a>
			팔로잉 : <a href="#" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${following }</a>
		</span>
		<span class="profile">
			성별 : ${list.profile_gender }
			직업 : ${list.profile_job }
			선호 음식 : ${list.food_name }
			식사 속도 : ${list.eat_speed }
			블라인드 수 : ${blind }
			<input id="follow" type="button" name="follow" value="${follow }" onclick="follow()"/>
		</span>
	</div>
	<p><a href='./myBoardList.go'>나의 활동</a></p>
	<div class="left">
		<td>내가 쓴 게시글</td>
	</div>
	<div class="right">
	
	</div>
</body>
<script>
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}

	function follow() {
		var follow = '${follow}';
		$.ajax({
			type:'get',
			url:'follow.ajax',
			data:{follow:follow},
			dataType:'JSON',
			success:function(data){
			 if(data.idoverlay){
					alert("이미 사용중인 아이디 입니다.");
				}else{
					alert("사용 가능한 아이디 입니다.");
					overChkId = true;
				}
			},
			error:function(e){
				console.log(e);
			}			
		});
	}
	
</script>
</html>