<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="form-group">
								<label for="select_title" class="col-sm-3 control-label">두 항목 중 투표해주세요!</label>
								<form="vote" method="post">
								<input type="hidden" name="select_pk" />
								<div class="col-sm-9" id="poll">
								
									<div>
										<label>
											<input type="radio" name="select_item" id="select_itemA" value="A" >
																				A
										</label>
										
											<div class="form-group">
												<label for="uploadFileA" class="col-sm-3 control-label"></label>
												<div class="col-sm-9 uploadResult">
													<ul>
													
													</ul>
												</div>
											</div>
									</div>
									<div>
										<label>
											<input type="radio" name="select_item" id="select_itemB" value="B" >
										B
										</label>
										
										<div class="form-group">
											<label for="uploadFileB" class="col-sm-3 control-label"></label>
											<div class="col-sm-9 uploadResult">
												<ul>
												
												</ul>
											</div>
										</div>
									</div>
								<button type="submit" id="btn_vote" class="btn btn-danger rounded">투표하기</button>
								</div>	
								</form>
								
							</div>

</body>
<script>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$(document).ready(function(){
	$("#btn_vote").on("click", function(){
		console.log("투표");
		
		//let select_pk = ${select.select_pk};
		let result = $("input[name='select_item']:checked").val();
		
		
		 // Json 형식의 데이터이다.
		let data = {'result':result};
		 
		if(result == '') {
				alert('항목을 선택하세요');
		}else{
			
			$.ajax({
		        type : "POST",            // HTTP method type(GET, POST,,,,,) 형식이다.
		        url:"/diary/select/vote",      // 컨트롤러에서 대기중인 URL 주소이다.
		        contentType: "application/json; charset=utf-8",
		       	data : JSON.stringify(data),
		       	beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},			//csrf post방식에 붙여둘것
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		           console.log("투표성공");
		        	//댓글등록성공하면 getList() 실행하여, 등록된 댓글 나타나게함
		        	if(res =='Success'){
		        		
		        		alert("투표가 완료되었습니다.");
		        		console.log("투표완료");
		        		$("input[name='select_item']:checked").val('');
   	   					//getList();
		        	}
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		        	
		        	console.log("통신 실패." +textStatus)
		        	console.log("통신 실패." +errorThrown)
		        }
		        
		    });
			console.log("ㅎㅎㅎ"+result);
		}
		
		
	});
});

</script>

</html>