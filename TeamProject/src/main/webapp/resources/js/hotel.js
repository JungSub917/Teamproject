// 검색 popup창 열기
$(function(){
  $(".search_box").click(function(){
    $(".search_popup").show();
  });
});

// 검색창
function filter(){

  var value, name, item, i;

  value = document.getElementById("dodbogi").value.toUpperCase();
  item = document.getElementsByClassName("content_items");

  for(i=0;i<item.length;i++){
    name = item[i].getElementsByClassName("nameC");
    if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
      item[i].style.display = "block";
    }else{
      item[i].style.display = "none";
    }
  }

}
// 메뉴 클릭시 검색 value값 넣고 popup창 닫기
$(function(){
  $(".content_items").click(function(){
    let cityName = $(this).children().children("p:first").text();
		let cityCode = $(this).children().children("p:last").text();
    $('input[name="dodbogi"]').attr("value", cityName);
    $('input[name="cityCode"]').attr("value", cityCode);
		
  });
});

$(document).on("click", ".content_items", function() {
  $(".search_popup").hide();
});
// 검색 popup창 닫기
$(document).mouseup(function (e) {
  var container = $(".search_popup");

  if (!container.is(e.target) && container.has(e.target).length === 0) {
    container.hide();
  }
});

// daterangepicker
$(function() {
  $('input[name="datefilter"]').daterangepicker({
    locale: {
      "separator": " ~ ",                     // 시작일시와 종료일시 구분자
      "format": 'MM월 DD일',     								// 일시 노출 포맷
      "applyLabel": "선택완료",                 // 확인 버튼 텍스트
      "cancelLabel": "취소",                   // 취소 버튼 텍스트
      "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
      "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
      },
  }, function(start, end, label) {
    //alert("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD','+1DD'));

	});
});

// 인원수 popup창 보이기
$(function(){
  $(".hotel_person").click(function(){
    $(".hotel_person_con").show();
  });
});
// 인원수 popup창 닫기
$(function(){
  $('.close_btn, input[name="daterange"], input[name="dodbogi"], #condition2').click(function(){
    $(".hotel_person_con").hide();
  });
});
// 객실, 인원수 + -
$(function(){
  let roomCnt = Number($(".room_number").val());
  // 객실 + -
  $("#minus_btn_room").click(function(){
    roomCnt = Number($(".room_number").val());
    // $(".room_number").val(roomCnt - 1);
    if (roomCnt > 0) {
      $(".room_number").val(roomCnt - 1);
    }
  });
  $("#plus_btn_room").click(function(){
    roomCnt = Number($(".room_number").val());
    $(".room_number").val(roomCnt + 1);

  });  
});    