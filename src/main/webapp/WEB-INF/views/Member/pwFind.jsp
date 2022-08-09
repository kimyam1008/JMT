<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form action="./pwFind.do" method="POST">
		<h3 id="title">비밀번호 찾기</h3>
		<table>
			<tr>
				<th class="col1">아이디</th>
				<td class="FindCol2">
					<input type="text" name="id"/>
				</td>
			</tr>
			<tr>
				<th class="col1">이메일</th>
				<td class="FindCol2">
					<input type="email" name="email"/>
				</td>
			</tr>
		</table>
		<div class="FindBtn-area">
			<button class="FindBtn" type="submit">PW찾기</button>
			<button class="FindBtn" type="button" onclick="location.href='../login.go'">돌아가기</button>
		</div>
	</form>
</body>
<script>
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>
</html>