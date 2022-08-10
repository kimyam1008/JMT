<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<tr>
			<td><input type="radio" name ="report_reason" value="욕설 및 비방"/>욕설 및 비방</td>
		</tr>
		<tr>
			<td><input type="radio" name ="report_reason" value="광고 및 홍보"/>광고 및 홍보</td>
		
		</tr>
		<tr>
			<td><input type="radio" name ="report_reason" value="부적절한 컨텐츠"/>부적절한 컨텐츠</td>
		</tr>
		<tr>
			<td>
				<input type="radio" name ="report_reason" value="기타"/>기타(직접 작성)
				<textarea id="report_reason" disabled></textarea>
			</td>
		</tr>
		<tr>
			<th>
				<input type="button" value="취소" onclick="lightReportclose()"/>
				<input type="button" value="신고" onclick="lightReport()"/>
		</th>
		</tr>
	</table>
</body>
<script>
	function lightReport() {
		
		$.ajax({
			type:'get',
			url:'lightReport.ajax',
			data:{},
			dataType:'JSON',
			success:function(data){
				console.log(data.dojangApply);
				if(data.dojangApply){
					opener.parent.location.reload();
					window.close();
				}else{
					alert("신고 실패");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	
	}

	function lightReportclose() {
		opener.parent.location.reload();
		window.close();
	}

</script>
</html>
