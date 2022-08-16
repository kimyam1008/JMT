<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table, input[type='text']{
		width: 100%;
	}
	
	table, th, td {
		border: 1px solid;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	
	#editable {
		width:99%;
		height:500px;
		border: 1px solid gray;
		margin: 5px;
		overflow: auto;
		padding: 5px;
		text-align: left;
	}
</style>
</head>
<body>
	<form action="profileRegister.do" method="post" enctype="multipart/form-data">
		<h3>프로필 생성</h3>
		<table>
			<tr>
				<th>프로필 사진 : <input type="file" name="photos" multiple="multiple"/></th>
			</tr>
			<tr>
				<th>성별 : <input type="radio" name="gender" value="남자"/>남자  <input type="radio" name="gender" value="여자"/>여자</th>
			</tr>
			<tr>
				<th>직업 : <input type="radio" name="job" value="학생"/>학생  <input type="radio" name="job" value="취준생"/>취준생  <input type="radio" name="job" value="직장인"/>직장인</th>
			</tr>
			<tr>
				<th>식사속도 : <input type="radio" name="speed" value="느림"/>느림  <input type="radio" name="speed" value="보통"/>보통  <input type="radio" name="speed" value="빠름"/>빠름</th>
			</tr>
			<tr>
				<th>선호음식 : 
					<select name="food_no">
					<option value="">선택</option>
	                	<c:forEach items="${foodList}" var="foodList">
	                		<option value="${foodList.food_no}">${foodList.food_name}</option>
	                	</c:forEach>
	           		</select>
            	</th>
			</tr>
		</table>
		<button>등록하기</button> 
	</form>
		<button onclick="cancel()">취소</button>
</body>
<script>
	function cancel(){
		alert("프로필을 등록하지 않으면 이용에 제한 될 수 있습니다.")
		location.href='./';
	}

</script>
</html>