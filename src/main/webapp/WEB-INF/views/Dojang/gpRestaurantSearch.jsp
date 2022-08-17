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
th, td {
  text-align: center;
}


</style>
</head>
<body>
	<br/>
		<form action="gpRestaurantSearch.do" method="get">
		<table>
			<tr><th colspan="3">맛집검색창</th></tr>
			<tr>
				<td>
					<select class="conditionSelect" name="gpSearchCondition">
			            <option value="restaurant_name" selected>가게이름</option>
			            <option value="restaurant_address">가게주소</option>			            									            
			        </select>
				</td>
			<td><input type="text" name="searchContent" placeholder="검색어를 입력해주세요"/></td>
			<td><input type="submit" value="검색"/></td>
			</tr>
		</table>
		</form>
		
	<table>
		<thead>
			<tr>
				<th></th>
				<th>가게이름</th>
				<th>주소</th>
				<th>음식카테고리</th>
			</tr>
		</thead>
		<tbody id=gpRestaurantSearchList>
			<c:forEach items="${gpRestaurantSearchList}" var="gpRestaurantSearchList">
			<tr id="gpSearch_${gpRestaurantSearchList.restaurant_no}">
				<td><input type="radio" name="gpRestaurantSearchList" value="${gpRestaurantSearchList.restaurant_no}"/></td>
				<td id="restaurant_name">${gpRestaurantSearchList.restaurant_name}</td>
				<td id="restaurant_address">${gpRestaurantSearchList.restaurant_address}</td>
				<td id="food_name">${gpRestaurantSearchList.food_name}</td>
				<td id="restaurant_no" class="hidden">${gpRestaurantSearchList.restaurant_no}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<br/><br/><br/><br/><br/><br/>
	<button onclick="gpChoice()">선택</button>
	<button onclick="window.close()">취소</button>
</body>
<script>
noHidden();


function noHidden(){
	$(".hidden").css("display", "none");
}


function gpChoice(){
	

	if($('#gpRestaurantSearchList input[type="radio"]:checked').is(":checked") == false){
		alert("식당을 선택해 주세요");
	}
	//console.log("현재 체크상태::::" + test);
	
	$('#gpRestaurantSearchList input[type="radio"]:checked').each(function(idx){
	var restaurantChoice = $(this).val();
	console.log(restaurantChoice);


	
	$tr = $("#gpSearch_"+restaurantChoice);
	console.log($tr.text());	
	
	opener.document.getElementById("restaurant_name").value =$tr.find('#restaurant_name').text();
	opener.document.getElementById("restaurant_no").value =$tr.find('#restaurant_no').text();
	
	window.close()
});	
	
}


</script>
</html>