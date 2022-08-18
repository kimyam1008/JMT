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
	input:type {
		
	}
</style>
<title>Insert title here</title>
</head>
<body>
	
	<form action="Reporthandling.do" method="post">
	<table>
		<tr>
			<td>
				식당이름
			</td>
			<td>
				<input type="hidden" name="restaurant_no" value="${resUpdateNo.restaurant_no}" />
				<input type="hidden" name="restuarantUpdate_no" value="${resUpdateNo.restuarantUpdate_no}" />
				${resUpdateNo.restaurant_name}
			</td>
			<td>
				처리 여부
			</td>
			<td>
				<select name="restaurantUpdate_proc_status">
					<option value="처리대기" ${resUpdateNo.restaurantUpdate_proc_status == '처리대기' ? 'selected="selected" ' : '' } >처리대기</option>
					<option value="처리완료" ${resUpdateNo.restaurantUpdate_proc_status == '처리완료' ? 'selected="selected" ' : '' } >처리완료</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="1">
				사유
			</td>
			<th colspan="3">
				${resUpdateNo.restaurantUpdate_reason}
			</th>
		</tr>
		<tr>
			<td>
				회원 ID
			</td>
			<th>
				${resUpdateNo.member_id}
			</th>
			<td>
				신청 날짜
			</td>
			<th>
				${resUpdateNo.restaurantUpdate_date}
			</th>
		</tr>
		<tr>
			<td colspan="4">
				<span>
					<input type="submit" value="등록">
				</span>
			</td>
		</tr>
	</table>
	<br/>
	</form>
	
	<form action="resAdminUpdate.do" method="post">
	<table>
		
			
			
		
			
		
		
		<tr>
			<td colspan="1">
				식당이름
			</td>
			<td colspan="3">
				<input type="hidden" name="restaurant_no" value="${resUpdateNo.restaurant_no}" />
				<input type="hidden" name="restuarantUpdate_no" value="${resUpdateNo.restuarantUpdate_no}" />
				<textarea name="restaurant_name">${requestNO.restaurant_name}</textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="1">
				주소
			</td>
			<td colspan="3">
				<textarea name="restaurant_address">${requestNO.restaurant_address}</textarea>
			</td>
		</tr>
		
		<tr>
			<td>
				영업정보
			</td>
			<td>
				<textarea name="restaurant_info">${requestNO.restaurant_info}</textarea>
			</td>
			<td>
				전화번호
			</td>
			<td>
				<textarea name="restaurant_call">${requestNO.restaurant_call}</textarea>
			</td>
		</tr>
		
		<tr>
			<td>
				X좌표(위도)
			</td>
			<th>
				${requestNO.restaurant_X}
			</th>
			<td>
				Y좌표(경도)
			</td>
			<th>
				${requestNO.restaurant_Y}
			</th>
		</tr>
		
		<tr>
			<td colspan="2">
				음식 카테고리
			</td>
			<td colspan="2">
				
			</td>
			
		</tr>
		<tr>
			<td colspan="4">
				<span>			
					<input type="submit" value="등록">  
					<button type="button" onclick="back()">목록</button>
				</span>
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