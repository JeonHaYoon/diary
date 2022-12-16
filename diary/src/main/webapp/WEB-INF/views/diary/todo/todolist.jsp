<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

<title>To do List</title>    
<%@ include file="../include/header.jsp"%>
<main id="app-main" class="app-main">
  <div class="wrap">
		<div class="col-md-12">
				<div class="widget">
					
					<div class="widget-body">
					
						<form action="" method="post">
							
							<div class="form-group">
									<label for="todo_content">내용</label>
									<div class='form-group'>
										<input type="text" class="form-control" id="todo_content" name="todo_content" required="required"/>
									</div>
							</div>
							<div class="form-group">
									<label for="todo_importance">중요도</label>
									<div class='form-group'>
										<input type="text" class="form-control" id="todo_importance" name="todo_importance"/>
									</div>
							</div>
							
							<!-- <div class="form-group center">
								<label for="todo_deadline">마감일</label>
								<div class='input-group date' id='datetimepicker2' data-plugin="datetimepicker">
									<input type="text" class="form-control" id="todo_deadline" name="todo_deadline" required="required"/>
									<span class="input-group-addon bg-info text-white">
										<span class="glyphicon glyphicon-calendar">
										</span>
									</span>
								</div>
							</div>  -->
							
							<button type="submit" class="btn btn-lg btn-primary btn-block">등록</button>
							
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
							
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">할 일 목록</h4>
					</header><!-- .widget-header -->
					
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="table-responsive">
							<table id="default-datatable" data-plugin="DataTable" class="table table-striped" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>등록일</th>
										<th>내용</th>
										<th>마감일</th>
										<th>중요도</th>										
										<th>완료여부</th>										
									</tr>
								</thead>
								<tbody>
								
									<c:forEach items="${todoList}" var="todoList">
									<tr>
										<td><fmt:formatDate value="${todoList.todo_regdate }" pattern="yyyy-MM-dd"/></td>
										<td>${todoList.todo_content }</td>
										<td><fmt:formatDate value="${todoList.todo_deadline }" pattern="yyyy-MM-dd"/></td>
										<td>${todoList.todo_importance }</td>
										<td>
											<c:if test="${todoList.todo_ok eq 'done'}"> 
												<button type="button" id="btn_done" class="btn mw-md btn-dark btn-sm">완료</button></td>
											</c:if> 	
											<c:if test="${todoList.todo_ok eq 'none'}"> 
												<button type="button" id="btn_none" class="btn mw-md btn-default btn-sm">미완료</button></td>
											</c:if> 
										</td>
										
									</tr>
									</c:forEach>
									
								
								</tbody>
							</table>
						</div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
							
		
</div>

<script>
$(document).ready(function(){
	$("#btn_done").on("click", function(){
		console.log("완료");
	});
	
	$("#btn_none").on("click", function(){
		console.log("미완료");
	});
});
</script>
  
 <%@ include file="../include/footer.jsp"%>