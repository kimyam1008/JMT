<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table,th,td {
		border:1px solid black;
		border-collapse:collapse;
		padding:5px 10px;
	}

	table, input[type='text'] {
			width:100%;
		}
		
	textarea {
		width: 100%;
		height: 150px;
		resize: none;
	}
	
	#editable{
		width: 99%;
		height: 500px;
		border: 1px solid gray;
		margin: 5px;
		overflow: auto;
		padding: 5px;
		text-align: left;
	}
	
	img{
		cursor: pointer;
	}
	
	img:hover {
		opacity: 0.5;
	}
</style>
</head>
<body>
	<h3>모임 후기 작성</h3>
	<form action="groupReviewRegister" method="POST">
		<table>
			<tr>
				<th>모임 검색</th>
				<td>
					<input type="text" name="subject" readonly/>모임 이름
					<button onclick="groupSearchPop()">검색</button>
				</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<!-- html 태그를 인식하기 위해 div 사용(type="text"나 textarea는 html을 그냥 글자취급) -->
					<div id="editable" contenteditable="true"></div>
					<!-- 하지만 div 는 서버에 값을 전송할 수가 없다. -->
					<!-- 결국엔 div의 내용을 input에 담아 서버에 전송할 예정 -->
					<input type="hidden" name="content" id="content"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="파일 업로드" onclick="fileUp()"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="save()">글쓰기</button>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
function groupSearchPop(){
	window.open("/groupSearchPop.go","new","width=1000, height=400, left=400 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");

}


</script>
</html>