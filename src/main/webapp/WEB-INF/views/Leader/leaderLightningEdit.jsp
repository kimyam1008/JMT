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
	table,th,td {
		border:1px solid black;
		border-collapse:collapse;
	}
	th,td {
		padding:5px 10px;
	}
</style>
</head>
<body>
	<h3>번개 모임 수정</h3>
	<!-- <form action="lightEdit" method="post"> -->
		<input type="hidden" id="class_no" value="${lightDto.class_no}"/>
		<input type="hidden" id="lightning_no" value="${lightDto.lightning_no}"/>
		<table>
			<tr>
				<th>이름</th>
				<td>${lightDto.lightning_title}</td>
			</tr>
			<tr>
				<th>정원</th>
				<td>
					<input name="member_num" type="range" id="member_num" min="0" max="30" step="1" value="${lightDto.member_num}" oninput="document.getElementById('people_num').innerHTML=this.value;"/>
					<div id="ex-out"></div>
				</td>
			</tr>
			<tr>
				<th>모집 상태</th>
				<td>
					<select id="lightning_status" value="${lightDto.lightning_status}">
						<option value="모집 중">모집 중</option>
						<option value="모집 마감">모집 마감</option>
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
					<input type="button" value="수정 완료" onclick="lightGroupUpd()"/>
					<input type="button" value="취소" onclick="lightGroupEditClose()"/>
				</th>
			</tr>
		</table>
	<!-- </form> -->
</body>
<script>
document.querySelector('#people_num').addEventListener('input',e=>{
    document.querySelector('#ex-out').innerHTML= e.target.value;
});

//수정 완료
function lightGroupUpd(){
	
	var lightning_no = $('#lightning_no').val();
	var member_num = $('#member_num').val();
	var lightning_status = $('#lightning_status').val();
	var lightning_content = $('#lightning_content').val();
	
	var result confirm("번개 모임의 내용을 수정하시겠습니까?");
	if(result == true){
		if ($('#member_num').val() == '') {
			alert("인원수는 0 이상이어야 합니다.");
		} else if ($('#lightning_content').val() == ''){
			alert("소개글의 내용을 입력해주세요.");
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
	opener.parent.location.reload();
	window.close();
}
</script>
</html>