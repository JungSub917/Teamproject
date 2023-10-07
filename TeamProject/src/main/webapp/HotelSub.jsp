<%@page import="dto.HotelDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	 int cityCode = Integer.parseInt(request.getParameter("cityCode"));
	 String cityName = request.getParameter("dodbogi");
	 String daterange = request.getParameter("datefilter");
	 
	 ArrayList<HotelDto> htsearchdto = (ArrayList<HotelDto>)request.getAttribute("mapinfolist");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>숙소 - 스투비플래너</title>
  <link rel="icon" href="resources/images/favicon.png">
  <!-- jQuery -->
  <script type="text/javascript" src="resources/js/jquery-3.7.0.min.js"></script>
    <!-- google font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap" rel="stylesheet">
  <!-- daterangepicker -->
  <script src="resources/daterangepicker-master/moment.min.js"></script>
  <script src="resources/daterangepicker-master/daterangepicker.js"></script>
  <link rel="stylesheet" href="resources/daterangepicker-master/daterangepicker.css">
  <!-- my -->
  <link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/header_footer.css">
  <link rel="stylesheet" href="resources/css/hotelsub.css">
  <script type="text/javascript" src="resources/js/header_footer.js"></script>
  <script src="resources/js/hotelsub.js"></script>
</head>
<body>
	<header>
   <div class="head_box">
      <div class="head_content">
        <div class="head_title">
          <h1><a href="Controller?command=MainPage"><img src="resources/images/stu_logo.png" alt=""></a></h1>
        </div>
         <%
      			if (session.getAttribute("userEmail") == null) {
     		%> 
         <div class="gnb_box">
           <div class="gnb_content">
             <ul>
               <li><a href="Controller?command=notice_list">고객센터</a></li>
               <li><a href="Login.jsp">로그인</a></li>
               <li><a href="Signup.jsp">회원가입</a></li>
             </ul> 
           </div>
         </div> 
         <%
            } else { 
         %> 
        <div class="gnb_box">
          <div class="gnb_content">
            <ul>
              <li><a href="Controller?command=notice_list">고객센터</a></li>
              <li class="profil"><img src="resources/images/img_pfnull.jpg"></li>
            </ul>
          </div>
	        <div class="profil_box">
	        	<ul>
	        		<li>
	        			<img src="resources/images/img_pfnull.jpg">
	        			<p>
	        			${userNickname}님 <br><span class="hi">안녕하세요.</span></p>
	        		</li>
	        		<li><a href="Controller?command=mypage">마이페이지</a></li>
	        		<li><a href="Controller?command=logout&page=1">로그아웃</a></li>
	        	</ul>
	        </div>
        </div>
        <%
           }
          %>
      </div>
    </div>
    <div class="lnb_box">
      <div class="lnb_content">
        <ul>
          <li><a href="Controller?command=MainPage">홈</a></li>
          <li><a href="Controller?command=natlist">탐색</a></li>
          <li><a href="Controller?command=tour_main">유럽투어</a></li>
          <li><a href="Controller?command=HotelMain" class="on">숙소</a></li>
          <li><a href="Controller?command=diary">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
  <section>
    <div class="hotel_option_box">
      <div class="hotel_option_contain">
        <div class="hotel_city_box">
          <p><%=cityName%></p>
        </div>
        <div class="hotel_condition_box">
          <div class="hotel_condition1">
            <!-- daterangepicker -->
            <label for="calendar" class="calendar_icon"></label>
            <input type="text" name="datefilter" id="calendar" value="<%=daterange%>" readonly/>
          </div>
          <div class="hotel_condition2">
            <div class="hotel_person">객실 X<span class="room_cnt">0</span>: 성인2, 아이0</div>
            <!-- person -->
            <div class="hotel_search_person">
              <div class="person_head">
                  <p>객실 및 인원</p>
                <div class="close_btn"></div>
              </div>
              <div class="person_body">
                <div class="check_room">
                  <p>객실</p>
                  <div class="check_room_op">
                    <div id="minus_btn_room"><p class="minus_btn"></p></div>
                    <input class="room_number" type="text" value="0" readonly>
                    <div id="plus_btn_room"><p class="plus_btn"></p></div>
                  </div>
                </div>
                <div class="check_adult">
                  <p>성인</p>
                  <div class="check_adult_op">
                    <div id="minus_btn_adult"><p class="minus_btn"></p></div>
                    <input class="adult_number" type="text" value="0" readonly>
                    <div id="plus_btn_adult"><p class="plus_btn"></p></div>
                  </div>
                </div>
                <div class="check_child">
                  <p>어린이<br/><span style="font-size: 12px; font-weight: 400; color: #8f8f8f;">만0세~17세</span></p>
                  <div class="check_child_op">
                    <div id="minus_btn_child"><p class="minus_btn"></p></div>
                    <input class="child_number" type="text" value="0" readonly>
                    <div id="plus_btn_child"><p class="plus_btn"></p></div>
                  </div>
                </div>
              </div>
              <div class="person_btn">
                <input type="button" value="선택완료" id="condition2">
              </div>
            </div>
          </div>
          <div style="clear: both;"></div>
        </div>
        <div style="clear: both;"></div>
      </div>
    </div>
    <div class="hotel_category_box">
      <div class="hotel_category_contain">
        <ul>
          <li class="fl click"><a href="#">호텔</a></li>
          <li class="fl"><a href="#" onclick="prepare()">호스텔</a></li>
          <li class="fl"><a href="#" onclick="prepare()">아파트</a></li>
          <li class="fl"><a href="#" onclick="prepare()">민박</a></li>
        </ul>
      </div>
    </div>
  </section>
  <section>
    <div class="section_box">
      <div class="section_filter">
        <div class="hotel_map_icon">
          <p class="hotel_btn">지도로 보기
        </div>
        <div class="hotel_question">
        	<a href="HotelReview.jsp">문의하기</a>
        </div>
          <div class="filter_head">
            <p>필터</p>
            <button onclick="window.location.reload()">전체초기화</button>
            <p style="clear:both"></p>
          </div>
          <% if(cityCode == 1100){ %>
          <div class="filter1">
            <p class="filter_title">방문 예정지</p>
            <ul class="col4 visit">
              <li>
                <div class="visit_place">
                  <p># 에펠탑</p>
                </div>
              </li>
              <li>
                <div class="visit_place">
                  <p># 루브르</p>
                </div>
              </li>
              <li>
                <div class="visit_place">
                  <p># 베르사유</p>
                </div>
              </li>
              <li>
                <div class="visit_place">
                  <p># 개선문</p>
                </div>
              </li>
              <li>
                <div class="visit_place">
                  <p># 노트르담 대성당</p>
                </div>
              </li>
              <li>
                <div class="visit_place">
                  <p># 샹젤리제 거리</p>
                </div>
              </li>
          </ul>
          </div>
          <%}else{ }%>
          <div class="filter2">
            <p class="filter_title">가격대(1박)</p>
            <ul class="col4">
              <li>
                <div class="check_circle"></div>
                <input type="radio" id="price_all" name="price" class="price_filter2" value="1" checked>
                <label for="price_all" >전체</label>
              </li>
              <li>
                <div></div>
                <input type="radio" id="prcie_down30" name="price" class="price_filter2" value="2">
                <label for="prcie_down30">30만원 이하</label>
              </li>
              <li>
                <div></div>
                <input type="radio" id="prcie_down60" name="price" class="price_filter2" value="3">
                <label for="prcie_down60">60만원 이하</label>
              </li>
              <li>
                <div></div>
                <input type="radio" id="prcie_up60" name="price" class="price_filter2" value="4">
                <label for="prcie_up60">60만원 이상</label>
              </li>
              
          </ul>
          </div>
          <div class="filter3">
            <p class="filter_title">이용자 평점</p>
            <ul class="col4">
              <li>
                <div class="check_circle"></div>
                <input type="radio" id="user_rating_all" name="user_rating" class="userating_filter3" value="1" checked>
                <label for="user_rating_all">전체</label>
              </li>
              <li>
                <div></div>
                <input type="radio" id="user_rating_up3" name="user_rating" class="userating_filter3" value="2">
                <label for="user_rating_up3">3점 이상</label>
              </li>
              <li>
                <div></div>
                <input type="radio" id="user_rating_up3.5" name="user_rating" class="userating_filter3" value="3">
                <label for="user_rating_up3.5">3.5점 이상</label>
              </li>
              <li>
                <div></div>
                <input type="radio" id="user_rating_up4" name="user_rating" class="userating_filter3" value="4">
                <label for="user_rating_up4">4점 이상</label>
              </li>
              <li>
                <div></div>
                <input type="radio" id="user_rating_up4.5" name="user_rating" class="userating_filter3" value="5">
                <label for="user_rating_up4.5">4.5점 이상</label>
              </li>
            </ul>
          </div>
          <div class="filter4">
            <p class="filter_title">호텔 타입</p>
            <ul class="col4">
              <li>
                <div class="check_circle"></div>
                <input type="radio" id="hotel_rating_all" name="hotel_rating" class="hotelrating_filter4" value="1" checked>
                <label for="hotel_rating_all">전체</label>
              </li>   
              <li>
                <div></div>
                <input type="radio" id="hotel_rating_up3" name="hotel_rating" class="hotelrating_filter4" value="2">
                <label for="hotel_rating_up3">3성급 이상</label>
              </li>
              <li>
                <div></div>
                <input type="radio" id="hotel_rating_up4" name="hotel_rating" class="hotelrating_filter4" value="3">
                <label for="hotel_rating_up4">4성급 이상</label>
              </li>
              <li>
                <div></div>
                <input type="radio" id="hotel_rating_up5" name="hotel_rating" class="hotelrating_filter4" value="4">
                <label for="hotel_rating_up5">5성급 이상</label>
              </li>
            </ul>
          </div>
          <%if(cityCode == 1100){ %>
          <div class="filter5">
            <p class="filter_title">선호지역</p>
            <ul class="col4">
              <li>
                <input type="checkbox" id="goo1" name="goo" value="1">
                <label for="goo1">1구-루브르</label>
              </li>
         
              <li>
                <input type="checkbox" id="goo2" name="goo" value="2">
                <label for="goo2">2구-부르스</label>
              </li>
              
              <li>
                <input type="checkbox" id="goo4" name="goo" value="4">
                <label for="goo4">4구-오텔 드 빌</label>
              </li>
             
              <li>
                <input type="checkbox" id="goo5" name="goo" value="5">
                <label for="goo5">5구-라탱 지구</label>
              </li>
         
              <li>
                <input type="checkbox" id="goo6" name="goo" value="6">
                <label for="goo6">6구-생제르맹</label>
              </li>
       
              <li>
                <input type="checkbox" id="goo7" name="goo" value="7">
                <label for="goo7">7구-앵발리드</label>
              </li>
           
              <li>
                <input type="checkbox" id="goo8" name="goo" value="8">
                <label for="goo8">8구-샹젤리제</label>
              </li>
         
              <li>
                <input type="checkbox" id="goo10" name="goo" value="10">
                <label for="goo10">10구-레퓌블리크</label>
              </li>
           
              <li>
                <input type="checkbox" id="goo11" name="goo" value="11">
                <label for="goo11">11구-바스티유</label>
              </li>
          
              <li>
                <input type="checkbox" id="goo14" name="goo" value="14">
                <label for="goo14">14구-몽파르나스</label>
              </li>
         
              <li>
                <input type="checkbox" id="goo15" name="goo" value="15">
                <label for="goo15">15구-라탱 지구</label>
              </li>
             
              <li>
                <input type="checkbox" id="goo18" name="goo" value="18">
                <label for="goo18">18구-포르트...</label>
              </li>
            </ul>
          </div>
          <%}else{} %>
   
      </div>
      <div class="hotel_classification_contain">
        <div class="hotel_classification_head">
          <h3><a name="target">호텔</a></h3>
          <span class="hotel_cnt"></span>
          <div class="hotel_classification_opt">
            <ul>
              <li class="sele" val="1">고객평점</li>
              <li val="2">낮은등급</li>
              <li val="3">높은등급</li>
              <li val="4">낮은가격</li>
              <li val="5">높은가격</li>
            </ul>
          </div>
        </div>
        <div style="clear:both;"></div>
        <div class="hotel_classification_content">
          <ul>
          	
          </ul>
        </div>
        <div class="pager">
        	<ul>
  	 
        	</ul>
        </div>
    
      </div>
    </div>
  </section>
  <footer style="margin-top: 100px;">
    <div class="util_Box">
      <div class="util_contain">
        <div class="util_content">
          <ul>
            <li><a href="#">광고/제휴문의</a></li>
            <li><a href="#">서비스문의</a></li>
            <li><a href="#">개인정보 취급방침</a></li>
            <li><a href="#">이용약관</a></li>
            <li><a href="#">여행자약관</a></li>
            <li><a href="#">가이드약관</a></li>
          </ul>
        </div>
        <div class="util_sns">
          <ul>
            <li class="stu_sns facebook"><a href="#"></a></li>
            <li class="stu_sns instagram"><a href="#"></a></li>
            <li class="stu_sns kakao"><a href="#"></a></li>
            <li class="stu_sns email"><a href="#"></a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="coInfo_Box">
      <div class="coInfo_contain">
        <div class="footer_logo"></div>
        <div class="business_info">
          <p>상상속 여행을 현실로, 스투비플래너</p>
          <address> contact: apple9568@naver.com</address>
        </div>
      </div>
    </div>
  </footer>
	  <div class="hotel_map_container">
    <div class="hotel_map_box_bg"></div>
    <form action="">
    <div class="hotel_map_box">
      <div class="hotel_map_content">

        <div class="hotel_map_filters">
          <div class="hmf_con">
            <!-- 필터 입력 -->
            <div class="hmf_con_title">
              <h4>필터링기준: </h4>
            </div>
            <div class="hmf_con_filter1">
              <p class="hmf_con_filter1_title">가격대(1박)</p>
              <ul class="col5">
                <li>
                  <input type="radio" id="hmf_price_all" name="hmf_price" checked>
                  <label for="hmf_price_all">전체</label>
                </li>
                <li>
                  <div></div>
                  <input type="radio" id="hmf_prcie_down30" name="hmf_price">
                  <label for="hmf_prcie_down30">30만원 이하</label>
                </li>
                <li>
                  <div></div>
                  <input type="radio" id="hmf_prcie_down60" name="hmf_price">
                  <label for="hmf_prcie_down60">60만원 이하</label>
                </li>
                <li>
                  <div></div>
                  <input type="radio" id="hmf_prcie_up60" name="hmf_price" >
                  <label for="hmf_prcie_up60">60만원 이상</label>
                </li>
            </ul>
            </div>
            <div class="hmf_con_filter2">
              <p class="hmf_con_filter2_title">이용자 평점</p>
              <ul class="col5">
                <li>
                  <input type="radio" id="hmf_user_rating_all" name="hmf_user_rating" checked>
                  <label for="hmf_user_rating_all">전체</label>
                </li>
                <li>
                  <div></div>
                  <input type="radio" id="hmf_user_rating_up3" name="hmf_user_rating">
                  <label for="hmf_user_rating_up3">만족: 3점 이상</label>
                </li>
                <li>
                  <div></div>
                  <input type="radio" id="hmf_user_rating_up3.5" name="hmf_user_rating">
                  <label for="hmf_user_rating_up3.5">좋음: 3.5점 이상</label>
                </li>
                <li>
                  <div></div>
                  <input type="radio" id="hmf_user_rating_up4" name="hmf_user_rating">
                  <label for="hmf_user_rating_up4" class=".after">매우 좋음: 4점 이상</label>
                </li>
                <li>
                  <div></div>
                  <input type="radio" id="hmf_user_rating_up4.5" name="hmf_user_rating">
                  <label for="hmf_user_rating_up4.5">최고: 4.5점 이상</label>
                </li>
              </ul>
            </div>
            <div class="hmf_con_filter3">
              <p class="hmf_con_filter3_title">호텔 타입</p>
              <ul class="col5">
                <li>
                  <input type="radio" id="hmf_hotel_rating_all" name="hmf_hotel_rating" checked>
                  <label for="hmf_hotel_rating_all">전체</label>
                </li>   
                <li>
                  <div></div>
                  <input type="radio" id="hmf_hotel_rating_up3" name="hmf_hotel_rating">
                  <label for="hmf_hotel_rating_up3">3성급 이상</label>
                </li>
                <li>
                  <div></div>
                  <input type="radio" id="hmf_hotel_rating_up4" name="hmf_hotel_rating">
                  <label for="hmf_hotel_rating_up4">4성급 이상</label>
                </li>
                <li>
                  <div></div>
                  <input type="radio" id="hmf_hotel_rating_up5" name="hmf_hotel_rating">
                  <label for="hmf_hotel_rating_up5">5성급 이상</label>
                </li>
              </ul>
            </div>
            <div class="hmf_con_filter4">
              <p class="hmf_con_filter4_title">선호지역</p>
              <ul class="col5">
                <li>
                  <input type="checkbox" id="hmf_goo1" name="hmf_goo">
                  <label for="hmf_goo1">1구-루브르</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo2" name="hmf_goo">
                  <label for="hmf_goo2">2구-부르스</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo4" name="hmf_goo">
                  <label for="hmf_goo4">4구-오텔 드 빌</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo5" name="hmf_goo">
                  <label for="hmf_goo5">5구-라탱 지구</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo6" name="hmf_goo">
                  <label for="hmf_goo6">6구-생제르맹</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo7" name="hmf_goo">
                  <label for="hmf_goo7">7구-앵발리드</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo8" name="hmf_goo">
                  <label for="hmf_goo8">8구-샹젤리제</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo10" name="hmf_goo">
                  <label for="hmf_goo10">10구-레퓌블리크</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo11" name="hmf_goo">
                  <label for="hmf_goo11">11구-바스티유</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo14" name="hmf_goo">
                  <label for="hmf_goo14">14구-몽파르나스</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo415" name="hmf_goo">
                  <label for="hmf_goo15">15구-라탱 지구</label>
                </li>
                <li>
                  <input type="checkbox" id="hmf_goo18" name="hmf_goo">
                  <label for="hmf_goo18">18구-포르트...</label>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="hotel_map_cards">
          <div class="hmc_con">
            <ul>
							<%
						  	for(HotelDto dto : htsearchdto){
						  %>
              <li class="hmc_hotel_item">
                <a href="#">
                  <div class="hmc_img_box">
                    <img src="<%=dto.getHotelImg() %>" alt="">
                  </div>  
                  <div class="hmc_hotel_info_box">
                    <p><%=dto.getHotelName()%></p>
                    <div class="hmc_hotel_rating_box">
                      <div class="hmc_hotel_rating">
                        <span><%=dto.getUserRating()%></span>
                      </div>
                      <span></span>
                    </div>  
                    <div class="hmc_hotel_person">
                      1박, 성인2
                    </div>
                    <div class="hmc_hotel_price">
                      <span><%=dto.getHotelPrice()%></span>
                    </div>
                  </div>
                </a>
              </li>
							<%}%>             
       
            </ul>
          </div>
        </div>
        <div class="hotel_map_map">
          <!-- map -->
          <div id="map">
          </div>
        </div>
        <button class="hotel_map_box_close_btn" type="reset">
          
        </button>
      </div>
    
    </div>
    </form>
  </div>
  <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfuR-6D2xByxPlVWjP9terRhK-LBElSnk&mpa_ids=6eadd5bedda610e4&callback=initMap" defer>
  </script>
  <script>
		$(function(){
		  diffDays = 1;
  	// daterangepicker
			let date1;
			let date2;
			let timeDiff;
			
	 		function countDay(start, end, label) {
	    	if (start && end) {
	      	date1 = new Date(start.format('YYYY-MM-DD'));
	      	date2 = new Date(end.format('YYYY-MM-DD'));
	      	timeDiff = Math.abs(date2.getTime() - date1.getTime());
	      	diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
	      	currentPage = 1;
			  	pageNumber = 1;
			  	let eltopfil = $(".hotel_classification_opt ul li.sele").attr("val");
			  	let pagenumber = $(".pager ul li.ac").text();
					let filter3 = $("input[name=price]:checked").val();
					let filter4 = $("input[name=user_rating]:checked").val();
					let filter5 = $("input[name=hotel_rating]:checked").val();
					let checkboxValues = [];
			    $("input[name=goo]:checked").each(function(i) {
			      checkboxValues.push($(this).val());
			 	  });
	    		loadhotel(eltopfil, filter3, filter4, filter5, checkboxValues);
			  
	    	} else {
	      	diffDays = 1;
	    	}
	    	
			
				 }

			
			  $('input[name="datefilter"]').daterangepicker({
			    locale: {
			      "separator": " ~ ",
			      "format": 'MM월 DD일',
			      "applyLabel": "선택완료",
			      "cancelLabel": "취소",
			      "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
			      "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
			    },
			  }, countDay);
	 	// 필터링
			$(".hotel_classification_opt ul li").on("click", function(e) {
				currentPage = 1;
				pageNumber = 1;
		    var el = $(e.target).closest('li');
		    el.siblings('li').removeClass("sele");
		    el.addClass("sele");
		    let eltopfil = $(e.target).closest('li').attr("val");
		    let pagenumber = $(".pager ul li.ac").text();    	
			  let filter3 = $("input[name=price]:checked").val();
			  let filter4 = $("input[name=user_rating]:checked").val();
			  let filter5 = $("input[name=hotel_rating]:checked").val();
			  let checkboxValues = [];
		    $("input[name=goo]:checked").each(function(i) {
		      checkboxValues.push($(this).val());
		 	  });
		    countHotel(filter3, filter4, filter5, checkboxValues);
				loadhotel(eltopfil, filter3, filter4, filter5, checkboxValues);
		  });

		  $("input[name=price]").change(function(){
		  	currentPage = 1;
		  	pageNumber = 1;
		  	let eltopfil = $(".hotel_classification_opt ul li.sele").attr("val");
		  	let pagenumber = $(".pager ul li.ac").text();
				let filter3 = $("input[name=price]:checked").val();
				let filter4 = $("input[name=user_rating]:checked").val();
				let filter5 = $("input[name=hotel_rating]:checked").val();
				let checkboxValues = [];
		    $("input[name=goo]:checked").each(function(i) {
		      checkboxValues.push($(this).val());
		 	  });
		    countHotel(filter3, filter4, filter5, checkboxValues);
				loadhotel(eltopfil, filter3, filter4, filter5, checkboxValues);
			});
		  
			$("input[name=user_rating]").change(function(){
				currentPage = 1;
				pageNumber = 1;
		  	let eltopfil = $(".hotel_classification_opt ul li.sele").attr("val");
		  	let pagenumber = $(".pager ul li.ac").text();
				let filter3 = $("input[name=price]:checked").val();
				let filter4 = $("input[name=user_rating]:checked").val();
				let filter5 = $("input[name=hotel_rating]:checked").val();
				let checkboxValues = [];
		    $("input[name=goo]:checked").each(function(i) {
		      checkboxValues.push($(this).val());
		 	  });
				countHotel(filter3, filter4, filter5, checkboxValues);
				loadhotel( eltopfil, filter3, filter4, filter5, checkboxValues);
			});
		  
	    $("input[name=hotel_rating]").change(function(){
	    	currentPage = 1;
	    	pageNumber = 1;
		  	let eltopfil = $(".hotel_classification_opt ul li.sele").attr("val");
		  	let pagenumber = $(".pager ul li.ac").text();
				let filter3 = $("input[name=price]:checked").val();
				let filter4 = $("input[name=user_rating]:checked").val();
				let filter5 = $("input[name=hotel_rating]:checked").val();
				let checkboxValues = [];
		    $("input[name=goo]:checked").each(function(i) {
		      checkboxValues.push($(this).val());
		 	  });
				countHotel(filter3, filter4, filter5, checkboxValues);
				loadhotel( eltopfil, filter3, filter4, filter5, checkboxValues);
   	 	});
	    
			$("input[name=goo]").click(function(){
				currentPage = 1;
				pageNumber = 1;
		  	let eltopfil = $(".hotel_classification_opt ul li.sele").attr("val");
		  	let pagenumber = $(".pager ul li.ac").text();
				let filter3 = $("input[name=price]:checked").val();
				let filter4 = $("input[name=user_rating]:checked").val();
				let filter5 = $("input[name=hotel_rating]:checked").val();
				let checkboxValues = [];
		    $("input[name=goo]:checked").each(function(i) {
		      checkboxValues.push($(this).val());
		 	  });
		    countHotel(filter3, filter4, filter5, checkboxValues);
		    loadhotel(eltopfil, filter3, filter4, filter5, checkboxValues);
			});
			
 		}); 
		let currentPage = 1;
		
		$(document).on("click", ".page_number", function(){
			pageNumber = $(this).text();
			currentPage = pageNumber;
		
		  $(".page_number").removeClass("ac");
		  
		  $(this).addClass("ac");
		  
	  	let eltopfil = $(".hotel_classification_opt ul li.sele").attr("val");
	  	let pagenumber = $(".pager ul li.ac").text();
			let filter3 = $("input[name=price]:checked").val();
			let filter4 = $("input[name=user_rating]:checked").val();
			let filter5 = $("input[name=hotel_rating]:checked").val();
			let checkboxValues = [];
	    $("input[name=goo]:checked").each(function(i) {
	      checkboxValues.push($(this).val());
	 	  });
	  	
	    countHotel(filter3, filter4, filter5, checkboxValues);
	    loadhotel(eltopfil, filter3, filter4, filter5, checkboxValues);
	    $('html, body').animate({scrollTop:150}, 200);
	    
	    
		});
		
		function countHotel(filter3, filter4, filter5, checkboxValues){
			$.ajax({
				type:"post",
				url:"Controller?command=HotelCount",
				data:{cityId: <%=cityCode%>, filter3: filter3, filter4: filter4, filter5: filter5, "check" : JSON.stringify(checkboxValues) },
				success:function(response){
					
					var count = response.count;
				  console.log('Received count: ' + count);
					$(".hotel_cnt").html(count);
					let maxCnt;
					if (count % 12 === 0) {
						maxCnt = parseInt(count / 12);
					} else {
						maxCnt = parseInt(count / 12) + 1;
					}
					let Hlist = '';
					for(let i = 1; i <= maxCnt; i++){
					 if (i === parseInt(currentPage)) {
				      Hlist += '<li class="page_number ac" style="margin-right: 5px;">'+ i +'</li>';
				    } else {
				      Hlist += '<li class="page_number" style="margin-right: 5px;">'+ i +'</li>';
				    }
					}
					$(".pager ul").html(Hlist);
					
				},
				error:function(){
					console.log("통신 실패");
				}
			});
		}  
		
		function loadhotel(filter, filter3, filter4, filter5, checkboxValues, random){
			$.ajax({
				type: "POST",
				url: "Controller?command=HotelOrder",
				data: {pageNum: pageNumber , cityId: <%=cityCode%>, order: filter, filter3:filter3, filter4:filter4, filter5: filter5, "check" : JSON.stringify(checkboxValues) },
				success:function(response){
					let jsonResult = JSON.parse(response);
					console.log(jsonResult);
					let results = jsonResult.result;
					let hotelBox = '';
					for(let i = 0; i < results.length; i++){
						let hotelImg = results[i].hotelImg;
						let hotelName = results[i].hotelName;
						let hotelPrice = results[i].hotelPrice;
						let userRating = results[i].userRating;
						hotelBox += '<li class="hotel_item">'
            				 + '<a href="#">'
                     + '<div class="like"></div>'
                     + '<div class="img_box">'
                     + '<img src="' + hotelImg  + '" alt="">'
   									 + '</div>'  
                     + '<div class="hotel_info_box">'
                     + '<p>'+ hotelName +'</p>'
                		 + '<p>'
                     + '<span class="room_price">'+ hotelPrice * diffDays +'</span>'
                     + '<span class="rangeD">/1박</span>'
                     + '</p>'
                 		 + '<div class="hotel_user_rating">'
                  	 + '<span></span>'
                     + '<span>' + userRating +'</span>'
                     + '</div>'
                     + '<div class="hotel_distance">'
                     + '<p>예상이동거리<span>0KM</span></p>'
                     + '</div>'
               			 + '</div>'
                     + '</a>'
                     + '</li>';
								}
							  
								$(".hotel_classification_content ul").html(hotelBox);
								$(function(){
									pricedot();
								});
							  $(".rangeD").each(function() {
							   	let ranD = $(this).text();
							    ranD = Number(diffDays);
							    ranD = "/" + ranD + "박";
							    $(this).text(ranD);
							   });
				},
				error:function(e){
					console.log("실패");
				}
			});
		}
 		window.onload = function() {
 			pageNumber = 1;
			let checkboxValues = [];
	    $("input[name=goo]:checked").each(function(i) {
	      checkboxValues.push($(this).val());
	 	  });
			countHotel($("input[name=price]:checked").val(), $("input[name=user_rating]:checked").val(),$("input[name=hotel_rating]:checked").val(), checkboxValues);
			loadhotel($(".hotel_classification_opt ul li:first").attr("val"), $("input[name=price]:checked").val(), $("input[name=user_rating]:checked").val(),$("input[name=hotel_rating]:checked").val(), checkboxValues);
		}; 
		
    function prepare(){
      alert("준비중 입니다.");
    }
    
    const city = [
    	<%
  			for(HotelDto dto : htsearchdto) {
    	%>
      {lat: <%=dto.getHotelLat()%>, lng: <%=dto.getHotelLon()%>, title: '<%=dto.getHotelName()%>' },
      
      <%}%>
    ];

    let markers = []; // 마커를 저장할 배열getHotelName

    let map;
    function initMap() {
      map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: 48.857696094342, lng: 2.34874913191027 },
        zoom: 14,
        mapId: 'eb59915c631e6bb9',
        streetViewControl: false,
        mapTypeControl: false,
        scaleControl: false,
        fullscreenControl: false,
        zoomControl: false,
        fullscreenControl: false,
        gestureHandling: "greedy",
      });

      const infoWindow = new google.maps.InfoWindow();

      function createMarker(position, title) {
        const marker = new google.maps.Marker({
          position: position,
          map: map,
          icon: {
            url: 'resources/images/hotel_marker2.png',
            scaledSize: new google.maps.Size(45, 45)
          },
          optimized: false,
          animation: google.maps.Animation.DROP 
        });

        marker.addListener("click", () => {
          infoWindow.close();
          infoWindow.setContent(title);
          infoWindow.open(map, marker);
        });

        // 마우스 오버시 애니메이션 적용
        marker.addListener("mouseover", () => {
          marker.setAnimation(google.maps.Animation.BOUNCE); 
        });

        // 마우스 아웃시 애니메이션 제거
        marker.addListener("mouseout", () => {
          marker.setAnimation(null); 
        });

        return marker;
      }

      // city 배열의 각 요소에 대해 마커를 생성하고 지도에 추가
      city.forEach(({ lat, lng, title }, index) => {
        const position = { lat, lng };
        const marker = createMarker(position, title);
        markers.push(marker);

        // 리스트 아이템을 hover 시 해당 마커의 애니메이션을 활성화
        let listItems = document.getElementsByClassName('hmc_hotel_item');
        listItems[index].addEventListener('mouseover', function(){
          marker.setAnimation(google.maps.Animation.BOUNCE);
        });

        // 리스트 아이템을 hover 종료 시 해당 마커의 애니메이션을 제거
        listItems[index].addEventListener('mouseout', function(){
          marker.setAnimation(null);
        });
      });

      // zoom 변경 이벤트를 감지하여 마커를 표시 또는 숨김
      map.addListener("zoom_changed", () => {
        const zoom = map.getZoom();

        // 마커의 표시 여부 설정
        markers.forEach(marker => {
          if (zoom > 11) {
            marker.setMap(map);
          } else {
            marker.setMap(null);
          }
        });
      });

      // 초기 로딩 시 마커 표시 여부 설정
      const initialZoom = map.getZoom();
      markers.forEach(marker => {
        if (initialZoom > 4) {
          marker.setMap(map);
        } else {
          marker.setMap(null);
        }
      });
    }
		
    window.initMap = initMap;
  </script>
</body>
</html>
