<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 검색</title>
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
	<h3>${sessionScope.loginId} 님의 모임 검색</h3>
	
	<!-- <select id="groupSortChange">
		<option value="lightning">번개모임</option>
		<option value="dojang">도장깨기</option>
	</select> -->
	
	<form action="lightningCall" method="get">
		<button type="submit">번개모임</button>
	</form>
	<form action="dojangCall" method="get">
		<button type="submit">도장깨기</button>
	</form>
	<table>
		<thead>
			<tr>
				<th>선택</th>
				<th>모임 번호</th>
				<th>제목</th>
				<th>방장 ID</th>
			</tr>
		</thead>
		<tbody id="list">
				<%-- <c:forEach items="${dto}" var="dto">
				<tr>
					<td>
						<input type="hidden" id="groupNumber" value="${dto.groupNumber}"/>
						<input type="radio" id="group_name" name="group_name" value="${dto.title}"/>${dto.title}
					</td>
					<td>${dto.leader_id}</td>
				</tr>
				</c:forEach> --%>
		</tbody>
	</table><br/>
	<button id="groupSearchEnd" onclick="groupSearchEnd()">확인</button>
	<!-- <button id="groupSearchEnd" onclick="groupSearchEnd()">확인</button> -->
</body>
<script>
//drawList(list);
/*
 window.onload = function(event){
    document.getElementById("groupSearchEnd").onclick = function(){
    	
    	if ($("input[type='radio']:checked")!=null) {
    		var groupNumber = document.getElementById("groupNumber").value;
            var group_name = document.getElementById("group_name").value;
            window.opener.document.getElementById("groupNumber").value = groupNumber;
            window.opener.document.getElementById("group_name").value = group_name;
            window.close();
		} else {
			window.close();
		}
        
    }
} 
*/
/*  function drawList(list){
		var content = '';
		console.log("data:",list);
		
		if($('input').length < 3){
			content += '<tr>';
			content += '<td colspan="2">'+"모임 종류를 선택하세요."+'</td>';
			content += '</tr>';
		}
 } */

/*
 function groupSearchEnd(){             
	opener.document.getElementById("group_name").value = document.getElementById("group_name").value
	        }
*/


groupListCall();

//셀렉트박스 바뀔때
/* $('#groupSortChange').on('change',function(){
	groupListCall();
}); */

function groupListCall(){
	//var groupSortChange = $("#groupSortChange option:selected").val();
	//console.log(groupSortChange);
	
	$.ajax({
		type:'get',
		url:'groupSearch.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			console.log(data);
			drawList(data.list);
			console.log("가입한 그룹",data.list);
		},
		error:function(e){
			console.log(e);
		}
	});
}

//groupSearchPop
function drawList(list){
	var content = '';
	console.log("data:",list);
	
	if(list.length == 0){
		content += '<tr>';
		content += '<td colspan="2">'+"모임 종류를 선택하세요."+'</td>';
		content += '</tr>';
	}
	
	list.forEach(function(item){
		/* if ($("#groupSortChange option:selected").val() == "lightning") { */
			content += '<tr>';
			content += '<td><input type="radio" name="groupRadio"/></td>';
			content += '<td>'+item.group_no+'</td>';
			content += '<td>'+item.title+'</td>';
			content += '<td>'+item.leader_id+'</td>';
			content += '</tr>';
		/* } else { */
			/* content += '<tr>';
			content += '<td><input type="radio" name="groupRadio"/></td>';
			content += '<td>'+item.lightning_title+'<input type="hidden" value="'+item.lightning_no+'"/></td>';
			content += '<td>'+item.leader_id+'</td>';
			content += '</tr>'; */
		/* } */
	});
	
	$('#list').empty();
	$('#list').append(content);
}


//라디오 선택값
//console.log($("input[type='radio']:checked").val());

//var groupSelect = $("input[type='radio']:checked").val();
//var idx = $("input[type='hidden']").val();

//모임 선택 완료

function groupSearchEnd() {
	let group_name = $('input[type=radio]:checked').parents('td').next().next().text();
	
	/* if(groupSelect != ""){ */
		let group_no = $('input[type=radio]:checked').parents('td').next().text();
		//let group_no = '${joinGroup.group_no}';
		
		$.ajax({
			type:'post',
			url:'groupSearchEnd.ajax',
			data:{
				lightning_title:group_name,
				dojang_title:group_name,
				lightning_no:group_no,
				dojang_no:group_no
			},
			dataType:'json',
			success:function(data){
				if(data>0){
					alert('모임 선택이 완료되었습니다.');
				}
				//location.reload();
			},
			error:function(e){console.log(e)}
			
		});
		
		//var content = '<input type="text" name="title" value="'+groupSelect+'" readonly/>';
		/* content += groupSelect **/
		//content += '<input type="hidden" name="idx" value="'+idx+'/>';
		//opener.document.getElementById("groupName").innerHTML += content;
		self.close();
	/* } */
	
}
</script>
</html>