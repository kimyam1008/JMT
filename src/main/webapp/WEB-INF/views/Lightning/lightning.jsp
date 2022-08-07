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
 <form action="lightList.go" method="get">
        <input type="text" name="search" placeholder="모임 이름을 입력해주세요" required/>
        <button  type="submit" >검색</button><br/>
        <select name="food_no">
       		<option value="">음식카테고리</option>
            <c:forEach items="${foodList}" var="foodList">
	            <option value="${foodList.food_no}">${foodList.food_name}</option>
            </c:forEach>
        </select>
        <select name="eat_speed">
            <option value="">식사속도</option>
            <option value="느림">느림</option>
            <option value="보통">보통</option>
            <option value="빠름">빠름</option>
        </select>
        <select name="job">
            <option value="">직업</option>
            <option value="학생">학생</option>
            <option value="직장인">직장인</option>
            <option value="상관없음">상관없음</option>
        </select>
        <input type="radio" name ="gender" value="남자"/>남자
        <input type="radio" name ="gender" value="여자"/>여자
        <input type="radio" name ="gender" value="상관없음"/>상관없음
    </form>
</body>
<script>
</script>
</html>