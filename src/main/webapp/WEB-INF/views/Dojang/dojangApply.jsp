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
body {
		font-family: 'GmarketSansMedium';
	}
@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
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
	select,option,textarea {
		font-family: 'GmarketSansMedium';
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