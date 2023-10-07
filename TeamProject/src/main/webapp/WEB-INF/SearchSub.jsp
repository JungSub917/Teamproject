<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<% 
		int natId;
		int cityId;
		try{
			natId = Integer.parseInt(request.getParameter("nat_id"));
			cityId = Integer.parseInt(request.getParameter("city_id"));
			
		}catch(NumberFormatException e){ 
			natId = 11101;
			cityId = 1100;
		}
%>
<%
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String id = "stubby";
    String pw = "pass1234";
%>
<%
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, id, pw);

	  String sql = "SELECT c.*, n.k_name FROM city c, nation n WHERE c.nat_id = n.nat_id AND city_id = ?";
	  PreparedStatement pstmt = conn.prepareStatement(sql);
	  pstmt.setInt(1, cityId);
	
	  ResultSet rs = pstmt.executeQuery();
      
%>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상상속 유럽여행을 현실로, 스투비 플래너</title>
  <link rel="icon" href="../images/favicon.png">
  <script src="../script/jquery-3.7.0.js"></script>
  <!-- Swiper -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 
  <!-- My -->
  <link rel="stylesheet" href="../css/reset.css">
  <link rel="stylesheet" href="../css/header_footer.css">
  <link rel="stylesheet" href="../css/searchsub.css">
  <script src="../script/search_sub.js"></script>
  <script type="text/javascript" src="../script/header_footer.js"></script>

</head>
<body>
<header>
    <div class="head_box">
      <div class="head_content">
        <div class="head_title">
          <h1><a href="Main.jsp"><img src="../images/stu_logo.png" alt=""></a></h1>
        </div>
        <%
    			if (session.getAttribute("userEmail") == null) {
    		%>
        <div class="gnb_box">
          <div class="gnb_content">
            <ul>
              <li><a href="">고객센터</a></li>
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
              <li><a href="">고객센터</a></li>
              <li class="profil"><img src="../images/img_pfnull.jpg"></li>
            </ul>
          </div>
	        <div class="profil_box">
	        	<ul>
	        		<li>
	        			<img src="../images/img_pfnull.jpg">
	        			<p><%=session.getAttribute("userNickname")%>님 <br><span class="hi">안녕하세요.</span></p>
	        		</li>
	        		<li><a href="#">마이페이지</a></li>
	        		<li><a href="LogoutAction.jsp?page=3">로그아웃</a></li>
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
          <li><a href="Main.jsp">홈</a></li>
          <li><a href="SearchMain.jsp" class="on">탐색</a></li>
          <li><a href="">유럽투어</a></li>
          <li><a href="HotelMain.jsp">숙소</a></li>
          <li><a href="">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
  <%
  	while(rs.next()){
  		String csubImg = rs.getString("img_sub");
  		String[] citysubImg = csubImg.split("___");
  %>
  <section>
    <div class="section1_bgcolor">
      <div class="info_city_box">
        <div class="info_city_contain">
          <div class="info_city_content">
            <div class="city_img">
              <img id="main_img" src="../images/CITY/CITY_IMG_MAIN/<%=rs.getString("name")%>.jpg" alt="">
              <button type="button" class="city_like_btn binheart"></button>
            </div>
            <div class="info_city_write">
              <div class="titArea">
                <div class="route">
                  <span><a href="SearchMain.jsp">홈 </a><span style="color:black">></span><a href="#"> <%=rs.getString("k_name")%></a></span>
                </div>
                <h2><%=rs.getString("name")%></h2>
                <p><%=rs.getString("sum")%></p>
                <div class="main_score">
                  <span></span>
                  <span><%=rs.getString("like_cnt")%></span>
                </div>
              </div>
              <div class="desArea">
                <p><%=rs.getString("description") %></p>
                <p>방문시기</p>
                <div style="height:80px">
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:12px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">1월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:12px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">2월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:14px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">3월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:26px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">4월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:22px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">5월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:24px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">6월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:22px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">7월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:18px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">8월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:18px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">9월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:14px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">10월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:10px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">11월</div>
                  </div>
      
                  <div style="float:left;width:8.33%;position:relative;height:100px;">
                    <div style="position:absolute;bottom:30px;left:0px;width:100%;background:#c0c0c0;height:8px;width:70%;margin-left:15%;margin-right:15%"></div>
                    <div style="position:absolute;bottom:0px;left:0px;width:100%;padding-bottom:4px;text-align:center;">12월</div>
                  </div>
      
                </div>
              </div>
            </div>
      
          </div>
        </div>
      </div>
      <!--  -->
      <div class="subImg_box">
        <div class="swiper mySwiper1" >
          <div class="swiper-wrapper custom_wrapper1" pagination="true" pagination-clickable="true" slides-per-view="3"
          space-between="30" free-mode="true">
            <div id="sw-sl" class="swiper-slide custom1" style="margin-left: 3px;"><a href="javascript:dispcopy('<%=citysubImg[0]%>','')"><img src="<%=citysubImg[0]%>" alt=""></a></div>
            <%
            	for(int i=1; i<citysubImg.length; i++){
            %>
            <div id="sw-sl" class="swiper-slide custom1"><a href="javascript:dispcopy('<%=citysubImg[i]%>','')"><img src="<%=citysubImg[i]%>" alt=""></a></div>
						<% } %>            	
      
          </div>
        </div>
        <div class="swiper-button-next custom_next_btn1"></div>
        <div class="swiper-button-prev custom_prev_btn1"></div>
      <!--  -->
      </div>
<%
	} 				 
%>
<%
	sql = "SELECT * FROM experience WHERE city_id = ?";
	pstmt = conn.prepareStatement(sql);

	pstmt.setInt(1, cityId);

	rs = pstmt.executeQuery();
%>

      <div class="exp_box">
        <div class="exp_contain">
          <div class="exp_content">
            <span class="bar"></span>
            <h3>경험해볼 만할 것들</h3>
            <div class="expexp">
            <%
							while(rs.next()){
						%>
              <div class="bor">
                <div class="wrap_img"><img src="<%=rs.getString("img") %>" alt=""></div>
                <div class="exp_info">
                  <p><%=rs.getString("title")%></p>
                  <p><%=rs.getString("description")%></p>
                </div>
              </div>
      			<% 		
							}

						%>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section>
    <div class="other_city_box">
      <div class="other_city_contain">
   			<%
					sql = " SELECT (c.count -1) AS city_count, n.k_name FROM (SELECT COUNT(city_id) AS count"
							+ " FROM city WHERE nat_id = ?) c, nation n WHERE n.nat_id = ?";
					pstmt = conn.prepareStatement(sql);
				
					pstmt.setInt(1, natId);
					pstmt.setInt(2, natId);
				
					rs = pstmt.executeQuery(); 
				%>
   			<% while(rs.next()){ %>
        <h3><%=rs.getString("k_name")%>(<%=rs.getInt("city_count")%>)</h3>
        <%} %>
        <div class="swiper mySwiper2" pagination="true" pagination-clickable="true" slides-per-view="3"
        space-between="30" free-mode="true">
          <div class="swiper-wrapper">
         <%
					sql = "SELECT img,name,sum, city_id,like_cnt FROM city WHERE nat_id = ? AND NOT city_id IN ?";
					pstmt = conn.prepareStatement(sql);
				
					pstmt.setInt(1, natId);
					pstmt.setInt(2, cityId);
				
					rs = pstmt.executeQuery(); 
				%>
				<%while(rs.next()){ %>
            <div class="swiper-slide custom2">
              <a href="SearchSub.jsp?nat_id=<%=natId%>&city_id=<%=rs.getString("city_id")%>">
                <div class="nat_cities_img">
                  <img src="../images/CITY/CITY_IMG_MAIN/<%=rs.getString("name")%>.jpg" alt="">
                </div>
                <div class="score">
                  <span></span>
                  <span><%=rs.getInt("like_cnt")%></span>
                </div>
                <div class="nat_cities_info">
                  <p><%=rs.getString("name")%></p>
                  <p><%=rs.getString("sum")%></p>
                </div>
              </a>
            </div>
         <%} %>   
          </div>
        </div>
        <div class="swiper-button-next custom_next_btn2"></div>
        <div class="swiper-button-prev custom_prev_btn2"></div>
      </div> 
      <div class="search_home_back">
        <a href="SearchMain.jsp">탐색 홈으로 돌아가기</a>
      </div>
    </div>
    <div class="link_tour_box">
      <div class="link_tour_contain">
        <h3>관련된 투어</h3>
        <div class="swiper mySwiper3" pagination="true" pagination-clickable="true" slides-per-view="3"
        space-between="30" free-mode="true">
          <div class="swiper-wrapper">
            <%
							sql = "SELECT img, title, price FROM tour_package WHERE nat_id = ?";
							pstmt = conn.prepareStatement(sql);
				
							pstmt.setInt(1, natId);
				
							rs = pstmt.executeQuery(); 
						%>
						<%while(rs.next()){ %>
            <div class="swiper-slide custom3">
              <a href="#">
                <div class="nat_tour_img">
                  <img src="<%=rs.getString("img")%>" alt="">
                </div>
                <div class="easy_reservation">
                  <span></span>
                  <span>간편예약</span>
                </div>
                <div class="nat_tour_info">
                  <p><%=rs.getString("title")%></p>
	                <p class="nat_tour_price"><%=rs.getInt("price")%></p>
                </div>
              </a>
            </div>
 						<%} %>
          </div>
        </div>
        <div class="swiper-button-next custom_next_btn3"></div>
        <div class="swiper-button-prev custom_prev_btn3"></div>
      </div>
      <div class="go_nat_tour">
         <%
					sql = "SELECT k_name FROM nation WHERE nat_id = ?";
					pstmt = conn.prepareStatement(sql);
				
					pstmt.setInt(1, natId);
				
					rs = pstmt.executeQuery(); 
					%>
					<%while(rs.next()){ %>
        <a href="#"><%=rs.getString("k_name")%> 투어 전체보기</a>
        	<%} %>
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
<%
rs.close();
pstmt.close();
conn.close();
%>
  <script>
    const swiper = new Swiper(".mySwiper1", {
      slidesPerView: 5,
      spaceBetween: 15,
      freeMode: true,
      navigation: {
        nextEl: ".custom_next_btn1",
        prevEl: ".custom_prev_btn1",
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },

    });
    const swiper2 = new Swiper(".mySwiper2", {
      slidesPerView: 4,
      spaceBetween: 13,
      freeMode: true,
      navigation: {
        nextEl: ".custom_next_btn2",
        prevEl: ".custom_prev_btn2",
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },

    });
    const swiper3 = new Swiper(".mySwiper3", {
      slidesPerView: 4,
      spaceBetween: 13,
      freeMode: true,
      navigation: {
        nextEl: ".custom_next_btn3",
        prevEl: ".custom_prev_btn3",
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },

    });
		
		/* 좋아요 클릭 이벤트 */ 
    $(function(){
			$(".city_like_btn").click(function(){
				
		<%
			if (session.getAttribute("userEmail") == null) {
			%> 
				alert("로그인 후 이용해주세요.");
			<%} else{%>
				if($(this).hasClass("binheart")){0
					$(this).removeClass("binheart");
					$(this).addClass("fullheart");
					let cityId = <%=cityId%>;
					let idx = <%=session.getAttribute("idx")%>;
					
					$.ajax({
						type: 'POST',
						url: '../cityLikeBtn',
						data: {idx: idx, cityId: cityId},
						success: function(){
							
						},
						error: function(){
							console.log("에러");
						}
					});
				}else{
					$(this).removeClass("fullheart");
					$(this).addClass("binheart");
					let cityId = <%=cityId%>;
					let idx = <%=session.getAttribute("idx")%>;
					$.ajax({
						type: 'POST',
						url: '../cityLikeBtn',
						data: {idx: idx, cityId: cityId},
						success: function(){
							console.log("성공");
						},
						error: function(){
							console.log("에러");
						}
					});
				}
	    <%}%>
			});
		});
  </script>
	

</body>
</html>