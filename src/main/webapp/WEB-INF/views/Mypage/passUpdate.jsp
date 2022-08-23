<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	body,textarea {
		font-family: 'GmarketSansMedium';
	}
	table {
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
		border-top: 1px solid #ccc;
		margin : 20px 10px;
	}
	table th {
		width: 150px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
	}
	table td {
		width: 250px;
		padding: 10px;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
	}
	
	@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	input[type='password']{
		font-family: 'GmarketSansMedium';
		border:none;
	}
	input[type='button']{
		font-family: 'GmarketSansMedium';
		color:#fff;
		background:orange;
		border:none;
		padding:5px 10px;
	}
	input[type='button']:focus{
		outline:0;
	}
	input[type='button']:hover{
		background:#ff3d1c;
		cursor:pointer;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>현재 비밀번호</th>
			<td><input id="oriPass" type="password" name="oriPass" value=""/></td>
		</tr>
		<tr>
			<th>변경 비밀번호</th>
			<td><input id="changePass" type="password" name="changePass" value=""/></td>
		</tr>
		<tr>
			<th>변경 비밀번호 확인</th>
			<td><input id="changePassCon" type="password" name="changePassCon" value=""/></td>
		</tr>
		<tr>
		<th colspan=2>
			<div style="display:block;">
            <span style="text-align:center; display:block; margin: 0 auto;">
				<input type="button" value="변경" onclick="passUpdate()"/>
				<input type="button" value="취소" onclick="passClose()"/>
			</span>
			</div>
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