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
				<th></th>
				<th>모임 분류</th>
				<th>제목</th>
				<th>방장 ID</th>
			</tr>
		</thead>
		<tbody id="groupList">
				<c:forEach items="${groupList}" var="groupList">
					<tr id="groupSearch">
						<td><input type="radio" name="groupList" value="${groupList.dojang_no}"/></td>
						<%-- <td id="${dto.groupNumber}">${dto.class_name}</td> --%>
						<td id="class_name">${groupList.class_name}</td>
						<td id="title">
							<%-- <input type="hidden" id="groupNumber" value="${dto.groupNumber}"/> --%>
							<%-- <input type="radio" id="group_name" name="group_name" value="${dto.title}"/>${dto.title} --%>
							${groupList.title}
						</td>
						<td id="leader_id">${groupList.leader_id}</td>
						<td id="groupNumber" class="hidden">${groupList.lightning_no}</td>
						<td id="groupNumber" class="hidden">${groupList.dojang_no}</td>
					</tr>
					<tr id="groupSearch">
						<td><input type="radio" name="groupList" value="${groupList.dojang_no}"/></td>
						<td id="class_name">${groupList.class_name}</td>
						<td id="title">${groupList.title}</td>
						<td id="leader_id">${groupList.leader_id}</td>
						<%-- <td id="groupNumber" class="hidden">${groupList.lightning_no}</td>
						<td id="groupNumber" class="hidden">${groupList.dojang_no}</td> --%>
					</tr>
				</c:forEach>
		</tbody>
	</table><br/>
	<button id="groupSearchEnd" onclick="groupSearchEnd()">확인</button>
	<button onclick="window.close()">취소</button>
	<!-- <button id="groupSearchEnd" onclick="groupSearchEnd()">확인</button> -->
</body>
<script>
noHidden();

function noHidden(){
	$(".hidden").css("display", "none");
}

function groupSearchEnd(){
	var groupArr = new Array();
	console.log("그룹 리스트 호출 되나요?");
	
	if($('#groupList input[type="radio"]:checked').is(":checked") == false){
		alert("모임을 선택해 주세요");
	}
	
	$('#groupList input[type="radio"]:checked').each(function(idx){
		console.log("선택됐나요?");
		var groupChoice = $(this).val();
		console.log(groupChoice);
		
		$tr = $("#groupSearch"+groupChoice);
		console.log($tr.text());
		
		window.opener.document.getElementById("title").value = $tr.find('#title').text();
		//window.opener.document.getElementById("groupNumber").value = $tr.find('#groupNumber').text();
		window.opener.document.getElementById("lightning_no").value = $tr.find('#lightning_no').text();
		window.opener.document.getElementById("dojang_no").value = $tr.find('#dojang_no').text();
        window.close();
		
	});
}

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


//groupListCall();

//셀렉트박스 바뀔때
/* $('#groupSortChange').on('change',function(){
	groupListCall();
}); */
/*
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
*/
/*
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
		/* if ($("#groupSortChange option:selected").val() == "lightning") { **
			content += '<tr>';
			content += '<td><input type="radio" name="groupRadio"/></td>';
			content += '<td>'+item.group_no+'</td>';
			content += '<td>'+item.title+'</td>';
			content += '<td>'+item.leader_id+'</td>';
			content += '</tr>';
		/* } else { *
			/* content += '<tr>';
			content += '<td><input type="radio" name="groupRadio"/></td>';
			content += '<td>'+item.lightning_title+'<input type="hidden" value="'+item.lightning_no+'"/></td>';
			content += '<td>'+item.leader_id+'</td>';
			content += '</tr>'; */
		/* } *
	});
	
	$('#list').empty();
	$('#list').append(content);
}
*/

//라디오 선택값
//console.log($("input[type='radio']:checked").val());

//var groupSelect = $("input[type='radio']:checked").val();
//var idx = $("input[type='hidden']").val();

//모임 선택 완료

//console.log($('input[type=radio]:checked').parents('td').next().next().text());
//console.log($('input[type=radio]:checked').parents('td').next().text());
/*
function groupSearchEnd() {
	let title = $('input[type=radio]:checked').parents('td').next().next().text();
	

		let idx = $('input[type=radio]:checked').parents('td').next().html();
		let idx = '${dto.groupNumber}';
		
		$.ajax({
			type:'post',
			url:'groupSearchEnd.ajax',
			data:{
				title:title
				//lightning_title:title,
				//dojang_title:title,
				idx:idx
				//lightning_no:group_no,
				//dojang_no:group_no
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
		//content += '<input type="hidden" id="groupNumber" value="'+idx+'/>';
		//opener.document.getElementById("group_name").innerHTML += content;
		window.opener.document.getElementById("group_name").value = title;
		window.opener.document.getElementById("groupNumber").value = idx;
		self.close();
		self.close();

	
}*/
</script>
</html>