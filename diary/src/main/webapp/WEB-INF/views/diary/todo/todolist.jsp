<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
									<th>마감일</th><th>내용(등록하면 수정이 불가합니다.)</th><th>중요도</th><th></th>		
								</tr>
								<tr>
									
										
									
									<td>
										<div class="form-group">
																						
												<input type="text" class="form-control" id="datepicker" name="todo_deadline">
											
										</div>
									</td>									
									<td><input type="text" name="todo_content" id="todo_content" class="form-control" required="required"></td>
									<td>
								
									<div class="form-group">										
										<div id="control-demo-6" class="col-sm-9">
											<select class="form-control" name="todo_importance" id="todo_importance">
												<option value="1">1</option>												
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</div>
									</div><!-- .form-group -->
									<td></td>									
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
										<th>등록일</th><th>내용</th><th>중요도</th><th>마감일</th><th>완료여부</th>								
									</tr>
								</thead>
								<tbody>
<c:set var="idx" value="0"/>
<c:forEach items="${todoList}" var="todoList">
									<tr>
										<td><fmt:formatDate value="${todoList.todo_regdate }" pattern="yyyy-MM-dd"/></td>
										<td>${todoList.todo_content }</td>
										<td>${todoList.todo_importance }</td>
										<td><c:out value="${todoList.todo_deadline }"/></td>
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
<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
    	   dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>

  
 <%@ include file="../include/footer.jsp"%>