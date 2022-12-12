<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta name="description" content="Admin, Dashboard, Bootstrap" />
	<link rel="shortcut icon" sizes="196x196" href="/diary/resources/assets/images/logo.png">
	<title>To Do List</title>
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
      <span class="brand-name">Infinity</span>
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
          <a href="javascript:void(0)"><img class="img-responsive" src="/diary/resources/assets/images/221.jpg" alt="avatar"/></a>
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
                <li>
                  <a class="text-color" href="settings.html">
                    <span class="m-r-xs"><i class="fa fa-gear"></i></span>
                    <span>Settings</span>
                  </a>
                </li>
                <li role="separator" class="divider"></li>
                <li>
                  <a class="text-color" href="logout.html">
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
            <li><a href="index.html"><span class="menu-text">일기</span></a></li>
            <li><a href="dashboard.2.html"><span class="menu-text">나의 일기</span></a></li>
            <li><a href="dashboard.3.html"><span class="menu-text">다른 사람 일기</span></a></li>
          </ul>
        </li>
        

        <li class="menu-separator"><hr></li>

        <li>
          <a href="documentation.html">
            <i class="menu-icon zmdi zmdi-file-text zmdi-hc-lg"></i>
            <span class="menu-text">해야할 일</span>
          </a>
        </li>

        <li>
          <a href="javascript:void(0)">
            <i class="menu-icon zmdi zmdi-settings zmdi-hc-lg"></i>
            <span class="menu-text">A OR B</span>
          </a>
        </li>
        
         <li>
          <a href="javascript:void(0)">
            <i class="menu-icon zmdi zmdi-settings zmdi-hc-lg"></i>
            <span class="menu-text">맛집 추천</span>
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

<!-- APP MAIN ==========-->
<main id="app-main" class="app-main">
  <div class="wrap">
		<div class="widget">
			<header class="widget-header">
				<h4 class="widget-title">To do List</h4>
			</header><!-- .widget-header -->
			<hr class="widget-separator">
			<div class="widget-body">
				<div class="m-b-lg">
					<small>
						<!-- 설명 -->
					</small>
				</div>
				
					<div class="form-group">
									<label for="datetimepicker2">Minimum Setup</label>
									<div class='input-group date' id='datetimepicker2' data-plugin="datetimepicker">
										<input type='text' class="form-control" />
										<span class="input-group-addon bg-info text-white">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
					</div>
								
				<form method="post" class="form-horizontal" action="">
					<table class="table" id="crew">
						<tr>
							<th>#</th><th>할 일</th><th>완료여부</th><th></th>
						</tr>
						<tr>
							<td>1</td>
							<td><input class="form-control"></td>
							<td><button class="btn btn-warning">완료</button></td>
							<td><button type="button" id="" class="btn btn-default" onclick="addItem(this)">+</button>
							<button type="button" id="" class="btn btn-default" onclick="delItem(this)">-</button></td>
						</tr>
					</table>
				</form>
			</div><!-- .widget-body -->
		</div><!-- .widget -->
	</div><!-- END column -->

<!-- new label Modal -->
<div id="labelModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Create / update label</h4>
			</div>
			<form action="#" id="newCategoryForm">
				<div class="modal-body">
					<div class="form-group m-0">
						<input type="text" id="catLabel" class="form-control" placeholder="Label">
					</div>
				</div><!-- .modal-body -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-success" data-dismiss="modal">Save</button>
				</div><!-- .modal-footer -->
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- delete item Modal -->
<div id="deleteItemModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Delete item</h4>
			</div>
			<div class="modal-body">
				<h5>Do you really want to delete this item ?</h5>
			</div><!-- .modal-body -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Delete</button>
			</div><!-- .modal-footer -->
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
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
<script>
function delItem(t){
	let len = $('#crew tr').length;
	if(len > 2){
		$(t).parent().parent().remove();
		let html = "";
		html += '<button type="button" id="" class="btn btn-default" onclick="addItem(this)">+</button>';
		html += '<button type="button" id="" class="btn btn-default" onclick="delItem(this)">-</button>';
		//console.log(len);
		$("#crew > tbody > tr:nth-child("+(len-1)+") > td:nth-child(4)").append(html);
	}
}
function addItem(t){
	
	//자신삭제
	$(t).parent().empty();
	
	let len = $('#crew tr').length;
	console.log(len);
	
	let html = "";
	html += '<tr>';
	html += '<td>'+len+'</td>';
	html += '<td><input class="form-control"></td>';
	html += '<td><button class="btn btn-warning">완료</td>';
	html += '<td><button type="button" id="" class="btn btn-default" onclick="addItem(this)">+</button>';
	html += '<button type="button" id="" class="btn btn-default" onclick="delItem(this)">-</button></td>';
	html += '</tr>';
	
	console.log("addItem"+html);
	
	$('#crew:last').append(html);
}


$(document).ready(function(){
	//오늘 사용안함
	
});
</script> 
	


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
	
</body>
</html>