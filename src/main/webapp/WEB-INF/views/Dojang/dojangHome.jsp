<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
</style>
</head>
<body>
 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
  ${sessionScope.dojang_no} 님 환영합니다, <a href="logout.do">로그아웃</a>
어서옵쇼
</body>
<script>
</script>
</html>