<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int hno = Integer.parseInt(request.getParameter("hno"));
%>
<html>
<head>
<meta charset="UTF-8">
	<title>숙소 - 스투비플래너</title>
	<link rel="icon" href="resources/images/favicon.png">
	<!-- jQuery -->
  <script type="text/javascript" src="resources/js/jquery-3.7.0.min.js"></script>
  <!-- summernote -->
	<script src="resources/js/summernote/summernote-lite.js"></script>
	<script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="resources/css/summernote/summernote-lite.css">
	<!-- my -->
	<link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/header_footer.css">
  <link rel="stylesheet" href="resources/css/hotelreviewwrite.css">
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
	        			<span><%=session.getAttribute("userNickname")%>님 안녕하세요.</span>
	        		</li>
	        		<li><a href="Controller?command=mypage">마이페이지</a></li>
	        		<li><a href="Controller?command=logout&page=4">로그아웃</a></li>
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
          <h3>호텔리뷰 수정</h3>
          <p>호텔에 관련된 자유로운 커뮤니케이션을 해보세요, 다양<br>한 팁을 얻으실 수 있습니다.</p>
        </div>
      </div>
     	<div class="opBox"></div>
    </div>
  </section>
	<section>
		<div class="hrWrite_Box">
			<div class="hrWrite_contain">
				<form action="Controller" method="get" id="checksave">
					<input type="hidden" name="command" value="HrReviewReform">
					<input type="hidden" name="hno" value="<%=hno%>">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value=""></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" value="<%=session.getAttribute("userNickname")%>" readonly></td>
							<td><input type="hidden" name="idx" value="<%=session.getAttribute("idx")%>"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea id="summernote" name="review"></textarea></td>
						</tr>
					</table>
					<div>
						<button type="submit" class="save">수정</button>
					</div>
				</form>
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
  <script>
	  $(document).ready(function() {
	  	$('#summernote').summernote({
	  		  height: 300,                
	  		  minHeight: 300,             
	  		  maxHeight: 300,            
	  		  focus: true,                  
	  		  lang: "ko-KR",				
	  		  placeholder: '최대 500자까지 쓸 수 있습니다'	
	  	});
	  });
	  
    
		$(function(){
			$("#checksave").submit(function() {
		    var confirmCheck = confirm("수정하시겠습니까?");
		    if (!confirmCheck) {
		      return false;
		    }
			});
		});
		
    window.onbeforeunload = function() {
    	if($("#checksave").data("clicked")) {
        return;
     }
     return "이 페이지를 떠나시겠습니까?";
    };
		
    $("#checksave").click(function() {
      $(this).data("clicked", true);
  	});
  </script>
</body>
</html>