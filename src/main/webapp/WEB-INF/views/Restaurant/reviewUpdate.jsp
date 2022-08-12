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
	<form action="reviewUpdate.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>리뷰 수정</th>
				<td>
					<textarea name="comment_content">${comment.comment_content}</textarea>
				</td>
				<td>
        		<input type="hidden" name="idx" value="${comment.comment_no}" />
        		<input type="hidden" name="restaurant_no" value="${comment.idx}" />
			    </td>
				<td><input type="file" name="photos" multiple="multiple"/></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="리뷰 수정"/>
					<input class="backBtn" type="button" value="돌아가기" onclick="back()"/>
				</th>
			</tr>
		</table>
	</form>
	<c:forEach items="${reviewPhoto}" var="photo">
		${photo.photo_newFileName}
		<button class="delBtn" onclick="reviewDel(this)" photoID="${photo.photo_no}">X</button>		
		<br/>
	</c:forEach>
</body>
<script>
	function reviewDel(photo_no) { 
	    var photoID = $(photo_no).attr("photoID");
	    console.log(photoID);
	    
	       $.ajax({
	             type:'get',
	             url:'reviewDel.ajax',
	             data:{
	            	 photo_no : photoID
	             },
	             dataType:'JSON',
	             success:function(data) {
	                alert(data.msg);
	             },
	             error:function(e) {
	                console.log(e);
	             }
	          });
	    
	    
	}


	function back() {
		  history.go(-1); 
		 }
</script>
</html>