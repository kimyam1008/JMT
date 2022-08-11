<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	td, th{
		padding: 5px 10px;
	}
	textarea {
	width:450px; 
	height:200px; 
	  }
</style>
</head>
<body>
<h3>도장깨기 생성</h3>
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
	<table>
	<tr>
		<th>모임 이름</th>
		<td><input type="text" id="dojang_title"/></td>
		<th>음식 카테고리</th>
		<td><select id="food_name"></select></td>
	</tr>
	<tr>
		<th>인원수</th>
		<td>
			<input type="range" id="points" min="0" max="30" step="1" value="0" oninput="document.getElementById('people_num').innerHTML=this.value;">
	        <span id="people_num"></span>
		</td>
		<th>식사 속도</th>
		<td>
		<select id='eat_speed'>
		    <option value='' selected>식사속도</option>
		    <option value='빠름'>빠름</option>
		    <option value='보통'>보통</option>
		    <option value='느림'>느림</option>
		    <option value='상관없음'>상관없음</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<input type="radio" name="gender" value="남자"/>남자
			<input type="radio" name="gender" value="여자"/>여자
			<input type="radio" name="gender" value="상관없음"/>상관없음
		</td>
		<th>직업</th>
		<td>
			<select id='job'>
		    <option value='' selected>직업</option>
		    <option value='직장인'>직장인</option>
		    <option value='취준생'>취준생</option>
		    <option value='학생'>학생</option>
			<option value='상관없음'>상관없음</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>소개글</th>
		<td colspan="3">
		<textarea id="dojang_content" placeholder="내용을 입력해주세요"></textarea>
		</td>
	</tr>
	<tr>
			<th colspan="4">
				<button type="button" onclick="dojangReg()">저장</button>
				<input type="button" value="취소" onclick="location.href='dojang.go'"/>
			</th>
		</tr>
	</table>
</body>
<script>


function dojangReg() {
	
	var dojang_title = $('#dojang_title').val();
	var food_name = $('#food_name option:selected').val();
	var points = $('#points').val();
	var eat_speed = $('#eat_speed option:selected').val();
	var gender = $('input[name=gender]').val();
	var job = $('#job option:selected').val();
	var dojang_content = $('#dojang_content').val();
	var loginId = $('#loginId').val();
	
	//유효성 체크
	if(food_name == ""){
		alert("음식 카테고리를 선택해주세요");
		
	}else if(dojang_content ==""){
		alert("소개글을 작성해주세요");
		dojang_content.focus();
		
	}else if(dojang_title == ""){
		alert("제목을 입력해주세요.");
		dojang_title.focus();
		
	}else if(eat_speed == ""){
		alert("식사속도를 선택해주세요.");
		
	}else if(gender == ""){
		alert("성별을 선택해주세요.");
		
	}else if(job == ""){
		alert("직업을 입력해주세요.");
		
	}else if(points == 0){
		alert("인원을 선택해주세요.");
	
	}else{
		

		$.ajax({
			type:'get',
			url:'dojangReg.ajax',
			data:{
				dojang_title:dojang_title,
				food_name:food_name,
				points:points,
				eat_speed:eat_speed,
				gender:gender,
				job:job,
				dojang_content:dojang_content,
				loginId:loginId
			},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.dojangReg){
					console.log(data.dojangReg)
					location.href='dojang.go';
				}else{
					alert("등록 실패");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
}



console.log($('#loginId').val());


function darwName(food_name) {
	var content = '';
		content += '<option value="">음식 카테고리</option>';
		food_name.forEach(function(item){
		content += '<option value="'+item.food_no+'">'+item.food_name+'</option>';
	});
	$('#food_name').empty();
	$('#food_name').append(content);
	
}

food_nameCall();

function food_nameCall() {
	
	$.ajax({
		type:'get',
		url:'foodname.ajax',
		data : {},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			darwName(data.foodname);
		},
		error:function(e){
			console.log(e);
		}
		
	});

}

</script>
</html>