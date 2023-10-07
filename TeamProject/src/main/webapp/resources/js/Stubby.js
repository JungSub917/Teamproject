//페이지 하단으로 이동시 상단으로 가는 버튼 활성화
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

});
// 자주묻는 질문 카테고리 박스 버튼 클릭시 active 클래스 추가
$(function(){
	$(".category_box button").click(function(){
		$(".category_box button").removeClass("active");
		$(this).addClass("active");
	
		let menu = $(this).attr("menu");
		$(".show").css("display","none");
		$("#"+menu).show();
	})
})


$(function(){
	$(".fanda_title_box").click(function(){
		let fadaContent = $(this).closest(".fanda_main_box").find(".fanda_content_box");
		let qIcon = $(this).find(".fanda_icon_q img");
		let upIcon = $(this).find(".fanda_ud_icon");
		let otherQIcons = $(".fanda_icon_q img").not(qIcon);
    	let otherUpIcons = $(".fanda_ud_icon").not(upIcon);
		if(fadaContent.css('display') === 'none'){
			$(".fanda_content_box").css("display","none");
			fadaContent.css('display','block');
			qIcon.css("filter","invert(55%) sepia(34%) saturate(919%) hue-rotate(135deg) brightness(89%) contrast(92%)");
			upIcon.css("background-position","-127px -115.25px");
			otherQIcons.css("filter","invert(61%) sepia(15%) saturate(0%) hue-rotate(159deg) brightness(95%) contrast(95%)");
      		otherUpIcons.css("background-position","-151px -115.25px");
			$(".fanda_content_btn").css("display","none");
		}else{
			$(".fanda_content_btn").css("display","none");
			fadaContent.css('display','none');
			qIcon.css("filter","invert(61%) sepia(15%) saturate(0%) hue-rotate(159deg) brightness(95%) contrast(95%)");
			upIcon.css("background-position","-151px -115.25px");
		};
			
	});
	
	$(".fanda_menu_btn").click(function(){
 	    let contentBtn = $(this).parent().find(".fanda_content_btn");
 	    if(contentBtn.css("display") === "none"){
 	    	contentBtn.css("display","inline-block");
 	    }else{
 	    	contentBtn.css("display","none");
 	    };
 	 });

	$(".qanda_menu_btn").click(function(){
		let contentBtn = $(this).parent().find(".qanda_content_btn");
		if(contentBtn.css("display") === "none"){
 	    	contentBtn.css("display","inline-block");
 	    }else{
 	    	contentBtn.css("display","none");
 	    };
 	 });

	$(document).on("click",".top_item",function() {
			        let tourId = $(this).attr("id");
			        location.href = "Controller?command=tourItem_detail&tourId="+tourId;
			    });
	$(document).on("click",".tour_item",function() {
			        let tourId = $(this).attr("id");
			        location.href = "Controller?command=tourItem_detail&tourId="+tourId;
			    });
	$(".review_menu").click(function(){
		let contentBtn = $(this).parent().find(".review_btn");
		
		if(contentBtn.css("display")==="none"){
			contentBtn.css("display","inline-block");
		}else{
			contentBtn.css("display","none");
		}
	});
	
		$(".category_box #signup").click(function(){
			location.href = "Controller?command=fanda_signup_list";			
		});
		$(".category_box #diary").click(function(){
			location.href = "Controller?command=fanda_diary_list";			
		});
		$(".category_box #plan").click(function(){
			location.href = "Controller?command=fanda_plan_list";			
		});
		$(".category_box #except").click(function(){
			location.href = "Controller?command=fanda_except_list";			
		});
		$(".fanda_delete").click(function(){
			let answer = confirm("정말 삭제하시겠습니까?");
			let fno = $(this).attr("id");
			if(answer){
				location.href = "Controller?command=fanda_delete&fno="+fno;
        		alert("삭제 되었습니다.");
   				 }
   			 else{
				return false;
				alert("취소 되었습니다."); 
			}
		});
		 $(".fanda_update").click(function(){
			let fno = $(this).attr("id");
			location.href = "Controller?command=fanda_update&fno="+fno;
		});
		$(".qanda_title").click(function(){
			let qno = $(this).attr("id");
			location.href = "Controller?command=qanda_detail&qno="+qno;
		});
		$(".qanda_write").click(function(){
			let idx = $(this).attr("id");
			if(idx == 0){
				alert("로그인후 이용해주세요!");
			}else{
				location.href = "qanda_write.jsp";
			}
		});
		$(".qandaDetail_delete_btn").click(function(){
			let qno = $(this).attr("id");
			let idx = $("idx").attr("id");
			let answer = confirm("정말 삭제하시겠습니까?");
			if(answer){
			location.href = "Controller?command=qanda_delete&qno="+qno;
			}else{
				alert("취소 되었습니다.");
				return;
			}
		});
		$(".qandaDetail_back_btn").click(function(){
			let idx = $("idx").attr("id");
			location.href = "Controller?command=qanda_list&idx="+idx;
		})
		$(".goQanda").click(function(){
			location.href = "Controller?command=qanda_list";
		});
		$(".qandaDetail_update_btn").click(function(){
			let qno = $(this).attr("id");
			location.href = "Controller?command=qanda_update&qno="+qno;
		});
		$(".goNotice").click(function(){
			location.href = "Controller?command=notice_list";
		});
		$(".goFanda").click(function(){
			location.href = "Controller?command=fanda_signup_list";
		});
		$(".notice_update").click(function(){
			let nno = $(this).attr("id");
			location.href = "Controller?command=notice_update&nno="+nno;
		});
		
		$(".notice_delete").click(function(){
			let answer = confirm("정말 삭제하시겠습니까?");
			let nno = $(this).attr("id");
			if(answer){
				location.href = "Controller?command=notice_delete&nno="+nno;
        		alert("삭제 되었습니다.");
   				 }
   			 else{
				location.href = "Controller?command=notice_detail&nno="+nno;	
				alert("취소 되었습니다.");
   			 }
		});
		
		$(".notice_home").click(function(){
			location.href = "jspNotice.jsp";
		});
		$(".notice_content_title").click(function(){
			let nno = $(this).attr("id");
			location.href = "Controller?command=notice_detail&nno="+nno;			
		});
		$(".notice_write button").click(function(){
			location.href = "notice_write.jsp";
		});
		$(".back_notice_list").click(function(){
			location.href = "Controller?command=notice_list";
		});
		$(".qanda_btn_box input[type=button]").click(function(){
			location.href = "Controller?command=qanda_list&idx=1";
			alert("작성이 취소 되었습니다.")
		});
		$(".qanda_comment_delete").click(function(){
			let answer = confirm("정말 삭제하시겠습니까?");
			let qno = $(this).attr("id");
			if(answer){
			location.href = "Controller?command=qanda_comment_delete&qno="+qno;
			}else{
				return;
			}
		});
		$(".qanda_comment_update").click(function(){
			let qno = $(this).attr("id");
			location.href = "Controller?command=qanda_comment_update&qno="+qno;
		});
		$(document).ready(function(){
			let categoryAarry = [];
		$("#category option").each(function() {
    			let value = $(this).val();
    		if (value !== "") {
        		categoryAarry.push(value);
    		};
				let uniqueOptionsArray = Array.from(new Set(categoryAarry));
			$("#category option").remove();
			for (let i = 0; i < uniqueOptionsArray.length; i++) {
    			let optionValue = uniqueOptionsArray[i];
    			$("#category").append("<option value='" + optionValue + "'>" + optionValue + "</option>");
				};
			});
		});
		
		let reviewsPerPage = 3; 
		let reviewIndex = 0; 
		let totalReviews = $('.tour_review').length; 
	  function showReviews() {
	    
$('.tour_review').hide();
	    for (let i = 0; i < reviewIndex + reviewsPerPage; i++) {
	      $('.tour_review').eq(i).show();
		    }
	    if (reviewIndex + reviewsPerPage < totalReviews) {
	      $('.look_content input[type="button"]').show(); 
	    } else {
	      $('.look_content input[type="button"]').hide(); 
	    }
	  }
	  showReviews();
	  $('.look_content input[type="button"]').click(function() {
    reviewIndex += reviewsPerPage; 
  	 showReviews(); 
	});
			
});

// 팝업창 닫기 버튼 클릭시 팝업창 닫기
function closePopup() {
	  window.close();
	};
	
// 리뷰 작성하기 버튼 클릭시 팝청창 가운데 띄움 

//투어아이템 페이지에서 스크롤 아래로 이동시 네비바 상단 고정
/*$(function() {
  let nav = $("#nav");
  let originalNavPosition = nav.offset().top + 50;
  $(window).scroll(function() {
    let scrollPosition = $(window).scrollTop();
    if (scrollPosition > originalNavPosition) {
      nav.addClass("fix");
    } else {
      nav.removeClass("fix");
    }
  });
});*/

//투어페이지 화면 스크롤 active
/*$(function() {
  $(window).scroll(function() {
    let scrollPosition = $(window).scrollTop();
    let scroll = $(".scroll");

    let section1 = $("#p1").offset().top - 150;
    let section2 = $("#p2").offset().top - 150;
    let section3 = $("#p3").offset().top - 150;
    let section4 = $("#p4").offset().top - 150;
    let section5 = $("#p5").offset().top - 150;
    
    if (scrollPosition >= section1 && scrollPosition < section2) {
      scroll.removeClass("active");
      $("#s1").addClass("active");
    } else if (scrollPosition >= section2 && scrollPosition < section3) {
      scroll.removeClass("active");
      $("#s2").addClass("active");
    } else if (scrollPosition >= section3 && scrollPosition < section4) {
      scroll.removeClass("active");
      $("#s3").addClass("active");
    } else if (scrollPosition >= section4 && scrollPosition < section5) {
      scroll.removeClass("active");
      $("#s4").addClass("active");
    } else if (scrollPosition >= section5){
      scroll.removeClass("active");
      $("#s5").addClass("active");
    } else {
      scroll.removeClass("active");
    }
  });
});
*/






	
// 투어 후기 버튼으로 펼처서 리뷰 보기 기능
/*$(function() {
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
		});*/

//투어아이템 페이지 네비 클릭시 해당 위치로 스크롤 이동
/*$(document).ready(function($) {
        $(".scroll").click(function(event){         
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
        });
	});	*/
//투어아이템 네비바 클릭시 active 적용

//투어아이템 좋아요 버튼 클릭시 이미지 변경
/*$(function(){
	$(".tour_like").click(function(){
		if($(this).css("background-position")==="-68px 1px"){
		$(this).css("background-position","-102px 1px");
		}else{
		$(this).css("background-position","-68px 1px");
		}
	})
})*/

/*$(function() {
  $(".tour_like").click(function() {
    if ($(this).css("background-position") === "-68px 1px") {
      $(this).css("background-position", "-102px 1px");
      $(".item_imgbox").append('<div class="hart"></div>');
      setTimeout(function() {
        $(".item_imgbox .hart").fadeOut(500, function() {
          $(this).remove();
        });
      }, 2000);
    } else {
      $(this).css("background-position", "-68px 1px");
    }
  });
});*/

	
	
/*투어 페이지 아이콘 클릭시 클릭활성화*/
$(function(){
  // 초기에 처음 아이콘에 "on" 클래스를 추가
  $(".naticon:first-child").addClass("on");

  $(".naticon").click(function(){
    // 모든 아이콘에서 "on" 클래스를 제거
    $(".naticon").removeClass("on");
    // 클릭한 아이콘에 "on" 클래스를 추가
    $(this).addClass("on");
  });
});


/*$(function() {
	$("#date").click(function(){
	let count = Math.floor(Math.random()*5)+1;
	if(count <= 3){
	$("#count").css("color","red");
	}else{
	$("#count").css("color","black");
	}
	$("#count").text(count);
	});
	const date = new Date();
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const formattedDate = `${year}-${month}-${day}`;
    $("#date").val(formattedDate);
    
	$("#date").datepicker({
	dateFormat: 'yy-mm-dd',
	minDate: 0,
	onSelect: function(){
		$(".tour_total").show();
	}
    });
});*/


$(function() {
  // 별점 클릭 이벤트 처리
  $(".star-rating input").click(function() {
    var rating = $(this).val();
    // 선택된 별점 값을 활용하여 추가적인 처리 가능
    console.log("선택된 별점: " + rating);
  });
});



