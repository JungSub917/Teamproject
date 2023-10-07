$(document).ready(function () {
    $(window).scroll(function () {
		if ($(this).scrollTop() > 200) {
			$('.scroll_top').fadeIn(200);
		} else {
			$('.scroll_top').fadeOut(200);
		}
	});
	$('.scroll_top').click(function (event) {
		event.preventDefault();
		$('html, body').animate({ scrollTop: 0 }, 300);
	});
        $(".scroll").click(function(event){         
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
	});
	
	$(document).ready(function() {
  const date = new Date();
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0');
  const day = String(date.getDate()).padStart(2, '0');
  const formattedDate = `${year}-${month}-${day}`;
  $("#date").val(formattedDate);

  $("#date").datepicker({
    dateFormat: 'yy-mm-dd',
    minDate: 0,
    onSelect: function() {
    }
  });
});
});
		


$(function() {
  let nav = $("#nav");
  let originalNavPosition = nav.offset().top + 50;
  $(window).scroll(function() {
    let scrollPosition = $(window).scrollTop();
    if (scrollPosition > originalNavPosition) {
      nav.addClass("fix");
    } else {
      nav.removeClass("fix");
    }

    let scroll = $(".scroll");
    let section1 = $("#p1").offset().top - 150;
    let section2 = $("#p2").offset().top - 150;
    let section3 = $("#p3").offset().top - 150;
    let section4 = $("#p4").offset().top - 150;
    let section5 = $("#p5").offset().top - 100;
    
    if (scrollPosition >= section1 && scrollPosition < section2) {
      scroll.removeClass("active");
      $("#s1").addClass("active");
    } else if (scrollPosition >= section2 && scrollPosition < section3) {
      scroll.removeClass("active");
      $("#s2").addClass("active");
    } else if (scrollPosition >= section3 && scrollPosition < section4) {
      scroll.removeClass("active");
      $("#s3").addClass("active");
    } else if (scrollPosition >= section4 && scrollPosition < section5){
      scroll.removeClass("active");
      $("#s4").addClass("active");
    } else if (scrollPosition >= section5){
      scroll.removeClass("active");
      $("#s5").addClass("active");
    } else{
      scroll.removeClass("active");
	}
});

$(".indetails_box button").click(function() {
		   let userContent = $(this).closest('.tour_review').find('.user_content');
			if (userContent.css('display') === 'none') {
			  $(".user_content").css("display","none");  
		 	  $(".look_btn").text("자세히");
			  userContent.css('display', 'block');
		      $(this).text("접기");
		    } else {
		      userContent.css('display', 'none');
		      $(this).text("자세히");
		    }
		  });
	
});
	

	
$(document).on("click",".review_update",function(){
	let tno = $(this).attr("id");
    let idx = $(this).attr("name");
    let _width = '750';
    let _height = '750';
    let _left = Math.ceil((window.screen.width - _width) / 2);
    let _top = Math.ceil((window.screen.height - _height) / 2);

    // 팝업창 열기
    let popup = window.open('Controller?command=review_update&tno=' + tno + '&idx=' + idx, 'popup-test', 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top);
    
    // 팝업창이 닫히는 이벤트를 감지하여 원래 페이지 새로고침
    popup.onunload = function() {
        location.reload();
    };
});
			
			
$(document).on("click",".review_delete",function() {
    let reviewId = $(this).attr("id");
    // Ajax 요청 보내기
    $.ajax({
        url: 'http://localhost:9090/WebProject1/ReviewDelete',  // 삭제 처리를 수행하는 서블릿 주소 또는 URL
        type: 'POST',  // 요청 메소드 (GET 또는 POST)
        data: { reviewId: reviewId },  // 삭제할 리뷰의 식별자 데이터
        success: function(response) {
            $('#' + reviewId).closest('.tour_review').fadeOut('fast', function() {
                $(this).remove();
            });
        },
        error: function() {
            console.error('Failed to delete review.');
        }
    });
});

	
