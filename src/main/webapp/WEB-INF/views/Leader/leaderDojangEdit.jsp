<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도장깨기 수정 팝업</title>
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
	<h3 style="text-align:center;">도장깨기 수정</h3>
	<input type="hidden" id="class_no" value="${dojangDto.class_no}"/>
	<input type="hidden" id="dojang_no" value="${dojangDto.dojang_no}"/>
	<input type="hidden" id="member_count" value="${dojangDto.member_count}"/>
	<table>
		<tr>
			<th>이름</th>
			<td>${dojangDto.dojang_title}</td>
		</tr>
		<tr>
			<th>정원</th>
			<td>
				<input name="people_num" type="range" id="people_num" min="0" max="30" step="1" value="${dojangDto.people_num}" oninput="document.getElementById('people_num').innerHTML=this.value;"/>
				<div id="ex-out"></div>
			</td>
		</tr>
		<tr>
			<th>모집 상태</th>
			<td>
				<select id="dojang_status">
					<option value="모집중" <c:if test="${dojangDto.dojang_status eq '모집중'}">selected</c:if>>모집중</option>
					<option value="모집마감" <c:if test="${dojangDto.dojang_status eq '모집마감'}">selected</c:if>>모집 마감</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>소개글</th>
			<td>
				<textarea id="dojang_content">${dojangDto.dojang_content}</textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<div style="display:block;">
                    <span style="text-align:center; display:block; margin: 0 auto;">
						<input type="button" value="저장" onclick="dojangGroupUpd()"/>
						<input type="button" value="취소" onclick="dojangGroupEditClose()"/>
					</span>
				</div>
			</th>
		</tr>
	</table>
</body>
<script>
document.querySelector('#people_num').addEventListener('input',e=>{
    document.querySelector('#ex-out').innerHTML= e.target.value;
});


//수정 완료
function dojangGroupUpd(){
	
	var dojang_no = $('#dojang_no').val();
	var people_num = $('#people_num').val();
	var dojang_status = $('#dojang_status').val();
	var dojang_content = $('#dojang_content').val();
	
	var result = confirm("도장깨기 모임의 내용을 수정하시겠습니까?");
	if(result == true){
		//alert("수정이 완료되었습니다.");
		//$('form').submit();
		if ($('#people_num').val() == '') {
			alert("인원수는 0 이상이어야 합니다.");
		} else if ($('#dojang_content').val() == ''){
			alert("소개글의 내용을 입력해주세요.");
		} else if ($('#people_num').val() < $('#member_count').val()){
			alert("현재 가입된 회원의 수보다 정원을 적게 설정할 수 없습니다.");
		} else {
			$.ajax({
				type:'get',
				url:'leaderDojangEdit.ajax',
				data:{
					'dojang_no':dojang_no,
					'people_num':people_num,
					'dojang_status':dojang_status,
					'dojang_content':dojang_content	
				},
				dataType:'JSON',
				success:function(data){
					if(data.leaderDojangEdit){
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

		
	} else {
		alert("취소되었습니다.");
	}
}

//취소
function dojangGroupEditClose(){
	window.close();
}
</script>
</html>