$(function(){
			$(".naticon").click(function(){
				let natId =$(this).attr("id");
				$.ajax({
					url: "TourMain",
					type: "post",
					data : {natId: natId},
					success:function(response){
						$(".backImg").css("background-image","url("+response.backImg+")");
						$(".flag").attr("src",response.flag);
						if(response.category1 == null){
							$(".category1 .title").hide();
							$(".list_A").hide();
						}else{
							$(".category1 .title").show();
							$(".list_A").show();
							$(".category1 .title").text(response.category1);
						};
						if(response.category2 == null){
							$(".list_B").hide();
							$(".category2 .title").hide();
						}else{
							$(".list_B").show();
							$(".category2 .title").show();
							$(".category2 .title").text(response.category2);
						};
						if(response.category3 == null){
							$(".list_C").hide();
							$(".category3 .title").hide();
						}else{
							$(".list_C").show();
							$(".category3 .title").show();
							$(".category3 .title").text(response.category3);
						};
						
						if(response.category1 == null && response.category2 == null && response.category3 == null){
							$("#tour_item_box").hide();
							$(".tour_none_item").show();
						}else{
							$(".tour_none_item").hide();
							$("#tour_item_box").show();
						}
					},
					error: function(xhr, status, error) {
						console.log(xhr);
						console.log(status);
		                console.log(error); // 에러를 graceful하게 처리하세요
		            }
				});
				$.ajax({
					  url: "TourList",
					  type: "POST",
					  data: { natId: natId },
					  success: function(response) {
						  let itemlist = "";
						  for (var i = 0; i < response.length; i++) {
						      let img = response[i].img;
						      let hash = response[i].hash;
						      let money = response[i].money;
						      let tourId = response[i].tourId;
						  	  let natName = response[i].natName;

						      // 이미지와 텍스트를 업데이트하는 코드
						      itemlist +=
						        '<div id = "'+ tourId +'" class="fl top_item">' +
						        '<img src="' + img + '" alt="">' +
								'<div class="nation">'+ natName +'</div>' +
						        '<div class="text"># ' + hash + '</div>' +
						        '<div class="price">' + money + '원</div>' +
						        '</div>' ;
						    }
							let itemBox = '<div class="slider1">'
										+ itemlist
										+ '</div>' ;
						    // 기존의 슬라이더를 삭제하고 새로운 슬라이더를 추가
						    $(".list_A").html(itemBox); // 수정된 부분

						    // 각각의 .slider1 요소에 대해 bxSlider를 초기화
						    $(".slider1").each(function() {
						      $(this).bxSlider({
						        speed: 400,
						        pager: false,
						        moveSlides: 1,
						        slideWidth: 366.666,
						        minSlides: 1,
						        maxSlides: 3,
						        infiniteLoop: false,
						        hideControlOnEnd: true,
						        touchEnabled: true
						      });
						    });
 	
					  },
						error: function(xhr, status, error) {
					    console.log(error); // 에러를 graceful하게 처리하세요
					  }
					});
				$.ajax({
					  url: "TourListB",
					  type: "POST",
					  data: { natId: natId },
					  success: function(response) {
					    let itemlist = "";
					    for (var i = 0; i < response.length; i++) {
					      let img = response[i].img;
					      let title = response[i].title;
					      let money = response[i].money;
					      let tourId = response[i].tourId;
					      let rating = response[i].rating;

					       itemlist += 
					        '<div id="' + tourId + '" class="fl tour_item">' +
					        '<img src="' + img + '" alt="">' +
					        '<div class="tour_item_title"><p>' + title + '</p></div>' +
					        '<div class="rating_price_box">' +
					        '<div class="fl fb tour_item_rating"><i></i><span>' + rating + '</span></div>' +
					        '<div class="fr tour_item_price">' + money + '원</div>' +
					        '</div>' +
					        '</div>';
					    }
					    let itemBox = '<div class="slider2">' + itemlist + '</div>';

					    $(".list_B").html(itemBox);

					    $(".slider2").each(function() {
					      $(this).bxSlider({
					        speed: 300,
					        pager: false,
					        moveSlides: 1,
					        slideWidth: 275,
					        minSlides: 1,
					        maxSlides: 4,
					        infiniteLoop: false,
					        hideControlOnEnd: true,
					        touchEnabled: true
					      });
					    });
					  },
					  error: function(xhr, status, error) {
					    console.log(error); // 에러를 graceful하게 처리하세요
					  }
					});
				$.ajax({
					  url: "TourListC",
					  type: "POST",
					  data: { natId: natId },
					  success: function(response) {
					    let itemlist = "";
					    for (var i = 0; i < response.length; i++) {
					      let img = response[i].img;
					      let title = response[i].title;
					      let money = response[i].money;
					      let tourId = response[i].tourId;
					      let rating = response[i].rating;

					      itemlist += 
					        '<div id="' + tourId + '" class="fl tour_item">' +
					        '<img src="' + img + '" alt="">' +
					        '<div class="tour_item_title"><p>' + title + '</p></div>' +
					        '<div class="rating_price_box">' +
					        '<div class="fl fb tour_item_rating"><i></i><span>' + rating + '</span></div>' +
					        '<div class="fr tour_item_price">' + money + '원</div>' +
					        '</div>' +
					        '</div>';
					    }
					    let itemBox = '<div class="slider3">' + itemlist + '</div>';

					    $(".list_C").html(itemBox);

					    $(".slider3").each(function() {
					      $(this).bxSlider({
					        speed: 300,
					        pager: false,
					        moveSlides: 1,
					        slideWidth: 275,
					        minSlides: 1,
					        maxSlides: 4,
					        infiniteLoop: false,
					        hideControlOnEnd: true,
					        touchEnabled: ture
					      });
					    });
					  },
					  error: function(xhr, status, error) {
					    console.log(error); // 에러를 graceful하게 처리하세요
					  }
					});
			});
		})