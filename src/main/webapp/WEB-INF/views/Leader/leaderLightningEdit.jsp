<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개 모임 수정 팝업</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	body {
		font-family: 'GmarketSansMedium';
	}
	table {
		border-collapse: separate;
		border-spacing: 1px;
		text-align: left;
		line-height: 1.5;
		border-top: 1px solid #ccc;
		margin : 20px 10px;
	}
	table th {
		width: 150px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
		text-align:center;
	}
	table td {
		width: 350px;
		padding: 10px;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
	}
	
	@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	input[type='button']{
		font-family: 'GmarketSansMedium';
		color:#fff;
		background:orange;
		border:none;
		padding:5px 10px;
	}
	input[type='button']:focus{
		outline:0;
	}
	input[type='button']:hover{
		background:#ff3d1c;
		cursor:pointer;
	}
	select,option,textarea {
		font-family: 'GmarketSansMedium';
	}
	textarea {
	    width: 100%;
	    height: 6.25em;
	    border: none;
	    resize: none;
  	}
</style>
</head>
<body>
	<h3 style="text-align:center;">번개 모임 수정</h3>
	<input type="hidden" id="class_no" value="${lightDto.class_no}"/>
	<input type="hidden" id="lightning_no" value="${lightDto.lightning_no}"/>
	<input type="hidden" id="member_count" value="${lightDto.member_count}"/>
	<table>
		<tr>
			<th>이름</th>
			<td>${lightDto.lightning_title}</td>
		</tr>
		<tr>
			<th>정원</th>
			<td>
				<input name="member_num" type="range" id="member_num" min="2" max="6" step="1" value="${lightDto.member_num}" oninput="document.getElementById('member_num').innerHTML=this.value;"/>
				<div id="ex-out"></div>
			</td>
		</tr>
		<tr>
			<th>모집 상태</th>
			<td>
				<select id="lightning_status">
					<option value="모집중" <c:if test="${lightDto.lightning_status eq '모집중'}">selected</c:if>>모집중</option>
					<option value="모집마감" <c:if test="${lightDto.lightning_status eq '모집마감'}">selected</c:if>>모집 마감</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>소개글</th>
			<td>
				<textarea id="lightning_content">${lightDto.lightning_content}</textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<div style="display:block;">
                   <span style="text-align:center; display:block; margin: 0 auto;">
						<input type="button" value="저장" onclick="lightGroupUpd()"/>
						<input type="button" value="취소" onclick="lightGroupEditClose()"/>
				</span>
				</div>
			</th>
		</tr>
	</table>
</body>
<script>
document.querySelector('#member_num').addEventListener('input',e=>{
    document.querySelector('#ex-out').innerHTML= e.target.value;
});

//수정 완료
function lightGroupUpd(){
	
	var lightning_no = $('#lightning_no').val();
	var member_num = $('#member_num').val();
	var lightning_status = $('#lightning_status').val();
	var lightning_content = $('#lightning_content').val();
	
	var result = confirm("번개 모임의 내용을 수정하시겠습니까?");
	if(result == true){
		if ($('#member_num').val() == '') {
			alert("인원수는 0 이상이어야 합니다.");
		} else if ($('#lightning_content').val() == ''){
			alert("소개글의 내용을 입력해주세요.");
		} else if ($('#member_num').val() < $('#member_count').val()){
			alert("현재 가입된 회원의 수보다 정원을 적게 설정할 수 없습니다.");
		} else {
			$.ajax({
				type:'get',
				url:'leaderLightEdit.ajax',
				data:{
					'lightning_no':lightning_no,
					'member_num':member_num,
					'lightning_status':lightning_status,
					'lightning_content':lightning_content	
				},
				dataType:'JSON',
				success:function(data){
					if(data.leaderLightEdit){
						alert("수정이 완료되었습니다.");
						opener.parent.location.reload();
						window.close();
					} else {
						alert("수정에 실패했습니다.");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
		
		
		
		/* alert("수정이 완료되었습니다.");
		$('form').submit();
		opener.parent.location.reload();
		window.close(); */
	} else {
		alert("취소되었습니다.");
	}
}

//취소
function lightGroupEditClose(){
	window.close();
}
</script>
</html>