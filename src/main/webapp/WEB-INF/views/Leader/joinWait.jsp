<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 대기 회원 목록</title>
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
	<form action="" method="post">
		<table>
			<thead>
				<tr>
					<th></th>
					<th>회원ID</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="checkbox" name=""/>
					</td>
					<td>회원 아이디</td>
					<td>
						<select>
							<option value="대기중" selected>대기중</option>
							<option value="승인">승인</option>
							<option value="거절">거절</option>
						</select>
					</td>
				</tr>
				<tr>
					<th colspan="3">
						<input type="button" value="처리 완료" onclick="joinWaitSave()"/>
						<input type="button" value="취소" onclick="joinWaitClose()"/>
					</th>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script>
//처리 완료
function joinWaitSave(){
	
}

//취소
function joinWaitClose(){
	opener.parent.location.reload();
	window.close();
}
</script>
</html>