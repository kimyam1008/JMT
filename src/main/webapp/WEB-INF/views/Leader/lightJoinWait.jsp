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
	<h3>번개모임 가입 대기 회원</h3>
	<%-- <form action="lightJoinWaitUpdate" method="post">
		<input type="hidden" name="class_no" value="${lightJoinWait.class_no}"/> --%>
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
				<c:forEach items="${lightJoinWait}" var="lightJoinWait">
					<tr>
						<td>
							<input type="checkbox" id="member_id" value="${lightJoinWait.member_id}"/>
						</td>
						<td>회원 아이디
							${lightJoinWait.member_id}
						</td>
						<td>
							<select name="status" value="">
								<option value="대기중" selected>대기중</option>
								<option value="승인">승인</option>
								<option value="거절">거절</option>
							</select>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<th colspan="3">
						<input type="button" value="처리 완료" onclick="joinWaitSave()"/>
						<input type="button" value="취소" onclick="joinWaitClose()"/>
					</th>
				</tr>
			</tbody>
		</table>
	<!-- </form> -->
</body>
<script>
//처리 완료
function joinWaitSave(){
	var lightning_no = $('#lightning_no').val();
	var status = $('#status').val();
	var member_id = $('input[type="checkbox"]:checked').val();
	
	var result = confirm("가입 대기 회원의 상태를 수정하시겠습니까?");
	if(result == true){
		
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