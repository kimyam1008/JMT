<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table {
    width:90%; 
    margin-top:50;
    margin-left:auto; 
    margin-right:auto;
    position: static;
}
</style>
</head>
<body>
	<p>팔로잉</p>
	<table>
		<c:forEach items="${otherFollowingList }" var="list">
			<tr>
				<td><input type="hidden" name="profile_no" value="${list.profile_no}"/></td>
				<td><img src="/photo/${list.photo_newFileName}" width="50" height="50"/></td>
				<td><a href="#" onclick="self.close(); javascript:parent.opener.location.href='./othersPage.go?profile_no=${list.profile_no }'">${list.follower_id}</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
<script>


</script>
</html>