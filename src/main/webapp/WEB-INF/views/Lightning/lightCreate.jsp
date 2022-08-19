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
	
	textarea[name="lightning_content"]{
		width:100%;
		height : 90px;
		resize : none;
	}
</style>

</head>
<body>

	<form action="lightCreate.do" method="post" onsubmit="return chkCreate()">
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
		                <option value="상관없음">상관없음</option>
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

	//모임날짜 오늘 날짜부터 나오게 
	var today = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString();
	var today_Date = today.slice(0, 10);
	$('input[name="lightning_date"]').attr("min", today_Date);
	var max_Date = new Date(new Date().getTime()+new Date("60")); // 7일 더하여 setting
	console.log(max_Date);
	$('input[name="lightning_date"]').attr("max", max_Date);
	
	//생성 버튼 눌렀을 시 유효성 검사
	function chkCreate(){
		if($('input[name="lightning_title"]').val()==""){
			alert("모임 이름을 입력해 주세요");
			return false;
		}else if($('#restaurant_no').val() == ""){
			alert("맛집을 검색해 주세요");
			return false;
		}else if($('input[name="lightning_date"]').val() == ""){
			alert("모임 날짜를 지정해 주세요");
			return false;
		}else if($('select[name="eat_speed"]').val() == ""){
			alert("식사 속도를 선택해 주세요");
			return false;
		}else if($('select[name="gender"]').val() == ""){
			alert("성별을 선택해 주세요");
			return false;
		}else if($('select[name="job"]').val() == ""){
			alert("직업을 선택해 주세요");
			return false;
		}else if($('textarea[name="lightning_content"]').val() == ""){
			alert("모임 소개글을 입력해 주세요");
			return false;
		}	
	}
	
	//소개글 글자 수 제한
	$('textarea').keyup(function(){
		var content = $(this).val();
			if (content.length > 300){
				alert("최대 300자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 300));
			}
	});
	
	$('input[name="lightning_title"]').keyup(function(){
		var content = $(this).val();
			if (content.length > 30){
				$(this).val(content.substring(0, 30));
			}
	});
	
	function restaurantSearch_pop(){
		window.open("/lightResSearch.go","new","width=600, height=400, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
	
	
	
</script>
</html>