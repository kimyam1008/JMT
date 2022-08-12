<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table, td,th{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	th, td{
		padding: 10px 20px 10px 20px;
	}
 	a{
 	text-decoration : none;
 	}
 	
 	
 	/*댓글 작성 폼 */
	 .comment-form {
	  display: flex;
	  flex-direction: column;
	  width : 515px;
	  height : 80px;
	  margin : 10px 0px;
	}
	.comment-form textarea {
	  resize: none;
	  border: 1px solid #dbdbdb;
	  padding: 15px 20px;
	  outline: none;
	}
	.comment-form .submit {
	  border: 1px solid #8f8f8f;
	  background-color: #8f8f8f;
	  color: #fff;
	  padding: 5px;
	  cursor: pointer;
	}
 	
 	
 	
 	/*댓글 리스트 */
 	/* 레이아웃 - 댓글 */
	.comments {
	  border: 1px solid #dbdbdb;
	  width : 510px;
	}
	.comments .comment {
	  border-bottom: 1px solid #dbdbdb;
	  padding: 15px;
	}
	.comments .comment:last-child {
	  border-bottom: none;
	}

	/* 상단 메뉴 */
	.top {
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	}
	.top .member_id {
	  font-weight: bold;
	  font-size : 13px;
	}
	
	.top .grade_name{
		font-size : 12px;
		padding : 5px;
	}
	
	.content {
		padding : 5px;
	}
	
	/*등급색상*/
	.g1{
		color :green;
	}
	
	.g2{
		color :brown;
	}
	
	.g3{
		color :lightblue;
	}
	
	.g4{
		color :gold;
	}
	
	.g5{
		color :purple;
	}
	
	.top .utility {
	  display: flex;
	  flex-direction: row;
	  margin-left: auto;
	}

	p {
		font-size : 13px;
	}
	
	/* 하단 메뉴 */
	.bottom {
	  display: flex;
	  flex-direction: row;
	  align-items: center;
	  list-style: none;
	  padding: 0;
	  margin: 0;
	  text-transform: uppercase;
	  letter-spacing: -0.5px;
	  font-weight: bold;
	  font-size: 14px;
	}
	.bottom .divider {
	  width: 1px;
	  height: 20px;
	  background-color: #dbdbdb;
	  margin: 0 20px;
	}
	.bottom .menu {
	  margin: 0;
	  padding: 0;
	  color: #bebebe;
	}
	.bottom .menu.report {
	  color: #333;
	}
 	
</style>
</head>

<body>
	<a href="#">방장페이지</a>
	<table>
		<tr>
			<th>모임 이름</th>
			<td>${dto.lightning_title}</td>
			<th>방장ID</th>
			<td>${dto.leader_id}</td>
		</tr>
		<tr>
			<th>인원</th>
			<td>${dto.member_count}/${dto.member_num}</td>
			<th>식사속도</th>
			<td>${dto.eat_speed}</td>
		</tr>
		<tr>
			<th>모임 생성 날짜</th>
			<td>${dto.lightning_create}</td>
			<th>모임 날짜</th>
			<td>${dto.lightning_date}</td>
		</tr>
		<tr>
			<th>장소</th>
			<td>${dto.restaurant_name}</td>
			<th>음식 카테고리</th>
			<td>${dto.food_name}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${dto.gender}</td>
			<th>직업</th>
			<td>${dto.job}</td>
		</tr>
		<tr>
			<td colspan="4">
				${dto.lightning_content} <br/>
				<button id="button" onclick="lightReport_pop()" style="float:right">신고하기</button>
			</td>
		</tr>
		<tr>
			<th colspan ="4">
				<button id="application" onclick="application()">신청</button>
				<button onclick="location.href='javascript:history.back()'">목록</button>
			</th>
		</tr>
	</table>
	<!--  댓글 영역
		  <div class="input-group mt-3">
		    	<input type="text" id="cmtInput" class="form-control" placeholder="댓글">
		    <div class="input-group-append">
				<button class="btn btn-primary" type="button" id="cmtWrite">OK</button> 
				<button class="btn btn-danger" type="button" id="cmtResetBtn">Cancel</button>
		    </div>	
		  </div>
	-->
	<div class="comment-form">
  		<textarea  id="cmtInput" placeholder="댓글을 작성하세요."></textarea>
  		<button type="button" class="submit" id="cmtWrite">댓글 쓰기</button>
	</div>
	<div id="cmtList">
	</div>
	<!-- 댓글리스트
	<div id="cmtList">
	  <ul>
	    <li>작성자</li>
	    <li>댓글내용</li>
	    <li>작성날짜</li>
	    <li>기능</li>
	  </ul>
	<div class="comments">
	  <div class="comment">
	    <div class="content">
	      <header class="top">
	        <div class="member_id">우연히 들어온 사람</div>
	        <div class="utility">
	          <button class="update">수정</button>
	          <button class="delete">삭제</button>
	        </div>
	      </header>
	      <p>content</p>
	      <ul class="bottom">
	        <li class="menu comment_date">날짜</li>
	         <li class="divider"></li>
        	<li class="menu report">신고하기</li>
	      </ul>
	    </div>
	  </div>
</div>
	</div>-->
	
	


	
</body>
<script>
	//상세보기 눌렀을 때 댓글리스트 보여주기 
	var lightning_no =  ${dto.lightning_no};
	var class_no = 2;
	cmtList(class_no,lightning_no);

	
	var msg = "${msg}";
	if (msg != ""){
		alert(msg);
	}
	
	var status = "${dto.status}";
	var leader_id="${dto.leader_id}";
	var loginId = "${loginId}";
	//사용자 프로필
	var eat_speed = "${profileInfo.eat_speed}";
	var profile_gender = "${dto.profile_gender}";
	var profile_job = "${profileInfo.profile_job}";
	
	//방장이 본인 방 상세페이지를 볼 때 
	if(leader_id == loginId){
		$("a").css("display","inline");
		$("#button").text("삭제");
		$("#button").attr("onclick","chkDel()");
	}else{
		$("a").css("display","none");
	}
	
	
	if(status=="승인"){
		$("#application").text("탈퇴");
		$("#application").attr("onclick","dropout()");
	}
	
	
	function application(){
		console.log(status);
		//방장아이디랑 로그인아이디 비교해서 같으면 신청불가
		if(leader_id == loginId){
			alert("방장은 신청할 수 없습니다.");
		//아직 가입신청을 안한 경우
		}else if (status == ""){
			//프로필 상태 기반
			if("${dto.gender}" !="상관없음" && "${dto.gender}" != profile_gender){
				alert("성별 조건이 맞지않습니다.");
			}else{
				if(confirm("가입 신청하시겠습니까?")){
					alert("신청완료 되었습니다.");
					location.href='/lightRegister.do?lightning_no=${dto.lightning_no}';
				}
			}
			
		}else if(status=="대기"){
			alert("이미 신청한 방입니다.");
		}else if(status=="거절"){
			alert("방장이 승인을 거절하여 재신청이 불가합니다.");
		}else if(status=="탈퇴"){
			alert("모임에서 탈퇴하여 재신청이 불가합니다.");
		}else if(status=="강퇴"){
			alert("모임에서 강퇴당하여 재신청이 불가합니다.");
		}
		
	}
	
	
	
	function dropout(){
		if(confirm("모임에서 탈퇴할 경우 재신청 할 수 없습니다. 정말 탈퇴하시겠습니까?")){
			alert("탈퇴 되었습니다.");
			location.href='/lightDropOut.do?lightning_no=${dto.lightning_no}';
		}
	}
	
	//신고 팝업
	function lightReport_pop(){
		window.open("/lightReport.go?lightning_no="+${dto.lightning_no},"new","width=400, height=200, left=550 ,top=300, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
	
	function chkDel(){
		if(confirm("방을 삭제하시겠습니까?")){
			location.href="/lightDelete.do?lightning_no=${dto.lightning_no}";
		}
	}
	
	
	
	/*********댓글*********/ 
	
	//로그인 아이디 위에 변수 설정 되어있음 loginId 
	//var lightning_no , var class_no 위에 변수 설정 
	//댓글 작성 시 : 작성하기 버튼 누를 시 
	$("#cmtWrite").on("click",function(){
	console.log(loginId, lightning_no);
	  var comment_content = $("#cmtInput").val();
	  if(comment_content == null ||comment_content ==''){
	    alert("댓글을 입력해 주세요.");
	    $("#cmtInput").focus();
		return false;
	  }else{
	    var cmtData = {'idx':lightning_no,'member_id':loginId,'comment_content':comment_content,'class_no':class_no};
	    
		$.ajax({
			type:"post",
			url:"comment/cmtWrite",
			data:JSON.stringify(cmtData),
			contentType:"application/json; charset=utf-8",
			success : function(data){
				if(data.writeSuccess){
					cmtList(class_no,lightning_no);
					$("#cmtInput").val("");
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	  
	  }
	});
	
	//06_TeamProject 참고 
	//댓글 리스트 가져오기 
	function cmtList(class_no,idx){
		var url ='comment'+ "/" + 'cmtList'+"/" +class_no+"/" +idx;
		
		$.ajax({
			url:url,
			type:'get',
			dataType:'json',
			success : function(data){
				console.log(data);
				drawCmt(data.cmtList);
				
			},
			error : function(e){
				console.log(e);
			}
		});
	}
	
	
	function drawCmt(list){
		console.log(list);
		var content = "";
		//데이터가 있는 경우
		if(list.length>0){					
			list.forEach(function(item,idx){
				//console.log(item);
				var date = new Date(item.comment_date);
				
				content += '<div class ="comments c'+item.comment_no+'">';
				content += '<div class ="comment">';
				content += '<div class ="content">';
				content += '<header class="top">';
				content += '<div class="member_id">'+item.member_id+'</div>';
				content += '<div class="grade_name g'+item.grade_no+'">'+item.grade_name+'</div>';
				content += '<div class="utility">';
				content += '<button class="updBtn" onclick="updBtn('+item.comment_no+   ","     +  "\'" +  item.comment_content   +"\'"  + ')">수정</button>';
				content += '<button class="delBtn" onclick="cmtDel('+item.comment_no+')">삭제</button>';
				content += '</div>';
				content += '</header>';
				content += '<p id="p'+item.comment_no+'">'+item.comment_content+'</p>';
				content += '<ul class="bottom">';
				content += '<li class="menu comment_date">'+date.toLocaleDateString("ko-KR")+'</li>';
				content += '<li class="divider"></li>';
				content += '<li class="menu report">신고하기</li>';
				content += '</ul>';
				content += '</div>';
				content += '</div>';
				content += '</div>';
			});
		//데이터가 없을 경우	
		}else{
			content += "데이터 없음";
		}
		
		$('#cmtList').empty();
		$('#cmtList').append(content); 	
	}
	

	//삭제 
	function cmtDel(cno){
		
		$.ajax({
			url:"comment/cmtDel",
			type:'post',
			data : {
				'comment_no' : cno
			},
			dataType:'json',
			success : function(data){
				console.log(data.delSuccess);
				if(data.delSuccess){
					cmtList(class_no,lightning_no);
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	}
	
	//수정
	function updBtn(cno,content){
		//console.log("수정하고싶다");
		console.log(cno,content);
		
		var updcontent = "";
		
		/*updcontent += '<div class ="ucomments c'+cno+'">';
		updcontent += '<div id ="ucomments"'+cno+'>';
		updcontent += '<div class ="ucomment">';
		updcontent += '<div class ="ucontent">';
		updcontent += '<header class="utop">';
		updcontent += '<div class="uutility">';
		updcontent += '<button class="updBtn" onclick="cmtUpd('+cno+','+content+')">수정하기</button>';
		updcontent += '<button class="delBtn" onclick="cmtDel('+cno+')">취소</button>';
		updcontent += '</div>';
		updcontent += '</header>';
		updcontent += '<textarea id="updcontent">';
		updcontent += content;
		updcontent += '</textarea>';
		updcontent += '</div>';
		updcontent += '</div>';
		updcontent += '</div>';
		*/ 
		
		//$('#cmtList').empty();
		$('#p'+cno).replaceWith('<textarea>'+content+'</textarea>');
		//$("#ucomments").replaceWith(updcontent);
		//$("div .ucomments .c"+cno).replaceWith(updcontent);
		/*
		$("div .comments .c"+cno).empty();
		$("div .comments .c"+cno).append(updcontent);
		$.ajax({
			url:"comment/cmtUpd",
			type:'post',
			data : {
				'comment_no' : cno,
				'comment_content' : content
			},
			dataType:'json',
			success : function(data){
				console.log(data);
				
			},
			error : function(e){
				console.log(e);
			}
		});
		*/
	}
	
</script>
</html>