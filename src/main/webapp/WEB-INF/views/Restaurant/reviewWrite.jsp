<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style></style>
<title>Insert title here</title>
</head>
<body>
	<form action=reviewWrite.do method="post" enctype="multipart/form-data">
        <table>
        	<tr>
        	<td>
        		<input type="hidden" name="idx" value="${resDetail.restaurant_no}" />
        	</td>
        	</tr>
            <tr>
                <th>리뷰 쓰기</th>
                <td>
                	<textarea name="Comment_content"></textarea>
                </td>
            </tr>
            <tr>
                <th>이미지</th>
                <td><input type="file" name="photos" multiple="multiple"/></td>
            </tr>
        </table> 
	        <input type="submit" value="리뷰 작성"/>
			<input class="backBtn" type="button" value="돌아가기" onclick="back()"/>
	</form>
</body>

<script>


	function fileUpload(){
		$("form").submit();
	}
	
	var path = "${path}";
	
	if(path != ""){
		var content = '<a href="#" id="${path}" onclick="del(this)">';
		content += '<img src="'+path+'" height="150"/>';
		content += '</a>';
		opener.document.getElementById("editable").innerHTML += content;		
		self.close();
	}

	function back() {
	  history.go(-1); 
	 }
</script>

</html>