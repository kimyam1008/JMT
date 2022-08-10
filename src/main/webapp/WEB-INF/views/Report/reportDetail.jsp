<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	textarea{
		resize:none;width:95%;height:150px;
	}
	/*  .onlyread{
	 border:none;	
	 outline:none;
	 } */
</style>
<body>
	<form action="reportUpdate.do" method="post">
		<input type="hidden" name="report_no" value="${detailDto.report_no}"/>
		<input type="hidden" name="idx" value="${detailDto.idx}"/>
		<input type="hidden" name="class_no" value="${detailDto.class_no}"/>
	
		<table>
			<tr>
				<th>글 제목</th><td>${detailDto.report_title}</td>
				<th>신고사유</th><td>${detailDto.report_reason}</td>
			</tr>
			<tr>
				<th>신고된 글/댓글</th>
				<td colspan="3">
					<%-- <c:if test="${not empty reportPost.lightning_title}"><input name="reporter" class="onlyread" type="text" value='${reportPost.lightning_title}' readonly/></c:if>
					 <c:if test="${not empty reportPost.dojang_title}"><input name="reporter" class="onlyread" type="text" value='${reportPost.dojang_title}' readonly/></c:if>
					 <c:if test="${not empty reportPost.comment_content}"><input name="reporter" class="onlyread" type="text" value='${reportPost.comment_content}' readonly/></c:if>
					 <c:if test="${not empty reportPost.dojangPost_subject}"><input name="reporter" class="onlyread" type="text" value='${reportPost.dojangPost_subject}' readonly/></c:if>
					 <c:if test="${not empty reportPost.review_title}"><input name="reporter" class="onlyread" type="text" value='${reportPost.review_title}' readonly/></c:if> --%>
					 
					 <c:if test="${not empty reportPost.lightning_title}">${reportPost.lightning_title}</c:if>
					 <c:if test="${not empty reportPost.dojang_title}">${reportPost.dojang_title}</c:if>
					 <c:if test="${not empty reportPost.comment_content}">${reportPost.comment_content}</c:if>
					 <c:if test="${not empty reportPost.dojangPost_subject}">${reportPost.dojangPost_subject}</c:if>
					 <c:if test="${not empty reportPost.review_title}">${reportPost.review_title}</c:if> 
					 
					 </td>

			
				
				<%-- <!-- 1. 번개 리스트  -->${reportPost.lightning_title} <!-- 3. 도장 리스트  --> ${reportPost.dojang_title} </td> --%>
			</tr>
			<tr>
				<th>게시판</th><td>${detailDto.class_name}</td>
				<th>처리상태</th>
				<td>
					<select name="report_status">
						<option selected  hidden value="${detailDto.report_proc_status}">${detailDto.report_proc_status}</option>
						<option value="처리대기">처리대기</option>
						<option value="처리완료">처리완료</option>
						<option value="블라인드">블라인드</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>신고자 ID</th><td>${detailDto.reporter} </td>
				<th>피신고자 ID</th><td>${detailDto.reported}</td>
			</tr>
			<tr>
			<%-- 	<th>신고날짜</th><td>${detailDto.report_date}</td> --%>
				<th>신고날짜</th><td><fmt:formatDate pattern="yyyy년MM월dd일 HH시mm분" value="${detailDto.report_date}" /></td>
				<%-- <th>처리 날짜</th><td>${detailDto.report_proc_date}</td> --%>
				<th>처리 날짜</th><td><fmt:formatDate pattern="yyyy년MM월dd일 HH시mm분" value="${detailDto.report_proc_date}" /></td>
			</tr>
			<tr>
				<th>처리사유</th><td colspan="3"><textarea name="reason">${detailDto.result_reason}</textarea></td>
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
var msg="${msg}"; 
if(msg!= null && msg!=""){
	console.log(msg); 
	alert('처리상태 변경이 완료되었습니다.');
	
}

function returnList(){ 
	location.href="/report";
}

</script>
</html>