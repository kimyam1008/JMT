<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>	
	table {
		width : 80%;
	}

	table,th,td {
		border : 1px solid black;
		border-collapse : collapse;
	}

	th,td { 
		padding : 5px 10px;
	}
	#restaurant_name {
		display : inline-block;
	}
</style>
</head>
<body>
	<form action="lightCreate.do" method="post">
		<table>
		    <tr>
		        <th>모임 이름</th>
		        <Td colspan="3"><input type="text" name="lightning_title"/></Td>
		    </tr>
		    <tr>
		        <th>맛집 이름</th>
		        <td>
		        	<input type="hidden" name="restaurant_no" id="restaurant_no" />
		        	<p id="restaurant_name">맛집을 검색해 주세요.</p>
		        	<button type="button" onclick="restaurantSearch_pop()">검색</button>
		        </td>
		        <th>모임 날짜</th>
		        <td><input type="date" name ="lightning_date" ></td>
		    </tr>
		    <tr>
		        <th>음식 카테고리<input type="hidden" name="food_no" id="food_no" /></th>
		        <td><p id="food_name"></p></td>
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
		                    <option value="모집중">모집중</option>
		                    <option value="모집마감" disabled>모집마감</option>
		                </select>
		        </td>
		    </tr>
		    <tr>
		        <th>소개글</th>
		        <td colspan="3">
		            <textarea name="lightning_content"></textarea>
		        </td>
		    </tr>
		    <tr>
		        <th colspan ="4">
		            <button type="submit">생성</button>
		            <button type="button" onclick="location.href='/lightList.go'">취소</button>
		        </th>
		    </tr>
		</table>
	</form>
</body>
<script>
	var i = $('input[type="range"]').val();
	$("#msg").html(i);
	
	$('input[type="range"]').on("change input", function(){ //input 이벤트 : 끌고있을 때 
	var i = $(this).val(); 
	$("#msg").html(i); 
	});

	function restaurantSearch_pop(){
		window.open("/lightResSearch.go","new","width=600, height=400, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
	
</script>
</html>