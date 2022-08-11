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
                <th>내용</th>
                <td>
                	<textarea class="claimWriteInput" id="claimWriteTextarea" name="Comment_content"></textarea>
                </td>
            </tr>
            <tr>
                <th>이미지</th>
                <td><input type="file" name="photos" multiple="multiple"/></td>
                <td><input type="file" name="photos" multiple="multiple"/></td>
                <td><input type="file" name="photos" multiple="multiple"/></td>
            </tr>
        </table>
        <div>
	        <input type="submit" value="작성"/>
			<input type="button" value="취소" onclick="location.href='/claimList'"/>					
		</div>
	</form>
</body>

<script>

</script>

</html>