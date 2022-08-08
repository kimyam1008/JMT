<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>
	table,th,td	{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}
</style>
<body>
	<form action="reportUpdate" method="post">
		<input type="hidden" name="report_no" value="${detailDto.report_no}"/>
		<table>
			<tr>
				<th>글 제목</th><td>${detailDto.report_title}</td>
				<th>신고사유</th><td>${detailDto.report_reason}</td>
			</tr>
			<tr>
				<th>글 내용</th> <td colspan="3"></td>
			</tr>
			<tr>
				<th>게시판</th><td></td>
				<th>처리상태</th>
				<td>
					<select name="report_status">
						<option selected disabled hidden>${detailDto.report_proc_status}</option>
						<option value="처리대기">처리대기</option>
						<option value="처리완료">처리완료</option>
						<option value="블라인드">블라인드</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>신고자 ID</th><td>${detailDto.reporter}</td>
				<th>피신고자 ID</th><td>${detailDto.reported}</td>
			</tr>
			<tr>
				<th>신고날짜</th><td>${detailDto.report_date}</td>
				<th>처리 날짜</th><td>${detailDto.report_proc_date}</td>
			</tr>
			<tr>
				<th>처리사유</th><td colspan="3"><input type="text" name="reason" value="${detailDto.report_reason}"/></td>
			</tr>
			<tr>
			<td colspan="4">
				<input type="submit" value="등록">  
				<button type="button" onclick="returnList()">목록</button>
			</td>
			</tr>	
		</table>
	</form>
</body>
<script>
function returnList(){ 
	location.href="/report";
}

</script>
</html>