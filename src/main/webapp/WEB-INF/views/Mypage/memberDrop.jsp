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
		<p>회원 탈퇴를 위해 비밀번호를 입력해주세요.</p>
		<tr height="10">
			<th>아이디</th>
			<td>${loginId }</td>
		</tr>
		<tr height="10">
			<th>비밀번호</th>
			<td><input id="pw" type="password" name="pw" value=""/></td>
		</tr>
		<tr>
		<th>
				<input type="button" value="회원탈퇴" onclick="memberDrop()"/>
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
					opener.parent.location.reload();
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