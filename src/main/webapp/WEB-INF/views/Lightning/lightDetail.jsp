<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table, td,th{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th, td{
		padding: 10px 20px 10px 20px;
	}
</style>
</head>

<body>
	<a href="#">방장페이지</a>
	<table>
		<tr>
			<th>모임 이름</th>
			<td>${dto.lightning_title}</td>
			<th>방장ID</th>
			<td>${dto.leader_id}</td>
		</tr>
		<tr>
			<th>인원</th>
			<td>${dto.member_count}/${dto.member_num}</td>
			<th>식사속도</th>
			<td>${dto.eat_speed}</td>
		</tr>
		<tr>
			<th>모임 생성 날짜</th>
			<td>${dto.lightning_create}</td>
			<th>모임 날짜</th>
			<td>${dto.lightning_date}</td>
		</tr>
		<tr>
			<th>장소</th>
			<td>${dto.restaurant_name}</td>
			<th>음식 카테고리</th>
			<td>${dto.food_name}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${dto.gender}</td>
			<th>직업</th>
			<td>${dto.job}</td>
		</tr>
		<tr>
			<td colspan="4">${dto.lightning_content}</td>
		</tr>
	</table>
	<button id="application" onclick="application()">신청</button>
	<button onclick="location.href='/lightList.go'">목록</button>
</body>
<script>
	var msg = "${msg}";
	if (msg != ""){
		alert(msg);
	}
	
	
	var status = "${dto.status}";
	
	if(status=="승인"){
		$("#application").text("탈퇴");
		$("#application").attr("onclick","dropout()");
	}
	
	
	
	function application(){
		console.log(status);
		//방장아이디랑 로그인아이디 비교해서 같으면 신청불가쓰~ 
		//아직 가입신청을 안한 경우
		if (status == ""){
			if(confirm("가입 신청하시겠습니까?")){
				alert("신청완료 되었습니다.");
				location.href='/lightRegister.do?lightning_no=${dto.lightning_no}';
			}
		}else if(status=="대기"){
			alert("이미 신청한 방입니다.");
		}else if(status=="거절"){
			alert("방장이 승인을 거절하여 재신청이 불가합니다.");
		}else if(status=="탈퇴"){
			alert("모임에서 탈퇴하여 재신청이 불가합니다.");
		}else if(status=="강퇴"){
			alert("모임에서 강퇴당하여 재신청이 불가합니다.");
		}
		
	}
	
	
	
	function dropout(){
		if(confirm("모임에서 탈퇴할 경우 재신청 할 수 없습니다. 정말 탈퇴하시겠습니까?")){
			alert("탈퇴 되었습니다.");
			location.href='/lightDropOut.do?lightning_no=${dto.lightning_no}';
		}
	}
</script>
</html>