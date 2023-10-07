/* 새로고침 시 랜덤 이미지 */
$(function(){
  let randomNumber = Math.floor(Math.random() * 4) + 1;
  $('.banner img').attr('src', 'resources/images/main_banner' + randomNumber + '.jpg');
});
/* slick */
$( document ).ready( function() {
    $('.responsive').slick({
      dots: true,
      infinite: false,
      speed: 300,
      slidesToShow: 4,
      slidesToScroll: 4,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 3,
            slidesToScroll: 3,
            infinite: true,
            dots: true
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
        // You can unslick at a given breakpoint now by adding:
        // settings: "unslick"
        // instead of a settings object
      ]
    });
  } );

// 검색 popup 스타일
$(function() {
  $(".search_box").click(function(){
    $(".search_box").css('border-top-left-radius','15px'),
    $(".search_box").css('border-top-right-radius','15px'),
    $(".search_box").css('border-bottom-left-radius','0px'),
    $(".search_box").css('border-bottom-right-radius','0px');
  });
});

// 검색 popup창 열기
$(function(){
  $(".search_box").click(function(){
    $(".search_popup").show();
    $(".search_popup_bg").show();
  });
});
// 검색 popup창 닫기
$(function(){
  $('.search_popup_bg').click(function(){
    $(".search_popup").hide();
    $(".search_popup_bg").hide();
    $(".search_box").css('border-top-left-radius','30px'),
    $(".search_box").css('border-top-right-radius','30px'),
    $(".search_box").css('border-bottom-left-radius','30px'),
    $(".search_box").css('border-bottom-right-radius','30px');
  });
});

// 검색창
function filter(){

  var value, name, item, i;

  value = document.getElementById("dodbogi").value.toUpperCase();
  item = document.getElementsByClassName("content_items");

  for(i=0;i<item.length;i++){
    name = item[i].getElementsByClassName("name");
    if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
      item[i].style.display = "block";
    }else{
      item[i].style.display = "none";
    }
  }
}