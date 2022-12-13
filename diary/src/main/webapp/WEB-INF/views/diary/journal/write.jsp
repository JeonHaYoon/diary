<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>일기 쓰기</title>    
<%@ include file="../include/header.jsp"%>

<main id="app-main" class="app-main">
  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-2">
				<div class="app-action-panel" id="compose-action-panel">
					<div class="action-panel-toggle" data-toggle="class" data-target="#compose-action-panel" data-class="open">
						<i class="fa fa-chevron-right"></i>
						<i class="fa fa-chevron-left"></i>
					</div><!-- .app-action-panel -->

					<div class="m-b-lg">
						<a href="calendar.jsp" type="button" class="btn action-panel-btn btn-default btn-block">목록보기</a>
					</div>

					<div class="app-actions-list scrollable-container">
						<!-- mail category list -->
						<div class="list-group">
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-envelope"></i>Inbox</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-star"></i>Starred</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-bookmark"></i>Important</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-paper-plane"></i>Sent</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-exclamation-triangle"></i>Drafts</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-folder"></i>All Mail</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-exclamation-circle"></i>Spam</a>
							<a href="javascript:void(0)" class="text-color list-group-item"><i class="m-r-sm fa fa-trash"></i>Trash</a>
						</div><!-- .list-group -->

						
					
					</div><!-- .app-actions-list -->
				</div><!-- .app-action-panel -->
			</div><!-- END column -->

			<div class="col-md-10">
				<div class="panel panel-default new-message">						
					<form id="frm" method="post" action="" >
						<div class="panel-body">
							<div class="form-group">
								<input type="text" class="form-control" id="journal_title" name="journal_title" placeholder="일기 제목" required="required">
							</div><!-- .form-group -->

							<div class="form-group m-b-0">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<div class='input-group date' id='datetimepicker2' data-plugin="datetimepicker">
												<input type='text' class="form-control" id="journal_regdate" name="journal_regdate"/>
												<span class="input-group-addon bg-info text-white">
													<span class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
									</div>
									<div class="col-sm-6" id="journal_weather" >
				
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_sunny" value="맑음"> 맑음
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_windy" value="바람"> 바람
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_cold" value="추움"> 추움
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_rainy" value="비"> 비
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_snowy" value="눈"> 눈
											</label>										
											<label class="radio-inline">
												<input type="radio" name=journal_weather id="weather_murky" value="흐림"> 흐림
											</label>
									
									</div>
								</div>
							</div><!-- .form-group -->

							
							<textarea class="form-control full-wysiwyg" name=journal_content id="journal_content" rows="10" placeholder="오늘의 일기" required="required"></textarea>
						</div><!-- .panel-body -->

						<div class="panel-footer clearfix">
							<div class="pull-right">
								<button type="reset" class="btn btn-default" id="btn_reset"><i class="fa fa-trash"></i></button>
								<button type="submit" class="btn btn-default" id="btn_save"><i class="fa fa-save"></i></button>
							</div>
						</div><!-- .panel-footer -->
					</form>
				</div><!-- .panel -->
			</div><!-- END column -->
		</div><!-- .row -->
	</section><!-- .app-content -->
</div><!-- .wrap -->

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
  <%@ include file="../include/footer.jsp"%>