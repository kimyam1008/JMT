<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개 모임 가입 대기 회원 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	body,select {
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
</style>
</head>
<body>
	<h3 style="text-align:center;">번개모임 가입 대기 회원</h3>
		<input type="hidden" id="lightning_no" value="${sessionScope.lightning_no}"/>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>회원ID</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test = "${lightJoinWait.size() == 0}">
                    <th colspan="3" style="text-align:center;">가입 신청한 회원이 없습니다.</th>
                </c:if>
				<c:forEach items="${lightJoinWait}" var="lightJoinWait">
					<tr>
						<td>
							<input type="radio" name="member_id" id="member_id" value="${lightJoinWait.member_id}"/>
						</td>
						<td>${lightJoinWait.member_id}</td>
						<td>
							<select id="status">
								<option value="대기">대기</option>
								<option value="승인">승인</option>
								<option value="거절">거절</option>
							</select>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<th colspan="3">
						<div style="display:block;">
                        <span style="text-align:center; display:block; margin: 0 auto;">
							<input type="button" value="저장" onclick="joinWaitSave()"/>
							<input type="button" value="닫기" onclick="joinWaitClose()"/>
						</span>
						</div>
					</th>
				</tr>
			</tbody>
		</table>
</body>
<script>
//처리 완료
function joinWaitSave(){
	var lightning_no = $('#lightning_no').val();
	var status = $('input[type="radio"]:checked').parent().next().next().children().val();
	var member_id = $('input[type="radio"]:checked').val();
	console.log(member_id);
	console.log(status);
	
	var result = confirm("가입 대기 회원의 상태를 수정하시겠습니까?");
	if(result == true){
		
		if($('input[type="radio"]:checked').is(":checked") == false){
			alert("대기상태를 변경할 회원을 선택해 주세요.");
		} else {
			
			$.ajax({
				type:'get',
				url:'lightJoinWaitUp.ajax',
				data:{
					'lightning_no':lightning_no,
					'member_id':member_id,
					'status':status
				},
				dataType:'JSON',
				success:function(data){
					if(data.lightJoinWaitUp){
						alert("수정이 완료되었습니다.");
						//opener.parent.location.reload();
						//window.close();
						window.location.reload();
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
function joinWaitClose(){
	opener.parent.location.reload();
	window.close();
}
</script>
</html>