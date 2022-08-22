<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>ID찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
 body > div {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    display: flex;
    justify-content: space-around;
    align-items: center;
    flex-wrap: wrap;
}

@font-face {
	font-family: 'GmarketSansMedium';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}

body,input {
		font-family: 'GmarketSansMedium';
	}
	
button{
	font-family: 'GmarketSansMedium';
	color:#fff;
	background:orange;
	border:none;
	padding:5px 10px;
}
button:focus{
	outline:0;
}
button:hover{
	background:#ff3d1c;
	cursor:pointer;
}

form{
	background-color:#ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<div>
	<form action="./idFind.do" method="POST">
		<h3 id="title" style="font-size:30px; color:orange; text-align:center;">ID 찾기</h3>
		<table class="idFindTable">
			<tr>
				<th class="col1">이메일</th>
				<td class="FindCol2">
					<input type="email" name="email"/>
				</td>
			</tr>
			<tr>
				<th class="col1">생년월일</th>
				<td class="FindCol2">
					<input type="text" name="birth" placeholder="ex) 2022-08-20"/>
				</td>
			</tr>
		</table>
		<div class="FindBtn-area" style="display:block; margin-top:15px">
		<span style="text-align:center; display:block; margin: 0 auto;">
			<button class="FindBtn" type="submit">ID찾기</button>
			<button class="FindBtn" type="button" onclick="location.href='../login.go'">돌아가기</button>
		</span>
		</div>
	</form>
	</div>
</body>
<script>
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>
</html>