<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.HrDao" %>
<%@ page import="dto.HrDto" %>
<% 
	HrDao hdao = new HrDao();
	ArrayList<HrDto> listHotelRe = hdao.getHotelReviewList(1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>숙소 - 스투비플래너</title>
	<link rel="icon" href="resources/images/favicon.png">
	<!-- jQuery -->
  <script type="text/javascript" src="resources/js/jquery-3.7.0.min.js"></script>
	<!-- my -->
  <link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/header_footer.css">
  <link rel="stylesheet" href="resources/css/HotelQuestion.css">
  <script type="text/javascript" src="resources/js/header_footer.js"></script>
  <script src="resources/js/hotelsub.js"></script>
  <script>
		let page_request = 1;
		function request_one_page(){
			page_request += 1;
			$.ajax({
				type: 'get',
				url: "Controller?command=HrInfiniteScroll",
				data: {"pageNum": page_request},
	 			datatype: 'json', 
				success: function(data){
				console.log(data);
					for(var i = 0; i <= data.length-1; i++){
						let hotelReviewList = '<li>'
  															+ '<a href="Controller?command=hotelReviewDetail&hno='+ data[i].hno+'">'
																+ '<div class="wrap">'
																+ '<div class="wrap_text">'
								 								+ '<p>' + data[i].hrDate +'</p>'
																+ '<p>['+ data[i].hotelName +']'+ data[i].title +'</p>'
																+ '<p><span>by'+ data[i].nickName +'</span></p>'
																+ '</div>'
																+ '<div class="wrap_img">'
															  + '<img src="'+ data[i].hotelImg +'">'
																+ '</div>'
																+ '</div>'
																+ '</a>'
																+ '</li>'
						$("#hqc").append(hotelReviewList); 
					} 
					
				},
				error: function(r, s, e){
					console.log(r);
					console.log(s);
					console.log(e);
				}
			});
		}
		
		$(function(){
			$(window).scroll(function(){
			  var scrT = $(window).scrollTop();
			  console.log(scrT); 
			  if(scrT == $(document).height() - $(window).height()){
			  	request_one_page();
			  } 
			})
		});
	</script>
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
    <div class="diary_banner_box">
      <div class="diary_banner_contain">
        <div class="diary_banner_content">
          <h3>호텔리뷰</h3>
          <p>호텔에 관련된 자유로운 커뮤니케이션을 해보세요, 다양<br>한 팁을 얻으실 수 있습니다.</p>
        </div>
      </div>
     	<div class="opBox"></div>
    </div>
  </section>
  <section>
  	<div class="hotel_question_box">
  		<div class="hotel_question_contain">
  			<ul id="hqc">
  				<% for(HrDto hdto : listHotelRe) { %>
  				<li>
  					<a href="Controller?command=hotelReviewDetail&hno=<%=hdto.getHno()%>">
  						<div class="wrap">
  							<div class="wrap_text">
  								<p><%=hdto.getHrDate() %></p>
  								<p>[<%=hdto.getHotelName() %>] <%=hdto.getTitle() %></p>
  								<p><span>by <%=hdto.getNickName() %></span></p>
  							</div>
  							<div class="wrap_img">
  								<img src="<%=hdto.getHotelImg()%>">
  							</div>
  						</div>
  					</a>
  				</li>
  				<%} %>
  			</ul>
  		</div>
  	</div>
  </section>
	<footer style="margin-top: 200px;">
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
</html>