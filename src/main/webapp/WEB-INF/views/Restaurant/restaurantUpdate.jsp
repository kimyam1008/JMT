<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		width: 350px;
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
	input[type='text']{
		font-family: 'GmarketSansMedium';
		border:none;
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
	textarea {
		font-family: 'GmarketSansMedium';
		width: 100%;
	    height: 6.25em;
	    border: none;
	    resize: none;
	}


	/* table {
	    width:70%; 
	    margin-left:auto; 
	    margin-right:auto;
	    position: static;
	}
	
    textarea {
		width:100%;
		height : 90px;
		resize : none;
	}
	
	.center {
		margin: 0;
		position: absolute;
		top: 90%;
		left: 50%;
		-ms-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
	} */
	
</style>
<title>맛집 수정 요청 페이지</title>
</head>


<body>
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
	<form action="restaurantWrite" method="post">
		<table>		
			<tr>
				<th>
					식당이름, 주소, 전화번호, 영업 여부 등 수정해야 할 정보를 기입해주세요
					<input type="hidden" name="member_id" value="${sessionScope.loginId}"/>
					<input type="hidden" name="restaurant_no" value="${resDetail.restaurant_no}"/>
				</th>
			</tr>
			<tr>
				<td>
					<textarea name="restaurantUpdate_reason"></textarea>			
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div style="display:block;">
					 <span style="text-align:center; display:block; margin: 0 auto;">
				   		<button type="button" onclick="cancellation()">취소</button>
						<button type="button" onclick="save()">요청</button>
					</span>
				  	</div>
				</td>
			</tr>
		</table>
		<br/>
	</form>
</body>
<script>

	function save(){
		$('form').submit();
		//window.close();
	}
	
	function cancellation(){
		self.close();
	}
	
	function back() {
		  history.go(-1); 
		 }
	
	
</script>
</html>