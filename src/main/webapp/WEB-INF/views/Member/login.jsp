<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="../resources/mainResource/assets/img/pizza-slice.png">
    <link rel="stylesheet" href="../resources/mainResource/assets/css/login.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-pen.css" rel="stylesheet">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>로그인</title>
</head>
<body>
    <a href="/"><h2>세상에서 가장 맛있는 만남, JMT</h2></a>
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form>
			<!-- <div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div> -->
			<!-- <span>use your email for registration</span> -->
			<div>
				<input class="joinInput" type="text" id="joinId" placeholder="ID" />
				<button class="chkBtn" type="button" onclick="idoverlay()">중복 확인</button>
			</div>
			<input class="joinInput" type="password" id="joinPw" placeholder="Password : 한글 제외, 4글자 이상" />
			<input class="joinInput" type="password" id="joinPw2" placeholder="Password 중복체크" />&nbsp;&nbsp;&nbsp;&nbsp;<font id="checkPw" size="2"></font>
			<input class="joinInput" type="text" id="joinName" placeholder="Name" />
			<div>
				<input class="joinInput" type="email" id="email" placeholder="ex) example@email.com" />
				<button class="chkBtn" type="button" onclick="emailoverlay()">중복 확인</button>
			</div>
			<p class="birthday">생년월일</p>
			<input class="joinInput" type="date" id="birth" placeholder="생년월일"/>
			<button class="origin" type="button" style="margin-top: 10px;" onclick="join()">Sign Up</button>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="./login.do" method="POST">
			<h1>Sign in</h1>
			<!-- <div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div> -->
			<span>use your account</span>
			<input type="text" name="id" placeholder="ID" />
			<input type="password" name="pw" placeholder="Password" />
			<div style="padding-bottom: 10px; padding-top: 10px;">
				<a href="./Member/idFind.go" style="padding-right: 10px;">아이디 찾기 </a>
				<a href="./Member/pwFind.go">비밀번호 찾기</a>
			</div><br/>
			<button>Sign In</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>반가워요!</h1>
				<p style="margin:20px 0 5px">회원 가입하고</p>
				<p>같이 밥 먹을래요?</p>
				<button class="ghost" id="signIn">Sign In</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>이제 혼밥은 그만,</h1>
				<p>같이 밥 먹을래요?</p>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
		</div>
	</div>
</div>

<footer>
	<!-- <p>
		Created with <i class="fa fa-heart"></i> by
		<a target="_blank" href="https://florin-pop.com">Florin Pop</a>
		- Read how I created this and how you can join the challenge
		<a target="_blank" href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.
	</p> -->
</footer>
</body>
<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
    
    var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
	
 	// 아이디 중복체크
	var overChkId = false;
	
	function idoverlay(){
		var id = $("#joinId").val();
		var idChk = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g; 
	      if(idChk.test($("#joinId").val())){
	          alert("아이디는 영어만 입력해주세요.");
	          return false; 
	       }
	      
	       if(id == ""|| id == null){
	         alert("아이디를 입력해주세요");
	         return false;
	      } 
		console.log('아이디 중복 체크 : '+id);		
		$.ajax({
			type:'get',
			url:'idoverlay.ajax',
			data:{chkId:id},
			dataType:'JSON',
			success:function(data){
			 if(data.idoverlay){
					alert("이미 사용중인 아이디 입니다.");
				}else{
					alert("사용 가능한 아이디 입니다.");
					overChkId = true;
				}
			},
			error:function(e){
				console.log(e);
			}			
		});
	}

	// 비밀번호 확인
	$('.joinInput').keyup(function(){
	    var pass1 = $("#joinPw").val();
	    var pass2 = $("#joinPw2").val();
	
	    if(pass1 != "" || pass2 != ""){
	        if(pass1 == pass2){
	            $("#checkPw").html('일치');
	            $("#checkPw").attr('color','green');
	        }else{
	            $("#checkPw").html('불일치');
	            $("#checkPw").attr('color','red');
	        }
	    }
	})
	
	//이메일 중복체크
	var overChkEmail = false; 

	function emailoverlay(){
		var email = $("#email").val();
		 if(email== "" || email == null){
	         alert("이메일을 입력해주세요");
	         return false;
	      }
		console.log('이메일 중복 체크 : '+email);		
		$.ajax({
			type:'get',
			url:'emailoverlay.ajax',
			data:{chkEmail:email},
			dataType:'JSON',
			success:function(data){
				if(data.emailoverlay){
					alert("이미 사용중인 이메일 입니다.");
				}else{
					alert("사용 가능한 이메일 입니다.");
					overChkEmail = true;
				}
			},
			error:function(e){
				console.log(e);
			}			
		});
	}
	
	//회원가입
	function join(){
		console.log('회원가입');
		var id = $('#joinId');
		var pw = $('#joinPw');
		var pw2 = $('#joinPw2');
		var name = $('#joinName');
		var email = $('#email');
		var birth = $('#birth');
		
		var pwdCheck = /^(?=.*[a-zA-Z]).{4,50}$/; 
		   
	    if(overChkId && overChkEmail){
	    	if(pw.val()=="") {
	    		alert("비밀번호를 입력해 주세요.");
	    		pw.focus();
	    	} else if(!pwdCheck.test($("#joinPw").val())) {
	    		alert("비밀번호는 한글을 제외한 4자리 이상이어야 합니다.");
	    		pw.focus();
	    		return false;
	    	} else if(pw.val() != pw2.val() ){
	    		alert("비밀번호가 일치하지 않습니다.");
				pw.focus();
	    	}
	    	
	    	else if(name.val() == ""){
				alert("이름을 입력해 주세요.");
				name.focus();
			}  else if(email.val() == ""){
				alert("이메일을 입력해 주세요.");
				email.focus();
			} else if(birth.val() == ""){
				alert("생년월일을 입력해 주세요.");
				birth.focus();
			} else {
				console.log("회원 가입 요청");
				
				$.ajax({
					type:'post',
					url:'join.ajax',
					data:{
						id:id.val(),
						pw:pw.val(),
						name:name.val(),
						email:email.val(),
						birth:birth.val()
					},
					dataType:'JSON',
					success:function(data){
						console.log(data);
						
						if(data.success){
							alert("회원가입에 성공 했습니다.");
							location.href='../login.go';
						}else{
							alert("회원가입에 실패 했습니다.");
						}
						
					},
					error:function(e){
						console.log(e);
						alert("회원가입에 실패 했습니다.");
					}
				});
			}
		} else {
			if(!overChkId){
				alert("아이디 중복체크를 진행해주세요.");
				id.focus();
			} else {
				alert("이메일 중복체크를 진행해 주세요");
				email.focus();
			}
		}
    }
</script>
</html>