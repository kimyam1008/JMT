<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table,th,td {
		border : 1px solid black;
		border-collapse : collapse;
	}

	th,td { 
		padding : 5px 10px;
	}
</style>
</head>
<body>

		<input type="text" id="lightning_title" placeholder="모임 이름을 입력해주세요" required/>
		<button  type="submit" >검색</button><br/>
	
	
	<select id="food_no">
		<option value="">음식카테고리</option>
			<c:forEach items="${foodList}" var="foodList">
				<option value="${foodList.food_no}">${foodList.food_name}</option>
			</c:forEach>
	</select>
	<select id="eat_speed">
		<option value="">식사속도</option>
		<option value="느림">느림</option>
		<option value="보통">보통</option>
		<option value="빠름">빠름</option>
	</select>
	<select id="job">
		<option value="">직업</option>
		<option value="학생">학생</option>
		<option value="직장인">직장인</option>
		<option value="상관없음">상관없음</option>
	</select>
	
	<input type="radio" name ="gender" id="gender" value="남자"/>남자
	<input type="radio" name ="gender" id="gender" value="여자"/>여자
	<input type="radio" name ="gender" id="gender" value="상관없음"/>상관없음

	
	<table>
		<thead>
			<tr>
				<th>맛집 이름</th>
				<th>음식 카테고리</th>
				<th>방장 ID</th>
				<th>모임 이름</th>
				<th>모임 날짜</th>
				<th>인원</th>
				<th>상태</th>
				<th>참여여부</th>
			</tr>
		</thead>
		<tbody id="list">
				<c:forEach items="${list}" var="list">
			        <tr>
			            <td>${list.restaurant_name}</td>
			            <td>${list.food_name}</td>
			            <td>${list.leader_id}</td>
			            <td><a href="detail.go?lightning_no=${list.lightning_no}">${list.lightning_title}</a></td>
			            <td>${list.lightning_date}</td>
			            <td>${list.member_count} / ${list.member_num}</td>
			            <td>${list.lightning_status}</td>
			            <td>참여여부</td>
					</tr>
		 	</c:forEach>
		</tbody>
	</table>

</body>
<script>

$("button").on("click",function(){
	listCall();
});

$("select").on("change", function(){ 
	listCall();
});

$("input[name='gender']:radio").on("change",function(){
	listCall();
});


function listCall(){
	
	var lightning_title = $("#lightning_title").val();
	var food_no = $("#food_no").val();
	var eat_speed = $("#eat_speed").val();
	var job = $("#job").val();
	var gender = $("#gender:checked").val(); // ->아무것도 체크안됐을때 undefined /다른건 공백
	
	/*
	console.log(food_no);
	console.log(eat_speed);
	console.log(job);
	console.log(gender);
	*/
	
	
	$.ajax({
		type: 'get',
		url : 'lightList.ajax',
		data : {
			'lightning_title' : lightning_title,
			'food_no' : food_no,
			'eat_speed' : eat_speed,
			'job' : job,
			'gender' : gender
		},
		dataType : 'json',
		success : function(data){
			console.log(data);
			drawList(data.list);
		},
		error : function(e){
			console.log(e);
		}
		
	});
}



function drawList(list){
	//console.log(list);
	var content ='';
	
	list.forEach(function(item,idx){
		//console.log(item);
		var date = new Date(item.lightning_date);
		
		content += '<tr>';
		content += '<td>'+item.restaurant_name+'</td>';
		content += '<td>'+item.food_name+'</td>';
		content += '<td>'+item.leader_id+'</td>';
		content += '<td><a href="detail.go?idx='+item.lightning_no+'">'+item.lightning_title+'</a></td>';
		content += '<td>'+date.toLocaleDateString("ko-KR")+'</td>';
		content += '<td>'+item.member_count +' / '+ item.member_num+'</td>';
		content += '<td>'+item.lightning_status+'</td>';
		content += '<td>참여여부</td>';
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
	
}
</script>
</html>