<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
							
							<div class="form-group center">
								<label for="journal_regdate">마감일</label>
								<div class='input-group date' id='datetimepicker2' data-plugin="datetimepicker">
									<input type="text" class="form-control" id="todo_deadline" name="todo_deadline" required="required"/>
									<span class="input-group-addon bg-info text-white">
										<span class="glyphicon glyphicon-calendar">
										</span>
									</span>
								</div>
							</div>
							
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
								<tfoot>
									<tr>
										<th>등록일</th>
										<th>내용</th>
										<th>마감일</th>
										<th>중요도</th>										
										<th>완료여부</th>										
									</tr>
								</tfoot>
								<tbody>
									<tr>
								<%-- 	<c:if test="${journal.journal_weather eq '맑음'}">checked="checked"</c:if>> 맑음 --%>
											
										<td>2008/12/13</td>
										<td>Software Engineer</td>
										<td>2008/12/13</td>
										<td>3</td>
										<td><button type="button" class="btn mw-md btn-dark">Dark</button>
								<button type="button" class="btn mw-md btn-default">default</button></td>
									</tr>
									<tr>
										<td>2008/12/13</td>
										<td>Software Engineer</td>
										<td>2008/12/14</td>
										<td>3</td>
										<td>OK</td>
									</tr>
									<tr>
										<td>2008/12/13</td>
										<td>Software Engineer</td>
										<td>2008/12/16</td>
										<td>3</td>
										<td>OK</td>
									</tr>
									<tr>
										<td>2008/12/13</td>
										<td>Software Engineer</td>
										<td>2008/12/13</td>
										<td>3</td>
										<td>OK</td>
									</tr>
								
								</tbody>
							</table>
						</div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->
							
		
</div>
		
  
 <%@ include file="../include/footer.jsp"%>