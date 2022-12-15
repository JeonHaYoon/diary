<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>To do List</title>    
<%@ include file="../include/header.jsp"%>

<style>

.input-container {
    width: 80%;
    display: flex;
    align-self: center;
    justify-content: space-between;
    margin-top: 20px;
}

#todo {
    width: 70%;
    padding: 8px 12px;
    border-radius: 4px;
    border: 1px solid #eaeaea;
}

#todoBtn {
    width: 20%;
    background-color: #1890ff;
    border-radius: 4px;
    border: 1px solid #41a3fe;
    color: white;
}

.list-container {
    display: flex;
    flex-direction: column;
    margin-top: 48px;
    width: 80%;
    align-self: center;
    border-radius: 4px;
    border: 1px solid #eaeaea;
    background-color: white;
}

h1 {
    padding: 16px 24px;
    margin: 0;
    font-size: 16px;
    border-bottom: 1px solid #eaeaea;
}

#list {
    margin: 32px 0;
}

.list-item {
    border-bottom: 1px solid #eaeaea;
    margin-right: 32px;
    padding: 16px 0;
    font-size: 14px;
}

</style>

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
					<form>
						<div class="form-group">
							<label for="datetimepicker2">날짜 선택</label>
								<div class='input-group date' id='datetimepicker2' data-plugin="datetimepicker">
									<input type='text' class="form-control"  />
									<span class="input-group-addon bg-info text-white">
										<span class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
						
							<div class="input-container">
								<input id="todo" name="todo"  />
								<button id="todoBtn" onclick="btn_todo();">추가</button>
							</div>
							
							<div class="list-container">
								<h1>할 일 목록</h1>
								<ul id="list">
									<li class="list-item">HTML배우기</li>
									<li class="list-item">CSS배우기</li>
								</ul>
							</div>
						</div>	
						
						
					</form>			
		
			</div><!-- .widget-body -->
		</div><!-- .widget -->
	</div><!-- END column -->


</main>


<script>
//등록버튼
function btn_todo(){
	if(todo ==''){
		alert("내용을 입력해주세요.");
	}else{
		alert("추가");
	}
	//console.log("버튼누름");
	
}
</script>
  
 <%@ include file="../include/footer.jsp"%>