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
	<h3>모임 검색</h3>
	<select id="groupSortChange">
		<option value="lightning">번개모임</option>
		<option value="dojang">도장깨기</option>
	</select>
	<table>
		<thead>
			<tr>
				<!-- <th>선택</th> -->
				<th>제목</th>
				<th>방장 ID</th>
			</tr>
		</thead>
		<tbody id="list">
			<%-- <tr>
				<c:forEach items="" var="">
					<td><input type="radio" value=""></td>
					<td></td>
					<td></td>
				</c:forEach>
			</tr> --%>
		</tbody>
	</table><br/>
	<button onclick="groupSearchEnd()">확인</button>
</body>
<script>
groupSearch();

//셀렉트박스 바뀔때
$('#groupSortChange').on('change',function(){
	groupSearch();
});

function groupSearch(){
	var groupSortChange = $("#groupSortChange option:selected").val();
	console.log(groupSortChange);
	
	$.ajax({
		type:'get',
		url:'groupSearch.ajax',
		data:{groupSortChange : groupSortChange},
		dataType:'json',
		success:function(data){
			console.log(data);
			drawList(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	var content="";
	
	list.forEach(function(item){
		if ($("#groupSortChange option:selected").val() == "lightning") {
			content += '<tr>';
			content += '<td><input type="radio" value="">'+item.lightning_title+'</td>';
			content += '<td>'+item.leader_id+'</td>';
			content += '</tr>';
		} else {
			content += '<tr>';
			content += '<td><input type="radio" value="">'+item.dojang_title+'</td>';
			content += '<td>'+item.leader_id+'</td>';
			content += '</tr>';
		}
	});
	
	$('#list').empty();
	$('#list').append(content);
}

//라디오 선택값
console.log($("input[type='radio']:checked").val());

var groupSelect = $("input[type='radio']:checked").val();

//모임 선택 완료
function groupSearchEnd() {
	if(groupSelect != ""){
		var content = '<input type="text" name="group_name" value="'+groupSelect+'" readonly/>';
		content += groupSelect
		opener.document.getElementById("groupName").innerHTML += content;
		self.close();
	}
}
</script>
</html>