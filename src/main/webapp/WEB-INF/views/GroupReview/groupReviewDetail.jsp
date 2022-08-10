<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 후기 상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table,th,td {
	border:1px solid black;
	border-collapse:collapse;
}
th,td {
	padding:5px 10px;
}
</style>
</head>
<body>
	<h3>모임 후기 상세보기</h3>
	<div>
	 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
	</div>
	<table>
		<tr>
			<th>글 제목</th>
			<td colspan="3" id="">${dto.review_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${dto.member_name}</td>
			<th>작성일</th>
			<td>${dto.review_date}</td>
		</tr>
		<tr>
			<th>모임 이름</th>
			<td>${dto.dojang_title} ${dto.lightning_title}</td>
			<th>모임 종류</th>
			<td>${dto.class_name}</td>
		</tr>
		<tr>
			<td colspan="4">${dto.review_content}</td>
		</tr>
	</table>
	<input type="button" value="수정" onclick="groupReviewUpdateForm()"/>
	<input type="button" value="목록" onclick="location.href='groupReviewList.go'"/>
</body>
<script>

</script>
</html>