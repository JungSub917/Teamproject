<%@page import="dto.NatDto"%>
<%@page import="dto.DiaryDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	ArrayList<NatDto> mainSearch = (ArrayList<NatDto>)request.getAttribute("mainsearch");
	ArrayList<NatDto> cityranking = (ArrayList<NatDto>)request.getAttribute("cityranking");
	ArrayList<DiaryDto> diaryranking = (ArrayList<DiaryDto>)request.getAttribute("diaryranking");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상상속 유럽여행을 현실로, 스투비 플래너</title>
  <link rel="icon" href="resources/images/favicon.png">
  <link rel="stylesheet" type="text/css" href="resources/css/slick.css"/>
  <!-- Add the new slick-theme.css if you want the default styling -->
  <link rel="stylesheet" type="text/css" href="resources/css/slick-theme.css"/>
  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="resources/js/slick.min.js"></script>
  <!-- uikit slider -->
  <link rel="stylesheet" href="resources/uikit-3.16.19/css/custom-uikit.css">
  <script type="text/javascript" src="resources/uikit-3.16.19/js/uikit.min.js"></script>
  <!-- My -->
  <link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/header_footer.css">
  <link rel="stylesheet" href="resources/css/main.css">
  <script type="text/javascript" src="resources/js/header_footer.js"></script>
  <script type="text/javascript" src="resources/js/main.js"></script>
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
          <li><a href="Controller?command=MainPage" class="on">홈</a></li>
          <li><a href="Controller?command=natlist">탐색</a></li>
          <li><a href="Controller?command=tour_main">유럽투어</a></li>
          <li><a href="Controller?command=HotelMain">숙소</a></li>
          <li><a href="Controller?command=diary">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
	<section class="section1">
    <div class="banner">
      <img src="resources/images/main_banner1.jpg" alt="">
      <div class="planner_box">
        <div class="planner_contain">
          <div class="planner_content">
            <h3>상상속 유럽여행,<br>현실로 만들어 보세요.</h3>
            <p>지도 위에서 다양한 유럽 도시들을 탐색하고</p>
            <p>교통편과 숙박일수를 추천 받으세요.</p>
            <p>친구를 초대해 함께 하거나</p>
            <p>모바일 앱에서 수정할 수 있습니다.</p>
          </div>
          <%if(session.getAttribute("userEmail")==null) {%>
          <div class="planner_start_btn"><a href="#" onclick="login();">플래너 시작하기</a></div>
          <%} else { %>
          <div class="planner_start_btn"><a href="Controller?command=planstart">플래너 시작하기</a></div>
          <%} %>
        </div>
      </div>
    </div>
    
  </section>
  <section class="section2">
    <div class="search_background">
      <img src="resources/images/homemar2022_dt_trans.png" alt="">
      <a class="btn-open">
        <div class="search_box">
          <div class="search_contain">
              <label class="dodbogi_img" for="dodbogi"></label>
              <input id="dodbogi" type="text" placeholder="도시,국가,키워드로 검색" name="dodbogi" onkeyup="filter()">
          </div>
        </div>
        <div class="search_popup">
          <div class="geomsaegchang">
            <ul>
            		<!-- 검색창 리스트 생성  -->
            	     	<% 
     						for(NatDto dto : mainSearch) {	
     					%>
     					<li class="content_items">
               	<a href="SearchSub.jsp?nat_id=<%=dto.getNatId() %>&city_id=<%=dto.getCityId()%>">
               		<div>
	                  <p class="name"><%=dto.getCityName() %></p>
	                  <p><%=dto.getNatKorname() %></p>
               		</div>
               	</a>
             	</li>
     					<% } %>
              <!-- 완료 -->
            </ul>
          </div>
        </div>
      </a>
    </div>
  </section>
  <div class="search_popup_bg">
  </div>
  <section class="section3">
    <h3>인기여행지</h3>
    <p>친환경적이고 놀라운 체험을 할 수 있는 멋진 도시</p>

    <div class="responsive">  
    <!-- 인기여행지 좋아요순 8개 -->
    <%for(NatDto dto : cityranking) { %>
      <div class="wrap_re">
        <a href="SearchSub.jsp?nat_id=<%=dto.getNatId()%>&city_id=<%=dto.getCityId()%>">
          <img src="resources/images/city/<%=dto.getCityName()%>.jpg" alt="">
          <div class="nat_city_name"><p><%=dto.getCityName()%>,<%=dto.getNatKorname()%></p></div>
        </a>
      </div>
      <% } %>
      </div>

  </section>
  <section class="section4">
    <h3>여행기</h3>
    <p>TRAVELOG</p>
    <!-- uikit slider -->
    <div class="uk-slider-container-offset" uk-slider>
      <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1">
          <ul class="uk-slider-items uk-child-width-1-2@s uk-grid">
          <!--게시물 조회수 순으로 6개 -->
          <%for(DiaryDto dto : diaryranking) {%>
            <li>
              <div class="uk-card uk-card-default">
                  <a href="Controller?command=diarydetail&dno=<%=dto.getDno()%>">
                    <div class="uk-card-media-top">
                        <img src="upload/<%=dto.getMainImg() %>" width="1800" height="1200" alt="">
                      </div>
                      <div class="uk-overlay-primary uk-position-cover" style="background: rgba(34, 34, 34, 0.3)"></div>
                      <div class="uk-card-body">
                        <h4><%=dto.getTitle()%></h4>
                    </div>
                  </a>
              </div>
            </li>
            <%} %>
          </ul>
          <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slider-item="previous"></a>
          <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slider-item="next"></a>
      </div>
      <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin"></ul>
  
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
  <script>
  	function login(){
  		alert("로그인 후 이용가능합니다.");
  		location.href="Login.jsp";
  	}
  </script>
</body>
</html>