<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
<title>Insert title here</title>
</head>
<body>
	<h3>맛집 상세보기</h3>
	 <c:forEach items="${photoList}" var="path">
      	<img src="/image/${path.photo_newFileName}" height="400"/>
     </c:forEach>
	<table>
		<thead>
	         <tr>
	         	<td>
				<input type="hidden" name="restaurant_no" value="${resDetail.restaurant_no}" />
				
				</td>
	         	<th>식당이름</th>
	         	<td>${resDetail.restaurant_name}</td>
	         	<th>음식종류</th>
	         	<td>${resDetail.food_name}</td>	
				<th>지번주소</th>
				<td>${resDetail.restaurant_address}</td>
				<th>전화번호</th>
				<td>${resDetail.restaurant_call}</td>
				<td colspan="2">
					<button type="button" id="${resDetail.restaurant_no}" onclick="resUp()">맛집 수정요청</button>
				</td>
	         </tr>
	   	</thead>
	   	<tbody>
	   			
		</tbody>
	</table>
		<h3>리뷰</h3>
	<table>
		<thead>
			<tr>
				<td>
					좋아요 순
				</td>
				<td>
					|
				</td>
				<td>
					최신순
				</td>
				<td>
					<a href="./reviewWrite?restaurant_no=${resDetail.restaurant_no}">리뷰 쓰기</a>			
				</td>
			</tr>
		</thead>
	</table>
	<br/>
	 <c:forEach items="${lightninglist}" var="liList">
	 	번개 모임!!
	 	<br/>
      	<td>${liList.lightning_title}</td>
      	<br/>
      	<br/>
     </c:forEach>
     
	 <c:forEach items="${resCommet}" var="comment">
      	<td>${comment.member_id}</td>
      	<td>${comment.comment_content}</td>
      	<td>${comment.comment_date}</td>
      	<td>${comment.comment_status}</td>
      	<br/>
     </c:forEach>
     
     
</body>

<script>

	function resUp(){
		window.open('restaurantUpdate.go?restaurant_no=${resDetail.restaurant_no}','','width=400, height=300');
	}
	
	
	
	
</script>


</html>























