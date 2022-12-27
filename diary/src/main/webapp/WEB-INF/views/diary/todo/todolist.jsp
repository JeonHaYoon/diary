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
					<header class="widget-header">
						<h4 class="widget-title">할 일 등록</h4>
					</header><!-- .widget-header -->
					<div class="widget-body">
										
						<form method="post" class="form-horizontal" action="">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<table class="table" id="crew">
								<tr>
									<th>내용</th><th>중요도</th><th></th>		
								</tr>
								<tr>
									<!-- <th>등록일></th><td><input type="date" name="todo_regdate" id="todo_regdate0" class="form-control" readonly="readonly"></td> -->
									<td><input type="text" name="todo_content" id="todo_content" class="form-control" required="required"></td>
									<td><input type="text" name="todo_importance" id="todo_importance" class="form-control"></td>									
								</tr>
							</table>
								<button type="submit" class="btn btn-primary">등록</button>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->		
	


<!-- 내용 출력 -->
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
										<th>등록일</th><th>내용</th><th>중요도</th><th>완료여부</th>								
									</tr>
								</thead>
								<tbody>
<c:set var="idx" value="0"/>
<c:forEach items="${todoList}" var="todoList">
									<tr>
										<td><fmt:formatDate value="${todoList.todo_regdate }" pattern="yyyy-MM-dd"/></td>
										<td>${todoList.todo_content }</td>
										<td>${todoList.todo_importance }</td>
										<td>
											<c:if test="${todoList.todo_ok eq 'done'}"> 
												<button type="button" id="btn_done${idx }<%//=idx %>" data-todo_pk="${todoList.todo_pk }" class="btn mw-md btn-dark btn-sm" onclick="todo(this)">완료</button></td>
											</c:if> 	
											<c:if test="${todoList.todo_ok eq 'none'}"> 
												<button type="button" id="btn_none${idx }<%//=idx %>" data-todo_pk="${todoList.todo_pk }" class="btn mw-md btn-default btn-sm" onclick="todo(this)">미완료</button></td>
											</c:if> 
										</td>
									
									</tr>
 <c:set var="idx" value="${idx+1}"/>
</c:forEach>
									
								
								</tbody>
							</table>
						</div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
		</div><!-- END column -->
</div>

<script>

//csrf post방식에 붙여둘것


var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

function todo(t){
	//alert("미완료로 변경합니다.");
	
	//btn_value='none';
	//alert($(t).val());
	let todo_pk = $(t).data("todo_pk");
	if (t.innerText == "완료"){
		$.ajax({
	        type : "POST",            // HTTP method type(GET, POST,,,,,) 형식이다.
	        url : "/diary/todo/todolist/"+todo_pk,      // 컨트롤러에서 대기중인 URL 주소이다.
	        //dataType: "text",
	        data : JSON.stringify({todo_pk:todo_pk,
	        	todo_ok:"none"}),
	        
	        	
	        	// Json 형식의 데이터이다.
	        contentType: 'application/json',
	        beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},		//csrf post방식에 붙여둘것
	        	success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	        	t.innerText="미완료";
	        	$(t).removeClass("btn-dark");
	        	$(t).addClass("btn-default");
	        	console.log($(t).data("todo_pk"));
	        },
	        error : function(request, status, error){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        	console.log("통신 실패.")
	        }
	    });
	}else{
		$.ajax({
	        type : "POST",            // HTTP method type(GET, POST,,,,,) 형식이다.
	        url : "/diary/todo/todolist/"+todo_pk,      // 컨트롤러에서 대기중인 URL 주소이다.
	        //dataType: "text",
	        data : JSON.stringify({todo_pk:todo_pk,
	        	todo_ok:"done"}),
	        
	        	
	        	// Json 형식의 데이터이다.
	        contentType: 'application/json',
	        beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},		//csrf post방식에 붙여둘것
	        	success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
	        	t.innerText="완료";
	        	$(t).removeClass("btn-default");
	        	$(t).addClass("btn-dark");
	        	console.log($(t).data("todo_pk"));
	        },
	        error : function(request, status, error){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        	console.log("통신 실패.")
	        }
	    });
	}
	
}

</script>

  
 <%@ include file="../include/footer.jsp"%>