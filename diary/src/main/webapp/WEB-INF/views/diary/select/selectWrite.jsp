<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
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
								혼자서 결정하기가 어렵다면, 투표로 올려주세요!
							</small>
						</div>
						<form class="form-horizontal" method="post" action="" >
						<input type="hidden" class="form-control" readonly="readonly" id="select_writer"  name="select_writer" value="<sec:authentication property="principal.username"/>">
						
							<div class="form-group">
								<label for="select_title" class="col-sm-3 control-label">제목:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="select_title"  name="select_title" placeholder="제목" required="required">
								</div>
							</div>
							
							<div class="form-group">
								<label for="select_category" class="col-sm-3 control-label">카테고리:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="select_category"  name="select_category" placeholder="카테고리">
								</div>
							</div>
						
							<div class="form-group">
								<label for="select_itemA" class="col-sm-3 control-label">항목A</label>
								<div class="col-sm-9">
								<input type="file"  id="select_itemA"  name="select_itemA" class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label for="select_itemB" class="col-sm-3 control-label">항목B</label>
								<div class="col-sm-9">
								<input type="file"  id="select_itemB"  name="select_itemB" class="form-control">
								</div>
							</div>
							
							<div class="form-group">
								<label for="select_content" class="col-sm-3 control-label">설명:</label>
								<div class="col-sm-9">
									<textarea class="form-control"  id="select_content"  name="select_content" placeholder="설명" required="required"></textarea>
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<button type="submit" class="btn btn-success">등록</button>
								
									<button type="reset" class="btn btn-success">취소</button>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

</div>



<%@ include file="../include/footer.jsp"%>