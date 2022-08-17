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
	<input type="hidden" name="class_no" value="${dojangDto.class_no}"/>
	<input type="hidden" name="dojang_no" value="${dojangDto.dojang_no}"/>
	<h3>도장깨기 방장 페이지</h3>
		<table style="padding:10px;">
			<caption>${dojangDto.dojang_title}</caption>
			<tr>
				<th>방장</th>
				<td>${dojangDto.leaderName}</td>
				<th>모집상태</th>
				<td>${dojangDto.dojang_status}</td>
			</tr>
			<tr>
				<th>정원</th>
				<td>${dojangDto.member_count} / ${dojangDto.people_num}</td>
				<th>성별</th>
				<td>${dojangDto.gender}</td>
			</tr>
			<tr>
				<th>음식 카테고리</th>
				<td>${dojangDto.food_name}</td>
				<th>식사속도</th>
				<td>${dojangDto.eat_speed}</td>
			</tr>
			<tr>
				<th>개설일</th>
				<td>${dojangDto.dojang_create}</td>
				<th>직업</th>
				<td>${dojangDto.job}</td>
			</tr>
			<tr>
				<th colspan="4">
					<input type="button" value="수정" onclick="dojangEdit()"/>
					<input type="button" value="삭제" onclick="groupDelete()"/>
				</th>
			</tr>
		</table><br/>
	
	<h4><a href="/myGroupPostSettingD.go?dojang_no=${dojangDto.dojang_no}">나의 모임 관리</a></h4>
	
	<div style="float:left; border: 1px solid pink; magin-right:30px;">
		<h3>최근 게시글</h3>
		<ul>
			<c:if test = "${dojangRecentPost.size() == 0}">
				등록된 글이 없습니다.
			</c:if>
			<c:forEach items="${dojangRecentPost}" var="dojangRecentPost">			
				<li>${dojangRecentPost.dojangPost_subject}</li>
			</c:forEach>
		</ul>
	</div>
	
	<div style="float:left; border: 1px solid pink; margin-left:30px;">
		<h3>가입 대기 회원</h3><a style="text-decoration:none" onclick="joinWait()">회원보기</a>
		<input type="button" value="회원보기" onclick="joinWait()"/>
		<ul>
			<c:forEach items="${dojangJoinWait}" var="dojangJoinWait">
				<li>${dojangJoinWait.member_id}</li>
			</c:forEach>
		</ul>
	</div>
</body>
<script>
//모임 수정 팝업
//var lightning_class_no = "${lightDto.class_no}";
///var dojang_no = ${dojangDto.dojang_no};

function dojangEdit(){
	window.open("/leaderDojangEdit.go?dojang_no="+${dojangDto.dojang_no},"new","width=500, height=500, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

//모임 삭제
function groupDelete(){
	if(confirm("모임을 삭제하시겠습니까?")){
		location.href="/groupDelete.do?group_no=${dto.group_no}";
	}
}

//가입 대기 회원 팝업
function joinWait(){
	window.open("/dojangJoinWait.go?dojang_no="+${dojangDto.dojang_no},"new","width=500, height=500, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	//window.open("/joinWait.go?grouop_no="+${dojangDetail.group_no},"new","width=600, height=300, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}
</script>
</html>