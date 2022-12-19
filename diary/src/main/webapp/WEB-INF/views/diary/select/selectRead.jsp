<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

 <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
 

<title>A or B</title>
<%@ include file="../include/header.jsp"%>

<main id="app-main" class="app-main">
  <div class="wrap">

			<div class="col-md-12">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">A or B</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
								다른 사용자의 결정을 투표로 도와주세요!
							</small>
						</div>
						<form class="form-horizontal" method="post" action="" id="frm" >
						<input type="hidden" name="select_pk" value="${select.select_pk}"/>
						<div class="form-group">
								<label for="select_title" class="col-sm-3 control-label">작성자:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="select_writer"  name="select_writer" value="<sec:authentication property="principal.username"/>" readonly="readonly">
								</div>
							</div>
						
						
							<div class="form-group">
								<label for="select_title" class="col-sm-3 control-label">제목:</label>
								<div class="col-sm-9">
									
									<input type="text" class="form-control" id="select_title"  name="select_title" value="${select.select_title}" readonly="readonly">
								</div>
							</div>
							
							<div class="form-group">
								<label for="select_title" class="col-sm-3 control-label">작성일:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="select_regdate"  name="select_regdate" value="<fmt:formatDate value="${select.select_regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
								</div>
							</div>
							
							<div class="form-group">
								<label for="select_category" class="col-sm-3 control-label">카테고리:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="select_category"  name="select_category" value="${select.select_category}" readonly="readonly">
								</div>
							</div>
						
							<div class="form-group">
								<label for="select_itemA" class="col-sm-3 control-label">항목A</label>
								<div class="col-sm-9 uploadDiv">
									<input type="text" class="form-control" id="select_itemA"  name="select_itemA" value="${select.select_itemA}" readonly="readonly">
									
								</div>
							</div>
							<div class="form-group">
								<label for="uploadFileA" class="col-sm-3 control-label"></label>
								<div class="col-sm-9 uploadResult">
									<ul>
									
									</ul>
								</div>
							</div>
							
							<div class="form-group">
								<label for="select_itemB" class="col-sm-3 control-label">항목B</label>
								<div class="col-sm-9 uploadDiv">
									<input type="text" class="form-control" id="select_itemB"  name="select_itemB" value="${select.select_itemB}" readonly="readonly">
									
								</div>
							</div>
							<div class="form-group">
								<label for="uploadFileB" class="col-sm-3 control-label"></label>
								<div class="col-sm-9 uploadResult">
									<ul>
									
									</ul>
								</div>
							</div>
							
							<div class="form-group">
								<label for="select_content" class="col-sm-3 control-label">설명:</label>
								<div class="col-sm-9">
									<textarea class="form-control"  id="select_content"  name="select_content" readonly="readonly">${select.select_content}</textarea>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<button type="button" id="btn_remove" class="btn btn-success">삭제</button>
								
									<a href="selectModify?select_pk=${select.select_pk }"><button type="button" class="btn btn-success">수정</button></a>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

</div>


<script>
$(document).ready(function(){
	$("#btn_remove").on("click", function(){
		
		if(confirm("삭제하시겠습니까?")){
			$("#frm").attr("action", "selectRemove");
			$("#frm").submit();
		}
		//console.log("삭제버튼 눌림");
	});
});
</script>  


<%@ include file="../include/footer.jsp"%>