<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>    
 <title>달력</title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     
    <style>
* {
    margin: auto;
    padding: auto;
}

.custom_calendar_table td {
    text-align: center;
}

.custom_calendar_table thead.cal_date th {
    font-size: 1.5rem;
}

.custom_calendar_table thead.cal_date th button {
    font-size: 1.5rem;
    background: none;
    border: none;
}

.custom_calendar_table thead.cal_week th {
    background-color: #288CFF;
    color: #fff;
}

.custom_calendar_table tbody td {
    cursor: pointer;
}

.custom_calendar_table tbody td:nth-child(1) {
    color: red;
}

.custom_calendar_table tbody td:nth-child(7) {
    color: #288CFF;
}

.custom_calendar_table tbody td.select_day {
    background-color: #288CFF;
    color: #fff;
}
</style>


<body>
    <div id="calendarForm">
    
    
    
    </div>
    
    <div id="content" class="panel-body" style="display: inline-block; text-align:center; margin-left:300px;"></div>
    
    
    
</body>

<script>

(function () {
    calendarMaker($("#calendarForm"), new Date());
})();

var nowDate = new Date();
function calendarMaker(target, date) {
    if (date == null || date == undefined) {
        date = new Date();
    }
    nowDate = date;
    if ($(target).length > 0) {
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1;
        $(target).empty().append(assembly(year, month));
    } else {
        console.error("custom_calendar Target is empty!!!");
        return;
    }

    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);


    var tag = "<tr>";
    var cnt = 0;
    //빈 공백 만들어주기
    for (i = 0; i < thisMonth.getDay(); i++) {
        tag += "<td></td>";
        cnt++;
    }

    //날짜 채우기
    for (i = 01; i <= thisLastDay.getDate(); i++) {
        if (cnt % 07 == 0) { tag += "<tr>"; }

        tag += "<td>" + i + "</td>";
        cnt++;
        if (cnt % 07 == 0) {
            tag += "</tr>";
        }
    }
    $(target).find("#custom_set_date").append(tag);
    calMoveEvtFn();

    function assembly(year, month) {
        var calendar_html_code =
            "<table class='custom_calendar_table'>" +
            "<colgroup>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "<col style='width:81px'/>" +
            "</colgroup>" +
            "<thead class='cal_date'>" +
            "<th><button type='button' class='prev'><</button></th>" +
            "<th colspan='5'><p><span>" + year + "</span>년 <span><th colspan='5'>" + month + "</span>월</p></th>" +
            "<th><button type='button' class='next'>></button></th>" +
            "</thead>" +
            "<thead  class='cal_week'>" +
            "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
            "</thead>" +
            "<tbody id='custom_set_date'>" +
            "</tbody>" +
            "</table>";
        return calendar_html_code;
    }
    
 

    /* 선택한 날짜  */
    function calMoveEvtFn() {
        //전달 클릭
        $(".custom_calendar_table").on("click", ".prev", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        //다음날 클릭
        $(".custom_calendar_table").on("click", ".next", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        //일자 선택 클릭
        $(".custom_calendar_table").on("click", "td", function () {
            $(".custom_calendar_table .select_day").removeClass("select_day");
            $(this).removeClass("select_day").addClass("select_day");
            
            //console.log(nowDate.getFullYear());
            //console.log(nowDate.getMonth()+1);
            //console.log($(this).text());
			
            var year = nowDate.getFullYear();
           	var month = nowDate.getMonth()+1;
           	var day = $(this).text();
           		//일자가 한자리 수일때 0붙이기
           		if(day>10){
           			day=$(this).text();
           			}else if(day<10){
           				day='0'+$(this).text();
           			}
           		//월이 한자리 수 일때 0 붙이기
           		if(month>10){
           			month=nowDate.getMonth()+1;
           			}else if(month<10){
           				month='0'+(nowDate.getMonth()+1);
           			}
            
            var date = year +"-" + month +"-"+ day;
            console.log(date);
            
         
          /* 날짜 클릭하면 해당일자 일기 출력 */  
          //[{"journal_pk":21,"journal_title":"날씨가 너무춥다","journal_content":"완전춥다","journal_weather":"추움","journal_regdate":"2022-12-15","journal_writer":"admin99","journal_hit":0,"journal_update":"2022-12-15 10:28:05"}]
            $.ajax({
            	type:"get",
            	url:"/diary/journal/calendar/"+date+".json",
            	contetnType:'application/json',
            	//data:JSON.stringify(data),
            	success:function(res){
            		//console.log(res);
            		//console.log(res.length);  일기 수      		
           
            		 let html = "";
            		 
            		 for(let i = 0; i<res.length;i++){
            			 
            			var str = JSON.stringify(res[i]);
                 		let data = JSON.parse(str);
                 		//console.log(data.journal_pk);
                 	
                 		html+='<div class="col-md-8 form-group">';
                 		html+='<div class="panel panel-default new-message">';					
                 		html+='<form method="post" id="frm" class="form-horizontal" action="" >';
                 		//html+='<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">';
                 		html+='<div class="panel-body">';
                 		html+='<div class="media-body">';
                 		html+='<h4 class="media-heading m-t-xs">';
                 		html+='<input type="hidden" name="journal_pk" value="'+data.journal_pk+'"/>';
                 		html+='<strong>'+data.journal_title+'</strong>';
                 		html+='</h4>';
                 		html+='<small class="media-meta">'+data.journal_regdate+'</small>';
                 		html+='<br>';
                 		html+='<small class="media-meta">'+data.journal_weather+'</small>';
                 		html+='<textarea readonly="readonly" class="form-control">'+data.journal_content+'</textarea>';									
                 		html+='</div>';
                 		html+='</div>';
                 		html+='</form>';
                 		html+='</div>';
                 		html+='</div>';
                 		
            		 }
            		 
                     	$("#content").html(html);
            		
            		
            	},
            	error:function(request, status, error){

            		console.log("code:"+request.status);
            		console.log("message:"+request.responseText);
            		console.log("error:"+error);

            	}
            });
            
            
           
        });
    }
    
    
    
}
</script>

    <%@ include file="../include/footer.jsp"%>