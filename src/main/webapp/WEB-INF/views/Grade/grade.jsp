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

 <p> 선택한 색상을 봐바^^</p>
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
	<tbody id="list">
		
	</tbody>
</table>
	<form action="grade" method="post" id="grade">
		<input type="hidden" id="getColorCode" value=""/>
	</form>
	
</body>
<script>

	$.ajax({
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
			content += '<td><input type="color" name="colorCode" value="#000000" onchange="sendCode(this.value)" id="colorWell'+item.grade_no+'">'+'</td>'
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

	function sendCode(color) {
		var colorCode = color;
		$("getColorCode").val(color);
		$("#grade").submit();
		console.log(colorCode);
	}
	
	
	
	

</script>
</html>