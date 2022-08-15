<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table,th,td {
		border : 1px solid black;
		border-collapse : collapse;
	}

	th,td { 
		padding : 5px 10px;
	}
	
</style>
</head>
<body>
	<table>
	    <tr>
	        <th>모임 이름</th>
	        <Td colspan="3"><input type="text" name="lightning_title"/></Td>
	    </tr>
	    <tr>
	        <th>맛집 이름</th>
	        <td>
	        	<span></span>
	        	<button onclick="restaurantSearch_pop()">검색</button>
	        </td>
	        <th>모임 날짜</th>
	        <td><input type="date" name ="lightning_date" ></td>
	    </tr>
	    <tr>
	        <th>음식 카테고리</th>
	        <td>//여긴 자동으로</td>
	        <th>인원 수</th>
	        <td> 
	            2~6 :  <input type="range" name="member_num" min="2" max="6" value="2" step="1"/>
	            <span id="msg"></span>명
	        </td>
	    </tr>
	    <tr>
	        <th>식사 속도</th>
	        <td>
	            <select name="eat_speed">
	                <option value="">식사속도</option>
	                <option value="느림">느림</option>
	                <option value="보통">보통</option>
	                <option value="빠름">빠름</option>
	            </select>
	        </td>
	        <th>성별</th>
	        <td>
	            <select name="gender">
	                <option value="">성별</option>
	                <option value="남자">남자</option>
	                <option value="여자">여자</option>
	                <option value="상관없음">상관없음</option>
	            </select>
	        </td>
	    </tr>
	    <tr>
	        <th>직업</th>
	        <td>
	            <select name="job">
	                <option value="">직업</option>
	                <option value="직장인">직장인</option>
	                <option value="취준생">취준생</option>
	                <option value="학생">학생</option>
	                <option value="상관없음">상관없음</option>
	            </select>
	        </td>
	        <th>방상태</th>
	        <td>
	                <select>
	                    <option value="모집중" selected>모집중</option>
	                    <option value="모집마감" disabled>모집마감</option>
	                </select>
	        </td>
	    </tr>
	    <tr>
	        <th>소개글</th>
	        <td colspan="3">
	            <textarea></textarea>
	        </td>
	    </tr>
	    <tr>
	        <th colspan ="4">
	            <button>생성</button>
	            <button onclick="location.href='/lightList.go'">취소</button>
	        </th>
	    </tr>
	</table>
</body>
<script>
	var i = $('input[type="range"]').val();
	$("#msg").html(i);
	
	$('input[type="range"]').on("change input", function(){ //input 이벤트 : 끌고있을 때 
	var i = $(this).val(); 
	$("#msg").html(i); 
	});

	function restaurantSearch_pop(){
		window.open("/lightSearch.go","new","width=600, height=400, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
	
</script>
</html>