<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table,th,td	{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}
	textarea{
		resize:none;width:95%;height:150px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	
	<form action="Reporthandling.do" method="post">
	<table>
		<tr>
			<td>
				<input type="hidden" name="restaurant_no" value="${resUpdateNo.restaurant_no}" />
				<input type="hidden" name="restuarantUpdate_no" value="${resUpdateNo.restuarantUpdate_no}" />
			</td>	
			<th>${resUpdateNo.restaurant_name}</th>
			<td>
	
				<select name="restaurantUpdate_proc_status">
					<option value="처리대기" ${resUpdateNo.restaurantUpdate_proc_status == '처리대기' ? 'selected="selected" ' : '' } >처리대기</option>
					<option value="처리완료" ${resUpdateNo.restaurantUpdate_proc_status == '처리완료' ? 'selected="selected" ' : '' } >처리완료</option>
				</select>
			
			</td>
			<th>${resUpdateNo.restaurantUpdate_reason}</th>
			<th>${resUpdateNo.member_id}</th>
			<th>${resUpdateNo.restaurantUpdate_date}</th>
			<td><input type="submit" value="등록"></td>
		</tr>
	</table>
	<br/>
	</form>
	
	<form action="resAdminUpdate.do" method="post">
	<table>
		<tr>
			<td>
				<input type="hidden" name="restaurant_no" value="${resUpdateNo.restaurant_no}" />
				<input type="hidden" name="restuarantUpdate_no" value="${resUpdateNo.restuarantUpdate_no}" />
			</td>	
			<td>
				<textarea name="restaurant_name">${requestNO.restaurant_name}</textarea>
			</td>
			<td>
				<textarea name="restaurant_address">${requestNO.restaurant_address}</textarea>
			</td>
			<td>
				<textarea name="restaurant_info">${requestNO.restaurant_info}</textarea>
			</td>
			<td>
				<textarea name="restaurant_call">${requestNO.restaurant_call}</textarea>
			</td>
			<th>${requestNO.restaurant_X}</th>
			<th>${requestNO.restaurant_Y}</th>
			<th>${requestNO.restaurant_no}</th>
			<td colspan="4">
				<input type="submit" value="등록">  
				<button type="button" onclick="back()">목록</button>
			</td>
		</tr>
	</table>
	</form>



</body>
<script>
	
	function back(){ 
		location.href="/resUpdateList.go"; 
	
	}

</script>
</html>