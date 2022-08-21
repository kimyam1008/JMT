<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

	table {
	    width:70%; 
	    margin-left:auto; 
	    margin-right:auto;
	    position: static;
	}
	
    textarea {
		width:100%;
		height : 90px;
		resize : none;
	}
	
	.center {
		margin: 0;
		position: absolute;
		top: 90%;
		left: 50%;
		-ms-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
	}
	
</style>
<title>맛집 수정 요청 페이지</title>
</head>


<body>
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
	<form action="restaurantWrite" method="post">
		<table>		
			<tr>
				<td>
					<input type="hidden" name="restaurant_no" value='${resDetail.restaurant_no}'/>
				</td>
			</tr>
			<tr>
				<td><input type="hidden" name="member_id" value="${sessionScope.loginId}"/></td>
			</tr>
			<tr>
				<th>식당이름, 주소, 전화번호, 영업 여부등 수정해야 할 정보를 기입해주세요</th>
			</tr>
			<tr>
				<td>
					<textarea name="restaurantUpdate_reason"></textarea>			
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<div class="center">
			   		<button type="button" onclick="cancellation()">취소</button>
					<button type="button" onclick="save()">요청</button>
			  	</div>
				</td>
			</tr>
		</table>
		<br/>
	</form>
</body>
<script>

	function save(){
		$('form').submit();
		//window.close();
	}
	
	function cancellation(){
		self.close();
	}
	
	function back() {
		  history.go(-1); 
		 }
	
	
</script>
</html>