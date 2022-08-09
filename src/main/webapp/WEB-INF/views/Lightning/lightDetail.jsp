<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table, td,th{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th, td{
		padding: 10px 20px 10px 20px;
	}
</style>
</head>

<body>
	<table>
		<tr>
			<th>모임 이름</th>
			<td></td>
			<th>방장ID</th>
			<td></td>
		</tr>
		<tr>
			<th>인원</th>
			<td></td>
			<th>식사속도</th>
			<td></td>
		</tr>
		<tr>
			<th>모임 생성 날짜</th>
			<td></td>
			<th>모임 날짜</th>
			<td></td>
		</tr>
		<tr>
			<th>장소</th>
			<td></td>
			<th>음식 카테고리</th>
			<td></td>
		</tr>
		<tr>
			<th>성별</th>
			<td></td>
			<th>직업</th>
			<td></td>
		</tr>
		<tr>
			<td colspan="4"></td>
		</tr>
	</table>
	<button>신청</button>
	<button onclick="location.href='/lightList.go'">목록</button>
</body>
<script>
</script>
</html>