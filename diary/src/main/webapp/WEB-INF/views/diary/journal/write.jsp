<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<title>일기 쓰기</title>    
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
						<a href="readAll" type="button" class="btn action-panel-btn btn-default btn-block">목록보기</a>
					</div>

					
				</div><!-- .app-action-panel -->
			</div><!-- END column -->

			<div class="col-md-10">
				<div class="panel panel-default new-message">
					<header class="widget-header">
						<h4 class="widget-title">일기쓰기</h4>
					</header><!-- .widget-header -->	
					<hr class="widget-separator">
					<div class="widget-body">
					<div class="m-b-lg">
						<small>
							오늘의 일기를 작성해주세요!
						</small>
						</div>			
					<form id="frm" method="post" action="" >
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
						<div class="panel-body">
							<div class="form-group">
								<input type="text" class="form-control input-sm" id="journal_writer" readonly="readonly" name="journal_writer" 	value="<sec:authentication property="principal.username"/>">								
							</div><!-- .form-group -->
							<div class="form-group">
								<input type="text" class="form-control" id="journal_title" name="journal_title" placeholder="일기 제목" required="required">
							</div>	
							<div class="form-group m-b-0">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<div class='input-group date'>
												
    												<p>일정을 선택해주세요. <input type="text" class="form-control" id="datepicker" name="journal_regdate"></p> 												
    										
												
											</div>
										</div>
									</div>
									<div class="col-sm-6" id="journal_weather" >
										
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_sunny" value="맑음"> 맑음
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_windy" value="바람"> 바람
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_cold" value="추움"> 추움
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_rainy" value="비"> 비
											</label>
											<label class="radio-inline">
												<input type="radio" name="journal_weather" id="weather_snowy" value="눈"> 눈
											</label>										
											<label class="radio-inline">
												<input type="radio" name=journal_weather id="weather_murky" value="흐림"> 흐림
											</label>
									
									</div>
								</div>
							</div><!-- .form-group -->

							
							<textarea class="form-control full-wysiwyg" name=journal_content id="journal_content" rows="10" placeholder="오늘의 일기" required="required"></textarea>
						</div><!-- .panel-body -->

						<div class="panel-footer clearfix">
							<div class="pull-right">
								<button type="reset" class="btn btn-default" id="btn_reset"><i class="fa fa-trash"></i></button>
								<button type="submit" class="btn btn-default" id="btn_save"><i class="fa fa-save"></i></button>
							</div>
						</div><!-- .panel-footer -->
					</form>
					</div>
				</div><!-- .panel -->
			</div><!-- END column -->
		</div><!-- .row -->
	</section><!-- .app-content -->
</div><!-- .wrap -->


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
  
  <!-- APP FOOTER -->
  <%@ include file="../include/footer.jsp"%>