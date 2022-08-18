<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개모임 방장 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table,th,td {
		border:1px solid black;
		border-collapse:collapse;
	}
	th,td {
		padding:5px 10px;
	}
	#test {
	  list-style-type: none;
	  padding: 10px;
	  margin: 0px;
	  width: 190px;
	  background: #edacb1;
	  height: 100%;
	  overflow: auto;
	  position: fixed;
	  top: 70px;
	}
	li a {
	  text-decoration: none;
	  padding: 10px;
	  display: block;
	  color: #000;
	  font-weight: bold;
	}
	
	li a:hover {
	  background: #333;
	  color: #fff;
	}
	
	#list {
	  margin-left: 260px;
	}
</style>
</head>
<body>
	<input type="hidden" name="class_no" value="${lightDto.class_no}"/>
	<input type="hidden" name="lightning_no" value="${lightDto.lightning_no}"/>
	<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
 	${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
	<h3>방장 페이지</h3>
	<div id="test">
		<ul>
			<li><a href="lightningLeaderPage.go?lightning_no=${lightDto.lightning_no}">방장 페이지</a></li>
			<li><a href="myGroupPostSettingL.go?lightning_no=${lightDto.lightning_no}">나의 모임 관리</a></li>
		</ul>
	</div>
	<div id="list">
		<table style="padding:10px;">
			<caption>${lightDto.dojang_title}</caption>
			<tr>
				<th>방장</th>
				<td>${lightDto.leaderName}</td>
				<th>모집상태</th>
				<td>${lightDto.lightning_status}</td>
			</tr>
			<tr>
				<th>정원</th>
				<td>${lightDto.member_count} / ${lightDto.member_num}</td>
				<th>성별</th>
				<td>${lightDto.gender}</td>
			</tr>
			<tr>
				<th>음식 카테고리</th>
				<td>${lightDto.food_name}</td>
				<th>식사속도</th>
				<td>${lightDto.eat_speed}</td>
			</tr>
			<tr>
				<th>개설일</th>
				<td>${lightDto.lightning_create}</td>
				<th>직업</th>
				<td>${lightDto.job}</td>
			</tr>
			<tr>
				<th colspan="4">
					<input type="button" value="수정" onclick="lightEdit()"/>
					<input type="button" value="삭제" onclick="groupDelete()"/>
				</th>
			</tr>
		</table><br/>
	
		<h4><a href="/myGroupPostSettingL.go?lightning_no=${lightDto.lightning_no}">나의 모임 관리</a></h4>
		
		<div style="float:left; border: 1px solid pink; magin-right:30px;">
			<h3>최근 게시글</h3>
			<ul>
				<c:if test = "${lightRecentPost.size() == 0}">
					등록된 글이 없습니다.
				</c:if>
				<c:forEach items="${lightRecentPost}" var="lightRecentPost" begin="0" end="4">			
					<li>${lightRecentPost.comment_content}</li>
				</c:forEach>
			</ul>
		</div>
		
		<div style="float:left; border: 1px solid pink; margin-left:30px;">
			<h3>가입 대기 회원</h3><a style="text-decoration:none" onclick="lightJoinWait()">회원보기</a>
			<input type="button" value="회원보기" onclick="lightJoinWait()"/>
			<ul>
				<c:forEach items="${lightJoinWait}" var="lightJoinWait">
					<li>${lightJoinWait.member_id}</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
<script>
//모임 수정 팝업
//var lightning_class_no = "${lightDto.class_no}";

function lightEdit(){
	window.open("/lightEdit.go?lightning_no="+${lightDto.lightning_no},"new","width=500, height=500, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

//모임 삭제
function groupDelete(){
	var member_count = ${lightDto.member_count};
	var result = confirm("정말로 모임을 삭제하시겠습니까? 한 번 삭제하면 되돌릴 수 없습니다.");
	
	if(result == true){
		if(member_count > 1) {
			alert("모임의 모든 회원을 추방한 뒤 모임을 삭제하세요.");
		} else {
			location.href="/leaderLightDelete.do?lightning_no="+${lightDto.lightning_no};
		}
		
	}
}

//가입 대기 회원 팝업
function lightJoinWait(){
	window.open("/lightJoinWait.go?lightning_no="+${lightDto.lightning_no},"new","width=500, height=500, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	//window.open("/joinWait.go?grouop_no="+${dojangDetail.group_no},"new","width=600, height=300, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}
</script>
</html>