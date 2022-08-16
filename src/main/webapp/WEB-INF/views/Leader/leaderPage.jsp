<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방장 페이지</title>
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
	<input type="hidden" name="class_no" value="${lightDto.class_no}"/>
	<input type="hidden" name="idx" value="${lightDto.idx}"/>
	<h3>방장 페이지</h3>
		<table style="padding:10px;">
			<caption>${dojangDto.dojang_title}</caption>
			<tr>
				<th>방장</th>
				<td></td>
				<th>모집상태</th>
				<td></td>
			</tr>
			<tr>
				<th>정원</th>
				<td> / </td>
				<th>성별</th>
				<td></td>
			</tr>
			<tr>
				<th>음식 카테고리</th>
				<td></td>
				<th>식사속도</th>
				<td></td>
			</tr>
			<tr>
				<th>개설일</th>
				<td></td>
				<th>직업</th>
				<td></td>
			</tr>
			<tr>
				<th colspan="4">
					<input type="button" value="수정" onclick="leaderGroupEdit()"/>
					<input type="button" value="삭제" onclick="groupDelete()"/>
				</th>
			</tr>
		</table><br/>
	
	<h4><a href="#">나의 모임 관리</a></h4>
	
	<div style="float:left; border: 1px solid pink; magin-right:30px;">
		<h3>최근 게시글</h3>
		<ul>
			<c:if test = "${recentPost.size() == 0}">
				등록된 글이 없습니다.
			</c:if>
			<c:forEach items="recentPost" var="recentPost">			
				<li>${recentPost.review_title}</li>
			</c:forEach>
		</ul>
	</div>
	
	<div style="float:left; border: 1px solid pink; margin-left:30px;">
		<h3>가입 대기 회원</h3><a style="text-decoration:none" onclick="joinWait()">회원보기</a>
		<input type="button" value="회원보기" onclick="joinWait()"/>
		<ul>
			<c:forEach items="joinWait" var="joinWait">
				<li>${joinWait.member_id}</li>
			</c:forEach>
		</ul>
	</div>
</body>
<script>
//모임 수정 팝업
var lightning_class_no = "${lightDto.class_no}";

function leaderGroupEdit(){
	if (lightning_class_no != null) {
		window.open("/leaderLightningEdit.go","new","width=300, height=300, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	} else {
		window.open("/leaderDojangEdit.go","new","width=300, height=300, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
		//window.open("/leaderGroupEdit.go?grouop_no="+${dojangDetail.group_no},"new","width=600, height=300, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
}

//모임 삭제
function groupDelete(){
	if(confirm("모임을 삭제하시겠습니까?")){
		location.href="/groupDelete.do?group_no=${dto.group_no}";
	}
}

//가입 대기 회원 팝업
function joinWait(){
	window.open("/joinWait.go","new","width=300, height=300, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	//window.open("/joinWait.go?grouop_no="+${dojangDetail.group_no},"new","width=600, height=300, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}
</script>
</html>