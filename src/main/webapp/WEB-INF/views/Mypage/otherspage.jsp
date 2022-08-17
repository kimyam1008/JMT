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
	<form action="./follow.do" method="post">
		<div class="top">
			<span class="wel">
				<input type="hidden" name="member_id" value="${list.member_id}">
				<input type="hidden" name="profile_no" value="${list.profile_no}">
				<img src="/photo/${photo.photo_newFileName}" width="150" height="100"/>
				${list.member_id} 님의 마이페이지
				등급 : ${list.grade_name }
				팔로워 : <a href="./otherFollowerList.go?profile_no=${list.profile_no}" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${follower }</a>
				팔로잉 : <a href="./otherFollowingList.go?profile_no=${list.profile_no}" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${following }</a>
			</span>
			<span class="profile">
				성별 : ${list.profile_gender }
				직업 : ${list.profile_job }
				선호 음식 : ${list.food_name }
				식사 속도 : ${list.eat_speed }
				블라인드 수 : ${blind }
				<input id="follow" type="submit" name="follow" value="${follow }"/>
			</span>
		</div>
		</form>
		<p>${list.member_id}의 활동</p>
		<div class="left">
			<td>내가 쓴 게시글</td>
		</div>
		<div class="right">
		
		</div>
	</div>
	<div class="fol">
		<h3>팔로워만 볼 수 있습니다.</h3>
	</div>
</body>
<script>
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}

	var follow = "${follow}";
	if(follow == "팔로우"){
		$(".left").hide();
		$(".right").hide();
		$(".fol").show();
	} else if (follow == "팔로잉") {
		$(".left").show();
		$(".right").show();
		$(".fol").hide();
	}
</script>
</html>