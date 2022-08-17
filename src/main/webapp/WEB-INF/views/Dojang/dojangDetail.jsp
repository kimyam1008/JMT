<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	td, th{
		padding: 5px 10px;
	}
</style>
</head>
<body>
<div>
	 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
</div>
<br/>
<h3>도장 상세</h3>
<input type="hidden" id="status" value="${applyStatus.status}"/>
<input type="hidden" id="profile_eat_speed" value="${profileStatus.eat_speed}"/>
<input type="hidden" id="profile_gender" value="${profileStatus.profile_gender}"/>
<input type="hidden" id="profile_job" value="${profileStatus.profile_job}"/>
<input type="hidden" id="eat_speed" value="${dojangDetail.eat_speed}"/>
<input type="hidden" id="gender" value="${dojangDetail.gender}"/>
<input type="hidden" id="job" value="${dojangDetail.job}"/>
<input type="button" name='report' style="position: absolute; left: 370px; top: 250px" value="신고하기" onclick="report()"/>	
	<table>
	<tr>
		<th>모임 이름</th>
		<td>${dojangDetail.dojang_title}</td>
		<th>방장 ID</th>
		<td>${dojangDetail.leader_id}</td>
	</tr>
	<tr>
		<th>모집 인원</th>
		<td>${dojangDetail.member_count}/${dojangDetail.people_num}</td>
		<th>식사 속도</th>
		<td>${dojangDetail.eat_speed}</td>
		
	</tr>
	<tr>
		<th>모임 생성 날짜</th>
		<td>${dojangDetail.dojang_create}</td>
		<th>음식 카테고리</th>
		<td>${dojangDetail.food_name}</td>
	</tr>
		<tr>
		<th>성별</th>
		<td>${dojangDetail.gender}</td>
		<th>직업</th>
		<td>${dojangDetail.job}</td>
	</tr>
	<tr>
		<td colspan="4">
		<h5>소개글</h5>	
		${dojangDetail.dojang_content}</td>
	</tr>
	<tr>
		<td colspan="4">
			<h5>모임후기</h5>
			<ul>
			<c:if test = "${dojangGreview.size() ==0}">
				등록된 글이 없습니다.
			</c:if>
				<c:forEach items="${dojangGreview}" var="djg">
					<p>${djg.member_id}<span style="padding-right: 5px"></span>
					: <span style="padding-right: 5px"></span>
					<a href="groupReviewDetail.do?groupReview_no=${djg.groupReview_no}">${djg.review_title}</a>
				</c:forEach>
			</ul>
		</td>
	</tr>
	<tr>
			<th colspan="4">
				<input type="button" name='Apply' value="신청"/>
				<input type="button" value="목록" onclick="location.href='dojang.go'"/>
			</th>
		</tr>
	</table>
</body>
<script>


console.log($("#eat_speed").val());
console.log($("#profile_eat_speed").val());


//상태에 따른 가입신청 관리
$("input:button[name='Apply']").on('click',function(){
	
	//가입신청 상태
	if($("#status").val() == '대기'){
		alert("이미 신청이 완료됐습니다.");
	}else if($("#status").val() == '강퇴'){
		alert("강퇴 당한 방입니다.");
	}else if($("#status").val() == '탈퇴'){
		alert("이미 탈퇴한 방입니다.");
	}else{
		
		//프로필 상태 기반
		if($("#gender").val() !="상관없음" && $("#gender").val() != $("#profile_gender").val()){
			alert("성별 조건이 맞지않습니다.");
		}else{
			dojangApply_pop();
		}
		
	}
	
	
	
});


console.log($("#status").val());

//가입신청 팝업
function dojangApply_pop(){
	window.open("/dojangApply.go?dojang_no="+${dojangDetail.dojang_no},"new","width=400, height=200, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

//신고하기 팝업
function report(){
	window.open("/dojangReport.go?dojang_no="+${dojangDetail.dojang_no},"new","width=600, height=400, left=450 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

</script>
</html>