<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>등급 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="../resources/mainResource/assets/img/pizza-slice.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap core CSS     -->
    <link href="../resources/etcResource/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="../resources/etcResource/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="../resources/etcResource/assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="../resources/etcResource/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

<style>

table {
    width: 80%;
    height: 200px;
  }
  
th {
    text-align: center;
	}
	
	
	
</style>
</head>
<body>
	
	
        
        <!--사이드바 시작-->
    <div class="wrapper">
     <div class="sidebar" data-color="purple">


    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="jmtMain.html" class="simple-text">
                    JMT
                </a>
            </div>
            <ul class="nav">
                <!--유저 사진, 이름-->
                <li class="dojangParty">
                </li>
                <li>
                    <a href="/report/">
                        <i class="pe-7s-comment"></i>
                        <p>신고 목록</p>
                    </a>
                </li>
                <li>
                    <a href="/report/blind.go">
                        <i class="pe-7s-config"></i>
                        <p>블라인드</p>
                    </a>
                </li>
                <li>
                    <a href="/report/memberList.go">
                        <i class="pe-7s-users"></i>
                        <p>회원 관리</p>
                    </a>
                </li>
                <li class="active">
                    <a href="/grade.go">
                        <i class="pe-7s-note"></i>
                        <p>등급 관리</p>
                    </a>
                </li>
                <li>
                    <a href="/resUpdateList.go">
                        <i class="pe-7s-pen"></i>
                        <p>맛집 수정</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>
    <!--사이드바 끝-->

    <!--상단바 시작-->
    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">신고 목록 페이지</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                       
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="/">
                                <p>Home</p>
                             </a>
                         </li>
                 
                           <li>
                              <a href="#">
                                <p>${loginId}</p>
                            </a>
                         </li>
                        <li>
                            <a href="/logout.do">
                                <p>Log out</p>
                            </a>
                        </li>
						<li class="separator hidden-lg"></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--상단바 끝-->
        
        
        
        <div class="content">
            <div class="container-fluid">
                <!--여기에 <div class="row">로 시작해서 내용을 넣어주세요 -->
                <div class="row">
                    <!--표 시작-->
                    <div class="col-md-12">
                        <div class="card">
                           
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th></th>
                                    	<th>등급 이름</th>
                                    	<th>게시글</th>
                                    	<th>댓글</th>
                                    	<th>색상</th>
                                    </thead>
                                    <tbody>
                                       <form action="grade" method="post" style="margin-bottom: 0px">
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
                                        </form>
                                        <form action="grade" method="post" style="margin-bottom: 0px">
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
                                        </form>
                                        <form action="grade" method="post" style="margin-bottom: 0px" >
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
                                        </form>
                                        <form action="grade" method="post" style="margin-bottom: 0px">
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
                                        </form>
                                        <form action="grade" method="post">
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
                                        </form>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                   <!--표 끝-->
                </div>

	
		


 	<%-- <form action="grade" method="post" id="grade" style="margin-bottom: 0px">
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
	</form> --%>
			
		</body>
<script>

var msg = "${msg}";
	if(msg != ""){
	alert(msg);
}


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