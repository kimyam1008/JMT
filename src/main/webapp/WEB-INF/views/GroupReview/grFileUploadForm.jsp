<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 업로드</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	body {
		font-family: 'GmarketSansMedium';
	}
</style>
</head>
<body>
	<form action="grFileUpload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" onchange="fileUpload()"/>
	</form>
	path : ${path}
</body>
<script>
	function fileUpload(){
		$("form").submit();
	}
	
	var path = "${path}";
	
	if(path != ''){
		var content = '<a href="#" class="imageUp" id="${path}" onclick="del(this)">';
		content += '<img id="content-image" src="'+path+'" height="150"/>';
		content += '</a>';
		opener.document.getElementById("editable").innerHTML += content;
		self.close();
	}
</script>
</html>