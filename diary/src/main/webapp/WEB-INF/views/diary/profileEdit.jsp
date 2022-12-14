<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta name="description" content="Admin, Dashboard, Bootstrap" />
	<link rel="shortcut icon" sizes="196x196" href="/diary/resources/assets/images/logo.png">
	<title>프로필 수정</title>
	
	<link rel="stylesheet" href="/diary/resources/libs/bower/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/diary/resources/libs/bower/material-design-iconic-font/dist/css/material-design-iconic-font.css">
	<!-- build:css /diary/resources/assets/css/app.min.css -->
	<link rel="stylesheet" href="/diary/resources/libs/bower/animate.css/animate.min.css">
	<link rel="stylesheet" href="/diary/resources/libs/bower/fullcalendar/dist/fullcalendar.min.css">
	<link rel="stylesheet" href="/diary/resources/libs/bower/perfect-scrollbar/css/perfect-scrollbar.css">
	<link rel="stylesheet" href="/diary/resources/assets/css/bootstrap.css">
	<link rel="stylesheet" href="/diary/resources/assets/css/core.css">
	<link rel="stylesheet" href="/diary/resources/assets/css/app.css">
	<!-- endbuild -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900,300">
	<script src="/diary/resources/libs/bower/breakpoints.js/dist/breakpoints.min.js"></script>
	<script>
		Breakpoints();
	</script>
</head>

<style>
.wrap {
	padding-bottom: 1.5rem;
}
</style>
	
<body class="menubar-top menubar-light theme-primary">
<!--============= start main area -->
<!-- APP NAVBAR ==========-->
<nav id="app-navbar" class="navbar navbar-inverse navbar-fixed-top primary">
  
  <!-- navbar header -->
  <div class="navbar-header">
    <button type="button" id="menubar-toggle-btn" class="navbar-toggle visible-xs-inline-block navbar-toggle-left hamburger hamburger--collapse js-hamburger">
      <span class="sr-only">Toggle navigation</span>
      <span class="hamburger-box"><span class="hamburger-inner"></span></span>
    </button>

    <button type="button" class="navbar-toggle navbar-toggle-right collapsed" data-toggle="collapse" data-target="#app-navbar-collapse" aria-expanded="false">
      <span class="sr-only">Toggle navigation</span>
      <span class="zmdi zmdi-hc-lg zmdi-more"></span>
    </button>

    <button type="button" class="navbar-toggle navbar-toggle-right collapsed" data-toggle="collapse" data-target="#navbar-search" aria-expanded="false">
      <span class="sr-only">Toggle navigation</span>
      <span class="zmdi zmdi-hc-lg zmdi-search"></span>
    </button>

    <a href="/diary/resources/index.html" class="navbar-brand">
      <span class="brand-icon"><i class="fa fa-gg"></i></span>
      <span class="brand-name">JPage</span>
    </a>
  </div><!-- .navbar-header -->
  
  <div class="navbar-container container-fluid">
    <div class="collapse navbar-collapse" id="app-navbar-collapse">
      <ul class="nav navbar-toolbar navbar-toolbar-left navbar-left">
        <li class="hidden-float hidden-menubar-top">
          <a href="javascript:void(0)" role="button" id="menubar-fold-btn" class="hamburger hamburger--arrowalt is-active js-hamburger">
            <span class="hamburger-box"><span class="hamburger-inner"></span></span>
          </a>
        </li>
        <li>
          <h5 class="page-title hidden-menubar-top">Dashboard</h5>
        </li>
      </ul>

    </div>
  </div><!-- navbar-container -->
</nav>
<!--========== END app navbar -->

<!-- APP ASIDE ==========-->
<aside id="menubar" class="menubar light">
  <div class="app-user">
    <div class="media">
      <div class="media-left">
        <div class="avatar avatar-md avatar-circle">
          <a href="javascript:void(0)"><img class="img-responsive" src="/diary/resources/images/dog.jpg" alt="avatar"/></a>
        </div><!-- .avatar -->
      </div>
      <div class="media-body">
        <div class="foldable">
          <h5><a href="javascript:void(0)" class="username">John Doe</a></h5>
          <ul>
            <li class="dropdown">
              <a href="javascript:void(0)" class="dropdown-toggle usertitle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <small>Web Developer</small>
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu animated flipInY">
                <li>
                  <a class="text-color" href="/index.html">
                    <span class="m-r-xs"><i class="fa fa-home"></i></span>
                    <span>Home</span>
                  </a>
                </li>
                <li>
                  <a class="text-color" href="profile.html">
                    <span class="m-r-xs"><i class="fa fa-user"></i></span>
                    <span>Profile</span>
                  </a>
                </li>
                <li role="separator" class="divider"></li>
                <li>
                  <a class="text-color" href="logout">
                    <span class="m-r-xs"><i class="fa fa-power-off"></i></span>
                    <span>Logout</span>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div><!-- .media-body -->
    </div><!-- .media -->
  </div><!-- .app-user -->

  <div class="menubar-scroll">
    <div class="menubar-scroll-inner">
      <ul class="app-menu">
        <li class="has-submenu">
          <a href="javascript:void(0)" class="submenu-toggle">
            <i class="menu-icon zmdi zmdi-view-dashboard zmdi-hc-lg"></i>
            <span class="menu-text">일기</span>
            <i class="menu-caret zmdi zmdi-hc-sm zmdi-chevron-right"></i>
          </a>
          <ul class="submenu">
            <li><a href="journal/write"><span class="menu-text">나의 일기</span></a></li>
            <li><a href="journal/readAll"><span class="menu-text">다른 사람 일기</span></a></li>
          </ul>
        </li>
        

        <li class="menu-separator"><hr></li>

        <li>
          <a href="journal/todolist">
            <i class="menu-icon zmdi zmdi-file-text zmdi-hc-lg"></i>
            <span class="menu-text">해야할 일</span>
          </a>
        </li>

        <li>
          <a href="select/selectOne">
            <i class="menu-icon zmdi zmdi-settings zmdi-hc-lg"></i>
            <span class="menu-text">A OR B</span>
          </a>
        </li>
        
        <li>
          <a href="map/searchPlace">
            <i class="menu-icon zmdi zmdi-settings zmdi-hc-lg"></i>
            <span class="menu-text">장소 검색</span>
          </a>
        </li>
        
        
       
      </ul><!-- .app-menu -->
    </div><!-- .menubar-scroll-inner -->
  </div><!-- .menubar-scroll -->
</aside>
<!--========== END app aside -->

<!-- navbar search -->
<div id="navbar-search" class="navbar-search collapse">
  <div class="navbar-search-inner">
    <form action="#">
      <span class="search-icon"><i class="fa fa-search"></i></span>
      <input class="search-field" type="search" placeholder="search/diary/resources."/>
    </form>
    <button type="button" class="search-close" data-toggle="collapse" data-target="#navbar-search" aria-expanded="false">
      <i class="fa fa-close"></i>
    </button>
  </div>
  <div class="navbar-search-backdrop" data-toggle="collapse" data-target="#navbar-search" aria-expanded="false"></div>
</div><!-- .navbar-search -->

<main id="app-main" class="app-main">
<div class="wrap">
  <div class="profile-header">
	<div class="profile-cover">
		<div class="cover-user m-b-lg">
			
			<form action="" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<div class="text-center">
					<div class="avatar avatar-xl avatar-circle">
						<a href="javascript:void(0)">
							<img class="img-responsive" src="/diary/resources/images/dog.jpg" alt="avatar"/>
						</a>
					</div><!-- .avatar -->
	
					<h4 class="profile-info-name m-b-lg">
						<input type="text" id="nickname" name="nickname" required="required" value="${member.nickname}">
						<p id="nickNameErrMsg"></p>	
					</h4>
					<div>
						<h5><input id="memberId" name="memberId" type="hidden" value="${member.memberId}"></h5>
						<h5>${member.memberId}</h5>
						<h5><p>${member.birth}</p></h5>
						<h5><input id="email" name="email" type="text" required="required" value="${member.email}"></h5>
						<p id="emailErrMsg"></p>
						<h5><input  id="region" name="region" type="text" required="required" value="${member.region}"></h5>
						<p id="regionErrMsg"></p>
					</div>
					<button type="submit" id="btn_edit" class="btn btn-success btn-sm">변경</button>
				</div>
				
				
			
			</form>
			
			
			
		</div>
		
	</div><!-- .profile-cover -->

</div><!-- .profile-header -->


</div><!-- .wrap -->


  <!-- APP FOOTER -->
  <div class="wrap p-t-0">
    <footer class="app-footer">
      <div class="clearfix">
        <ul class="footer-menu pull-right">
          <li><a href="javascript:void(0)">Careers</a></li>
          <li><a href="javascript:void(0)">Privacy Policy</a></li>
          <li><a href="javascript:void(0)">Feedback <i class="fa fa-angle-up m-l-md"></i></a></li>
        </ul>
        <div class="copyright pull-left">Copyright RaThemes 2016 &copy;</div>
      </div>
    </footer>
  </div>
  <!-- /#app-footer -->
</main>
<!--========== END app main -->

	<!-- build:js /diary/resources/assets/js/core.min.js -->
	<script src="/diary/resources/libs/bower/jquery/dist/jquery.js"></script>
	<script src="/diary/resources/libs/bower/jquery-ui/jquery-ui.min.js"></script>
	<script src="/diary/resources/libs/bower/jQuery-Storage-API/jquery.storageapi.min.js"></script>
	<script src="/diary/resources/libs/bower/bootstrap-sass/assets/javascripts/bootstrap.js"></script>
	<script src="/diary/resources/libs/bower/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script src="/diary/resources/libs/bower/perfect-scrollbar/js/perfect-scrollbar.jquery.js"></script>
	<script src="/diary/resources/libs/bower/PACE/pace.min.js"></script>
	<!-- endbuild -->

	<!-- build:js /diary/resources/assets/js/app.min.js -->
	<script src="/diary/resources/assets/js/library.js"></script>
	<script src="/diary/resources/assets/js/plugins.js"></script>
	<script src="/diary/resources/assets/js/app.js"></script>
	<!-- endbuild -->
	<script src="/diary/resources/libs/bower/moment/moment.js"></script>
	<script src="/diary/resources/libs/bower/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="/diary/resources/assets/js/fullcalendar.js"></script>
	
<script type="text/javascript">


$(document).ready(function () {
	
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
			//console.log(nickname);
		   
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
			//console.log(email);
		   
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
	
      $('#btn_edit').click(function () {
          
          var nickname = $('#nickname').val().trim();
          var email = $('#email').val().trim();
          var region = $('#region').val().trim();
			
          if(nickname == ''){
        	 alert("닉네임을 입력해주세요");
          } else if(email == ''){
        	  alert("이메일을 입력해주세요");
          } else if(region == ''){
        	  alert("지역을 입력해주세요");
          } else{
        	 $('form').submit();
          }
          
        });

      });
      
      
      
      
</script>
	
	
</body>
</html>