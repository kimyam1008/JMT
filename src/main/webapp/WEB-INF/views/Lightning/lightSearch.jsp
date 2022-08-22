<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	body,textarea,table,button {
		font-family: 'GmarketSansMedium';
	}
	
	input[type='text']{
		font-family: 'GmarketSansMedium';
	}
	
	input[type='submit']{
		font-family: 'GmarketSansMedium';
	}
	
	@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	body {
		overflow-x :hidden;
		overflow-y :hidden;
	}

	table {
	    width:100%; 
	    margin-left:auto; 
	    margin-right:auto;
	}

	
	table,th,td {
		border : 1px solid #ccc;
		border-collapse : collapse;
		border-left: none;
		border-right: none;
	}
	
	 th {
			background-color: #f9f9f9;
		    text-align: center;
		}

	th,td { 
		padding : 5px 10px;
	}
	
	tr:nth-child(odd){
		background-color: #f9f9f9;
	}
	div {
		width:95%;
		height : 280px;
	 	overflow:auto;
	}
	
	/*검색창 가운데 정렬 */
	form { 
		text-align : center;
	}
	
	/*확인 취소 버튼 가운데 정렬*/
	.btn{
		text-align : center;
	}
	.btn1{
		display : inline-block;
		background-color: #ff3d1c;
   		border-radius: 10px;
   		color : white;
   		border : none;
   		padding : 5px 10px; 
	}
</style>
</head>
<body>

	<form action="lightResSearch.go" method="get">
 		<input type="text" name="restaurant_name" placeholder="식당 이름을 입력해 주세요."/>
 		<input type="submit" value="검색"/>
	</form>
	<div>
 		<table>
 			<colgroup>
		  		<col width="50"></col>
				<col width="180"></col>
				<col width="*"></col>
			</colgroup>
	 		<tr>
	 			<th>선택</th>
	 			<th>식당 이름</th>
	 			<th>주소</th>
	 		</tr>
	 		<c:choose>
		 		<c:when test="${resList.size()>0}">
			 		<c:forEach items="${resList}" var="list">
			 			<tr>
			 				<td>
			 					<input type="radio" name="restaurant_no" id="restaurant_no" value="${list.restaurant_no}"/>
			 				</td>
			 				<td id="restaurant_name">${list.restaurant_name}</td>
			 				<td>
			 					${list.restaurant_address}
			 					<input type="hidden" id="food_no" value="${list.food_no}"/>
			 					<input type="hidden" id="food_name" value="${list.food_name}"/>
			 				</td>
			 			</tr>
			 		</c:forEach>
		 		</c:when>
		 		<c:otherwise>
		 			<tr>
			 			<td colspan="3" style="text-align:center">찾으시는 데이터가 없습니다.</td>
			 		</tr>
		 		</c:otherwise>
	 		</c:choose>
 		</table>
	</div>
	<div class="btn">
		<button onclick="resChoice()" class="btn1">확인</button>
		<button onclick="lightSearchclose()" class="btn1">취소</button>
	</div>
</body>
<script>
	//맛집 선택시
	function resChoice(){
		if(!$('input[name="restaurant_no"]').is(":checked")){
			alert("맛집을 선택해 주세요");
		}else{
			var restaurant_no = $('input[name="restaurant_no"]:checked').val();
			var restaurant_name = $('input[name="restaurant_no"]:checked').parent().next().html();
			var food_no = $('input[name="restaurant_no"]:checked').parent().next().next().find("#food_no").val();
			var food_name = $('input[name="restaurant_no"]:checked').parent().next().next().find("#food_name").val();
			//console.log(restaurant_name);
			//console.log(food_name);
			$(opener.document).find("#restaurant_no").val(restaurant_no); 
			$(opener.document).find("#restaurant_name").text(restaurant_name);
			$(opener.document).find("#food_no").val(food_no); 
			$(opener.document).find("#food_name").text(food_name); 
			window.close();
		}	
	}
	
	


	function lightSearchclose() {
		//opener.parent.location.reload(); 입력된 값이 있을 수 있으니 새로고침 하면안됨
		window.close();
	}
</script>
</html>