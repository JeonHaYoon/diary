<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
 
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
						<a href="calendar" type="button" class="btn action-panel-btn btn-default btn-block">목록보기</a>
					</div>

					
				</div><!-- .app-action-panel -->
			</div><!-- END column -->

			<div class="col-md-10">
				<div class="panel panel-default new-message">						
					<form method="post" id="frm" class="form-horizontal" action="" >
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
								<button type="button"  id="btn_remove" class="btn btn-default"><i class="fa fa-trash"></i></button>
								<a href="modify?journal_pk=${journal.journal_pk }"  class="btn btn-default"><i class="fa fa-edit"></i></a>
							</div>
						</div><!-- .panel-footer -->
					</form>
				</div><!-- .panel -->
			</div><!-- END column -->
		</div><!-- .row -->
	</section><!-- .app-content -->
</div><!-- .wrap -->


  
<script>
$(document).ready(function(){
	$("#btn_remove").on("click", function(){
		
		if(confirm("삭제하시겠습니까?")){
			$("#frm").attr("action", "remove");
			$("#frm").submit();
		}
		//console.log("삭제버튼 눌림");
	});
});
</script>  
 
  <%@ include file="../include/footer.jsp"%>
  