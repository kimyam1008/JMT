<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
</style>
</head>
<body>
지수님 파이팅 ^_^

	
<h3>등급 관리</h3>


 	<form action="grade" method="post" id="grade">
		<table>
			<thead>
				<tr>
				 <th></th>
		         <th>등급 이름</th>
		         <th>게시글</th>
		         <th>댓글</th>
		         <th>색상</th>
		         <th>아이콘</th>
		         
		      </tr>  
			</thead>
			<tbody>
				<c:forEach items="${list}" var="grade">
					<tr>
						<td>
							${grade.grade_no}
						</td>
						<td>
							<input type="hidden" name="grade_no" value="${grade.grade_no}">
							<input type="text" name="grade_name" value="${grade.grade_name}">
						</td>
						<td>
							<input type="text" name="grade_post" value="${grade.grade_post}">
						</td>
						<td>
							<input type="text" name="grade_comment" value="${grade.grade_comment}">
						</td>
						<td>
							<input type="color" name="grade_color" value="${grade.grade_color}" onchange="sendCode(this.value)" id="colorWell'+item.grade_no+'">
						</td>
						<td>
						<input id="${grade.grade_no}" name="${grade.grade_no}" onclick="this()" value="저장" type="submit"/>
						<input type="button" value="저장" onclick='mySubmit(${grade.grade_no})' />
						</td>
					</tr>
				</c:forEach>
				
  				
  				
			</tbody>
		</table>
	</form>
	
	<form action="h" method="post">
		<table>
			<tr>
				<td>
					${grade.grade_no}
				</td>
				<td>
					<input type="hidden" name="grade_no" value="${grade.grade_no}">
					<input type="text" name="grade_name" value="${grade.grade_name}">
				</td>
				<td>
					<input type="text" name="grade_post" value="${grade.grade_post}">
				</td>
				<td>
					<input type="text" name="grade_comment" value="${grade.grade_comment}">
				</td>
				<td>
					<input type="color" name="grade_color" value="${grade.grade_color}" onchange="sendCode(this.value)" id="colorWell'+item.grade_no+'">
				</td>
				<td>
				<input id="${grade.grade_no}" name="${grade.grade_no}" onclick="this()" value="저장" type="submit"/>
				<input type="button" value="저장" onclick='mySubmit(${grade.grade_no})' />
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