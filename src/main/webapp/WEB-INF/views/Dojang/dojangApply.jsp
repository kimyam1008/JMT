<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table {
    width:70%; 
    margin-left:auto; 
    margin-right:auto;
    position: static;
}
</style>
</head>
<body>
	<table>
		<tr height="150">
			<th>가입신청 하시겠습니까?</th>
			<td></td>
		</tr>
		<tr>
		<th>
				<input type="button" value="신청" onclick="dojangApply()"/>
				<input type="button" value="취소" onclick="dojangApplyclose()"/>
		</th>
		</tr>
		
	</table>
</body>
<script>

function dojangApply() {
	
		$.ajax({
			type:'get',
			url:'dojangApply.ajax',
			data:{
			},
			dataType:'JSON',
			success:function(data){
				console.log(data.dojangApply);
				if(data.dojangApply){
					opener.parent.location.reload();
					window.close();
				}else{
					alert("등록 실패");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	
	}
	
	
function dojangApplyclose() {
	opener.parent.location.reload();
	window.close();
}


</script>
</html>