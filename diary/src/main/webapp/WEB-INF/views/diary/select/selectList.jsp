<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js"
	integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
	crossorigin="anonymous"></script>

<title>모든 일기 조회</title>
<%@ include file="../include/header.jsp"%>

<!-- APP MAIN ==========-->
<main id="app-main" class="app-main">
	<div class="wrap">

		<div class="row">
			<div class="col-md-2">
				<div class="app-action-panel" id="calendar-action-panel">
					<div class="action-panel-toggle" data-toggle="class"
						data-target="#calendar-action-panel" data-class="open">
						<i class="fa fa-chevron-right"></i> <i class="fa fa-chevron-left"></i>
					</div>
					<!-- .app-action-panel -->

					<div class="m-b-lg">
						<a href="selectWrite"
							class="btn action-panel-btn btn-default btn-block">A or B 등록</a>
					</div>

				</div>
				<!-- .app-action-panel -->
			</div>
			<!-- END column -->

			<div class="col-md-10">

				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">A or B</h4>
					</header>
					<!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small> 사람들의 선택을 도와주세요 </small>
						</div>
						<table class="table">
							<colgroup>
								<col style="width: 80px;" />
								<col style="width: 150px;" />
								<col style="width: 100px;" />
								<col style="width: 100px;" />
								<col style="width: 100px;" />
								<col style="width: 80px;" />
							</colgroup>

							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>카테고리</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>

							<!-- 행에대해 숫자를 세는 것 -->
							<c:set value="0" var="rowCnt" />
							<c:forEach items="${list }" var="select">
								<tr>
									<td><c:out value="${select.select_pk }" /></td>
									<td><a
										href="selectRead?select_pk=<c:out value="${select.select_pk}"/>"><c:out
												value="${select.select_title}" /></a></td>
									<td><c:out value="${select.select_writer}" /></td>
									<td><c:out value="${select.select_category}" /></td>
									<td><fmt:formatDate value="${select.select_regdate}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><c:out value="${select.select_hit}" /></td>
								</tr>
								<c:set value="${rowCnt +1 }" var="rowCnt" />
							</c:forEach>

							<c:if test="${rowCnt eq 0}">
								<tr>
									<td colspan="6">등록된 글이 없습니다.</td>
								</tr>
							</c:if>

						</table>
					</div>
				</div>
				</div>

					<!-- 페이징 -->
					<nav style="text-align: center;">
						<ul class="pagination">

							<c:if test="${pageMaker.prev }">
								<li><a
									href="?pageNum=${pageMaker.startPage-1 }&amount=${pageMaker.cri.amount}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="num">
								<c:if test="${pageMaker.cri.pageNum eq num }">
									<li class="active"><a>${num }</a></li>
								</c:if>

								<c:if test="${pageMaker.cri.pageNum ne num }">
									<li><a
										href="?pageNum=${num }&amount=${pageMaker.cri.amount}">${num }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${pageMaker.next }">
								<li><a
									href="?pageNum=${pageMaker.endPage+1 }&amount=${pageMaker.cri.amount}"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>
					<!-- 페이징 -->
				</div>
				<!-- .row -->
			</div>
			<!-- .wrap -->

			<%@ include file="../include/footer.jsp"%>