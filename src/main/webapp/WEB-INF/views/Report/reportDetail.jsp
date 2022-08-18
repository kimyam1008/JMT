<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<link href="${path}/resources/etcResource/assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<link href="${path}/resources/etcResource/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />


</head>
<style>

	textarea{
		resize:none;width:95%;height:150px;
	}
	/*  .onlyread{
	 border:none;	
	 outline:none;
	 } */
	 
	 
	 #twobutton{
		 position: absolute;
  	left: 50%;
 	 transform: translateX(-50%);
	 }
</style>
<body>
	<form action="reportUpdate.do" method="post">
		<input type="hidden" name="report_no" value="${detailDto.report_no}"/>
		<input type="hidden" name="idx" value="${detailDto.idx}"/>
		<input type="hidden" name="class_no" value="${detailDto.class_no}"/>
		<input type="hidden" name="reported" value="${detailDto.reported}"/>
	
		<table  class="table"> 
			<tr>
				<th>신고된 글/댓글</th>
				<td >
					<%-- <c:if test="${not empty reportPost.lightning_title}"><input name="reporter" class="onlyread" type="text" value='${reportPost.lightning_title}' readonly/></c:if>
					 <c:if test="${not empty reportPost.dojang_title}"><input name="reporter" class="onlyread" type="text" value='${reportPost.dojang_title}' readonly/></c:if>
					 <c:if test="${not empty reportPost.comment_content}"><input name="reporter" class="onlyread" type="text" value='${reportPost.comment_content}' readonly/></c:if>
					 <c:if test="${not empty reportPost.dojangPost_subject}"><input name="reporter" class="onlyread" type="text" value='${reportPost.dojangPost_subject}' readonly/></c:if>
					 <c:if test="${not empty reportPost.review_title}"><input name="reporter" class="onlyread" type="text" value='${reportPost.review_title}' readonly/></c:if> --%>
					 
					 <c:if test="${not empty reportPost.lightning_title}"><a href="/lightDetail.go?lightning_no=${detailDto.idx}"> ${reportPost.lightning_title}</a></c:if>
					 <c:if test="${not empty reportPost.dojang_title}"><a href="/dojangDetail.do?dojang_no=${detailDto.idx}"> ${reportPost.dojang_title}</a></c:if>
					 <c:if test="${not empty reportPost.comment_content}"> ${reportPost.comment_content}</c:if>
					 <c:if test="${not empty reportPost.dojangPost_subject}"><a href="/dojangHomeDetail.go?dojangPost_no=${detailDto.idx}"> ${reportPost.dojangPost_subject}</a></c:if>
					 <c:if test="${not empty reportPost.review_title}"><a href="/groupReviewDetail.do?groupReview_no=${detailDto.idx}"> ${reportPost.review_title}</a></c:if> 
					 
					 </td>

				<th>신고사유</th><td>${detailDto.report_reason}</td>
			</tr>
	
			<tr>
				<th>게시판</th><td>${detailDto.class_name}</td>
				<th>처리상태</th>
				<td>
					<select name="report_status">
<%-- 						<option selected  hidden value="${detailDto.report_proc_status}">${detailDto.report_proc_status}</option> --%>
						<c:if test="${not empty reportPost.lightning_status}"><option selected  hidden value="${reportPost.lightning_status}">${reportPost.lightning_status}</option> </c:if>
						<c:if test="${not empty reportPost.comment_status}"><option selected  hidden value="${reportPost.comment_status}">${reportPost.comment_status}</option> </c:if>
						<c:if test="${not empty reportPost.dojang_status}"><option selected  hidden value="${reportPost.dojang_status}">${reportPost.dojang_status}</option> </c:if>
						<c:if test="${not empty reportPost.dojangPost_status}"><option selected  hidden value="${reportPost.dojangPost_status}">${reportPost.dojangPost_status}</option> </c:if>
						<c:if test="${not empty reportPost.groupReview_status}"><option selected  hidden value="${reportPost.groupReview_status}">${reportPost.groupReview_status}</option> </c:if>
						
						
						<%-- <option selected  hidden value="${detailDto.report_proc_status}">${detailDto.report_proc_status}</option> --%>
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
			<td colspan="4" id="twobutton">
				<input  class="btn btn-outline-secondary" type="submit" value="등록" >  
				<button class="btn btn-outline-secondary" type="button" onclick="returnList()" >목록</button>
			</td>
			</tr>	
		</table>
	</form> 
</body>
<script>
var msg="${msg}"; 
if(msg!= null && msg!=""){
	alert('처리상태 변경이 완료되었습니다.');
	location.reload();
}

function returnList(){ 
	location.href="/report/"; 
/* 	history.go(-1); */
}
 
var report_status = $('select[name=report_status]').val();
if(report_status=='블라인드'){
	$('select[name=report_status]').attr("disabled","disabled");
}

</script>
</html>