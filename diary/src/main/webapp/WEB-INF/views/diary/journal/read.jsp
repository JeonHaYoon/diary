<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<title>일기 조회</title>
<%@ include file="../include/header.jsp"%>

<!-- APP MAIN ==========-->
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
					<form method="post" class="form-horizontal" action="" >
						<div class="panel-body">
							<div class="media-body">
									
									<h4 class="media-heading m-t-xs">
										<input type="hidden" name="journal_pk" value="${journal.journal_pk }"/>
										<a href="javascript:void(0)"><c:out value="${journal.journal_title}"/></a>
									</h4>
									<small class="media-meta"><fmt:formatDate value="${journal.journal_regdate }" pattern="yyyy-MM-dd"/></small>
									<small class="media-meta"><c:out value="${journal.journal_weather}"/></small>
									<div class="stream-body m-t-xl">
										<% pageContext.setAttribute("newLineChar", "\n"); %>
										${fn:replace(journal.journal_content, newLineChar, '<br>') }
									</div>
								</div>

						</div><!-- .panel-body -->

						<div class="panel-footer clearfix">
							<div class="pull-right">
								<button type="button" class="btn btn-default"><i class="fa fa-trash"></i></button>
								<button type="button" class="btn btn-default"><i class="fa fa-edit"></i></button>
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
  