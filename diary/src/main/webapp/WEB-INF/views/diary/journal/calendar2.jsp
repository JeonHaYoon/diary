<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<title>달력</title>    
<%@ include file="../include/header.jsp"%>

<main id="app-main" class="app-main">
  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-3">
				<div class="app-action-panel" id="calendar-action-panel">
					<div class="action-panel-toggle" data-toggle="class" data-target="#calendar-action-panel" data-class="open">
						<i class="fa fa-chevron-right"></i>
						<i class="fa fa-chevron-left"></i>
					</div><!-- .app-action-panel -->
					
					<div class="m-b-lg">
						<a href="write"  class="btn btn-lg btn-primary btn-block">일기쓰기</a>
						<a href="todolist"  class="btn btn-lg btn-primary btn-block">투두리스트 작성</a>
					</div>
		

					<div class="app-actions-list scrollable-container">
						<div id="external-events" class="m-b-lg">
							<p class="m-b-lg text-muted fs-italic">Drag an event from the list and drop it onto the calendar</p>
							<div data-class="info" class="info external-event">My Event 1</div>
							<div data-class="purple" class="purple external-event">My Event 2</div>
							<div data-class="success" class="success external-event">My Event 2</div>
							<div data-class="warning" class="warning external-event">My Event 3</div>
							<div data-class="pink" class="pink external-event">My Event 4</div>
						</div>
						<div class="checkbox checkbox-primary">
							<input type="checkbox" id="drop-remove"/>
							<label for="drop-remove">remove after drop ?</label>
						</div>
					</div><!-- .app-actions-list -->
				</div><!-- .app-action-panel -->
			</div><!-- END column -->

			<div class="col-md-9">
				<div id="fullcalendar"></div>
			</div><!-- END column -->
		</div><!-- .row -->
	</section><!-- .app-content -->
</div><!-- .wrap -->

  <!-- APP FOOTER -->
    <%@ include file="../include/footer.jsp"%>