<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	table,th,td {
		border:1px solid black;
		border-collapse:collapse;
		padding:5px 10px;
	}

	table, input[type='text'] {
			width:100%;
		}
		
	textarea {
		width: 100%;
		height: 150px;
		resize: none;
	}
	
	#editable{
		width: 99%;
		height: 500px;
		border: 1px solid gray;
		margin: 5px;
		overflow: auto;
		padding: 5px;
		text-align: left;
	}
	
	img{
		cursor: pointer;
	}
	
	img:hover {
		opacity: 0.5;
	}

</style>
</head>
<body>
	<h3>모임 후기 작성</h3>
	<form action="groupReviewRegister" method="POST">
		<table>
			<tr>
				<th>모임 검색</th>
				<td>
					<input type="text" id="group_name" style="width:30%" value="" readonly/>
					<!-- <p id="groupName"></p> -->
					<%-- ${joinGroup.title} --%>
					<!-- <input type="button" value="검색" id="groupSearch"/> -->
					<input type="hidden" id="groupNumber" name="groupNumber" value=""/>
					<input type="button" value="검색" onclick="groupSearchPop()"/>
					<input type="button" value="초기화" id="groupReset" onclick="groupReset()"/>
				</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td><input type="text" name="review_title"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<!-- html 태그를 인식하기 위해 div 사용(type="text"나 textarea는 html을 그냥 글자취급) -->
					<div id="editable" contenteditable="true"></div>
					<!-- 하지만 div 는 서버에 값을 전송할 수가 없다. -->
					<!-- 결국엔 div의 내용을 input에 담아 서버에 전송할 예정 -->
					<input type="hidden" name="review_content" id="review_content"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="파일 업로드" onclick="fileUp()"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="save()">글쓰기</button>
				</th>
			</tr>
		</table>
	</form>	
	
</body>
<script>

//$('input[name=user_id]').attr('value',"${sessionScope.loginId}");

if($('#title').length > 2) {
	alert("모임은 한 개만 추가 할 수 있습니다.");
} else {
	//모임 검색 팝업
	function groupSearchPop(){
		window.open("/groupSearchPop.go","new","width=500, height=400, left=400 ,top=200, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
	}
}

//초기화
function groupReset(){
	//$('#group_name').val('');
	//$('#groupNumber').val('');
	document.getElementById("group_name").value ='';
	document.getElementById("groupNumber").value ='';
}


//글 업로드
function save(){
	$('#review_content a').removeAttr('onclick');
	//id가 content인 태그의 자식태그 a 태그에서 onclick 속성 삭제
	$('#review_content').val($('#editable').html());
	//content 안에 editable 넣음
	$('form').submit();
}

//파일업로드 팝업
function fileUp(){
	if ($('img').length < 4) {
		window.open('grFileUploadForm.go','','width=400, height=100');
	} else {
		alert('이미지 업로드 제한 갯수를 초과했습니다.');
	}
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
		url:'grFileDelete.ajax',
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