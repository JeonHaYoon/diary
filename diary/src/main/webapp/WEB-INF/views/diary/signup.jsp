<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>SignUp</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta name="description" content="Admin, Dashboard, Bootstrap" />
	<link rel="shortcut icon" sizes="196x196" href="../assets/images/logo.png">
	
	<link rel="stylesheet" href="/diary/resources/libs/bower/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/diary/resources/libs/bower/material-design-iconic-font/dist/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="/diary/resources/libs/bower/animate.css/animate.min.css">
	<link rel="stylesheet" href="/diary/resources/assets/css/bootstrap.css">
	<link rel="stylesheet" href="/diary/resources/assets/css/core.css">
	<link rel="stylesheet" href="/diary/resources/assets/css/misc-pages.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900,300">
	
	<script src="/diary/libs/bower/jquery/dist/jquery.js"></script>
	
</head>

<body class="simple-page">
	<div id="back-to-home">
		<a href="/diary/main" class="btn btn-outline btn-default"><i class="fa fa-home animated zoomIn"></i></a>
	</div>
	<div class="simple-page-wrap">
		<div class="simple-page-logo animated swing">
			<a href="/diary/main">
				<span><i class="fa fa-gg"></i></span>
				<span>JPage</span>
			</a>
		</div><!-- logo -->	
		
		
				<div class="simple-page-form animated flipInY" id="signup-form">
					<h4 class="form-title m-b-xl text-center">회원가입</h4>
					
						<form action="" method="post">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						
						<!--  -->
						
						<div class="form-group">
							<input id="memberId" type="text" name="memberId" class="form-control" placeholder="아이디">							
							<p id="idErrMsg"></p>
						</div>
				
						<div class="form-group">
							<input id="memberPw" type="password" name="memberPw" class="form-control" placeholder="비밀번호">
							<p id="pwErrMsg"></p>
						</div>
						
						<div class="form-group">
							<input id="memberName" type="text" name="memberName" class="form-control" placeholder="이름">
							<p id="nameErrMsg"></p>
						</div>
						
						<div class="form-group">
							<input id="nickname" type="text" name="nickname" class="form-control" placeholder="닉네임">
							<p id="nickNameErrMsg"></p>							
						</div>
						
						<div class="form-group">
							<input id="region" type="text" name="region" class="form-control" placeholder="지역">
							<p id="regionErrMsg"></p>
						</div>
				
						<div class="form-group">
							<input id="email" type="email" name="email" class="form-control" placeholder="이메일">
							<p id="emailErrMsg"></p>
						</div>
						
						<div class="form-group">
							<input id="birth" type="text" name="birth" class="form-control" placeholder="생년월일(ex:19990101)">
							<p id="birthErrMsg"></p>
						</div>
				
						<div class="form-group">
							<input id="genderM" type="radio" name="gender" value="M" placeholder="남">M
							<input id="genderF" type="radio" name="gender" value="F" placeholder="여">F
							<p id="genderErrMsg"></p>
						</div>
				
						<input type="submit" class="btn btn-primary" value="회원가입">
						<button type="button" class="btn btn-primary">취소</button>
						
						</form>
				
				
				</div>
				
				<div class="simple-page-footer">
					<p>
						<small>Do you have an account ?</small>
						<a href="login">로그인</a>
					</p>
				</div><!-- .simple-page-footer -->

	</div><!-- .simple-page-wrap -->

<script>


var pwValidate = -1;

$(document).ready(function(){		
	
	//아이디  중복여부 확인
	$('#memberId').on("blur", function(){
		let memberId = $('#memberId').val().trim();
		
		if(memberId == ''){
			$('#idErrMsg').text('아이디를 6~16글자 입력하셔야합니다.');
			$('#idErrMsg').css('color','red');
			$('#memberId').focus();
		} else if(memberId.length < 6 || memberId.length > 16){
			$('#idErrMsg').text('아이디를 6~16글자 입력하셔야합니다.');
			$('#idErrMsg').css('color','red');
			$('#memberId').focus();
		} else {
			$('#idErrMsg').text('');
			$('#idErrMsg').css('color','');
			//Ajax 를 이용한 아이디 중복체크
			//중복된 아이디입니다.
			//사용가능한 아이디입니다.
			// ajax 통신
			//console.log(memberId);
		   
			$.ajax({
		        type : "GET",            // HTTP method type(GET, POST,,,,,) 형식이다.
		        url : "/diary/idcheck",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {memberId:memberId},            // Json 형식의 데이터이다.
		    	dataType : 'json',
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	console.log(res);
		        	// 응답코드 > 0000
		            //사용가능한 아이디입니다.
		            if(res == 0){
						
		    			$('#idErrMsg').text('사용가능한 아이디입니다.');
		    			$('#idErrMsg').css('color','green');
		            } else { //중복된 아이디입니다.
		    			$('#idErrMsg').text('중복된 아이디입니다.');
		    			$('#idErrMsg').css('color','red');
		    			$('#memberId').focus();
		            }
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		        	
		        	console.log("통신 실패." +XMLHttpRequest)
		        	console.log("통신 실패." +textStatus)
		        	console.log("통신 실패." +errorThrown)
		        }
		    });
		}
	});	
	
	$('#memberPw').on("keyup", function(){
		let memberPw = $('#memberPw').val().trim();
		let reg =  /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
		//console.log("현재값:"+pwValidate);
		pwValidate = -1;
		if(memberPw == ''){
			$('#pwErrMsg').text('비밀번호를 6~16글자 입력하셔야합니다.');
			$('#pwErrMsg').css('color','red');
		} else if(memberPw.length < 6 || memberPw.length > 16){
			$('#pwErrMsg').text('비밀번호를 6~16글자 입력하셔야합니다.');
			$('#pwErrMsg').css('color','red');
		} else if(!reg.test(memberPw) ) {	
			$('#pwErrMsg').text('영문자, 숫자, 특수문자 각1개이상 입력하셔야합니다.');
			$('#pwErrMsg').css('color','red');			
		} else {	
			$('#pwErrMsg').text('');
			pwValidate = 0;	
		}
		
		//console.log("결과값:"+pwValidate);
	});//$('#memberPw').on("keyup", function(){
		
		
	//닉네임  중복여부 확인
	$('#nickname').on("blur", function(){
		let nickname = $('#nickname').val().trim();
		let reg =   /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/;
		
		if(nickname == ''){
			$('#nickNameErrMsg').text('닉네임은 2~10글자 입력하셔야합니다.');
			$('#nickNameErrMsg').css('color','red');
			$('#nickname').focus();
		} else if(nickname.length < 2 || nickname.length > 10){
			$('#nickNameErrMsg').text('닉네임은 2~10글자 입력하셔야합니다.');
			$('#nickNameErrMsg').css('color','red');
			$('#nickname').focus();
		} else if(!reg.test(nickname) ) {	
			$('#nickNameErrMsg').text('한글, 숫자, 영어로만 입력하셔야합니다.');
			$('#nickNameErrMsg').css('color','red');			
		} else {
			$('#nickNameErrMsg').text('');
			$('#nickNameErrMsg').css('color','');
			//Ajax 를 이용한 아이디 중복체크
			//중복된 아이디입니다.
			//사용가능한 아이디입니다.
			// ajax 통신
			console.log(nickname);
		   
			$.ajax({
		        type : "GET",            // HTTP method type(GET, POST,,,,,) 형식이다.
		        url : "/diary/nickcheck",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {nickname:nickname},            // Json 형식의 데이터이다.
		    	dataType : 'json',
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	console.log(res);
		        	// 응답코드 > 0000
		            //사용가능한 아이디입니다.
		            if(res == 0){
						
		    			$('#nickNameErrMsg').text('사용가능한 닉네임입니다.');
		    			$('#nickNameErrMsg').css('color','green');
		            } else { //중복된 아이디입니다.
		    			$('#nickNameErrMsg').text('중복된 닉네임입니다.');
		    			$('#nickNameErrMsg').css('color','red');
		    			$('#nickname').focus();
		            }
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		        	
		        	console.log("통신 실패." +XMLHttpRequest)
		        	console.log("통신 실패." +textStatus)
		        	console.log("통신 실패." +errorThrown)
		        }
		    });
		}
	});		
	
	
	//이메일  중복여부 확인
	$('#email').on("blur", function(){
		let email = $('#email').val().trim();
		
		if(email == ''){
			$('#emailErrMsg').text('이메일을 입력하셔야합니다.');
			$('#emailErrMsg').css('color','red');
			$('#email').focus();
		} else {
			$('#emailErrMsg').text('');
			$('#emailErrMsg').css('color','');
			//Ajax 를 이용한 아이디 중복체크
			//중복된 아이디입니다.
			//사용가능한 아이디입니다.
			// ajax 통신
			console.log(email);
		   
			$.ajax({
		        type : "GET",            // HTTP method type(GET, POST,,,,,) 형식이다.
		        url : "/diary/emailcheck",      // 컨트롤러에서 대기중인 URL 주소이다.
		        data : {email:email},            // Json 형식의 데이터이다.
		    	dataType : 'json',
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	console.log(res);
		        	// 응답코드 > 0000
		            //사용가능한 아이디입니다.
		            if(res == 0){
						
		    			$('#emailErrMsg').text('사용가능한 메일입니다.');
		    			$('#emailErrMsg').css('color','green');
		            } else { //중복된 아이디입니다.
		    			$('#emailErrMsg').text('중복된 메일입니다.');
		    			$('#emailErrMsg').css('color','red');
		    			$('#email').focus();
		            }
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		        	
		        	console.log("통신 실패." +XMLHttpRequest)
		        	console.log("통신 실패." +textStatus)
		        	console.log("통신 실패." +errorThrown)
		        }
		    });
		}
	});		
	
	
	$('input[type=submit]').on("click", function(e){
		e.preventDefault();
		
		let memberId = $('#memberId').val().trim();
		let memberPw = $('#memberPw').val().trim();
		let memberName = $('#memberName').val().trim();
		let nickname = $('#nickname').val().trim();
		let region = $('#region').val().trim();
		let email = $('#email').val().trim();
		let birth = $('#birth').val().trim();
		let gender = $('input[name=gender]:checked').val();

		if(memberId == ''){
			$('#idErrMsg').text("아이디를 입력하셔야합니다.");
			$('#idErrMsg').css('color','red');
			$('#memberId').focus();
		} else if(memberPw == ''){
			$('#idErrMsg').text('');
			$('#pwErrMsg').text("비밀번호를 입력하셔야합니다.");
			$('#pwErrMsg').css('color','red');
			$('#memberPw').focus();
		} else if(memberName == ''){
			$('#pwErrMsg').text('');
			$('#nameErrMsg').text("이름을을 입력하셔야합니다.");
			$('#nameErrMsg').css('color','red');
			$('#memberName').focus();
		}	else if(nickname == ''){
			$('#nameErrMsg').text('');
			$('#nickNameErrMsg').text("닉네임을 입력하셔야합니다.");
			$('#nickNameErrMsg').css('color','red');
			$('#nickname').focus();
		} else if(region == ''){
			$('#nickNameErrMsg').text('');
			$('#regionErrMsg').text("지역을 입력하셔야합니다.");
			$('#regionErrMsg').css('color','red');
			$('#region').focus();
		} else if(email == ''){
			$('#regionErrMsg').text('');
			$('#emailErrMsg').text("이메일을 입력하셔야합니다.");
			$('#emailErrMsg').css('color','red');
			$('#email').focus();
		}else if(birth == ''){
			$('#emailErrMsg').text('');
			$('#birthErrMsg').text("생년월일을 입력하셔야합니다.");
			$('#birthErrMsg').css('color','red');
			$('#birth').focus();
		} else if(gender == ''){
			$('#birthErrMsg').text('');
			$('#genderErrMsg').text("성별을 선택하셔야합니다.");
			$('#genderErrMsg').css('color','red');
			$('#gender').focus();
		} else {
			//회원가입단추를 제거후 값전송
			//$(this).hide();
			//$(this).addClass("disabled");
			//$(this).attr("disabled","disabled");//html
			$(this).prop("disabled", true);//javascript
			$('form').submit();
		}
		
	});		
	
});


	
</script>

</body>
</html>