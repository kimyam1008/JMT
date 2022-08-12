<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table {
    width:90%; 
    margin-top:50;
    margin-left:auto; 
    margin-right:auto;
    position: static;
}
</style>
</head>
<body>
	<table>
		<tr height="10">
			<th>현재 비밀번호</th>
			<td><input id="oriPass" type="password" name="oriPass" value=""/></td>
		</tr>
		<tr height="10">
			<th>변경 비밀번호</th>
			<td><input id="changePass" type="password" name="changePass" value=""/></td>
		</tr>
		<tr height="10">
			<th>변경 비밀번호 확인</th>
			<td><input id="changePassCon" type="password" name="changePassCon" value=""/></td>
		</tr>
		<tr>
		<th>
				<input type="button" value="변경" onclick="passUpdate()"/>
				<input type="button" value="취소" onclick="passClose()"/>
		</th>
		</tr>
		
	</table>
</body>
<script>

	function passUpdate() {
		var oriPass = $("#oriPass").val();
		var changePass = $("#changePass").val();
		var changePassCon = $("#changePassCon").val();
	
		$.ajax({
			type:'post',
			url:'passUpdate.ajax',
			data:{
				oriPass:oriPass,
				changePass:changePass,
				changePassCon:changePassCon
			},
			dataType:'JSON',
			success:function(data){
				if(data.passUpdate){
					alert("변경이 완료되었습니다.");
					opener.parent.location.reload();
					window.close();
				}else{
					alert("변경에 실패하였습니다. 비밀번호를 확인해주세요.");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	
	}
	
	function passClose() {
		opener.parent.location.reload();
		window.close();
	}


</script>
</html>