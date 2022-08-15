<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
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
		border : 1px solid black;
		border-collapse : collapse;
	}

	th,td { 
		padding : 5px 10px;
	}
	div {
		width:95%;
		height : 280px;
	 	overflow:auto;
	}
</style>
</head>
<body>

	<form action="lightResSearch.go" method="get">
 		<input type="text" name="restaurant_name"/>
 		<input type="submit" value="검색"/>
	</form>
	<div>
 		<table>
	 		<tr>
	 			<th>선택</th>
	 			<th>식당 이름</th>
	 			<th>주소</th>
	 		</tr>
	 		<c:choose>
		 		<c:when test="${resList.size()>0}">
			 		<c:forEach items="${resList}" var="list">
			 			<tr>
			 				<td><input type="radio" name="restaurant_no" value="${list.restaurant_no}"/></td>
			 				<td>${list.restaurant_name}</td>
			 				<td>${list.restaurant_address}</td>
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
	<button onclick="resChoice()">확인</button>
	<button onclick="lightSearchclose()">취소</button>
</body>
<script>
	//맛집 선택시
	function resChoice(){

		if(!$('input[name="restaurant_no"]').is(":checked")){
			alert("맛집을 선택해 주세요");
		}else{
			var restaurant_no = $('input[name="restaurant_no"]').val();
			//console.log(restaurant_no);
			
			$.ajax({
				type:'get',
				url:'lightCreateRes.ajax',
				data:{
					'restaurant_no' : restaurant_no
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
				},
				error:function(e){
					console.log(e);
				}
			});
		}	
	}



	function lightSearchclose() {
		//opener.parent.location.reload(); 입력된 값이 있을 수 있으니 새로고침 하면안됨
		window.close();
	}
</script>
</html>