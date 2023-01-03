<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

<title>모든 일기 조회</title>
<%@ include file="../include/header.jsp"%>

<!-- APP MAIN ==========-->
<main id="app-main" class="app-main">
  <div class="wrap">
	
		<div class="row">				
						<div class="col-md-12">
				 		
							<table class="table">
								<colgroup>
									<col style="width:80px;"/>
									<col style=""/>
									<col style="width:100px;"/>
									<col style="width:150px;"/>
								</colgroup>
								
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
								
								<!-- 행에대해 숫자를 세는 것 -->
								<c:set value="0" var="rowCnt"/>
								<c:forEach items="${list }" var="list">
								<tr>
									<td><c:out value="${list.journal_pk }"/></td>
									<td><a href="read?journal_pk=<c:out value="${list.journal_pk}"/>"><c:out value="${list.journal_title}"/></a></td>
									<td><c:out value="${list.journal_writer}"/></td>
									<td><c:out value="${list.journal_regdate}"/></td>
									
								</tr>
								<c:set value="${rowCnt +1 }" var="rowCnt"/>
								</c:forEach>
								
								<c:if test="${rowCnt eq 0}">
								<tr>
									<td colspan="4"> 등록된 글이 없습니다. </td>
								</tr>
								</c:if>
								
							</table>
						</div> 
						
						
					<!-- 페이징 -->
						<nav style="text-align:center;">
						  <ul class="pagination">
						   
						   <c:if test="${pageMaker.prev }">
						    <li>
						      <a href="?pageNum=${pageMaker.startPage-1 }&amount=${pageMaker.cri.amount}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						   </c:if> 

							 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num" >
						   	  <c:if test="${pageMaker.cri.pageNum eq num }">	
							    <li class="active"><a>${num }</a></li>
							  </c:if>
							  
							  <c:if test="${pageMaker.cri.pageNum ne num }">  
							    <li ><a href="?pageNum=${num }&amount=${pageMaker.cri.amount}">${num }</a></li>
							  </c:if> 
						   </c:forEach>
						   
						    <c:if test="${pageMaker.next }">
						    <li>
						      <a href="?pageNum=${pageMaker.endPage+1 }&amount=${pageMaker.cri.amount}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						 	</c:if>
						  </ul>
						</nav><!-- 페이징 --> 
	</div><!-- .row -->
</div><!-- .wrap -->
	 
  <%@ include file="../include/footer.jsp"%>