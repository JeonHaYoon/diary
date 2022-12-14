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
	
	<link rel="stylesheet" href="/diary/resources/libs/bower/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/diary/resources/libs/bower/material-design-iconic-font/dist/css/material-design-iconic-font.css">
	<!-- build:css /diary/resources/assets/css/app.min.css -->
	<link rel="stylesheet" href="/diary/resources/libs/bower/animate.css/animate.min.css">
	<link rel="stylesheet" href="/diary/resources/libs/bower/fullcalendar/dist/fullcalendar.min.css">
	<link rel="stylesheet" href="/diary/resources/libs/bower/perfect-scrollbar/css/perfect-scrollbar.css">
	<link rel="stylesheet" href="/diary/resources/assets/css/bootstrap.css">
	<link rel="stylesheet" href="/diary/resources/assets/css/core.css">
	<link rel="stylesheet" href="/diary/resources/assets/css/app.css">

	
	<!-- build:js /admin/resources/assets/js/core.min.js -->
	<script src="/admin/resources/libs/bower/jquery/dist/jquery.js"></script>
	<script src="/admin/resources/libs/bower/jquery-ui/jquery-ui.min.js"></script>
	<script src="/admin/resources/libs/bower/jQuery-Storage-API/jquery.storageapi.min.js"></script>
	<script src="/admin/resources/libs/bower/bootstrap-sass/assets/javascripts/bootstrap.js"></script>
	<script src="/admin/resources/libs/bower/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script src="/admin/resources/libs/bower/perfect-scrollbar/js/perfect-scrollbar.jquery.js"></script>
	<script src="/admin/resources/libs/bower/PACE/pace.min.js"></script>
	<!-- endbuild -->
	
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

    <a href="/main" class="navbar-brand">
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
                  <a class="text-color" href="../main">
                    <span class="m-r-xs"><i class="fa fa-home"></i></span>
                    <span>Home</span>
                  </a>
                </li>
                <li>
                  <a class="text-color" href="../profile">
                    <span class="m-r-xs"><i class="fa fa-user"></i></span>
                    <span>Profile</span>
                  </a>
                </li>               
                <li role="separator" class="divider"></li>
                <li>
                  <a class="text-color" href="../logout">
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
            <span class="menu-text">??????</span>
            <i class="menu-caret zmdi zmdi-hc-sm zmdi-chevron-right"></i>
          </a>
          <ul class="submenu">
            <li><a href="journal/write"><span class="menu-text">????????????</span></a></li>
            <li><a href="journal/list"><span class="menu-text">?????? ??????</span></a></li>
            <li><a href="journal/readAll"><span class="menu-text">?????? ?????? ??????</span></a></li>
          </ul>
        </li>
        

        <li class="menu-separator"><hr></li>

        <li>
          <a href="todo/todolist">
            <i class="menu-icon zmdi zmdi-file-text zmdi-hc-lg"></i>
            <span class="menu-text">????????? ???</span>
          </a>
        </li>

        <li>
          <a href="select/selectList">
            <i class="menu-icon zmdi zmdi-settings zmdi-hc-lg"></i>
            <span class="menu-text">A OR B</span>
          </a>
        </li>
        
        <li>
          <a href="map/searchPlace">
            <i class="menu-icon zmdi zmdi-settings zmdi-hc-lg"></i>
            <span class="menu-text">?????? ??????</span>
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
	<section class="app-content">
		<div class="row">			
				<div class="widget p-md clearfix">
					<div class="pull-right">
						<h3 class="widget-title">????????? JPage??? ?????? ?????? ???????????????.</h3>						
					</div>
				</div><!-- .widget -->			
		</div><!-- .row -->

		<div class="row">
			<div class="col-md-4 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">100</span></h3>							
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-file-text-o"></i></span>
					</div>
					<footer class="widget-footer bg-warning">
						<small class="text-color">Total diary</small>
					</footer>
				</div><!-- .widget -->
			</div>

			<div class="col-md-4 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-danger"><span class="counter" data-plugin="counterUp">150</span></h3>							
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-file-text-o"></i></span>
					</div>
					<footer class="widget-footer bg-danger">
						<small class="text-color">Total Select</small>
					</footer>
				</div><!-- .widget -->
			</div>

			<div class="col-md-4 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-success"><span class="counter" data-plugin="counterUp">200</span></h3>							
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-user"></i></span>
					</div>
					<footer class="widget-footer bg-success">
						<small class="text-color">Total Member</small>
					</footer>
				</div><!-- .widget -->
			</div>
		</div>	

		<div class="row">
			<div class="col-md-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Best Diary</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body">
						<div class="table-responsive">							
							<table class="table no-cellborder">
								<thead>
									<tr><th></a>??????</th><th>?????????</th><th>?????????</th><th>?????????</th></tr>
								</thead>
								<tbody>
									<tr><td><a href="#">??????????????????</td><td>100</td><td>??????</td><td>2022/12/30</td></tr>
								</tbody>
							</table>
						</div>
					</div>
				</div><!-- .widget -->
			</div><!-- END column -->
			
			<div class="col-md-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Best Select</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body">
						<div class="table-responsive">							
							<table class="table no-cellborder">
								<thead>
									<tr><th>??????</th><th>?????????</th><th>?????????</th><th>?????????</th></tr>
								</thead>
								<tbody>
									<tr><td><a href="#">??????vs??????</td><td>100</td><td>??????</td><td>2022/12/30</td></tr>
								</tbody>
							</table>
						</div>
					</div>
				</div><!-- .widget -->
			</div><!-- END column -->

			<div class="col-md-12">
				<div class="widget todo-widget">
					<header class="widget-header">
						<h4 class="widget-title">Todo List</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body p-b-0">
						<ul class="todo-list">
							<li class="todo-item">
								<div class="checkbox checkbox-default">
									<label>?????????????????????</label>
								</div>
							</li><!-- .todo-item -->
							
							<li class="todo-item">
								<div class="checkbox checkbox-default">
									<label>??????????????? ?????????</label>
								</div>
							</li><!-- .todo-item -->
							
							
							<li class="todo-item">
								<div class="checkbox checkbox-default">
									<label>???????????????</label>
								</div>
							</li><!-- .todo-item -->
							
							<li class="todo-item">
								<div class="checkbox checkbox-default">
									<label>????????? ??????</label>
								</div>
							</li><!-- .todo-item -->						

							
						</ul><!-- .todo-list -->
					</div>
					<footer class="widget-footer">
						<a href="javascript:void(0)" class="btn btn-sm btn-default pull-right">?????????...</a>
					</footer>
				</div><!-- .widget -->
			</div>
		</div><!-- .row -->

	</section><!-- #dash-content -->
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
	
	 

  
</body>
</html>