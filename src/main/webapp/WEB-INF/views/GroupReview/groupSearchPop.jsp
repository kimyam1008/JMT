<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h3>모임 검색</h3>
	<select id="">
		<option value="lightning">번개모임</option>
		<option value="dojang">도장깨기</option>
	</select>
	<table>
		<thead>
			<tr>
				<th>선택</th>
				<th>제목</th>
				<th>방장 ID</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%-- <c:forEach items="" var="">
					<td><input type="radio" value=""></td>
					<td></td>
					<td></td>
				</c:forEach> --%>
			</tr>
		</tbody>
	</table><br/>
	<button onclick="groupSearchEnd()">확인</button>
</body>
<script>
</script>
</html>