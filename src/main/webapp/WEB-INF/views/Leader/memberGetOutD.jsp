<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추방</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	body,textarea {
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
	input[type='text']{
		font-family: 'GmarketSansMedium';
		border:none;
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
	textarea {
		font-family: 'GmarketSansMedium';
		width: 100%;
	    height: 6.25em;
	    border: none;
	    resize: none;
	}
</style>
</head>
<body>
	<input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="member_id" value="" readonly></td>
		</tr>
		<tr>
			<th>사유</th>
			<td><textarea name="reason" id="reason"></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<div style="display:block;">
	            <span style="text-align:center; display:block; margin: 0 auto;">
					<input type="button" value="추방" onclick="getOutSave()"/>
					<input type="button" value="취소" onclick="Close()"/>
				</span>
				</div>
			</th>
		</tr>
	</table>
</body>
<script>
//부모창에서 선택한 아이디 뿌려주기
var radioChk = opener.document.getElementsByName('member_id');
//var dojang_no = opener.document.getElementsById()
for(var i=0; i<radioChk.length; i++) {
    if(radioChk[i].checked) {
        //alert(radioChk[i].value);
        $('#member_id').val(radioChk[i].value);
    }
}


//글자수 제한
$('textarea').keyup(function(){
	  var content = $(this).val();
	  if (content.length > 10){
	    alert("최대 10자까지 입력 가능합니다.");
	    $(this).val(content.substring(0, 10));
	  }
});


//추방
function getOutSave(){
	var member_id = $('#member_id').val();
	var reason = $('#reason').val();
	var dojang_no = $('#dojang_no').val();
	
	var result = confirm("정말로 추방하시겠습니까?");
	
	if(result == true){
		if ($('#reason').val() == '') {
			alert("추방 사유를 입력해주세요.");
		} else {
			$.ajax({
				type:'get',
				url:'memberGetOutD.ajax',
				data:{
					'member_id':member_id,
					'reason':reason,
					'dojang_no':dojang_no
				},
				dataType:'JSON',
				success:function(data){
					if(data.memberGetOutD){
						opener.parent.location.reload();
						window.close();
					} else {
						alert("추방에 실패했습니다.");
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
function Close(){
	window.close();
}
</script>
</html>