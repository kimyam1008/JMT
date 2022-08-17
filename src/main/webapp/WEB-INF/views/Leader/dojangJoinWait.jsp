<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도장깨기 가입 대기 회원 목록</title>
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
	<h3>도장깨기 가입 대기 회원</h3>
	<!-- <form action="dojangJoinWaitUpdate" method="post"> -->
		<%-- <input type="hidden" name="class_no" value="${dojangJoinWait.class_no}"/> --%>
		<input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>
		<table>
			<thead>
				<tr>
					<th></th>
					<th>회원ID</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dojangJoinWait}" var="dojangJoinWait">
					<tr>
						<td>
							<input type="checkbox" id="member_id" value="${dojangJoinWait.member_id}"/>
						</td>
						<td>회원 아이디
							${dojangJoinWait.member_id}
						</td>
						<td>
							<select id="status" value="">
								<option value="대기중" selected>대기중</option>
								<option value="승인">승인</option>
								<option value="거절">거절</option>
							</select>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<th colspan="3">
						<input type="button" value="처리 완료" onclick="JoinWaitSaveD()"/>
						<input type="button" value="취소" onclick="JoinWaitCloseD()"/>
					</th>
				</tr>
			</tbody>
		</table>
	<!-- </form> -->
</body>
<script>
//처리 완료
function JoinWaitSaveD(){
	var dojang_no = $('#dojang_no').val();
	var status = $('#status').val();
	var member_id = $('input[type="checkbox"]:checked').val();
	
	var result = confirm("가입 대기 회원의 상태를 수정하시겠습니까?");
	if(result == true){
		$.ajax({
			type:'get',
			url:'dojangJoinWaitUp.ajax',
			data:{
				'dojang_no':dojang_no,
				'member_id':member_id,
				'status':status
			},
			dataType:'JSON',
			success:function(data){
				if(data.dojangJoinWaitUp){
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
		
		

		
	} else {
		alert("취소되었습니다.");
	}
}

//취소
function JoinWaitCloseD(){
	opener.parent.location.reload();
	window.close();
}
</script>
</html>