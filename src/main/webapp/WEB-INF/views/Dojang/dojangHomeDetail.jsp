<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#test {
  list-style-type: none;
  padding: 10px;
  margin: 0px;
  width: 190px;
  background: #edacb1;
  height: 100%;
  overflow: auto;
  position: fixed;
  top: 70px;
}

li a {
  text-decoration: none;
  padding: 10px;
  display: block;
  color: #000;
  font-weight: bold;
}

li a:hover {
  background: #333;
  color: #fff;
}

#list {
  margin-left: 260px;
}

table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		width: 600px;
		hi
	}
	td, th{
		padding: 5px 10px;
	}
	
#test2{
		width: 170px;
       height: 170px;
       border: 1px solid black;
       overflow:scroll;
      padding:10px; 
      background-color: #cd5c5c;
}

#review{
	display: flex;
	justify-content: center;
}

td a {
	display:block; 
	line-height:350px; 
	text-decoration:none;
	cursor:pointer;
	color: black; 
}

#review2{
	display: flex;
	justify-content: center;
}

</style>
</head>
<body>
 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
 <input type="hidden" id="dojangPost_no" value="${sessionScope.dojangPost_no}"/>
  <input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>
<div id="test">
<h3>도장 격파원</h3>
<div id="test2">
<h5>방장</h5>
<ul id="leader">
</ul>
<h5>멤버</h5>
<ul id="member">
</ul>
</div>
<br/>
<h3>게시판</h3>
<ul id="post_type">
  <li class="post"><a href="dojangHome.go?dojang_no=${sessionScope.dojang_no}">전체게시판</a></li>
  <li class="post"><a href="dojangHomeL.go?dojang_no=${sessionScope.dojang_no}">공지게시판</a></li>
  <li class="post"><a href="dojangHomeM.go?dojang_no=${sessionScope.dojang_no}">일반게시판</a></li>
   <c:if test="${list.leader_id == loginId}">
  <li><a href="dojangLeaderPage.go?dojang_no=${sessionScope.dojang_no}">방장페이지</a></li>
	</c:if>
</ul>

<div  id="review">
<input type="button" value="모임후기 작성하러 가기" onclick="location.href='groupReviewList'"/>
</div>
<br/>
<c:if test="${member == loginId}">
<div id="review2">
<input type="button" value="도장깨기 회원 탈퇴" onclick="memberStatus()"/>
</div>
</c:if>
</div>


<div id="list">
<h1>게시글 상세</h1>
	<c:choose>
		<c:when test="${list.member_id ==loginId}">
			<input type="button" value="수정하기" onclick="dojangPostUpdate()"/>
			<input type="button" value="삭제하기" onclick="dojangPostDel()"/>
		</c:when>
		<c:otherwise>
			<input type="button" value="신고하기" onclick="dojangPostReport()"/>
		</c:otherwise>
	</c:choose>
<table>
	<tr id="dojangPost_no_tr">
		<th>글번호</th>
		<td id="dojangPost_no"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="2" id="dojangPost_subject"></td>
		<td id="dojangPost_type"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td id="member_id"></td>
		<th>작성일</th>
		<td id="dojangPost_date"></td>
	</tr>
	<tr>
		<td height=350 colspan="4" id="dojangPost_content"></td>
	</tr>
	<tr>
		<th colspan="2">
		<c:choose>
			<c:when test="${list.leader_id == loginId and list.dojangPost_type == '공지게시판'}">
				이번 모임장소는?
			</c:when>
			<c:otherwise>
				추천 맛집은?
			</c:otherwise>
		</c:choose>
		</th>
		<c:choose>
			<c:when test="${list.restaurant_name == null or list.restaurant_name == '검색버튼을 눌러주세요'}">
				<td colspan="2">등록된 맛집이 없습니다.</td>
			</c:when>
			<c:otherwise>
				<td colspan="2" id="restaurant_name"></td>
			</c:otherwise>
		</c:choose>
	</tr>
</table>
</div>


</body>
<script>
$('#dojangPost_no_tr').attr('style', "display:none;");


	
	$.ajax({
		type:'get',
		url:'dojangHomeDetail.ajax',
		data:{
		},
		dataType:'JSON',
		success:function(data){
				$('#leader').html(data.dojangHomeLeader);
				drawMember(data.dojangHomeMember);
				$('#dojangPost_no').html(data.dojangHomeDetail.dojangPost_no);
				$('#dojangPost_subject').html(data.dojangHomeDetail.dojangPost_subject);
				$('#dojangPost_type').html(data.dojangHomeDetail.dojangPost_type);
				$('#member_id').html(data.dojangHomeDetail.member_id);
				$('#restaurant_name').html(data.dojangHomeDetail.restaurant_name);
				var date = new Date(data.dojangHomeDetail.dojangPost_date);
				
				$('#dojangPost_date').html(date.toLocaleDateString("ko-KR"));
				$('#dojangPost_content').html(data.dojangHomeDetail.dojangPost_content);
		},
		error:function(e){
			console.log(e);
		}
			
	});	
	



function drawMember(member){
	var content = '';

	member.forEach(function(item){
		content += '<li>'+item.member_id+'</li>';
	});
	$('#member').empty();
	$('#member').append(content);
}

function dojangPostUpdate(){
	var dojangPost_no = $('#dojangPost_no').html();
	location.href='dojangPostUpdate.go?dojangPost_no='+dojangPost_no;
}


//신고하기 팝업
function dojangPostReport(){
	var dojangPost_no = $('#dojangPost_no').html();
	window.open("/dojangPostReport.go?dojangPost_no="+dojangPost_no,"new","width=600, height=400, left=450 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

//삭제(숨김처리)
function dojangPostDel(){
	
	var dojangPost_no = $('#dojangPost_no').html();
	var dojang_no = $('#dojang_no').val();
	
		if (!confirm("정말로 삭제하시겠습니까?")) {
			alert("삭제가 취소되었습니다.");
			window.location.reload();
		} else {
			$.ajax({
				type:'get',
				url:'dojangHomeDetail.ajax',
				data:{
					dojangPost_no:dojangPost_no
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.success){
						console.log(data.success)
						alert("삭제가 완료됐습니다.")
						location.href='/dojangHome.go?dojang_no='+dojang_no;
					}else{
						alert("삭제 실패");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		
		}
	
}


//회원탈퇴
function memberStatus(){
	
	var loginId = $('#loginId').val();
	var dojang_no = $('#dojang_no').val();
	
		if (!confirm("정말로 탈퇴 하시겠습니까?")) {
			alert("탈퇴가 취소됐습니다.");
			window.location.reload();
		} else {
			$.ajax({
				type:'get',
				url:'dojangHome.ajaxtwo',
				data:{
					dojang_no:dojang_no,
					loginId:loginId
				},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					if(data.Mstatus){
						console.log(data.Mstatus)
						alert("탈퇴가 완료됐습니다.")
						location.href='/dojang.go';
					}else{
						alert("탈퇴 실패");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		
		}
	
}



</script>
</html>