$(function() {
	$('#datepicker').datepicker({
		dateFormat: 'yy-mm-dd'
		, showOtherMonths: true
		, showMonthAfterYear: true
		, changeYear: true
		, changeMonth: true
		, yearSuffix: "년"
		, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		, dayNamesShort: ['일', '월', '화', '수', '목', '금', '토']
		, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
		, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']
		, minDate: "-5Y"
		, maxDate: "+5y"
		, onSelect: function() {
		let plancnt = $(".plandate").length;
	let formatdate = $("#datepicker").datepicker("getDate");
	let formatdate2 = $("#datepicker").datepicker("getDate");
	let nowdate = $.datepicker.formatDate("mm월-dd일(D)", $("#datepicker").datepicker("getDate"), { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
//	alert(Number($(".addday >.visitday:eq(0)").text())+1);
	for(var i=0;i<plancnt;i++){
		let sumdate =0;
		sumdate = sumdate+Number($(".addday > .visitday:eq("+i+")").text());
		let date = $.datepicker.formatDate("mm월-dd일(D)", $("#datepicker").datepicker("getDate"), { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
		let plusdate1 = $.datepicker.formatDate("mm월-dd일(D)", formatdate, { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
		date=plusdate1;
		formatdate.setDate(formatdate.getDate()+ Number($(".addday > .visitday:eq("+i+")").text()));
		let plusdate2= $.datepicker.formatDate("mm월-dd일(D)", formatdate, { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
		formatdate2.setDate(formatdate2.getDate()+ sumdate);
		let lastdate = $.datepicker.formatDate("mm월-dd일(D)", formatdate2, { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
		$(".plandate > .date:eq("+i+")").text(date+"~");
		$(".plandate > .plusdate:eq("+i+")").text(plusdate2);
		$(".plandate > .plusdate:last").text(lastdate);
	}
		$(".plandate > .date:first").text(nowdate);
		}
		
	});
	$('#datepicker').datepicker('setDate', 'today');
	
//		$("#addtrip").on("click",function(){
///*시작날짜*/	let start = $.datepicker.formatDate("yy/mm/dd",$("#datepicker").datepicker("getDate"));
//			let cnt = $("section").length;
//			let enddate = $("#datepicker").datepicker("getDate");
////			let start = $(".plan:first").closest(".date").text();
//				let answer = confirm("일정을 저장하시겠습니까?")
//				if(answer){
//					let sum=0;
//					for(var i = 0; i<cnt; i++){
//						sum = sum+Number($(".addday > .visitday:eq("+i+")").text());
//						let id = $(".addday:eq("+i+")").attr("cityid");
//						let order = $("section:eq("+i+")").attr("plan_order");
//						let visitday = $(".visitday:eq("+i+")").text();
// 					list.push({cityid:id , plan_day:visitday});
//					}
///*종료날짜*/			enddate.setDate(enddate.getDate()+sum);
//					enddate = $.datepicker.formatDate("yy/mm/dd",enddate);
// 					list.push({p_cnt:cnt,idx:1,p_start:start,p_end:enddate});
// 					let url = "http://localhost:9090/WebProject1/SetMyplanServelt";
// 					var list2 = {"list":JSON.stringify(list)};
// 					$.ajax({
//						 type: "POST",
//						 url : url,
//						 data : list2,
//						 traditional : true,
//						 success : function (){
//							 console.log("성공");
//						 },
//						 error:function(e){
//							 console.log(e);
//							 alert("실패");
//						 }
//					 })
//				};
//			});
			
});
function resetdate(){
	let plancnt = $(".plandate").length;
	let formatdate = $("#datepicker").datepicker("getDate");
	let formatdate2 = $("#datepicker").datepicker("getDate");
	let nowdate = $.datepicker.formatDate("mm월-dd일(D)", $("#datepicker").datepicker("getDate"), { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
//	alert(Number($(".addday >.visitday:eq(0)").text())+1);
	for(var i=0;i<plancnt;i++){
		let sumdate =0;
		sumdate = sumdate+Number($(".addday > .visitday:eq("+i+")").text());
		let date = $.datepicker.formatDate("mm월-dd일(D)", $("#datepicker").datepicker("getDate"), { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
		let plusdate1 = $.datepicker.formatDate("mm월-dd일(D)", formatdate, { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
		date=plusdate1;
		formatdate.setDate(formatdate.getDate()+ Number($(".addday > .visitday:eq("+i+")").text()));
		let plusdate2= $.datepicker.formatDate("mm월-dd일(D)", formatdate, { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
		formatdate2.setDate(formatdate2.getDate()+ sumdate);
		let lastdate = $.datepicker.formatDate("mm월-dd일(D)", formatdate2, { dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] });
		$(".plandate > .date:eq("+i+")").text(date+"~");
		$(".plandate > .plusdate:eq("+i+")").text(plusdate2);
		$(".plandate > .plusdate:last").text(lastdate);
	}
		$(".plandate > .date:first").text(nowdate+"~");
	
}
