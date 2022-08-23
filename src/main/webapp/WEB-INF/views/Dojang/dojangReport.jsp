<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>도장깨기 신고</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
table, th, td{
		border: 1px solid #ccc;
		border-collapse: collapse;
		line-height: 1.5;
		border-bottom: 1px solid #ccc;
		border-top: 1px solid #ccc;
		
	}
	td, th{
		padding: 5px 10px;
	}
	
table{
	 width: 400px;
	 height: 300px;
	 margin-left: auto;
	 margin-right: auto;
	 text-align: center;

}


#report_text {
  width:300px;
  height:30px;
  font-size:15px;
}

#reportYes {
	position: absolute;
	left: 220px;
	top: 350px;
	width:70px;
	height:35px;
}

#reportNo {
	position: absolute;
	left: 330px;
	top: 350px;
	width:70px;
	height:35px;
}
body {
		font-family: 'GmarketSansMedium';
	}
	@font-face {
		font-family: 'GmarketSansMedium';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
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
	select,option,textarea {
		font-family: 'GmarketSansMedium';
	}


</style>
</head>
<body>
<input type="hidden" id="loginId" value="${sessionScope.loginId}"/>
<input type="hidden" id="dojang_no" value="${sessionScope.dojang_no}"/>
<input type="hidden" id="reported" value="${sessionScope.reported}"/>
<br/>
	<table>
		<tr>
			<th colspan="2">사유 선택</th>
		</tr>
		<tr>
			<th>
			<input type="radio" name="report" value="욕설 및 비방"/>
			</th>
			<td>욕설 및 비방</td>
		</tr>
		<tr>
			<th>
			<input type="radio" name="report" value="광고 및 홍보"/>
			</th>
			<td>광고 및 홍보</td>
		</tr>
		<tr>
			<th>
			<input type="radio" name="report" value="부적절한 콘텐츠"/>
			</th>
			<td>부적절한 콘텐츠</td>
		</tr>
			<tr>
			<th>
			<input type="radio" name="report" value="기타"/>
			</th>
			<td>
			<input type="text" id="report_text" placeholder="기타 (직접 작성)" disabled/>
			</td>
		</tr>
	</table>
		<input type="button" value="신고" id="reportYes" onclick="dojangReport()"/>
		<input type="button" value="취소" id="reportNo" onclick="dojangReportclose()"/>
</body>
<script>

console.log($('#reported').val());



//"기타" 선택 시 활성화
$('input[name="report"]').on("change",function(){	
	if($('input[name="report"]:checked').val()=="기타"){
		$('#report_text').attr("disabled",false);
	}else{
		$('#report_text').val("");
		$('#report_text').attr("disabled",true);
	}
})



//글자 수 제한
$('#report_text').keyup(function(){
	  var content = $(this).val();
	  if (content.length > 100){
	    alert("최대 100자까지 입력 가능합니다.");
	    $(this).val(content.substring(0, 100));
	  }
});



function dojangReport(){
	
	var reporter = $('#loginId').val();
	var dojang_no = $('#dojang_no').val();
	var reported = $('#reported').val();
	var report_reason = $('input[name="report"]:checked').val();
	var report_text = $('#report_text').val();
	
	
	if(!$('input[name="report"]').is(":checked")){
		alert("신고 사유를 선택해 주세요");
	}else if(report_reason =="기타" && report_text ==""){
		alert("신고 사유를 입력해 주세요");
		report_text.focus();
	}else{
	

	$.ajax({
		type:'get',
		url:'dojangReport.ajax',
		data:{
			reporter:reporter,
			dojang_no:dojang_no,
			reported:reported,
			report_reason:report_reason,
			report_text:report_text

		},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if(data.dojangReport){
				console.log(data.dojangReport)
				opener.parent.location.reload();
				window.close();
			}else{
				alert("등록 실패");
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
	}
	
}



function dojangReportclose(){
	opener.parent.location.reload();
	window.close();
}


</script>
</html>