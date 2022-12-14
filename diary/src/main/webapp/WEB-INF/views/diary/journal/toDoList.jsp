<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>To do List</title>    
<%@ include file="../include/header.jsp"%>
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
					<form class="form-horizontal" action="">
						<div class="form-group">
									<label for="datetimepicker2">날짜 선택</label>
									<div class='input-group date' id='datetimepicker2' data-plugin="datetimepicker">
										<input type='text' class="form-control" />
										<span class="input-group-addon bg-info text-white">
											<span class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
						</div>
					
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
  
 <%@ include file="../include/footer.jsp"%>