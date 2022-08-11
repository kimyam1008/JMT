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
			<tr>
				<td><img src="/photo/${photo.photo_newFileName}" width="150" height="100"/></td>
				<td>${list.member_id }님 반갑습니다.</td>
				<td>등급 : ${list.grade_name }</td>
				<td>팔로워 : ${follower }   팔로잉 : ${following } </td>
			</tr>
		</span>
		<span class="profile">
			<tr>
				<td>성별 : ${list.profile_gender }</td>
				<td>직업 : ${list.profile_job }</td>
				<td>선호 음식 : ${list.food_name }</td>
				<td>식사 속도 : ${list.eat_speed }</td>
				<td>블라인드 수 : ${blind }</td>
				<td><a href='./profileUpdate.go'>개인정보수정</a></td>
			</tr>
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
</script>
</html>