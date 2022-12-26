<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
								다른 사용자의 결정을 투표로 도와주세요!
							</small>
						</div>
						<form class="form-horizontal" method="post" action="" id="frm" >
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
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
									<a href="selectModify?select_pk=${select.select_pk }"><button type="button" class="btn btn-success">수정</button></a>
									<button type="button" id="btn_remove" class="btn btn-success">삭제</button>								
									
								</div>
							</div>
						</form>
						
					
							<!-- 댓글 시작 -->
						<div>
							<h4 class="widget-title">댓글</h4>
							<form method="post" action="#" onsubmit="return false">
							
							<input type="hidden" name="select_pk" id="select_pk" value="${select.select_pk}">
							<input type="hidden" name="replyer" id="replyer" value="<sec:authentication property="principal.username"/>">
								<div class="form-group">
									<input type="text" name="reply" id="reply" class="form-control" required="required">
									<div style="text-align:right;">
										<button type="button" id="btn_reply" class="btn btn-default">입력</button>
									</div>
								</div>
							</form>
						</div>
						
						
						<!-- 댓글목록 -->
								
						
	 					
						<div id="chat">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<input type="hidden" name="type" value="${pageMaker.cri.type }">
							<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
						</div>
						
						<div class="col-md-12">
								<nav style="text-align:right;">
								  <ul class="pagination">
							
								  </ul>
								</nav>
							</div>
						
						<!-- 댓글목록 끝-->
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

</div>



<script>
//csrf post방식에 붙여둘것
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";


var pageNum = 1;

function showReplyPage(replyCnt){
	console.log("페이징..."+replyCnt);
	var endNum = Math.ceil(pageNum / 10.0) * 10;
	var startNum = endNum -9;
	
	var prev = startNum != 1;
	var next = false;
	
	if(endNum * 10 >= replyCnt){
		endNum = Math.ceil(replyCnt/10.0);
	}
	
	if(endNum * 10 <replyCnt){
		next = true;
	}
	
	var str = "";

if(prev){
		str += '<li>';
		str += '<a href="'+(startNum-1)+'" class="btn_pagingnation" aria-label="Previous">';
		str += '<span aria-hidden="true">&laquo;</span>';
		str += '</a>';
		str += '</li>';
}

for(let i = startNum; i<=endNum; i++){
	if(pageNum == i){
		str += '<li class="active">';
		str += '<a>'+i+'</a>';
		str += '</li>';
	}else{
		str += '<li>';
		str += '<a href="'+i+'" class="btn_pagingnation">'+i+'</a>';
		str += '</li>';
	}
}

if(next){
	str += '<li>';
	str += '<a href="$'+(endNum+1)+'" class="btn_pagingnation" aria-label="Next">';
	str += '<span aria-hidden="true">&raquo;</span>';
	str += '</a>';
	str += '</li>';
}
	$('.pagination').html(str);
	
	
}


/* 댓글목록 가져오는것 */
function getList(){

	$.ajax({
        type : "GET",            // HTTP method type(GET, POST,,,,,) 형식이다.
        url : "/diary/reply/pages/${select.select_pk}/"+pageNum+".json",      // 컨트롤러에서 대기중인 URL 주소이다.
        //contentType: 'application/json',
       	//data : JSON.stringify(data),
        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
           //let jsonArr = JSON.parse(res); 
        	   console.log("댓글목록" + res.select_replyCnt);
        	   let html = "";
        	  
        	   //console.log(res.select_replyCnt);
        	   //console.log(res.list.length)
        	   for(let i =0; i<res.list.length;i++){
        		   <!--댓글영역 -->
				html+='<div class="mail-item">';
				html+='<table class="mail-container">';
				html+='<tr>';
				html+='<td class="mail-center">';
				html+='<div class="mail-item-header">';
				html+='<strong class="mail-item-title"><span class="title-color" data-reply="'+res.list[i].reply+'"  data-rno="'+res.list[i].rno+'">'+res.list[i].replyer+'</span></strong>';
				html+='</div>';
				html+='<p class="mail-item-excerpt">'+res.list[i].reply+'</p>';
				html+='</td>';
				html+='<td class="mail-right mail-item-header" style="width:160px;" >';
				html+='<p class="mail-item-date">'+( new Date(res.list[i].replydate).toLocaleString())+'</p>';
				html+='</td>';
				html+='</tr>';				
				html+='</table>';
				html+='<div class="pull-right">';
				html+='<button type="button"  id="btn_reDel" class="btn btn-default"   data-rno="'+res.list[i].rno+'"><i class="fa fa-trash"></i></button>';
				html+='<a href="" }"  class="btn btn-default"><i class="fa fa-edit"></i></a>';
				html+='</div>';
				html+='<hr class="widget-separator">';
				html+='</div>';
				
				
				
				
        		   ///console.log("글번호"+res.list[i].bno);
        		  // console.log("댓글내용"+res.list[i].reply);
        		   //console.log("댓글작성자"+res.list[i].replyer);
        		  // console.log("날짜"+res.list[i].replydate);
        	   }
        	   
        	   $("#chat").html(html);
        	   
        	   showReplyPage(res.select_replyCnt); //페이징
        },
        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
        	console.log("통신 실패.")
        }
    });
}

$(document).ready(function(){
	getList();
	
	//글삭제
	$("#btn_remove").on("click", function(){
		
		if(confirm("삭제하시겠습니까?")){
			$("#frm").attr("action", "selectRemove");
			$("#frm").submit();
		}
		//console.log("삭제버튼 눌림");
	});
	
	//댓글등록
	$(document).on("click", "#btn_reply" , function(){
		let select_pk = ${select.select_pk};
		let reply = $("#reply").val();
		let replyer = $("#replyer").val();
		
		 // Json 형식의 데이터이다.
		let data = {'select_pk':select_pk,
   				'reply':reply,
   				'replyer':replyer};
		 
		if(reply == '') {
				alert('내용을 입력하세요');
		}else{
			
			$.ajax({
		        type : "POST",            // HTTP method type(GET, POST,,,,,) 형식이다.
		        url:"/diary/reply/new",      // 컨트롤러에서 대기중인 URL 주소이다.
		        contentType: "application/json; charset=utf-8",
		       	data : JSON.stringify(data),
		       	beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},			//csrf post방식에 붙여둘것
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		           console.log("댓글등록성공");
		        	//댓글등록성공하면 getList() 실행하여, 등록된 댓글 나타나게함
		        	if(res =='Success'){
		        		
		        		alert("댓글등록이 완료되었습니다.");
		        		console.log("댓글등록완료");
		        		$('#reply').val('');
   	   					$('#replyer').val('');
   	   					getList();
		        	}
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		        	
		        	console.log("통신 실패." +textStatus)
		        	console.log("통신 실패." +errorThrown)
		        }
		        
		    });
			console.log(reply+ replyer+select_pk);
		}
		
		
	});
	
	//댓글페이징
	$(document).on("click",".btn_pagingnation",function(e){
		e.preventDefault();
		
		pageNum = $(this).attr("href");
		getList();
		
	});	
	
	//댓글삭제
	$(document).on("click", "#btn_reDel", function(){
		
		let rno = $(this).data("rno");
		
		if(confirm("정말로 삭제하시겠습니까?")) {
			// ajax 통신
			///admin/replies/2
		    $.ajax({
		        type : "DELETE",            // HTTP method type(GET, POST,,,,,) 형식이다.
		        url : "/diary/reply/"+rno,      // 컨트롤러에서 대기중인 URL 주소이다.  admin/replies/10
		        //data : JSON.stringify({rno:rno, reply:reply, replyer:replyer}),
				contentType : "application/json; charset=utf-8",
				beforeSend: function(xhr){						////csrf post방식에 붙여둘것
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
		        success : function(res){ // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
		        	console.log("댓글목록" + res);
		        	//댓글등록성공하면 getList() 실행하여, 등록된 댓글 나타나게함
		        	if(res == 'success'){
		        		getList();
		        	}
		        },
		        error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
		        	console.log("통신 실패."+XMLHttpRequest);
		        	console.log("통신 실패."+textStatus);
		        	console.log("통신 실패."+errorThrown);
		        }
		    });
			
		
		}
	});
	
	
	
});
</script>  


<%@ include file="../include/footer.jsp"%>