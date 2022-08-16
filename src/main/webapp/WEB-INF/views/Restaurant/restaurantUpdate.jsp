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
				<th>내용</th>
				<td>					
					<input type="text" name="restaurantUpdate_reason"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="cancellation()">취소</button>
					<button type="button" onclick="save()">요청</button>
				</td>
			</tr>
		</table>
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