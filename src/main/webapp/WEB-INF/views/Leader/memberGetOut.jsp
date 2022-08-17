<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추방</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
</style>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
		</tr>
		<tr>
			<td id="memberID"></td>
		</tr>
		<tr>
			<th>사유</th>
		</tr>
		<tr>
			<td><textarea name="reason"></textarea></td>
		</tr>
		<tr>
			<th colspan="2"><input type="button" value="추방" onclick="getOutSave()"/></th>
		</tr>
	</table>
</body>
<script>
	
	function getOutSave(){
		
	}
</script>
</html>