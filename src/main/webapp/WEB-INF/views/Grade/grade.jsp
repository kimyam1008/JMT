<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>


table {
        margin-bottom: 0px;

    }

	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
		text-align: center;
	}
	
	
	
</style>
</head>
<body>
지수님 파이팅 ^_^

	
<h3>등급 관리</h3>


 	<form action="grade" method="post" id="grade" style="margin-bottom: 0px">
		<table>
			<thead>
				<tr>	
					<th></th>
			        <th>등급 이름</th>
			        <th>게시글</th>
			        <th>댓글</th>
			        <th>색상</th>
		      	</tr>  
			</thead>
			<tbody>
				<tr>
					<td>
						${list[0].grade_no}
					</td>
					<td>
						<input type="hidden" name="grade_no" value="1">
						<input type="text" name="grade_name" value="${list[0].grade_name}">
					</td>
					<td>
						<input type="text" name="grade_post" value="${list[0].grade_post}">
					</td>
					<td>
						<input type="text" name="grade_comment" value="${list[0].grade_comment}">
					</td>
					<td>
						<input type="color" name="grade_color" value="${list[0].grade_color}" onchange="sendCode(this.value)" id="colorWell'+item.grade_no+'">
					</td>
					<td>
						<input value="저장" type="submit"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	  
	
	<form action="grade" method="post" style="margin-bottom: 0px">
		<table>
				<tr>
					<td>
						${list[1].grade_no}
					</td>
					<td>
						<input type="hidden" name="grade_no" value="2">
						<input type="text" name="grade_name" value="${list[1].grade_name}">
					</td>
					<td>
						<input type="text" name="grade_post" value="${list[1].grade_post}">
					</td>
					<td>
						<input type="text" name="grade_comment" value="${list[1].grade_comment}">
					</td>
					<td>
						<input type="color" name="grade_color" value="${list[1].grade_color}" onchange="sendCode(this.value)" id="colorWell'+item.grade_no+'">
					</td>
					<td>
					<input value="저장" type="submit"/>
					</td>
				</tr>
		</table>
	</form>
	
	<form action="grade" method="post" style="margin-bottom: 0px" >
		<table>
				<tr>
					<td>
						${list[2].grade_no}
					</td>
					<td>
						<input type="hidden" name="grade_no" value="3">
						<input type="text" name="grade_name" value="${list[2].grade_name}">
					</td>
					<td>
						<input type="text" name="grade_post" value="${list[2].grade_post}">
					</td>
					<td>
						<input type="text" name="grade_comment" value="${list[2].grade_comment}">
					</td>
					<td>
						<input type="color" name="grade_color" value="${list[2].grade_color}" onchange="sendCode(this.value)" id="colorWell'+item.grade_no+'">
					</td>
					<td>
						<input value="저장" type="submit"/>
					</td>
				</tr>
		</table>
	</form>
	
	<form action="grade" method="post" style="margin-bottom: 0px">
		<table>
				<tr>
					<td>
						${list[3].grade_no}
					</td>
					<td>
						<input type="hidden" name="grade_no" value="4">
						<input type="text" name="grade_name" value="${list[3].grade_name}">
					</td>
					<td>
						<input type="text" name="grade_post" value="${list[3].grade_post}">
					</td>
					<td>
						<input type="text" name="grade_comment" value="${list[3].grade_comment}">
					</td>
					<td>
						<input type="color" name="grade_color" value="${list[3].grade_color}" onchange="sendCode(this.value)" id="colorWell'+item.grade_no+'">
					</td>
					<td>
						<input value="저장" type="submit"/>
					</td>
				</tr>
		</table>
	</form>
	
	<form action="grade" method="post">
		<table>
				<tr>
					<td>
						${list[4].grade_no}
					</td>
					<td>
						<input type="hidden" name="grade_no" value="5">
						<input type="text" name="grade_name" value="${list[4].grade_name}">
					</td>
					<td>
						<input type="text" name="grade_post" value="${list[4].grade_post}">
					</td>
					<td>
						<input type="text" name="grade_comment" value="${list[4].grade_comment}">
					</td>
					<td>
						<input type="color" name="grade_color" value="${list[4].grade_color}" onchange="sendCode(this.value)" id="colorWell'+item.grade_no+'">
					</td>
					<td>
						<input value="저장" type="submit"/>
					</td>
				</tr>
		</table>
	</form>
			
		</body>
<script>
/* 
	function mySubmit(index) {
	    if (index == 1) {
	      document.myForm.action = $("#grade").submit();
	    }
	    if (index == 2) {
	      document.myForm.action='ok2.html';
	    }
	    document.myForm.submit();
	  } */

	function sendCode(color) {
	var grade_color = color;
	$("grade_color").val(color);
	//$("#grade").submit();
	console.log(grade_color);
	
	
	}
	/* $.ajax({
		type:'get',
		url:'gradeList.ajax',
		data : {},
		dataType:'JSON',
		success:function(data){
			list(data.list);
			console.log(data);
		},
		error:function(e){
			console.log(e);
		}
		
	});
	
	
	function list(list){
		var content = '';
		
		list.forEach(function(item){
			content += '<tr>';
			content += '<td>'+item.grade_no+'</td>';
			content += '<td><input type="text" class="'+item.grade_no+' grade_name" value="'+item.grade_name+'"</td>';
			content += '<td><input type="text" class="'+item.grade_no+' grade_post" value="'+item.grade_post+'"</td>';
			content += '<td><input type="text" class="'+item.grade_no+' grade_comment" value="'+item.grade_comment+'"</td>';
			content += '<td><input type="color" name="colorCode" value="#001100" onchange="sendCode(this.value)" id="colorWell'+item.grade_no+'">'+'</td>'
			content += '</tr>';
			
			
		});
		$('#list').empty();
		$('#list').append(content);
		
		$('input[type="text"]').focusin(function(){
			$(this).css("background-color","white");
		});
			
		$('input[type="text"]').focusout(function(e){
			$(this).css("background-color","lightgray");
			//console.log(e.currentTarget.defaultValue+ ' => '+ e.currentTarget.value);
			if($(this).prop('defaultValue') != $(this).val()){
				console.log('수정요청');
				reqUpdate($(this)[0])
			}
		});
	}
	
	
	function reqUpdate(obj) {
		
		console.log('name = ',obj.classList[0]);	
		console.log('column = ',obj.classList[1]);	
		console.log('value = ',obj.value);
		
		
		var val = obj.value == ''?'_value_':obj.value;
		var url = 'update/'+obj.classList[1]+'/'+val+'/'+obj.classList[0];
		
		console.log(url);
		
		$.ajax({
			url:url,
			type:'get',
			dataType:'json',
			success:function(data){
				console.log(data);
			},
			error:function(e){
				console.log(e);
			}
		});
		
	};
	
	
	
	let colorWell1;
	console.log(colorWell1);
    const defaultColor = "#0000ff";
    
    
    window.addEventListener("load", startup, false);

    function startup() {
        colorWell = document.querySelector("#colorWell");
        colorWell.value = defaultColor;
        colorWell.addEventListener("input", updateFirst, false);
        colorWell.addEventListener("change", updateAll, false);
        colorWell.select();
    };

    function updateFirst(event) {
    const p = document.querySelector("p");
    if (p) {
        p.style.color = event.target.value;
    }
    }

    function updateAll(event) {
    document.querySelectorAll("p").forEach((p) => {
        p.style.color = event.target.value;
    });
    };

	
	} */
	
	
	
	

</script>
</html>