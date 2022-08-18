<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.top {height:200px;}
	.left {float:left; width:400px; height:350px;}
	.right {float:right; width:320px; height:350px;}
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
			${list.member_id }님 반갑습니다.
			등급 : ${list.grade_name }
			팔로워 : <a href="./followerList.go" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${follower }</a>
			팔로잉 : <a href="./followingList.go" onclick="window.open(this.href, '_blank', 'width=400, height=450, left=500, top=200'); return false;">${following }</a>
		</span>
		<span class="profile">
			성별 : ${list.profile_gender }
			직업 : ${list.profile_job }
			선호 음식 : ${list.food_name }
			식사 속도 : ${list.eat_speed }
			블라인드 수 : ${blind }
			<a href='./profileUpdate.go'>개인정보수정</a>
		</span>
	</div>
	<p><a href='./myBoardList.go'>나의 활동</a></p>
	<div class="left">
		<h5>내가 쓴 게시글</h5>
		<c:forEach items="${myboard }" var="list">
			<ul>
				<li>${list.review_title }</li>
			</ul>
		</c:forEach>
		<a href="./boardMore.go">더 보기</a>
		<h5>내가 쓴 댓글의 게시글</h5>
		<c:forEach items="${mycomment}" var="board">
			<ul>
				<li>${board.lightning_title}</li>
			</ul>
		</c:forEach>
		<a href="./commentMore.go">더 보기</a>
	</div>
	<div class="right">
		<h5>내모임</h5>
			<ul>
				<li>번개모임</li>
				<c:forEach items="${myLightning}" var="myLightning">
					<a href="./myMoim.go">${myLightning.lightning_title }</a>
				</c:forEach>
				<li>도장깨기</li>
				<c:forEach items="${myDojang}" var="myDojang">
					<a href="./myMoim.go">${myDojang.dojang_title }</a>
				</c:forEach>
				<li>내가 생성한 방 - 번개</li>
				<c:forEach items="${myLightningRoom}" var="myLightningRoom">
					<a href="#">${myLightningRoom.lightning_title }</a>
				</c:forEach>
				<li>내가 생성한 방 - 도장</li>
				<c:forEach items="${myDojangRoom}" var="myDojangRoom">
					<a href="#">${myDojangRoom.dojang_title }</a>
				</c:forEach>
			</ul>
	</div>
</body>
<script>
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
	
</script>
</html>