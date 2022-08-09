<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	td, th{
		padding: 5px 10px;
	}
</style>
</head>
<body>
<h3>도장 상세</h3>
	<table>
	<tr>
		<th>모임 이름</th>
		<td>${dojangDetail.dojang_title}</td>
		<th>방장 ID</th>
		<td>${dojangDetail.leader_id}</td>
	</tr>
	<tr>
		<th>모집 인원</th>
		<td>${dojangDetail.member_count}/${dojangDetail.people_num}</td>
		<th>식사 속도</th>
		<td>${dojangDetail.eat_speed}</td>
	</tr>
	<tr>
		<th>모임 생성 날짜</th>
		<td>${dojangDetail.dojang_create}</td>
		<th>음식 카테고리</th>
		<td>${dojangDetail.food_name}</td>
	</tr>
		<tr>
		<th>성별</th>
		<td>${dojangDetail.gender}</td>
		<th>직업</th>
		<td>${dojangDetail.job}</td>
	</tr>
	<tr>
		<td colspan="4">${dojangDetail.dojang_content}</td>
	</tr>
	<tr>
		<td colspan="4">모임후기</td>
	</tr>
	<tr>
		<th>성별</th>
		<td colspan="3">${dojangDetail.gender}</td>
	</tr>
	</table>
</body>
<script>
</script>
</html>