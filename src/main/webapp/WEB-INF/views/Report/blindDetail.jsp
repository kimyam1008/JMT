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
	.Detail{float:left;
	height:400px;}
	.history{
		float:left;
		height:400px;
		border: 1px solid black ;
		overflow:auto;
	}
	.history_li td {
		height:50px;
	}
</style>
<body>
<br>
<h1>블라인드 상세보기</h1>

<form action="blindUpdate.do" method="post" id="blindUpdate">	
	<input type="hidden" name="idx" value="${idx}" />
	<input type="hidden" name="class_no" value="${class_no}"/>
	<input type="hidden" name="reported" value="${detailDto.reported}"/>
	<input type="hidden" name="report_no" value="${report_no}"/>
	<table class="Detail">
	<!-- 게시글인 경우    -->
	<c:if test="${empty reportPost.comment_content}">
			<tr>
				<th>신고된 글</th>
				<td>
					 <c:if test="${not empty reportPost.lightning_title}">${reportPost.lightning_title}</c:if>
					 <c:if test="${not empty reportPost.dojang_title}">${reportPost.dojang_title}</c:if>
					 <c:if test="${not empty reportPost.dojangPost_subject}">${reportPost.dojangPost_subject}</c:if>
					 <c:if test="${not empty reportPost.review_title}">${reportPost.review_title}</c:if> 				 
				</td>
				<th>신고사유</th><td>${detailDto.report_reason}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					 <c:if test="${not empty reportPost.lightning_content}">${reportPost.lightning_content}</c:if>
					 <c:if test="${not empty reportPost.dojang_content}">${reportPost.dojang_content}</c:if>
					 <c:if test="${not empty reportPost.dojangPost_content}">${reportPost.dojangPost_content}</c:if>
					 <c:if test="${not empty reportPost.review_content}">${reportPost.review_content}</c:if> 
				 </td>
			</tr>
	</c:if>
	
	
	
	
	<!-- 댓글인 경우   -->
	<c:if test="${not empty reportPost.comment_content}">
			<tr>
				<th>신고된 댓글</th>
				<td>
					${reportPost.comment_content}
				</td>
				<th>신고사유</th><td>${detailDto.report_reason}</td>
			</tr>
	</c:if>		
	
	
	
			
			<tr>
				<th>게시판</th><td colspan="3">${detailDto.class_name}</td>
				<%-- <th>처리상태</th>
				<td>
					<select name="report_status">
						<option selected  hidden value="${detailDto.report_proc_status}">${detailDto.report_proc_status}</option>
						<option value="처리대기">처리대기</option>
						<option value="처리완료">처리완료</option>
						<option value="블라인드">블라인드</option>
					</select>
				</td> --%>
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
				<c:if test="${detailDto.report_proc_status eq '블라인드' }">
					<input name="blichk" value="블라인드" type="checkbox" id="checkForBlind" checked/>
					<label for="checkForBlind">블라인드</label >
				</c:if>
				<c:if test="${detailDto.report_proc_status ne '블라인드' }">
					<input name="blichk" value="블라인드" type="checkbox" id="checkForBlind"/>
					<label for="checkForBlind">블라인드</label >
				</c:if>
				</td>
			</tr>
			<tr>
			<td colspan="4">
				<button type="button" onclick="updateBlind()">등록</button> 
				<button type="button" onclick="returnList()">목록</button>
			</td>
			</tr>	
		</table>
</form>	
	
	<!-- 블라인드 히스토리 -->
		<div class="history">
			<table>
				<thead>
					<tr>
						<th>관리자 ID</th>
						<th>신고 번호</th>
						<th>처리날짜</th>
						<th>처리상태</th>
						<th>처리사유</th>
					</tr>
			<c:forEach items="${blindHistory}" var="history">
				</thead>
				<tbody class="history_li">
					<td>${history.admin_id}</td>
					<td>${history.report_no}</td>
					<td><fmt:formatDate pattern="yyyy년MM월dd일 HH시mm분" value="${history.blind_proc_date}" /></td>
					<td>${history.blind_status}</td>
					<td>${history.blind_reason}</td>
				</tbody>
			</c:forEach>
			</table>
		</div>
</body>
<script>
var msg="${msg}"; 
if(msg!= null && msg!=""){
	alert('처리상태 변경이 완료되었습니다.');
	location.reload();
}

function returnList(){ 
	location.href="/report/blind.go";
}
var blichk = $('input[name=blichk]').is(':checked');
console.log(blichk);



function updateBlind(){
	var blichk = $('input[name=blichk]:checked').val();
	var s= "${detailDto.report_proc_status}";
	var z =  $('input[name=blichk]').is(':checked');
	
	if(z && s=='블라인드'){
		alert('이미 블라인드된 상태입니다.');
		return false; 
	} else if (!z & s=='해제'){
		alert('이미 블라인드 해제상태입니다.');
		return false; 
	}
	
	$('#blindUpdate').submit();
	
}

</script>
</html>