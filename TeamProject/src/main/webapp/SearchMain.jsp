<%@page import="dto.NatDto"%>
<%@page import="dto.CityDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<% 
	ArrayList<NatDto> ndto = (ArrayList<NatDto>)request.getAttribute("natlist"); 
	ArrayList<CityDto> cdto = (ArrayList<CityDto>)request.getAttribute("citylist");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상상속 유럽여행을 현실로, 스투비 플래너</title>
  <link rel="icon" href="resources/images/favicon.png">
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
  <!-- swiper -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <!-- font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Noto+Sans+KR:wght@100;700&display=swap" rel="stylesheet">
  <!-- My -->
  <link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/header_footer.css">
  <link rel="stylesheet" href="resources/css/searchmain.css">
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
          <li><a href="Controller?command=natlist" class="on">탐색</a></li>
          <li><a href="Controller?command=tour_main">유럽투어</a></li>
          <li><a href="Controller?command=HotelMain">숙소</a></li>
          <li><a href="Controller?command=diary">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
  <section>
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide banner1 type">
          <div class="banner_content">
            <p>2023가을 여행지 제안</p>
            <p>독일 하이델베르크</p>
            <p>자세히</p>
          </div>
        </div>
        <div class="swiper-slide banner2 type">
          <div class="banner_content">
            <p>2023가을 여행지 제안</p>
            <p>프랑스 지베르니</p>
            <p>자세히</p>
          </div>
        </div>
        <div class="swiper-slide banner3 type">
          <div class="banner_content">
            <p>2023가을 여행지 제안</p>
            <p>이탈리아 베니스</p>
            <p>자세히</p>
          </div>
        </div>
        <div class="swiper-slide banner4 type">
          <div class="banner_content">
            <p>2023가을 여행지 제안</p>
            <p>스웨덴 스톡홀롬</p>
            <p>자세히</p>
          </div>
        </div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>
    <div>
      <div class="search_city">
        <label class="dodbogi_img" for="dodbogi"></label>
        <input id="dodbogi" type="text" placeholder="어디로 여행을 떠나시나요?" name="dodbogi" onkeyup="searchData();">
      </div>
    </div>
  </section>
  <section>
    <div class="search_nation_box">
      <div class="search_drop_down fr">
        <select name="order" id="orderor" class="order">
          <option value="1" selected>추천순</option>
          <option value="2" >내림차순</option>
          <option value="3">오름차순</option>
        </select>
      </div>
      <div style="clear: both;"></div>
      <div class="search_nation_contain">
        <div class="search_nation_content">
						
						
						
						
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
   <%
  %>
  <%
  	for(NatDto dto : ndto){
//System.out.println("ndto.city : " + Arrays.toString(dto.getArrcity()));  		
  %>
<div class="nation_popup" cityId=<%=dto.getNatId()%>>
	<div class="nation_bg"></div>
  <div class="nation_wrap">
    <div class="popup_nat">
      <div class="popup_natImg"><img src="resources/images/NATION/NAT_IMG/<%=dto.getNatKorname()%>.jpg" alt=""></div>
      <button class="close_btn">

      </button>
      <div class="popup_natDes">
        <h2><%=dto.getNatEngname() %></h2>
        <h3><%=dto.getNatKorname() %></h3>
        <span><%=dto.getDescription() %></span>
        <div class="plus_info">
          <ul>
            <li class="fl">
              <div>
                <p><img src="resources/images/SEARCH/icon_currency.png" alt=""></p>
                <p><%=dto.getCurrency()%></p>
              </div>
            </li>
            <li class="fl">
              <div>
                <p><img src="resources/images/SEARCH/icon_volt.png" alt=""></p>
                <p><%=dto.getVolt()%></p>
              </div>
            </li>
            <li class="fl">
              <div>
                <p><img src="resources/images/SEARCH/icon_visa.png" alt=""></p>
                <p><%=dto.getVisa()%></p>
              </div>
            </li>
            <li class="fl">
              <div>
                <p><img src="resources/images/SEARCH/icon_timedi.png" alt=""></p>
                <p><%=dto.getTimedi()%></p>
              </div>
            </li>
          </ul>
        </div>
        
        <div style="clear:both;"></div>
        <div class="select_city">
        	 <%
        	 	String[] city = dto.getArrcity();
        		for(int i = 0; i<city.length; i++){
        	%>
        		<div class="city"><a href="SearchSub.jsp?nat_id=<%=dto.getNatId()%>&city_id=<%=city[i]%>"><%=city[i]%></a></div>
        	<%
        		}
        	%>

 
        </div>
      </div>
    </div>
  </div>
</div>
    		<%} %> 

  <script>
    // searchmain banner
		var swiper = new Swiper(".mySwiper", {
		  slidesPerView: 1,
		  spaceBetween: 30,
		  loop: true,
		  autoplay: {
		    delay: 5000,
		    disableOnInteraction: false,
		  },
		  pagination: {
		    el: ".swiper-pagination",
		    clickable: true,
		  },
		  navigation: {
		    nextEl: ".swiper-button-next",
		    prevEl: ".swiper-button-prev",
		  },
		});
	   <%
	 		%>
	    	let cityArr1 = [];
	 		<%
	 			for(CityDto dto : cdto){
	 		%>
	    	cityArr1.push({cityId:<%=dto.getCityid()%>, cityName:"<%=dto.getName()%>"});
	    <% } %>
	    $(function(){
	      cityArr1.forEach(function(city){
	          let cityId = city.cityId;
	          let cityName = city.cityName;

	          $(".city a").each(function(){
	              let cities = $(this).text();
	              if (cities == cityId){
	              	$(this).text(cityName);
	              }
	          });
	      });    
	  });
		
    /* 오름차순-내림차순-추천순 나열  */
    
  	function loadData() {
      let param = $("select[name=order]").val(); // value 값 가져오기
      $.ajax({
          type: "POST",
          url: "natOrder",
          data: {option: param},
          success: function(response) {
              let jsonResult = JSON.parse(response);
              let results = jsonResult.result;
              let natBox = '';
              for (let i = 0; i < results.length; i++) {
                  let natId = results[i].natId;
                  let korName = results[i].korName;
                  let engName = results[i].engName;
                  natBox += '<div class="content">'
                      	 + '<div class="natBox" cityId="' + natId + '">'
                      	 + '<div class="natImg"><img src="resources/images/NATION/NAT_IMG/' + korName + '.jpg" alt=""></div>'
                      	 + '<div class="nat_title">'
                      	 + '<p>' + engName + '</p>'
                      	 + '<p>' + korName + '</p>'
                      	 + '</div>'
                      	 + '</div>'
                      	 + '</div>';
              		}
              		$('.search_nation_content').html(natBox);
              		
                 	$(".natBox").click(function(){
                 		let natId = $(this).attr("cityId");
                 		$(".nation_popup[cityId="+natId+"]").show();
                 	});
                 	
                 	$(".close_btn").click(function(){
                 		$(".nation_popup").hide();
                 		
                 	});
          },
          error: function() {
              alert("다시 시도해주세요.");
          }
      });

 	 }
  	/* 검색  */
		function searchData(){
			$.ajax({
        type: "POST",
        url: "natSearch",
        data: { dodbogi: $("#dodbogi").val()},
        success: function(response) {
        	let jsonResult = JSON.parse(response);
          let results = jsonResult.result1;
          let natBox1 = '';
					console.log(results);
          for (let i = 0; i < results.length; i++) {
              let natId = results[i].natId;
              let korName = results[i].korName;
              let engName = results[i].engName;
              natBox1 += '<div class="content">'
                 			+ '<div class="natBox" cityId="' + natId + '">'
                  		+ '<div class="natImg"><img src="resources/images/NATION/NAT_IMG/' + korName + '.jpg" alt=""></div>'
                  		+ '<div class="nat_title">'
                  		+ '<p>' + engName + '</p>'
                  		+ '<p>' + korName + '</p>'
                  		+ '</div>'
                  		+ '</div>'
                  		+ '</div>';
          }

          $('.search_nation_content').html(natBox1);
          
          $(".natBox").click(function(){
         		let natId = $(this).attr("cityId");
         		$(".nation_popup[cityId="+natId+"]").show();
         	});
         
         	$(".close_btn").click(function(){
         		$(".nation_popup").hide();
         		
         	});
         
        },
        error: function() {
            alert("다시 시도해주세요.");
        }
    	});
  	}
    window.onload = function() {
      loadData();
      $("select[name=order]").change(function() {
          loadData();
      });
  	};
	</script>
</body>
</html>

