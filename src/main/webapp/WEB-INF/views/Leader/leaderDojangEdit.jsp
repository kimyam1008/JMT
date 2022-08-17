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
	<form action="dojangEdit" method="post">
		<input type="hidden" name="class_no" value="${dojangDto.class_no}"/>
		<input type="hidden" name="dojang_no" value="${dojangDto.dojang_no}"/>
		<table>
			<tr>
				<th>이름</th>
				<td>${dojangDto.dojang_title}</td>
			</tr>
			<tr>
				<th>정원</th>
				<td>
					<input name="people_num" type="range" id="points" min="0" max="30" step="1" value="${dojangDto.people_num}" oninput="document.getElementById('people_num').innerHTML=this.value;"/>
				</td>
			</tr>
			<tr>
				<th>모집 상태</th>
				<td>
					<select name="dojang_status">
						<option value="모집 중">모집 중</option>
						<option value="모집 마감">모집 마감</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>소개글</th>
				<td>
					<textarea name="dojang_content">${dojangDto.dojang_content}</textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="수정 완료" onclick="dojangGroupUpd()"/>
					<input type="button" value="취소" onclick="dojangGroupEditClose()"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
//수정 완료
function dojangGroupUpd(){
	var result confirm("도장깨기 모임의 내용을 수정하시겠습니까?");
	if(result == true){
		alert("수정이 완료되었습니다.");
		$('form').submit();
		opener.parent.location.reload();
		window.close();
	} else {
		alert("취소되었습니다.");
	}
}

//취소
function dojangGroupEditClose(){
	opener.parent.location.reload();
	window.close();
}
</script>
</html>