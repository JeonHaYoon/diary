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
						<form class="form-horizontal" method="post" action="" id="frm" >
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
								<div class="col-sm-9 uploadDiv">
									<input type="text" class="form-control" id="select_itemA"  name="select_itemA" placeholder="항목A" required="required">
									<input type="file"  id="itemAFile"  name="itemAFile" class="form-control" >
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
								<input type="text" class="form-control" id="select_itemB"  name="select_itemB" placeholder="항목B" required="required">
									<input type="file"  id="itemBFile"  name="itemBFile" class="form-control" >
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

<script>

var regax = new RegExp("(.*?)\.(jpeg|jpg|png|gif|bmp|tiff|heic)$");   //허용되는확장자(사진)
var maxSize = 1024*1024*5;  //5MB

function checkExtension(fileName, fileSize){
	//용량체크
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	//허용확장자체크
	if(!regax.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	return true;
}

function showUploadFile(uploadResultArr){
	
	//uploadResultArr의 값이 없으면 리턴해라	
		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
			
		}
		
		let str = "";
		
		$(uploadResultArr).each(function(i, obj){
			//obj.image 이미지일 경우에 처리 
			if(obj.image){
			//디스플레이값넣어준것과 같은 파일명(썸네일)
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			//원본파일
			var fileRealPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
			
			//str +=  "<li><img src = 'display?fileName=" + fileCallPath+ "'></li>";
			str +=  "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><a href='../download?fileName="+fileRealPath+"'>";
			str +=	"<img src = '../display?fileName=" + fileCallPath+ "'></a>";
			str +=  "<span data-realfile = '"+fileRealPath+"' data-file = '"+fileCallPath+"' data-type = 'image'>X</span></li>";
			}else {
				var fileRealPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				
				
				str +=  "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><a href='../download?fileName="+fileRealPath+"'>";
				str +=	"파일아이콘</a>";
				str +=  "<span data-realfile = '"+fileRealPath+"' data-file = '"+fileCallPath+"' data-type = 'file'>X</span></li>";		
			}
		});
		
		$(".uploadResult ul").append(str);
	}


$(document).ready(function(){
	$("button[type=submit]").on("click",function(e){
		e.preventDefault();
		
		let select_title = $("#select_title").val();
		let select_content = $("#select_content").val();
		let select_itemA = $("#select_itemA").val();
		let select_itemB = $("#select_itemB").val();
		if(select_title == ''){
			alert("제목을 입력하세요.");
			return;
		}else if(select_content ==''){
			alert("설명을 입력하세요.");
			return;
		}else if(select_itemA ==''){
			alert("항목A를 입력하세요.");
			return;
		}else if(select_itemB ==''){
			alert("항목B를 입력하세요.");
			return;
		}
		
		let str = "";
		//console.log("submit");
		
		$(".uploadResult ul li").each(function(i, obj){
			console.log(obj);
			str += '<input type="hidden" name="attachList['+i+'].fileName" value="'+$(obj).data('filename')+'"> ';
			str += '<input type="hidden" name="attachList['+i+'].uuid" value="'+$(obj).data('uuid')+'"> ';
			str += '<input type="hidden" name="attachList['+i+'].uploadPath" value="'+$(obj).data('path')+'"> ';
			str += '<input type="hidden" name="attachList['+i+'].fileType" value="'+$(obj).data('type')+'"> ';
		});
		
		$("#frm").append(str).submit();
		
	});
	

 	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}"; 
	
	$("input[type=file]").on("change", function(){
	
		//console.log("까꿍");
		var formData = new FormData();
		var inputfileA = $("input[name=uploadFileA]");
		var inputfileB = $("input[name=uploadFileB]");
		var files = inputfile[0].files;
		console.log(files);
		
		for(var i = 0; i< files.length ; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFileA", files[i],files[i].name);
			formData.append("uploadFileB", files[i],files[i].name);
		}
		
		
		$.ajax({
			url:"/diary/uploadAjaxAction",
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success:function(result){
				console.log(result);
				
				//파일선택 초기화 : uploadDiv에 복사해둔 cloneObj를 넣겠다.
				//$(".uploadDiv").html(cloneObj.html());
				$("#uploadFileA").val('');
				$("#uploadFileB").val('');
				//파일목록출력
				showUploadFile(result);
			}
		});
	});
	
	
	var cloneObj = $(".uploadDiv").clone();
	//이미지첨부삭제관련 , uploadResult에서 span태그 클릭했을때
	$(".uploadResult").on("click", "span", function(){
		let targetRealfile = $(this).data("realfile");  //원본파일
		let targetfile = $(this).data("file");			//썸네일파일
		let type = $(this).data("type");
		let span = $(this);
		
		$.ajax({
			url:'../deleteFile',
			data: {
				fileName : targetfile,
				fileRealName : targetRealfile,
				type : type
				},
			dataType:"text", 
			type: "POST",
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success:function(result){
				console.log(result);
				
				//삭제성공하면 업로드 썸네일 삭제하기
				if("deleted" == result){
					
					span.parent().remove();
					//파일선택 초기화 : uploadDiv에 복사해둔 cloneObj를 넣겠다.	
					//$(".uploadDiv").html(cloneObj.html());
					//파일목록출력
					showUploadFile(result);
					
				}
			}
		});
	});
	
});


</script>

<%@ include file="../include/footer.jsp"%>