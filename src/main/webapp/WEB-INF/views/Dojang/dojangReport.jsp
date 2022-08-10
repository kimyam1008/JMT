<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>도장깨기 신고</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	td, th{
		padding: 5px 10px;
	}
	
table{
	 width: 400px;
	 height: 300px;
	 margin-left: auto;
	 margin-right: auto;
	 text-align: center;

}

#report_text {
  width:300px;
  height:30px;
  font-size:15px;
}

#reportYes {
	position: absolute;
	left: 220px;
	top: 350px;
	width:70px;
	height:35px;
}

#reportNo {
	position: absolute;
	left: 330px;
	top: 350px;
	width:70px;
	height:35px;
}


</style>
</head>
<body>
<br/>
	<table>
		<tr>
			<th colspan="2">사유 선택</th>
		</tr>
		<tr>
			<th>
			<input type="radio" name="report" value="욕설 및 비방"/>
			</th>
			<td>욕설 및 비방</td>
		</tr>
		<tr>
			<th>
			<input type="radio" name="report" value="광고 및 홍보"/>
			</th>
			<td>광고 및 홍보</td>
		</tr>
		<tr>
			<th>
			<input type="radio" name="report" value="부적절한 콘텐츠"/>
			</th>
			<td>부적절한 콘텐츠</td>
		</tr>
			<tr>
			<th>
			<input type="radio" name="report" value=""/>
			</th>
			<td>
			<input type="text" id="report_text" placeholder="기타 (직접 작성)"/>
			</td>
		</tr>
	</table>
		<input type="button" value="신고" id="reportYes" onclick=""/>
		<input type="button" value="취소" id="reportNo" onclick=""/>
</body>
<script>
</script>
</html>