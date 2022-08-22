<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.top {height:200px;}
	table, th, td {border: 1px solid black;}
</style>
</head>
<body>
	<h3>개인정보수정</h3>
	<form action="profileUpdate.do" method="post" enctype="multipart/form-data">
		<input class="update" type="submit" value="수정">
			<table class="top">
				<tr><td><img src="/photo/${photo.photo_newFileName}" width="150" height="100"/></td></tr>
				<tr><th>사진수정 : <input type="file" name="photos" multiple="multiple"/></th></tr>
				<tr><td>이름 : <input type=text name="name" value="${list.member_name }"/></td></tr>
				<tr><td>아이디 : ${list.member_id }</td></tr>
				<tr><td>비밀번호 : <input type="button" name="passUpdate" value="비밀번호변경" onclick="passUpdate()"/></td></tr>
				<tr><td>생년월일 : ${list.member_birth }</td></tr>
			</table>
			<table class="bottom">
				<p>프로필</p>
					<tr><th>성별 : ${list.profile_gender }</th></tr>
					<tr><th>직업 : <input id="student" type="radio" name="job" value="학생"/>학생  <input id="freshman" type="radio" name="job" value="취준생"/>취준생  <input id="worker" type="radio" name="job" value="직장인"/>직장인</th></tr>
					<tr><th>식사속도 : <input id="slow" type="radio" name="speed" value="느림"/>느림  <input id="nomal" type="radio" name="speed" value="보통"/>보통  <input id="fast" type="radio" name="speed" value="빠름"/>빠름</th></tr>
					<tr><th>선호음식 : 
						<select id="food" name="food_no">
						<option value="">선택</option>
		                	<c:forEach items="${foodList}" var="foodList">
		                		<option value="${foodList.food_no}" ${foodList.food_name == list.food_name ? 'selected="selected"' : ''}>${foodList.food_name}</option>
		                	</c:forEach>
		           		</select>
	            	</th></tr>
					<tr><td><a href="./memberDrop.go" onclick="window.open(this.href, '_blank', 'width=400, height=200, left=500, top=300'); return false;">회원탈퇴</a></td></tr>
			</table>
		</form>
</body>
<script>
	var job = '${list.profile_job}';
	var speed = '${list.eat_speed}';
	console.log(job);
	console.log(speed);
	
	if ( job == '학생'){
		$("#student").prop("checked", true);
	} else if(job == '취준생') {
		$("#freshman").prop("checked", true);
	} else if(job == '직장인') {
		$("#worker").prop("checked", true);
	}
	
	if(speed == '느림') {
		$("#slow").prop("checked", true);
	} else if(speed == '보통') {
		$("#nomal").prop("checked", true);
	}else if(speed == '빠름') {
		$("#fast").prop("checked", true);
	}
	
	//비밀번호 변경 팝업
	function passUpdate(){
		window.open("/passUpdate.go","new","width=400, height=100, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
	
	
</script>
</html>