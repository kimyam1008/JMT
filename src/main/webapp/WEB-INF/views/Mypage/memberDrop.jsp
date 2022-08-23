<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	body {
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
		<p style="text-align:center">회원 탈퇴를 위해 비밀번호를 입력해주세요.</p>
		<tr>
			<th>아이디</th>
			<td>${loginId }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input id="pw" type="password" name="pw" value=""/></td>
		</tr>
		<tr>
			<th colspan="2">
				<div style="display:block;">
           		<span style="text-align:center; display:block; margin: 0 auto;">
					<input type="button" value="회원탈퇴" onclick="memberDrop()"/>
				</span>
				</div>
			</th>
		</tr>
		
	</table>
</body>
<script>

	function memberDrop() {
		var pw = $("#pw").val();
	
		$.ajax({
			type:'post',
			url:'memberDrop.ajax',
			data:{
				pw:pw
			},
			dataType:'JSON',
			success:function(data){
				if(data.memberDrop){
					//팝업에서 닫기를 누르면 어떻게 다시 로그인 페이지로 보내지?
					alert("이용해 주셔서 감사합니다.");
					opener.parent.location.href="/";
					window.close();
				}else{
					alert("탈퇴에 실패하였습니다. 비밀번호를 확인해주세요.");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	
	}
	

</script>
</html>