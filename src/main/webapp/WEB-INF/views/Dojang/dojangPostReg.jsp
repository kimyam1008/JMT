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

textarea {
	width:350px; 
	height:250px; 
	  }

#dojangPost_subject {
  width:330px;
}

#editable{
		width: 90%;
		height: 400px;
		border: 1px solid gray;
		margin: 5px;
		overflow: auto;
		padding: 5px;
		text-align: left;
}

.btn {cursor:pointer;}
</style>
</head>
<body>
 ${sessionScope.loginId} 님 환영합니다, <a href="logout.do">로그아웃</a>
  <input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
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
  <li><a href="#">방장페이지</a></li>
</ul>

<div  id="review">
<input type="button" value="모임후기 작성하러 가기" onclick="location.href='groupReviewList'"/>
</div>
</div>


<div id="list">
<h1>게시판 작성 </h1>
<table>
	<tr>
		<th>게시판 선택</th>
		<td>
		<c:choose>
			<c:when test="${leader == loginId}">
				<select id="dojangPost_type">
					<option value="공지게시판">공지게시판</option>
					<option value="일반게시판">일반게시판</option>
				</select>
			</c:when>
			<c:otherwise>
				<input type="hidden" id="dojangPost_type" value="일반게시판"/>일반게시판
			</c:otherwise>
		</c:choose>
		</td>
		
	</tr>
	<tr>
		<th>제목</th>
		<td>
		<input type="text" id="dojangPost_subject" />
		</td>
	</tr>
	<tr class="hidden">
		<th>맛집 번호</th>
		<td><input type="text" id="restaurant_no"/></td>
	</tr>	
	<tr>
		<th>맛집 이름</th>
		<td>
		<input type="text" id="restaurant_name" readonly placeholder="검색버튼을 눌러주세요"/>
		<input type="button" value="맛집검색" onclick="restaurant_pop()"/>
		</td>
	</tr>
	<tr>
		<th>게시판 글쓰기</th>
		<td height=350 id="dojangPostContent">
		<!-- html 태그를 인식하기 위해 div 사용(type="text"나 textarea는 html을 그냥 글자취급) -->
			<div id="editable" contenteditable="true"></div>
					<!-- 하지만 div 는 서버에 값을 전송할 수가 없다. -->
					<!-- 결국엔 div의 내용을 input에 담아 서버에 전송할 예정 -->
			<input type="hidden" name="dojangPost_content" id="dojangPost_content"/>
		</td>
	</tr>
	<tr>
		<th>파일 업로드</th>
		<td>
		<input type="button" value="파일 업로드" onclick="dojangfileUp()"/>
		</td>
	</tr>
	<tr>
		<th colspan="2">
		<input type="button" value="저장" onclick="dojangPostReg()"/>
		<input type="button" value="취소" onclick="location.href='dojangHome.go?dojang_no=${sessionScope.dojang_no}'"/>
		</th>
	</tr>
</table>
</div>


</body>
<script>

noHidden();
function noHidden(){
	$(".hidden").css("display", "none");
}

	
memberCall()	
	
	
console.log($('#dojang_no').val());
var dojangPost_content = $('#dojangPost_content').val($('#editable').html());



function dojangPostReg(){
	
	
	var dojangPost_type = $('#dojangPost_type').val();
	var dojangPost_subject = $('#dojangPost_subject').val();
	var restaurant_no = $('#restaurant_no').val();
	var dojangPost_content = $('#editable').html();
	var member_id = $('#loginId').val();
	var dojang_no = $('#dojang_no').val();
	
	var formData = new FormData();
	
	formData.append("dojangPost_type", dojangPost_type);
	formData.append("dojangPost_subject", dojangPost_subject);
	formData.append("dojangPost_content", dojangPost_content);
	formData.append("restaurant_no", restaurant_no);
	formData.append("member_id", member_id);
	formData.append("dojang_no", dojang_no);
	
		
	
	if(dojangPost_subject == ""){
		alert("제목을 입력해주세요");
	}else if($('img').length > 3) {
		alert('이미지 업로드 제한 갯수 3개를 초과했습니다.');
	}else if(restaurant_no == ""){
		var restaurant_no = $('#restaurant_no').val(320);
	}else{
	
	
		$.ajax({
			type:'post',
			url:'dojangPostReg.ajax',
			data: formData,
			contentType: false,
			processData: false,
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.dojangPostReg){
					location.href='dojangHome.go?dojang_no='+dojang_no;
				}else{
					alert("등록 실패");
				}
			},
			error:function(e){
				console.log(e);
			}
				
		});	
	
	}
	
}


function memberCall(){
	
	
	var dojang_no = $('#dojang_no').val();
	
	$.ajax({
		type:'get',
		url:'dojangMember.ajax',
		data:{
			dojang_no:dojang_no,
		},
		dataType:'JSON',
		success:function(data){
				$('#leader').html(data.dojangHomeLeader);
				drawMember(data.dojangHomeMember);
		},
		error:function(e){
			console.log(e);
		}
			
	});	
	
}


function dojangfileUp(){
	window.open('gpFileUploadForm.go','','width=400, height=100,left=550 ,top=300');
}

function restaurant_pop(){	
	 window.open("/gpRestaurantSearch.go","new","width=800, height=600, left=350 ,top=500, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}



function drawMember(member){
	var content = '';

	member.forEach(function(item){
		content += '<li>'+item.member_id+'</li>';
	});
	$('#member').empty();
	$('#member').append(content);
}


//사진 삭제
function del(elem){
	console.log(elem);
	//id에서 삭제할 파일명을 추출
	var id = $(elem).attr("id");
	var fileName = id.substring(id.lastIndexOf("/")+1);
	console.log(fileName);
	//해당 파일 삭제 요청
	$.ajax({
		url:'gpFileDelete.ajax',
		type:'get',
		data:{'fileName':fileName},
		dataType:'json',
		success:function(data){
			console.log(data)
			//a 태그를 포함한 img 태그를 삭제
			$(elem).remove();
		},
		error:function(e){
			console.log(e);
		}
	});
}





</script>
</html>