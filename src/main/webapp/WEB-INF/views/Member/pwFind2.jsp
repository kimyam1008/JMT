<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h3 id="title">비밀번호 변경</h3>
	<table>
		<tr>
			<th class="col1">비밀번호 변경</th>
			<td class="FindCol2">
				<input class="pwFind" type="password" id="pw"/>
			</td>
		</tr>
		<tr>
			<th class="col1">비밀번호 확인</th>
			<td class="FindCol2">
				<input class="pwFind" type="password" id="pw2"/>
			</td>
		</tr>
	</table>
	<div class="FindBtn-area">
		<button class="FindBtn" type="button" onclick="pwUpdate()">PW변경</button>
		<button class="FindBtn" type="button" onclick="location.href='../login.go'">돌아가기</button>
	</div>
</body>
<script>
	
	//비밀번호 변경
	function pwUpdate(){
		var pw = $('#pw');
		var pw2 = $('#pw2');
		
		var pwdCheck = /^(?=.*[a-zA-Z]).{4,50}$/;
		
		if(pw.val()==""){
			alert("비밀번호를 입력해 주세요.");
    		pw.focus();
		} else if(!pwdCheck.test($("#joinPw").val())) {
    		alert("비밀번호는 한글을 제외한 4자리 이상이어야 합니다.");
    		pw.focus();
    		return false;
		}else if(pw.val() != pw2.val() ){
    		alert("비밀번호가 일치하지 않습니다.");
			pw.focus();
    	} else {
    		$.ajax({
				type:'post',
				url:'pwUpdate.ajax',
				data:{
					pw:pw.val()
				},
				dataType:'JSON',
				success:function(data) {
					console.log(data);
					if(data.success){
						alert("비밀번호 변경에 성공 했습니다.");
						location.href='../login.go';
					}else{
						alert("비밀번호 변경에 실패 했습니다.");
					}
				},
				error:function(e){
					console.log(e);
					alert("비밀번호 변경에 실패 했습니다.");
				}
    		});
    	}
	}
	

</script>
</html>