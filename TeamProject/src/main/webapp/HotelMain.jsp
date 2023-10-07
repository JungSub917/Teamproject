<%@page import="dto.NatDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
	ArrayList<NatDto> htsearchdto = (ArrayList<NatDto>)request.getAttribute("hotelsearch");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>숙소 홈 - 스투비플래너</title>
  <!-- favicon -->
  <link rel="icon" href="resources/images/favicon.png">
  <script type="text/javascript" src="resources/js/jquery-3.7.0.min.js"></script>
  <!-- daterangepicker -->
  <script src="resources/daterangepicker-master/moment.min.js"></script>
  <script src="resources/daterangepicker-master/daterangepicker.js"></script>
  <link rel="stylesheet" href="resources/daterangepicker-master/daterangepicker.css">
  <!-- my -->
  <link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/header_footer.css">
  <link rel="stylesheet" href="resources/css/hotelmain.css">
  <script type="text/javascript" src="resources/js/hotel.js"></script>
	<script type="text/javascript" src="resources/js/header_footer.js"></script>
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
  <section class="hotel_banner_search">
    <div class="hotel_banner_box">
      <div class="hotel_banner_contain">
        <div class="hotel_banner_content">
          <p>최적의 동선의</p>
          <p>유럽 숙소 간편검색</p>
        </div>
        <img src="resources/images/stu_hotel_banner.png" alt="">
      </div>
    </div>
    <form action="Controller">
    	<input type="hidden" name="command" value="HotelSub">
	    <div class="hotel_search_box">
	      <div class="hotel_search_contain">
	        <div class="hotel_search_content">
	          <div class="hotel_search_city">
	            <div class="search_box">
	              <div class="search_contain">
	                <label class="dodbogi_img" for="dodbogi"></label>
	                <input id="dodbogi" type="text" placeholder="어디로 향하시나요?" name="dodbogi" onkeyup="filter()" autocomplete="off" required>
	                <input type="hidden"  name="cityCode" autocomplete="off">
	              </div>
	              <div class="search_popup" style="display: none;">
	                <div class="geomsaegchang">
	                  <ul>
	                  	<%
	                			for(NatDto dto : htsearchdto){
	                  	%>
	                    <li class="content_items">
	                      <div>
	                        <p class="nameC"><%=dto.getCityName() %></p>
	                        <p><%=dto.getNatKorname() %></p>
	                        <p style="display:none"><%=dto.getCityId() %></p>
	                      </div>
	                    </li>
	                    <%} %>
	                  </ul>
	                </div>
	              </div>
	            </div>
	          </div>
	          <div class="hotel_search_date">
	            <label for="calendar" class="calendar_icon"></label>
	            <input class="datee" type="text" name="datefilter" value="" />
	          </div>
	          <div class="hotel_search_person">
	            <div class="hotel_person">
	              <img src="resources/images/person_FILL0_wght400_GRAD0_opsz48.png" alt="">
	              <p>객실 X<span id="room-cnt">1</span>: 성인2, 아이0</p>
	            </div>
	            <div class="hotel_person_con">
	              <div class="person_head">
	                <p>객실 및 인원</p>
	                <div class="close_btn"></div>
	              </div>
	              <div class="person_body">
	                <div class="check_room">
	                  <p>객실</p>
	                  <div class="check_room_op">
	                    <div id="minus_btn_room"><p class="minus_btn"></p></div>
	                    <input class="room_number" type="text" value="0" name="room_num" readonly>
	                    <div id="plus_btn_room"><p class="plus_btn"></p></div>
	                  </div>
	                </div>
	                <div class="check_adult">
	                  <p>성인</p>
	                  <div class="check_adult_op">
	                    <div id="minus_btn_adult"><p class="minus_btn"></p></div>
	                    <input class="adult_number" type="text" value="0" name="adult_num" readonly>
	                    <div id="plus_btn_adult"><p class="plus_btn"></p></div>
	                  </div>
	                </div>
	                <div class="check_child">
	                  <p>어린이<br/><span style="font-size: 12px; font-weight: 400; color: #8f8f8f;">만0세~17세</span></p>
	                  <div class="check_child_op">
	                    <div id="minus_btn_child"><p class="minus_btn"></p></div>
	                    <input class="child_number" type="text" value="0" name="child_num" readonly>
	                    <div id="plus_btn_child"><p class="plus_btn"></p></div>
	                  </div>
	                </div>
	                <div class="person_btn">
	                  <input type="button" value="선택완료" id="condition2">
	                </div>
	              </div>
	            </div>
	          </div>
	          <button type="submit" class="com_search">
	           		 검색
	          </button>
	        </div>
	      </div>
	    </div>
    </form>
  </section>
  <section>
    <div class="hotel_recommend_box">
      <div class="hotel_recommend_contain">
        <h3>지금 떠나면 좋은 추천 여행지 BEST5!</h3>
        <div class="hotel_recommend_content">
          <table>
            <tr>
              <td class="content1"><a href="Controller?command=HotelSub&dodbogi=비엔&cityCode=1303"><span>#비엔나</span></a></td>
              <td rowspan="2" class="content2"><a href="Controller?command=HotelSub&dodbogi=파리&cityCode=1100"><span>#파리</span></a></td>
              <td class="content3"><a href="Controller?command=HotelSub&dodbogi=바르셀로나&cityCode=1200"><span>#바르셀로나</span></a></td>
            </tr>
            <tr>
              <td class="content4"><a href="Controller?command=HotelSub&dodbogi=잘츠부르크&cityCode=1304"><span>#잘츠부르크</span></a></td>
              <td class="content5"><a href="Controller?command=HotelSub&dodbogi=마드리드&cityCode=1201"><span>#마드리드</span></a></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </section>
  <section>
    <div class="hotel_tutorial_box">
      <div class="hotel_tutorial_contain">
        <h3>주요도시 숙소선택 튜토리얼</h3>
        <div class="hotel_tutorial_content">
          <div class="tutorial tcontent1">
            <a href="#">
              <img src="resources/images/HOTEL_MAIN/HOTEL_TUTORIAL/파리.jpg" alt="">
              <p>파리편</p>
            </a>
          </div>
          <div class="tutorial tcontent2">
            <a href="#">
              <img src="resources/images/HOTEL_MAIN/HOTEL_TUTORIAL/런던.jpg" alt="">
              <p>런던편</p>
            </a>
          </div>
          <div class="tutorial tcontent3">
            <a href="#">
              <img src="resources/images/HOTEL_MAIN/HOTEL_TUTORIAL/프라하.jpg" alt="">
              <p>프라하편</p>
            </a>
          </div>
          <div class="tutorial tcontent4">
            <a href="#">
              <img src="resources/images/HOTEL_MAIN/HOTEL_TUTORIAL/바르셀로나.jpg" alt="">
              <p>바르셀로나편</p>
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <footer>
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
</body>
      