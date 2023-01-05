<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
 
 
<title>일기 수정</title>    
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
						<a href="calendar" type="button" class="btn action-panel-btn btn-default btn-block">목록보기</a>
					</div>

		
				</div><!-- .app-action-panel -->
			</div><!-- END column -->

			<div class="col-md-10">
				<div class="panel panel-default new-message">						
					<form method="post" action="" id="frm" >
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<div class="panel-body">
							<div class="form-group">
								<input type="hidden" name="journal_pk" value="${journal.journal_pk }"/>
									<input type="hidden" class="form-control input-sm" id="journal_writer" readonly="readonly" name="journal_writer" 	value="<sec:authentication property="principal.username"/>">
								<input type="text" class="form-control" id="journal_title" name="journal_title" value="${journal.journal_title}" required="required">
							</div><!-- .form-group -->

							<div class="form-group m-b-10">
								<div class="row">
							<input type="text" class="form-control" id="journal_regdate" name="journal_regdate" 
								 value="<c:out value="${journal.journal_regdate }" />" readonly="readonly"> 
														
								
									<div class="col-sm-6" id="journal_weather" >
				
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_sunny" value="맑음" 
												<c:if test="${journal.journal_weather eq '맑음'}">checked="checked"</c:if>> 맑음
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_windy" value="바람" 
												<c:if test="${journal.journal_weather eq '바람'}">checked="checked"</c:if>> 바람
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_cold" value="추움" 
												<c:if test="${journal.journal_weather eq '추움'}">checked="checked"</c:if>> 추움
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_rainy" value="비" 
												<c:if test="${journal.journal_weather eq '비'}">checked="checked"</c:if>> 비
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_snowy" value="눈" 
												<c:if test="${journal.journal_weather eq '눈'}">checked="checked"</c:if>> 눈
											</label>										
											<label class="radio-inline">
												<input type="radio" name=journal_weather id="weather_murky" value="흐림" 
												<c:if test="${journal.journal_weather eq '흐림'}">checked="checked"</c:if>> 흐림
											</label>
									
									</div>
								</div>
							</div><!-- .form-group -->

							
							<textarea class="form-control full-wysiwyg" name=journal_content id="journal_content" rows="10"  required="required">${journal.journal_content}</textarea>
						</div><!-- .panel-body -->

						<div class="panel-footer clearfix">
							<div class="pull-right">
								<button type="button"  id="btn_remove" class="btn btn-default"><i class="fa fa-trash"></i></button>
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
  
<script>
$(document).ready(function(){
	$("#btn_remove").on("click", function(){
		
		if(confirm("삭제하시겠습니다?")){
			$("#frm").attr("action", "remove");
			$("#frm").submit();
		}
		//console.log("삭제버튼 눌림");
	});
});
</script>    
  <%@ include file="../include/footer.jsp"%>