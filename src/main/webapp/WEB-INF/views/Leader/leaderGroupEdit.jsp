<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 수정 팝업</title>
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
	<h3>모임 수정</h3>
	<form action="leaderGroupEdit" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td>모임이름</td>
			</tr>
			<tr>
				<th>정원</th>
				<td>
					<input type="range" id="points" min="0" max="30" step="1" value="0" oninput="document.getElementById('people_num').innerHTML=this.value;"/>
				</td>
			</tr>
			<tr>
				<th>모집상태</th>
				<td>
					<select>
						<option>모집중</option>
						<option>모집마감</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>소개글</th>
				<td>
					<textarea name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="수정 완료" onclick="leaderGroupUpd()"/>
					<input type="button" value="취소" onclick="leaderGroupEditClose()"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
//수정 완료
function leaderGroupUpd(){
	
}

//취소
function leaderGroupEditClose(){
	opener.parent.location.reload();
	window.close();
}
</script>
</html>