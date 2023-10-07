// 인원수 popup창 보이기
$(function(){
  $(".hotel_person").click(function(){
    $(".hotel_search_person").show();
  });
});
// 인원수 popup창 닫기
$(function(){
  $('.close_btn, input[name="daterange"]').click(function(){
    $(".hotel_search_person").hide();
  });
});
// 가격 , 찍기
function pricedot(){
$(function(){
	  $('.room_price').each(function(){
	    let roomPrice = $(this).text();
	    roomPrice = Number(roomPrice);
	    roomPrice = roomPrice.toLocaleString();
	    roomPrice = roomPrice + "원";
	    $(this).text(roomPrice);
	  });
	});
	$(function(){
	  $('.hmc_hotel_price').each(function() {
	    let hmcRoomPrice = $(this).text();
	    hmcRoomPrice = Number(hmcRoomPrice);
	    hmcRoomPrice = hmcRoomPrice.toLocaleString();
	    hmcRoomPrice = hmcRoomPrice + "원";
	    $(this).text(hmcRoomPrice);
	  });
	});
}	
// map pop에서 평점에 따른 만족도 표시
$(function(){
  $('.hmc_hotel_rating span').each(function() {
    let rating = parseFloat($(this).text());
    if (rating >= 4.5) {
      $(this).parent().parent().children('span').text("최고");
    } else if (rating >= 4.0) {
      $(this).parent().parent().children('span').text("매우 좋음");
    } else if (rating >= 3.5) {
      $(this).parent().parent().children('span').text("좋음");
    } else if (rating >= 3.0) {
      $(this).parent().parent().children('span').text("만족");
    }
  });
});
// hotel 계산 
function calc(){
  let roomPrice = $("#room_price").text();
  roomPrice = roomPrice.replace(/,|원/g, "");
  roomPrice = Number(roomPrice);
  
  let roomCnt = Number($(".room_number").val());

  let room = roomPrice * roomCnt * diffDays;
  room = room.toLocaleString();
  room = room + "원";

  $("#room_price").text(room);
  return room;
}

$(function(){
  let roomCnt = Number($(".room_number").val());
//  let adultCnt;
//  let childCnt;
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
	// 성인 + -
  $("#minus_btn_adult").click(function(){
     adultCnt = Number($(".adult_number").val());
     if( adultCnt === 0){
       $(".adult_number").val();
     }else{
       $(".adult_number").val(adultCnt - 1);
     }
   });
   $("#plus_btn_adult").click(function(){
     adultCnt = Number($(".adult_number").val());
     $(".adult_number").val(adultCnt + 1);
   });
// 어린이 + -
   $("#minus_btn_child").click(function(){
     childCnt = Number($(".child_number").val());
     if( childCnt == 0){
       $(".child_number").val();
     }else{
       $(".child_number").val(childCnt - 1);
     }
   });
   $("#plus_btn_child").click(function(){
     childCnt = Number($(".child_number").val());
    $(".child_number").val(childCnt + 1);
   });

  $(function (){
    $("#condition2").click(function(){
      $(".hotel_search_person").hide();
      $(".room_cnt").text(roomCnt);
      calc();
  
    });
  });
});

// 지도 팝업 열고 닫기
$(function(){
  $(".hotel_btn").click(function() {
    $(".hotel_map_box_bg").show();
    $(".hotel_map_box").show();
    $('body').css('overflow', 'hidden');
  });
});
$(function(){
  $(".hotel_map_box_close_btn").click(function() {
    $(".hotel_map_box_bg").hide();
    $(".hotel_map_box").hide();
    $('body').css('overflow', '');
  });
});
  
  
// filter관련 input 태그
$(function(){
  $('.visit_place').click(function(){
    if($(this).children('p').hasClass('on') === false){
      $(this).children('p').addClass("on");
    }else{
      $(this).children('p').removeClass("on");
    }
  })
});

$(document).ready(function(){
  $(".price_filter2").click(function(){
    if($(this).is(":checked")){
      $(".price_filter2").not(this).parent().children('div').removeClass('check_circle');
      $(this).parent().children('div').addClass('check_circle');
    } else {
      $(this).parent().children('div').removeClass('check_circle');
    }
  });
  $(".userating_filter3").click(function(){
    if($(this).is(":checked")){
      $(".userating_filter3").not(this).parent().children('div').removeClass('check_circle');
      $(this).parent().children('div').addClass('check_circle');
    } else {
      $(this).parent().children('div').removeClass('check_circle');
    }
  });
  $(".hotelrating_filter4").click(function(){
    if($(this).is(":checked")){
      $(".hotelrating_filter4").not(this).parent().children('div').removeClass('check_circle');
      $(this).parent().children('div').addClass('check_circle');
    } else {
      $(this).parent().children('div').removeClass('check_circle');
    }
  });
});

$(document).ready(function(){
  $(".resetButton").click(function(){
    if($(".price_filter2").is(":checked")){
      $(".price_filter2").not(this).parent().children('div').removeClass('check_circle');
      $(".userating_filter3").not(this).parent().children('div').removeClass('check_circle');
      $(".hotelrating_filter4").not(this).parent().children('div').removeClass('check_circle');
      $("#price_all").parent().children('div').addClass('check_circle');
      $("#user_rating_all").parent().children('div').addClass('check_circle');
      $("#hotel_rating_all").parent().children('div').addClass('check_circle');
    } 
    $(".visit_place").children('p').removeClass("on");
  });

});
