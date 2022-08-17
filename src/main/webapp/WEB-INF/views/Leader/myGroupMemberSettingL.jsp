<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 모임 관리 - 회원</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="resources/js/jquery.twbsPagination.js"></script>
<style>
	table,th,td {
		border:1px solid black;
		border-collapse:collapse;
	}
	th,td {
		padding:5px 10px;
	}
	.profileImg{
		width:150px;
		border-radius:50%;
	}
	.top-section{
		border:1px solid black;
		margin-bottom:20px;
	}

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
	
	#centered {
	  margin-left: 260px;
	}
	
</style>
</head>
<body>
	<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
 	${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
	<h3>모임 관리</h3>
	<input type="hidden" id="lightning_no" value="${sessionScope.lightning_no}"/>
	<div id="test">
		<ul>
			<li><a href="lightningLeaderPage.go?lightning_no=${sessionScope.lightning_no}">방장 페이지</a></li>
			<li><a href="myGroupPostSettingL.go?lightning_no=${sessionScope.lightning_no}">나의 모임 관리</a></li>
		</ul>
	</div>
	<div id="centered">	
		<div class="top-section">
			<a href="#"><img src ="/photo/${dto.photo_newFileName}" class="profileImg"></a>
			<p>${dto.lightning_title}</p>
			<p>작성글 : ${dto.post_count}</p><p>작성 댓글 : ${dto.comment_count}</p>
		</div>
	
		<a href="/myGroupPostSettingL.go?lightning_no=${dto.lightning_no}">댓글</a> <a href="javascript:location.reload()">회원</a>
		<input type="button" value="추방하기" onclick="getOut()"/>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>회원 ID</th>
					<th>이름</th>
				</tr>
			</thead>
			<tbody id="list">
				<c:forEach items="${lightMember}" var="lightMember">
				<tr>			
					<td><input type="radio" name="member_id" id="member_id" value="${lightMember.member_id}"/></td>
					<td>${lightMember.member_id}</td>
					<td>${lightMember.member_name}</td>
				</tr>
				</c:forEach>
			</tbody>
				<!-- <tr>
					<td colspan="7" id="paging">
						twbspagination 플러그인
						<div class="container">
							<nav arial-label="Page navigation" style="text-align:center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr> -->
		</table>
	</div>
</body>
<script>
/*
var currPage = 1;

listCall(currPage);

//페이징
function listCall(page){
	var pagePerNum = 10;
	var dojang_no = $('#dojang_no').val();
	
	$.ajax({
		type:'get',
		url:'myGroupMemberSettingD.ajax',
		data:{
			cnt : pagePerNum,
			page : page,
			dojang_no : dojang_no
		},
		dataType:'JSON',
		success:function(data){
			drawList(data.myGroupMemberSettingD);
			currPage=data.currPage;
			console.log(currPage);
			
			//플러그인 사용 페이징
			$("#pagination").twbsPagination({
				startPage:data.currPage,//시작페이지
				totalPages:data.pages,//총 페이지(전체게시물 / 한 페이지에 보여줄 게시물 수)
				visiblePages:5,//한번에 보여줄 페이지 수
				onPageClick:function(e,page){
					console.log(page);
					currPage=page;
					listCall(page);
				}
			});
		},
		error:function(e){
			console.log(e);
		}
	});
}


//리스트 그리기
function drawList(myGroupMemberSettingD){
	
	var content ="";
	
	myGroupMemberSettingD.forEach(function(item){
		
		content += '<tr>';
		content += '<td><input type="radio" name="'+item.member_id+' id="'+item.member_id+'"" value="'+item.member_id+'"/></td>';
		content += '<td>'+item.member_id+'</td>';
		content += '<td>'+item.member_name+'</td>';
		content += '</tr>';
	});
	
	$('#list').empty();
	$('#list').append(content);
}
*/

//추방하기
function getOut(){
	var member_id = $('input[type="radio"]:checked').val();
	//var radioChk = opener.document.getElementsByName('member_id');
	
	
	if($('input[type="radio"]:checked').is(":checked") == false){
		alert("추방할 회원을 선택해 주세요.");
	} else {
		window.open("/memberGetOutL.go?member_id="+member_id,"new","width=500, height=500, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
		//openWin.document.getElementById("member_id").value = document.getElementById("member_id").value;
	}
}
</script>
</html>